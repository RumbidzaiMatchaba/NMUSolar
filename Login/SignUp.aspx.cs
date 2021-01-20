using System;
using System.Data.SqlClient;
using System.Drawing;

namespace NMUSolar.Login
{
    public partial class SignUp : System.Web.UI.Page
    {
        private const string LoginPage = "~/Login/Login.aspx";
        
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public void signUpUser(object sender, EventArgs e)
        {
            String password1 = firstPassword.Text;
            String password2 = secondPassword.Text;
          
            Boolean passWordValue = CheckPassword(password1, password2);

            if (passWordValue )
            {
                //Get Data values from textBox and add to database
                InsertUserInfor();
                //Then dispaly Confirmation message
                Label1.Text = "";
                //rediredc to login page 
                Response.Redirect(LoginPage);

            }
        }
        public Boolean checkdataFields()
        {
            if((txtname.Text.Equals("")) || txtsurname.Text.Equals("") || txtemail.Text.Equals("") )
            {
                return false;
            }
            else 
            {
                return true;
            }
        }
        public void cancelUser(object sender, EventArgs e)
        { 
           
                txtname.Text = "";
                txtsurname.Text = "";
                txtemail.Text = "";
                UserRole.SelectedValue = "Administrator";
                firstPassword.Text = "";
                secondPassword.Text = " ";
                Label1.Text = "";
            RequiredFieldValidator1.ErrorMessage = "";
          
           
        }

        //checks if both passwords match, display popup
        public Boolean CheckPassword(String firstPassword, String secondPassword)
        {

            if(checkdataFields())
            {
                if (emptyPasswords(firstPassword, secondPassword))
                {
                    if (firstPassword.Equals(secondPassword))
                    {
                        Label1.Text = "Successful";
                        return true;
                    }
                    else
                    {
                        Label1.Text = "Passwords do not match! Please try again";
                        return false;
                    }
                }
                else
                {
                    Label1.Text = "Passwords can not be empty";
                    return false;
                }

            }
            else
            {
                //Label1.ForeColor = Red;
                Label1.Text = "Enter all details";
                return false;
            }


        }
        public Boolean emptyPasswords(String firstPassword, String secondPassword)
        {
            if(firstPassword.Equals("") && secondPassword.Equals(""))
            {
                return false;
            }
            else
            {
                return true;
            }
        }

        public string getConnectionString()
        {
            return System.Configuration.ConfigurationManager.ConnectionStrings["SolarDatabaseConnection"].ConnectionString;
        }
        private void InsertUserInfor()
        {
            SqlConnection con = new SqlConnection(getConnectionString());
            SqlCommand cmd = new SqlCommand("spInsertUser", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("Name",txtname.Text );
            cmd.Parameters.AddWithValue("Surname", txtsurname.Text);
            cmd.Parameters.AddWithValue("EmailAddress", txtemail.Text);
            cmd.Parameters.AddWithValue("UserRole", UserRole.SelectedValue);
            cmd.Parameters.AddWithValue("Password", secondPassword.Text);
            con.Open();
            int num = cmd.ExecuteNonQuery();
            if(num !=0)
            {
                //popup signup successfull.
                Label1.Text = "Successful SignUp!!!";
                //redirect to login page
                Response.Redirect(LoginPage);
                
            }
            
            con.Close();
            
        }
    }
}