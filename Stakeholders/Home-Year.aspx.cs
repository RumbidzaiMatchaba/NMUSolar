using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NMUSolar.Stakeholders
{
    public partial class Home_Year : System.Web.UI.Page
    {
        String HomePageDay = "~/Stakeholders/Home.aspx";
        String HomePageMonth = "~/Stakeholders/Home-Month.aspx";
        String HomePageWeek = "~/Stakeholders/Home-Week.aspx";
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnday_Click(object sender, EventArgs e)
        {
            Response.Redirect(HomePageDay);
        }

        protected void btnweek_Click(object sender, EventArgs e)
        {
            Response.Redirect(HomePageWeek);
        }

        protected void btnmonth_Click(object sender, EventArgs e)
        {
            Response.Redirect(HomePageMonth);
        }
      

       
    }
}