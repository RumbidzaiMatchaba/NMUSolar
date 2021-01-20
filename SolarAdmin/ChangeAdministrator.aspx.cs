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
    public partial class ChangeAdministrator : System.Web.UI.Page
    {
        String userSettingsPage = "~/SolarAdmin/SupposedMasterFile.aspx";
        protected void Page_Load(object sender, EventArgs e)
        {
            DataTable dataTable = new DataTable();
            SqlConnection con = new SqlConnection(getConnectionString());
            String sqlStatement = "Select * from Users";
            SqlCommand cmd = new SqlCommand(sqlStatement, con);
            con.Open();
            SqlDataReader reader = cmd.ExecuteReader();
            dataTable.Load(reader);

            GridView1.DataSource = dataTable;
            GridView1.DataBind();

            con.Close();
        }
        public string getConnectionString()
        {
            return System.Configuration.ConfigurationManager.ConnectionStrings["SolarDatabaseConnection"].ConnectionString;
        }

        protected void btnuserSettings_Click(object sender, EventArgs e)
        {
            Response.Redirect(userSettingsPage);
        }
    }
}