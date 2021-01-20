using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Data.SqlClient;

namespace NMUSolar
{
    /// <summary>
    /// Summary description for Admin
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    // [System.Web.Script.Services.ScriptService]
    public class Admin : System.Web.Services.WebService
    {

        [WebMethod]
        public void addPlant(object sender, EventArgs e)
        {

        //    SqlConnection con = new SqlConnection(getConnectionString());
        //    SqlCommand cmd = new SqlCommand("spInsertPlantSection", con);
        //    cmd.CommandType = System.Data.CommandType.StoredProcedure;
        //    cmd.Parameters.AddWithValue("PlantName", txtplantsection.Text);
        //    cmd.Parameters.AddWithValue("Azimuth", txtazimuth.Text);
        //    cmd.Parameters.AddWithValue("Inclination", txtinclination.Text);
        //    cmd.Parameters.AddWithValue("Invertor", txtinvertor.Text);
        //    cmd.Parameters.AddWithValue("PanelQuantity", int.Parse(txtquantity.Text));
        //    con.Open();
        //    int num = cmd.ExecuteNonQuery();
        //    if (num != 0)
        //    {
        //        lblplantConfirm.Text = "Succefull plant addtion!";
        //        //  ClientScript.RegisterStartupScript(GetType(), "Javascript", "javascript:showpopup(); ", true);
        //        // ClientScript.RegisterStartupScript(Page.GetType(), "randomtext", "showpopup() ", true);

        //    }
        //    else
        //    {
        //        lblplantConfirm.Text = " Unsucceffull attempt, please try again";
        //    }

        //    con.Close();
        }
        //public string getConnectionString()
        //{
        //    return System.Configuration.ConfigurationManager.ConnectionStrings["SolarDatabaseConnection"].ConnectionString;
        //}
    }
}
