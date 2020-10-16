using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NMUSolar.Login
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void signUp(object sender, EventArgs e)
        {
            Response.Redirect("SignUp.aspx");
        }

        protected void Unnamed1_TextChanged(object sender, EventArgs e)
        {

        }
    }
}