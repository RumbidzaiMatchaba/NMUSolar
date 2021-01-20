using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Data.SqlClient;

namespace NMUSolar.Controls
{
    /// <summary>
    /// Summary description for HighCharts
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
  //  To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line.

    [System.Web.Script.Services.ScriptService]
    public class HighCharts : System.Web.Services.WebService
    {
        public class SolarData
        {
            public int PlantSectionID { get; set; }
            public int solarYield { get; set; }
            public string PlantName { get; set; }

            public DateTime yieldDate { get; set; }
        }

        [WebMethod]       
        public List<SolarData> getSolarDataDay(List<string> pData)
        {
            string day = pData[0];
            int num = day.Length;
            string dayS = day.Substring(0,2);
            string monthS = day.Substring(3, 2);
            string yearS = day.Substring(day.Length - 4);
            string actualData = yearS + "-" + monthS + "-" +dayS ;
            DateTime d = DateTime.Parse(actualData).Date;
            DateTime dt = d.Date;
            
           // string actualDate = ///change date formst
            List<SolarData> p = new List<SolarData>();
            using( SqlConnection con = new SqlConnection(getConnectionString()))
            {
                //string query = "SELECT DISTINCT PlantSectionID, SUM(Yield) AS TOTAL FROM SolarProduction WHERE (SELECT YEAR(DATE) AS y) =@year GROUP BY PlantSectionID";
                SqlCommand cmd = new SqlCommand("spgetSolarbyDay", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@date", dt);
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                if(dr.HasRows)
                {
                    while(dr.Read())
                    {
                        SolarData spDatat = new SolarData();
                        spDatat.PlantName = dr["PlantName"].ToString();
                        spDatat.solarYield = Convert.ToInt32(dr["TOTAL"].ToString());
                        p.Add(spDatat);
                    }
                }
            }
            return p;
            

        }
        [WebMethod]
        public List<SolarData> getSolarDataYear(List<string> pData)
        {
            int year = int.Parse(pData[0]);
            List<SolarData> p = new List<SolarData>();
            using (SqlConnection con = new SqlConnection(getConnectionString()))
            {
                //string query = "SELECT DISTINCT PlantSectionID, SUM(Yield) AS TOTAL FROM SolarProduction WHERE (SELECT YEAR(DATE) AS y) =@year GROUP BY PlantSectionID";
                SqlCommand cmd = new SqlCommand("spgetSolarbyYear", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@syear",year);
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        SolarData spDatat = new SolarData();
                        spDatat.PlantName= dr["PlantName"].ToString();
                        spDatat.solarYield = Convert.ToInt32(dr["TOTAL"].ToString());
                        p.Add(spDatat);
                    }
                }
            }
            return p;


        }
        [WebMethod]
        public List<SolarData> getSolarDataMonth(List<string> pData)
        {
           
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


            string m = pData[0];
            int year = int.Parse(pData[1]);
            int mon = months.IndexOf(m);
            int month = mon + 1;

            List<SolarData> p = new List<SolarData>();
            using (SqlConnection con = new SqlConnection(getConnectionString()))
            {
                //string query = "SELECT DISTINCT PlantSectionID, SUM(Yield) AS TOTAL FROM SolarProduction WHERE (SELECT YEAR(DATE) AS y) =@year GROUP BY PlantSectionID";
                SqlCommand cmd = new SqlCommand("spgetSolarbyMonth", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@month", month);
                cmd.Parameters.AddWithValue("@ySolar", year);
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        SolarData spDatat = new SolarData();
                        spDatat.PlantName = dr["PlantName"].ToString();
                        spDatat.solarYield = Convert.ToInt32(dr["TOTAL"].ToString());
                        p.Add(spDatat);
                    }
                }
            }
            return p;


        }

        [WebMethod]
        public List<SolarData> getDrillDownSolarMonth(List<string> pData)
        {
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


            string name = pData[0];
            int mon = months.IndexOf(pData[1]);
            int month = mon + 1;
            int year = int.Parse(pData[2]);
            

            List<SolarData> p = new List<SolarData>();
            using (SqlConnection con = new SqlConnection(getConnectionString()))
            {
                //string query = "SELECT DISTINCT PlantSectionID, SUM(Yield) AS TOTAL FROM SolarProduction WHERE (SELECT YEAR(DATE) AS y) =@year GROUP BY PlantSectionID";
                SqlCommand cmd = new SqlCommand("spMonthDrilldownforday", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@name", name);
                cmd.Parameters.AddWithValue("@m", month);
                cmd.Parameters.AddWithValue("@year", year);
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        SolarData spDatat = new SolarData();
                        spDatat.yieldDate = DateTime.Parse(dr["Date"].ToString());
                        spDatat.solarYield = Convert.ToInt32(dr["Yield"].ToString());
                        p.Add(spDatat);
                    }
                }
            }
            return p;
        }
        [WebMethod]
        public List<SolarData> getSolarDataWeek(List<string> pData)
        {

            string dateOne = pData[0];
            DateTime d = DateTime.Parse(dateOne);
            DateTime dtOne = d.Date;

            string dateTwo = pData[1];
            DateTime dtTwo = new DateTime();

            List<SolarData> p = new List<SolarData>();
            using (SqlConnection con = new SqlConnection(getConnectionString()))
            {
                //string query = "SELECT DISTINCT PlantSectionID, SUM(Yield) AS TOTAL FROM SolarProduction WHERE (SELECT YEAR(DATE) AS y) =@year GROUP BY PlantSectionID";
                SqlCommand cmd = new SqlCommand("spgetSolarbyMonth", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@dateOne", dtOne);
                cmd.Parameters.AddWithValue("@dateTwo", dtTwo);
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        SolarData spDatat = new SolarData();
                        spDatat.PlantName = dr["PlantName"].ToString();
                        spDatat.solarYield = Convert.ToInt32(dr["TOTAL"].ToString());
                        p.Add(spDatat);
                    }
                }
            }
            return p;


        }
        public  string getConnectionString()
        {
            return System.Configuration.ConfigurationManager.ConnectionStrings["SolarDatabaseConnection"].ConnectionString;
        }

    }

}


   
    
