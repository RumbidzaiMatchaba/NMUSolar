using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace NMUSolar.SolarAdmin
{
    public partial class PlantSection_Settings : System.Web.UI.Page
    {
        String addPlantSectionPage = "~/SolarAdmin/Add Plant Section.aspx";
       protected GridView PlantSectionData;
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                displayData();
            }
        }
        public void addPlantSection(object sender, EventArgs e)
        {
            Response.Redirect(addPlantSectionPage);
        }
        private void displayData()
        {
            DataTable dataTable = new DataTable();
            SqlConnection con = new SqlConnection(getConnectionString());
            String sqlStatement = "Select * from PlantSection";
            SqlCommand cmd = new SqlCommand(sqlStatement, con);
            con.Open();
            SqlDataReader reader = cmd.ExecuteReader();
            dataTable.Load(reader);

            PlantSectionData.DataSource = dataTable;
            PlantSectionData.DataBind();
           
            con.Close();
        }

        public string getConnectionString()
        {
            return System.Configuration.ConfigurationManager.ConnectionStrings["SolarDatabaseConnection"].ConnectionString;
        }

        protected void PlantSectionData_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        //protected void PlantSectionData_RowEditing(object sender, GridViewEditEventArgs e)
        //{
        //    PlantSectionData.EditIndex = e.NewEditIndex;
        //    displayData();
        //}
    }
}