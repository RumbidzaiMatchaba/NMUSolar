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
    public partial class SupposedMasterFile : System.Web.UI.Page
    {
        private const string changeAdmin = "~/SolarAdmin/ChangeAdministrator.aspx";
        protected GridView GridView1;
       

        public void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
               
                    displayData();
              //do Session data here
                
            }
        }
        
       
        private void displayData()
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
        public void btnChangeAdmin(object sender, EventArgs e)
        {
            Response.Redirect(changeAdmin);

        }

        //deleting a seleted user
       protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
          
           
           
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            //if(e.CommandName.Equals("removeUser"))
            //{
            //    SqlConnection con = new SqlConnection(getConnectionString());
            //    Users
            //    int useid = Convert.ToInt32(GridView1.DataKeys[e.]
            //        Convert.ToInt32(gvDetails.DataKeys[e.RowIndex].Values["UserId"].ToString());
            //    String sqlStatement = "Delete from Users where UserID = @UserID";
            //    SqlCommand cmd = new SqlCommand(sqlStatement, con);
            //    con.Open();
               
            //    int num = cmd.ExecuteNonQuery();
            //    if (num != 0)
            //    {
            //        //popup signup successfull.
            //        Label1.Text = "Successful removal!!!";

            //    }

            //    con.Close();

            //}

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}