using System;
using System.Web.UI;

namespace CargoManagement
{
    public partial class Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user_login"] == null)
            {
                Response.Redirect("Login.aspx");
            }
        }
    }
}
