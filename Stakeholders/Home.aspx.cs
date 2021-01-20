using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Highsoft.Web.Mvc.Charts;
using Highsoft.Web.Mvc.Charts.Rendering;
using System.Data.SqlClient;
using System.Data;
using System.Data.OleDb;
using System.IO;


namespace NMUSolar.Stakeholders
{
    public partial class Home : System.Web.UI.Page
    {
        String HomePageWeek = "~/Stakeholders/Home-Week.aspx";
        String HomePageMonth = "~/Stakeholders/Home-Month.aspx";
        String HomePageYear = "~/Stakeholders/Home-Year.aspx";

        public string lineData;
        protected void Page_Load(object sender, EventArgs e)
        {
           // LoadDataOfLineChart();
        }
        public void LoadDataOfLineChart()
        {
            SqlConnection con = new SqlConnection(getConnectionString());
            con.Open();
            SqlCommand cmd = new SqlCommand("spchartsData", con);
            DataTable dt = new DataTable();
            dt.Load(cmd.ExecuteReader());
            gvLineChart.DataSource = dt;
            gvLineChart.DataBind();

            lineData = "{";
            foreach(DataRow dr in dt.Rows)
            {
                lineData += "[" + dr["PlantName"] + "," + dr["Yield"] + "],";
            }
            lineData = lineData.Remove(lineData.Length - 1) + '}';

        }
        private string getConnectionString()
        {
            return System.Configuration.ConfigurationManager.ConnectionStrings["SolarDatabaseConnection"].ConnectionString;
        }


        protected void btnday_Click(object sender, EventArgs e)
        {

          
        }

        protected void btnmonth_Click(object sender, EventArgs e)
        {
            Response.Redirect(HomePageMonth);
        }

        protected void btnweek_Click(object sender, EventArgs e)
        {
            Response.Redirect(HomePageWeek);
        }

        protected void btnyear_Click(object sender, EventArgs e)
        {
            Response.Redirect(HomePageYear);
        }

        protected void tableData_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}