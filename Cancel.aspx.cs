using System;
using System.Data;
using System.Web.UI;
using MySql.Data.MySqlClient;

namespace CargoManagement
{
    public partial class Cancel : Page
    {
        protected string trackingId;
        protected double refundAmount;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user_login"] == null)
            {
                Response.Redirect("Login.aspx");
            }

            trackingId = Request.QueryString["tracking_id"];

            if (!IsPostBack && !string.IsNullOrEmpty(trackingId))
            {
                LoadCargoDetails();
            }
        }

        private void LoadCargoDetails()
        {
            string connectionString = "server=localhost;port=3306;database=cargo_db;user=root;password=;";
            using (MySqlConnection conn = new MySqlConnection(connectionString))
            {
                conn.Open();
                string query = "SELECT sender_city, receiver_city, (SELECT amount FROM payments WHERE tracking_id = @TrackingId) AS amount " +
                               "FROM cargo WHERE tracking_id = @TrackingId";

                using (MySqlCommand cmd = new MySqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@TrackingId", trackingId);
                    using (MySqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            lblTrackingId.Text = trackingId;
                            lblPickup.Text = reader["sender_city"].ToString();
                            lblDestination.Text = reader["receiver_city"].ToString();

                            double amount = Convert.ToDouble(reader["amount"]);
                            refundAmount = amount * 0.8; // Deduct 20% fee

                            lblAmount.Text = amount.ToString("F2");
                            lblRefundAmount.Text = refundAmount.ToString("F2");
                        }
                        else
                        {
                            lblCancelMessage.Text = "Error: Cargo not found!";
                        }
                    }
                }
            }
        }

        protected void btnConfirmCancel_Click(object sender, EventArgs e)
        {
            string connectionString = "server=localhost;port=3306;database=cargo_db;user=root;password=;";
            using (MySqlConnection conn = new MySqlConnection(connectionString))
            {
                conn.Open();

                // Delete the cargo
                string deleteQuery = "DELETE FROM cargo WHERE tracking_id = @TrackingId";
                using (MySqlCommand cmd = new MySqlCommand(deleteQuery, conn))
                {
                    cmd.Parameters.AddWithValue("@TrackingId", trackingId);
                    cmd.ExecuteNonQuery();
                }
            }

            // Redirect to cargo page
            Response.Redirect("Cargo.aspx");
        }
    }
}
