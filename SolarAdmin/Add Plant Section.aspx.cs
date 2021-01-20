using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace NMUSolar.SolarAdmin
{
    public partial class Add_Plant_Section : System.Web.UI.Page
    {
        String PlantSectionPage = "~/SolarAdmin/PlantSectionSettings.aspx";
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public void cancelPlantData(object sender, EventArgs e)
        {
            txtplantsection.Text = "";
            txtazimuth.Text = "";
            txtinclination.Text = "";
            txtinvertor.Text = "";
            txtquantity.Text = "";
            lblplantConfirm.Text = " ";
            
        }
        public void addPlant(object sender, EventArgs e)
        {
            
            SqlConnection con = new SqlConnection(getConnectionString());
            SqlCommand cmd = new SqlCommand("spInsertPlantSection", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("PlantName", txtplantsection.Text);
            cmd.Parameters.AddWithValue("Azimuth", txtazimuth.Text);
            cmd.Parameters.AddWithValue("Inclination", txtinclination.Text);
            cmd.Parameters.AddWithValue("Invertor", txtinvertor.Text);
            cmd.Parameters.AddWithValue("PanelQuantity",  int.Parse(txtquantity.Text));
            con.Open();
            int num = cmd.ExecuteNonQuery();
            if (num != 0)
            {
                lblplantConfirm.Text = "Succefull plant addtion!";
                //  ClientScript.RegisterStartupScript(GetType(), "Javascript", "javascript:showpopup(); ", true);
               // ClientScript.RegisterStartupScript(Page.GetType(), "randomtext", "showpopup() ", true);

            }
            else
            {
               lblplantConfirm.Text = " Unsucceffull attempt, please try again";
            }

            con.Close();
        }
        public string getConnectionString()
        {
            return System.Configuration.ConfigurationManager.ConnectionStrings["SolarDatabaseConnection"].ConnectionString;
        }
        public void backtoPlantSettings(object sender, EventArgs e)
        {
            Response.Redirect(PlantSectionPage);
        }
    }

}