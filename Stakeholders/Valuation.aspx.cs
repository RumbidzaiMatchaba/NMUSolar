using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace NMUSolar.Stakeholders
{
    public partial class Valuation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           

        }
       

        protected void dyValuation_Click(object sender, EventArgs e)
        {
            String selectedDate = txtDate.Text;
            double totalSolar = 0; 
            if(selectedDate.Equals(""))
            {
                //select a date
            }
            else
            {
                DateTime d = DateTime.Parse(selectedDate).Date;
                DateTime dt = d.Date;

                using (SqlConnection con = new SqlConnection(getConnectionString()))
                {
                    
                    SqlCommand cmd = new SqlCommand("spgetValutionDayTotal", con);
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@date", dt);
                    con.Open();
                    SqlDataReader dr = cmd.ExecuteReader();
                    if (dr.HasRows)
                    {
                        while (dr.Read())
                        {
                            totalSolar = double.Parse(dr["TOTAL"].ToString());
                        }
                    }

                }              
            }

            double municipal = totalSolar * getMuinicipalData();
            double tasolData = totalSolar * getTasolData();

            lbldayMunipalRate.Text = getMuinicipalData().ToString();
            lblTUPrice.Text = tasolData.ToString();
            lblMUPrice.Text = municipal.ToString();
            lbltotalYield.Text = totalSolar.ToString();

        }


        public double getMuinicipalData()
        {
            double municipalData = 0;
            SqlConnection con = new SqlConnection(getConnectionString());
            SqlCommand cmd = new SqlCommand("spgetMunicipalPrice", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                while (dr.Read())
                {

                    municipalData = double.Parse(dr["MunicipalUnitPrice"].ToString());

                }
            }
            return municipalData;
        }
        public double getTasolData()
        {
           double UnitData = 0;
            SqlConnection con = new SqlConnection(getConnectionString());
            SqlCommand cmd = new SqlCommand("spgetTasolPrice", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                while (dr.Read())
                {

                   UnitData = double.Parse(dr["UnitPrice"].ToString());

                }
            }
            return UnitData;
        }

        public string getConnectionString()
        {
            return System.Configuration.ConfigurationManager.ConnectionStrings["SolarDatabaseConnection"].ConnectionString;
        }

        protected void Button2_Click(object sender, EventArgs e)
        {

            String month = ddlmonthone.Value;
            int dateYear = int.Parse(ddlyearone.Value);
            

            List<String> months = new List<string>();
            months.Add("January");
            months.Add("February");
            months.Add("March");
            months.Add("April");
            months.Add("May");
            months.Add("June");
            months.Add("July");
            months.Add("August");
            months.Add("September");
            months.Add("October");
            months.Add("November");
            months.Add("December");
            int mon = months.IndexOf(month) +1;
            

            double totalSolar = 0;
           

                using (SqlConnection con = new SqlConnection(getConnectionString()))
                {

                    SqlCommand cmd = new SqlCommand("spgetValuationMonthTotal", con);
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@month", mon);
                    cmd.Parameters.AddWithValue("@year",dateYear);
                    con.Open();
                    SqlDataReader dr = cmd.ExecuteReader();
                    if (dr.HasRows)
                    {
                        while (dr.Read())
                        {
                            totalSolar = double.Parse(dr["TOTAL"].ToString());
                        }
                    }

                }
           

            double municipal = totalSolar * getMuinicipalData();
            double tasolData = totalSolar * getTasolData();

            lblmonthrate.Text = getMuinicipalData().ToString();
            lblMonthTPP.Text = tasolData.ToString();
            lblMonthMPP.Text = municipal.ToString();
            lblMonthTotalYield.Text = totalSolar.ToString();
        }
    }
}