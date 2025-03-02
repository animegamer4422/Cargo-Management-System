using System;
using System.Web.UI;

namespace CargoManagement
{
    public partial class Header : UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadNavLinks();
            }
        }

        private void LoadNavLinks()
        {
            string links = "";

            if (Session["user_login"] != null)
            {
                links = @"
                    <li class='nav-item'><a class='nav-link' href='Cargo.aspx'>Cargos</a></li>
                    <li class='nav-item'><a class='nav-link' href='profile.aspx'>My Profile</a></li>
                    <li class='nav-item'><a class='nav-link' href='logout.aspx'>Logout</a></li>";
            }
            else
            {
                links = @"
                    <li class='nav-item'><a class='nav-link' href='Login.aspx'>Login</a></li>
                    <li class='nav-item'><a class='nav-link' href='Register.aspx'>Register</a></li>";
            }

            navLinks.Text = links;
        }
    }
}
