using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Security.Cryptography;
using System.Text;

namespace CargoManagement
{
    public partial class ManageAdmins : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadAdmins();
            }
        }

        private void LoadAdmins()
        {
            string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["MySqlConnection"].ConnectionString;
            using (MySqlConnection conn = new MySqlConnection(connectionString))
            {
                conn.Open();
                string query = "SELECT id, fullname, contact, city, email, password FROM admin";
                using (MySqlCommand cmd = new MySqlCommand(query, conn))
                {
                    using (MySqlDataAdapter da = new MySqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        da.Fill(dt);
                        gridAdmins.DataSource = dt;
                        gridAdmins.DataBind();
                    }
                }
            }
        }

        protected void gridAdmins_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gridAdmins.EditIndex = e.NewEditIndex;
            LoadAdmins();
        }

        protected void gridAdmins_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gridAdmins.EditIndex = -1;
            LoadAdmins();
        }

        protected void btnAddAdmin_Click(object sender, EventArgs e)
        {
            string fullname = txtNewFullName.Text.Trim();
            string contact = txtNewContact.Text.Trim();
            string city = txtNewCity.Text.Trim();
            string email = txtNewEmail.Text.Trim();
            string password = txtNewPassword.Text.Trim();

            // 🚨 Validate Required Fields
            if (string.IsNullOrEmpty(fullname) || string.IsNullOrEmpty(contact) || string.IsNullOrEmpty(city) ||
                string.IsNullOrEmpty(email) || string.IsNullOrEmpty(password))
            {
                lblMessage.Text = "All fields are required.";
                lblMessage.ForeColor = System.Drawing.Color.Red;
                return;
            }

            // 🚨 Validate Contact (10-digit number)
            if (!System.Text.RegularExpressions.Regex.IsMatch(contact, @"^\d{10}$"))
            {
                lblMessage.Text = "Invalid contact number. It must be 10 digits.";
                lblMessage.ForeColor = System.Drawing.Color.Red;
                return;
            }

            // 🚨 Validate Email Format
            if (!System.Text.RegularExpressions.Regex.IsMatch(email, @"^[^@\s]+@[^@\s]+\.[^@\s]+$"))
            {
                lblMessage.Text = "Invalid email format.";
                lblMessage.ForeColor = System.Drawing.Color.Red;
                return;
            }

            // 🚨 Validate Input Lengths
            if (fullname.Length > 50 || city.Length > 100 || email.Length > 100 || password.Length > 100)
            {
                lblMessage.Text = "Input values exceed allowed length.";
                lblMessage.ForeColor = System.Drawing.Color.Red;
                return;
            }

            // 🚨 Hash the password before inserting
            string hashedPassword = HashPassword(password);

            string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["MySqlConnection"].ConnectionString;
            using (MySqlConnection conn = new MySqlConnection(connectionString))
            {
                conn.Open();
                string query = "INSERT INTO admin (fullname, contact, city, email, password) VALUES (@FullName, @Contact, @City, @Email, @Password)";

                using (MySqlCommand cmd = new MySqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@FullName", fullname);
                    cmd.Parameters.AddWithValue("@Contact", contact);
                    cmd.Parameters.AddWithValue("@City", city);
                    cmd.Parameters.AddWithValue("@Email", email);
                    cmd.Parameters.AddWithValue("@Password", hashedPassword);

                    cmd.ExecuteNonQuery();
                }
            }

            // Clear form fields
            txtNewFullName.Text = "";
            txtNewContact.Text = "";
            txtNewCity.Text = "";
            txtNewEmail.Text = "";
            txtNewPassword.Text = "";

            lblMessage.Text = "New admin added successfully!";
            lblMessage.ForeColor = System.Drawing.Color.Green;

            LoadAdmins(); // Refresh admin list
        }



        protected void gridAdmins_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = gridAdmins.Rows[e.RowIndex];
            int id = Convert.ToInt32(gridAdmins.DataKeys[e.RowIndex].Values["id"]);

            string fullname = (row.FindControl("txtFullName") as TextBox).Text.Trim();
            string contact = (row.FindControl("txtContact") as TextBox).Text.Trim();
            string city = (row.FindControl("txtCity") as TextBox).Text.Trim();
            string email = (row.FindControl("txtEmail") as TextBox).Text.Trim();
            string password = (row.FindControl("txtPassword") as TextBox).Text.Trim();

            string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["MySqlConnection"].ConnectionString;
            using (MySqlConnection conn = new MySqlConnection(connectionString))
            {
                conn.Open();

                // Only update password if it's not empty
                string query;
                if (!string.IsNullOrEmpty(password))
                {
                    string hashedPassword = HashPassword(password);
                    query = "UPDATE admin SET fullname=@FullName, contact=@Contact, city=@City, email=@Email, password=@Password WHERE id=@Id";
                    using (MySqlCommand cmd = new MySqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@FullName", fullname);
                        cmd.Parameters.AddWithValue("@Contact", contact);
                        cmd.Parameters.AddWithValue("@City", city);
                        cmd.Parameters.AddWithValue("@Email", email);
                        cmd.Parameters.AddWithValue("@Password", hashedPassword);
                        cmd.Parameters.AddWithValue("@Id", id);
                        cmd.ExecuteNonQuery();
                    }
                }
                else
                {
                    query = "UPDATE admin SET fullname=@FullName, contact=@Contact, city=@City, email=@Email WHERE id=@Id";
                    using (MySqlCommand cmd = new MySqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@FullName", fullname);
                        cmd.Parameters.AddWithValue("@Contact", contact);
                        cmd.Parameters.AddWithValue("@City", city);
                        cmd.Parameters.AddWithValue("@Email", email);
                        cmd.Parameters.AddWithValue("@Id", id);
                        cmd.ExecuteNonQuery();
                    }
                }
            }

            gridAdmins.EditIndex = -1;
            LoadAdmins();
        }

        protected void gridAdmins_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int id = Convert.ToInt32(gridAdmins.DataKeys[e.RowIndex].Values["id"]);

            string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["MySqlConnection"].ConnectionString;
            using (MySqlConnection conn = new MySqlConnection(connectionString))
            {
                conn.Open();
                string query = "DELETE FROM admin WHERE id=@Id";

                using (MySqlCommand cmd = new MySqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@Id", id);
                    cmd.ExecuteNonQuery();
                }
            }

            LoadAdmins();
        }

        private string HashPassword(string password)
        {
            using (SHA256 sha256 = SHA256.Create())
            {
                byte[] bytes = sha256.ComputeHash(Encoding.UTF8.GetBytes(password));
                StringBuilder builder = new StringBuilder();
                foreach (byte b in bytes)
                {
                    builder.Append(b.ToString("x2"));
                }
                return builder.ToString();
            }
        }
    }
}
