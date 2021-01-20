using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Data.SqlClient;

namespace NMUSolar.Stakeholders
{
    /// <summary>
    /// Summary description for ReportsHighCharts
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class ReportsHighCharts : System.Web.Services.WebService
    {
        public class ReportObject
        {
            public string dateName { get; set; }
            public int accumulatedSolar { get; set; }
            public Boolean drilldown { get; set; }
        }
        public class SolarData
        {
            public int PlantSectionID { get; set; }
            public int solarYield { get; set; }
            public string PlantName { get; set; }
            public string dateName { get; set; }
            public Boolean drilldown { get; set; }

        }

        [WebMethod]
        public List<SolarData> getSolarDataReportDay(List<string> pData)
        {
            string mOne = pData[0];
            string mTwo = pData[1];
           
            List<SolarData> p = new List<SolarData>();
            //Soalr Object One
            SolarData solarDataOne = new SolarData();
            solarDataOne.dateName = mOne;
            solarDataOne.solarYield = getOneDayData(mOne);
            solarDataOne.drilldown = true;

            //Soalr Object One
            SolarData solarDataTwo = new SolarData();
            solarDataTwo.dateName = mTwo;
            solarDataTwo.solarYield = getOneDayData(mTwo);
            solarDataTwo.drilldown = true;


            p.Add(solarDataOne);
            p.Add(solarDataTwo);
            return p;
        }

        [WebMethod]
        public List<SolarData> getSolarDataReportMonth(List<string> pData)
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


            string mOne = pData[0];
            string mTwo = pData[2];
            int yearOne = int.Parse(pData[1]);
            int yearTwo = int.Parse(pData[3]);
            int monOne = months.IndexOf(mOne)+1;
            int monTwo = months.IndexOf(mTwo)+1;

            List<SolarData> p = new List<SolarData>();
            SolarData solarDataOne = new SolarData();
            solarDataOne.dateName = mOne;
            solarDataOne.solarYield = getOneMonthData(monOne, yearOne);
            solarDataOne.drilldown = true;

            SolarData solarDataTwo = new SolarData();
            solarDataTwo.dateName = mTwo;
            solarDataTwo.solarYield = getOneMonthData(monTwo, yearTwo);
            solarDataTwo.drilldown = true;


            p.Add(solarDataOne);
            p.Add(solarDataTwo);
            return p;


        }

        [WebMethod]
        public List<SolarData> getSolarDataDayDrilldown(List<string> pData)
        {
            string day = pData[0];
            int num = day.Length;
            string dayS = day.Substring(0, 2);
            string monthS = day.Substring(3, 2);
            string yearS = day.Substring(day.Length - 4);
            string actualData = yearS + "-" + monthS + "-" + dayS;
            DateTime d = DateTime.Parse(actualData).Date;
            DateTime dt = d.Date;

            // string actualDate = ///change date formst
            List<SolarData> p = new List<SolarData>();
            using (SqlConnection con = new SqlConnection(getConnectionString()))
            {
                //string query = "SELECT DISTINCT PlantSectionID, SUM(Yield) AS TOTAL FROM SolarProduction WHERE (SELECT YEAR(DATE) AS y) =@year GROUP BY PlantSectionID";
                SqlCommand cmd = new SqlCommand("spgetSolarbyDay", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@date", dt);
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
        public int getOneDayData(String dayDate)
        {
            int total = 0;
            DateTime d = DateTime.Parse(dayDate);
            DateTime dt = d.Date;
            
            using (SqlConnection con = new SqlConnection(getConnectionString()))
            {
                //string query = "SELECT DISTINCT PlantSectionID, SUM(Yield) AS TOTAL FROM SolarProduction WHERE (SELECT YEAR(DATE) AS y) =@year GROUP BY PlantSectionID";
                SqlCommand cmd = new SqlCommand("spGetOneDay", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@day", dt);
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {                      
                        total = Convert.ToInt32(dr["TOTAL"].ToString());                       
                    }
                }
            }
            return total;

        }
        [WebMethod]
        public List<SolarData> getSolarDataValuationDay(List<String> pData)
        {
            string day = pData[0];
            int num = day.Length;
            string dayS = day.Substring(0, 2);
            string monthS = day.Substring(3, 2);
            string yearS = day.Substring(day.Length - 4);
            string actualData = yearS + "-" + monthS + "-" + dayS;
            DateTime d = DateTime.Parse(actualData).Date;
            DateTime dt = d.Date;

            // string actualDate = ///change date formst
            List<SolarData> p = new List<SolarData>();
            using (SqlConnection con = new SqlConnection(getConnectionString()))
            {
                //string query = "SELECT DISTINCT PlantSectionID, SUM(Yield) AS TOTAL FROM SolarProduction WHERE (SELECT YEAR(DATE) AS y) =@year GROUP BY PlantSectionID";
                SqlCommand cmd = new SqlCommand("spgetSolarbyDay", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@date", dt);
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
        public List<SolarData> getSolarDataValuationMonth(List<string> pData)
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
        public int getOneMonthData(int mon, int year)
        {
            int totalSolar = 0;
            using (SqlConnection con = new SqlConnection(getConnectionString()))
            {
                //string query = "SELECT DISTINCT PlantSectionID, SUM(Yield) AS TOTAL FROM SolarProduction WHERE (SELECT YEAR(DATE) AS y) =@year GROUP BY PlantSectionID";
                SqlCommand cmd = new SqlCommand("spGetOneMonth", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@mon", mon);
                cmd.Parameters.AddWithValue("@year", year);
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                       
                       totalSolar = Convert.ToInt32(dr["TOTAL"].ToString());

                        
                    }
                }
            }
            return totalSolar;
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
        public string getConnectionString()
        {
            return System.Configuration.ConfigurationManager.ConnectionStrings["SolarDatabaseConnection"].ConnectionString;
        }

    }
}
