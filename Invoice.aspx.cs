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
            if (string.IsNullOrEmpty(trackingId))
            {
                Response.Write("Error: Missing tracking ID.");
                return;
            }

            string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["MySqlConnection"].ConnectionString;

            using (MySqlConnection conn = new MySqlConnection(connectionString))
            {
                conn.Open();

                // **Fetch correct amount from payments table instead of recalculating**
                string query = @"
                    SELECT c.sender_name, c.sender_contact, c.sender_address, 
                           c.receiver_name, c.receiver_contact, c.receiver_address, 
                           c.sender_city AS pickup, c.receiver_city AS destination, 
                           c.weight, c.volume, c.quantity, 
                           p.amount AS amount
                    FROM cargo c
                    JOIN payments p ON c.tracking_id = p.tracking_id
                    WHERE c.tracking_id = @TrackingId";

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
                            lblAmount.Text = "₹" + reader["amount"].ToString();
                        }
                        else
                        {
                            Response.Write("Error: No invoice found for this tracking ID.");
                        }
                    }
                }
            }
        }
    }
}
