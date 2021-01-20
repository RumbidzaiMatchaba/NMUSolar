using System;
using System.Data.SqlClient;
using System.Security;

namespace NMUSolar.Login
{
    public partial class Login : System.Web.UI.Page
    {
        private const string SignUpPage = "~/Login/SignUp.aspx";
        private const string UserSettingsPage = "~/SolarAdmin/SupposedMasterFile.aspx";

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void signUp(object sender, EventArgs e)
        {
            Response.Redirect(SignUpPage);
        }
        public string getConnectionString()
        {
            return System.Configuration.ConfigurationManager.ConnectionStrings["SolarDatabaseConnection"].ConnectionString;
        }
        public void loginUser(object sender, EventArgs e)
        {

            if(checkdataFeilds())
            {
                SqlConnection con = new SqlConnection(getConnectionString());
                SqlCommand cmd = new SqlCommand("spLogin", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@EmailAddress", txtEmail.Text);
                cmd.Parameters.AddWithValue("@Password", txtPassword.Text);
                con.Open();
                //retuns the number of rows affected
                SqlDataReader reader = cmd.ExecuteReader();


                if (reader.HasRows)
                {
                    reader.Read();
                    Label3.Text = "Succesfull login";
                    Session["User"] = txtEmail.Text;
                    Response.Redirect(UserSettingsPage);

                }
                else
                {
                    Label3.Text = "Unsuccesfull login, Try again!";
                }
                con.Close();
            }
            else
            {
                Label3.Text = " Enter username and password";
            }

           
        }

        protected void logCancel_Click(object sender, EventArgs e)
        {
            txtEmail.Text = "";
            txtPassword.Text = "";
            Label3.Text = "";
        }
        protected Boolean checkdataFeilds()
        {
            String username = txtEmail.Text;
            String password = txtPassword.Text;
            if(username.Equals("") || password.Equals(""))
            {
                return false;
            }
            else
            {
                return true;
            }
        }
    }
}