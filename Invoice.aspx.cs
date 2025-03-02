using System;
using System.Data;
using System.Web.UI;
using MySql.Data.MySqlClient;

namespace CargoManagement
{
    public partial class Invoice : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadInvoiceDetails();
            }
        }

        private void LoadInvoiceDetails()
        {
            string trackingId = Request.QueryString["tracking_id"];
            string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["MySqlConnection"].ConnectionString;

            using (MySqlConnection conn = new MySqlConnection(connectionString))
            {
                conn.Open();
                string query = "SELECT sender_name, sender_contact, sender_address, receiver_name, receiver_contact, receiver_address, pickup, destination, weight, volume, quantity, estimated_delivery, (weight * 5) AS amount FROM cargo WHERE tracking_id = @TrackingId";

                using (MySqlCommand cmd = new MySqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@TrackingId", trackingId);
                    using (MySqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            lblSenderName.Text = reader["sender_name"].ToString();
                            lblSenderContact.Text = reader["sender_contact"].ToString();
                            lblSenderAddress.Text = reader["sender_address"].ToString();
                            lblReceiverName.Text = reader["receiver_name"].ToString();
                            lblReceiverContact.Text = reader["receiver_contact"].ToString();
                            lblReceiverAddress.Text = reader["receiver_address"].ToString();
                            lblPickup.Text = reader["pickup"].ToString();
                            lblDestination.Text = reader["destination"].ToString();
                            lblWeight.Text = reader["weight"].ToString();
                            lblVolume.Text = reader["volume"].ToString();
                            lblQuantity.Text = reader["quantity"].ToString();
                            lblEstimatedDelivery.Text = reader["estimated_delivery"].ToString();
                            lblAmount.Text = "₹" + reader["amount"].ToString();
                        }
                    }
                }
            }
        }
    }
}
