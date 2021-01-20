using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Data.OleDb;
using System.IO;


namespace NMUSolar.SolarAdmin
{
    public partial class UploadFile : System.Web.UI.Page
    {
        public int plantID ;
        String plantName = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!Page.IsPostBack)
            {
                SqlConnection con = new SqlConnection(getConnectionString());
                String sqlStatement = "Select * from PlantSection";
                SqlCommand cmd = new SqlCommand(sqlStatement, con);
                SqlDataAdapter da = new SqlDataAdapter();
                da.SelectCommand = cmd;
                DataTable dt = new DataTable();
                da.Fill(dt);
                solarPlants.DataSource = dt;
                solarPlants.DataTextField = "PlantName";
                solarPlants.DataValueField = "PlantName";
                solarPlants.DataBind();
            }
           
        }
        private string getConnectionString()
        {
            return System.Configuration.ConfigurationManager.ConnectionStrings["SolarDatabaseConnection"].ConnectionString;
        }

        protected void solarPlants_SelectedIndexChanged(object sender, EventArgs e)
        {
            plantName = solarPlants.SelectedValue;
            lblplant.Text = plantName;
            plantID = getPlantID(plantName);
            BindSolarData(plantName);
        }
        protected int getPlantID(String Pdata)
        {
            int num = 0;
            SqlConnection con = new SqlConnection(getConnectionString());
           // String sqlStatement = "Select PlantSectionID from PlantSection where PlantName ='" + Pdata + "'";
            SqlCommand cmd = new SqlCommand("spgetPlantID ", con);
            cmd.Parameters.AddWithValue("@N", Pdata);
            cmd.CommandType = CommandType.StoredProcedure;
           
            cmd.Connection = con;
            try
            {
                con.Open();
                SqlDataReader sdr = cmd.ExecuteReader();
                while (sdr.Read())
                {
                   num = (int)sdr["PlantSectionID"];
                                      
                }
                return num;
            }
            catch (Exception ex)
            {
                throw ex;
            }

        }
        protected void BindSolarData(String sdata)
        {
            SqlConnection con = new SqlConnection(getConnectionString());
           // String sqlStatement = "Select * from PlantSection where PlantName ='"+sdata+"'";
            SqlCommand cmd = new SqlCommand("spgetPlantDetails", con);
            cmd.Parameters.AddWithValue("@N", sdata);
            cmd.CommandType = CommandType.StoredProcedure;
           // cmd.CommandText = sqlStatement;
            cmd.Connection = con;
            try
            {
                con.Open();
                SqlDataReader sdr = cmd.ExecuteReader();
                while (sdr.Read())
                {
                    lblplantSection.Text = sdr["PlantName"].ToString();
                    lblAzimuth.Text = sdr["Azimuth"].ToString();
                    lblInclination.Text = sdr["Inclination"].ToString();
                    lblInvertor.Text = sdr["Invertor"].ToString();
                    lblQuantity.Text = sdr["PanelQuantity"].ToString();
                    solarPlants.DataBind();
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }

        }

        protected void btnUpload_Click(object sender, EventArgs e)
        {
            if(Fileupload.PostedFile !=null)
            {
                try
                {

                    var appDataPath = Server.MapPath("~/App_Data/");
                    if (!Directory.Exists(appDataPath))
                    {
                       Directory.CreateDirectory(appDataPath);

                    }
                   
                    string path = string.Concat(appDataPath + Fileupload.FileName);

                    Fileupload.SaveAs(path);
                    string excelCS = string.Format("Provider=Microsoft.ACE.OLEDB.12.0;Data Source={0};Extended Properties=Excel 8.0", path);
                    OleDbConnection con;
                    using (con = new OleDbConnection(excelCS))
                    {
                        OleDbCommand cmd = new OleDbCommand("Select * from [Sheet1$]", con);
                        con.Open();
                        OleDbDataReader dr = cmd.ExecuteReader();
                        using (SqlConnection connection = new SqlConnection(getConnectionString()))
                        {
                            connection.Open();
                            SqlBulkCopy sqlBulkCopy = new SqlBulkCopy(connection);
                            //add the plant ID
                            
                            sqlBulkCopy.ColumnMappings.Add("Date", "Date");
                            sqlBulkCopy.ColumnMappings.Add("Yield", "Yield");
                            sqlBulkCopy.ColumnMappings.Add("Target", "Target");
                            sqlBulkCopy.ColumnMappings.Add("Variance", "Variance");
                            sqlBulkCopy.DestinationTableName = "temp_SolarProduction";
                            //mappings maybe 
                            sqlBulkCopy.WriteToServer(dr);
                            AddPlantSectionID();
                            tranferToSolarProduction();
                            clearTempTable();

                        }

                    }

                    lblconfirm.Text = "Successfull Data Upload for " +plantName+ "!";
                }
                catch(Exception ex)
                {
                   
                    throw ex;
                    //lblconfirm.Text = ex.Message;
                }
            }
        }

        protected void clearTempTable()
        {
            SqlConnection con = new SqlConnection(getConnectionString());
            SqlCommand cmd = new SqlCommand("spClearTemp", con);
            //  SqlDataAdapter da = new SqlDataAdapter();
            //da.SelectCommand = cmd;
            con.Open();
            int n = cmd.ExecuteNonQuery();
            if (n > 0)
            {
                //good shit
            }
        }

        protected void AddPlantSectionID()
        {
            plantName = solarPlants.SelectedValue;
            plantID = getPlantID(plantName);
            SqlConnection con = new SqlConnection(getConnectionString());
            String sqlStatement = "UPDATE [SolarProject].[dbo].[temp_SolarProduction] SET PlantSectionID = "+plantID+"";
            SqlCommand cmd = new SqlCommand(sqlStatement, con);
            con.Open();
            int num=  cmd.ExecuteNonQuery();
            if(num >0)
            {
                //good shit
            }
          
        }

        protected void tranferToSolarProduction()
        {
            SqlConnection con = new SqlConnection(getConnectionString());
            SqlCommand cmd = new SqlCommand("TransfertoSP", con);
            //  SqlDataAdapter da = new SqlDataAdapter();
            //da.SelectCommand = cmd;
            con.Open();
            int n =cmd.ExecuteNonQuery();
            if(n > 0)
            {
                //good shit
            }
           
        }
    }
}