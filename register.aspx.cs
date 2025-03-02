using System;
using System.Web.UI;
using MySql.Data.MySqlClient;
using System.Configuration; // Required for accessing web.config

namespace CargoManagement
{
    public partial class Register : Page
    {
        protected void btnRegister_Click(object sender, EventArgs e)
        {
            // Get form values
            string fullname = txtFullname.Text.Trim();
            string contact = txtContact.Text.Trim();
            string city = txtCity.Text.Trim();
            string email = txtEmail.Text.Trim();
            string password = txtPassword.Text.Trim();
            string confirmPassword = txtConfirmPassword.Text.Trim();

            // Validate password match
            if (password != confirmPassword)
            {
                lblMessage.Text = "Passwords do not match.";
                lblMessage.ForeColor = System.Drawing.Color.Red;
                return;
            }

            // Hash the password for security
            string hashedPassword = BCrypt.Net.BCrypt.HashPassword(password);

            // Retrieve connection string from web.config (same method as ManageAdmins)
            string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["MySqlConnection"].ConnectionString;

            if (string.IsNullOrEmpty(connectionString))
            {
                lblMessage.Text = "Error: Database connection string is missing in web.config.";
                lblMessage.ForeColor = System.Drawing.Color.Red;
                return;
            }

            try
            {
                using (MySqlConnection conn = new MySqlConnection(connectionString))
                {
                    conn.Open();

                    // **Check if email already exists**
                    string checkQuery = "SELECT COUNT(*) FROM users WHERE email = @Email";
                    using (MySqlCommand checkCmd = new MySqlCommand(checkQuery, conn))
                    {
                        checkCmd.Parameters.AddWithValue("@Email", email);
                        int userExists = Convert.ToInt32(checkCmd.ExecuteScalar());

                        if (userExists > 0)
                        {
                            lblMessage.Text = "Email is already registered!";
                            lblMessage.ForeColor = System.Drawing.Color.Red;
                            return;
                        }
                    }

                    // **Insert user data into MySQL**
                    string insertQuery = "INSERT INTO users (fullname, contact, city, email, password) VALUES (@Fullname, @Contact, @City, @Email, @Password)";
                    using (MySqlCommand cmd = new MySqlCommand(insertQuery, conn))
                    {
                        cmd.Parameters.AddWithValue("@Fullname", fullname);
                        cmd.Parameters.AddWithValue("@Contact", contact);
                        cmd.Parameters.AddWithValue("@City", city);
                        cmd.Parameters.AddWithValue("@Email", email);
                        cmd.Parameters.AddWithValue("@Password", hashedPassword);

                        cmd.ExecuteNonQuery();
                        lblMessage.Text = "Registration successful! <a href='Login.aspx'>Login here</a>";
                        lblMessage.ForeColor = System.Drawing.Color.Green;
                    }
                }
            }
            catch (MySqlException ex)
            {
                lblMessage.Text = "Database error: " + ex.Message;
                lblMessage.ForeColor = System.Drawing.Color.Red;
            }
            catch (Exception ex)
            {
                lblMessage.Text = "An unexpected error occurred: " + ex.Message;
                lblMessage.ForeColor = System.Drawing.Color.Red;
            }
        }
    }
}
