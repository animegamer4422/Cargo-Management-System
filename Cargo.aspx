<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Cargo.aspx.cs" Inherits="CargoManagement.Cargo" %>
<%@ Register TagPrefix="uc" Src="~/Header.ascx" TagName="Header" %>
<%@ Register TagPrefix="uc" Src="~/Footer.ascx" TagName="Footer" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Book Cargo - Cargo Management</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/styles.css">
</head>
<body>

    <form id="form1" runat="server">
        <!-- 🔹 Load Header -->
        <uc:Header runat="server" />

        <!-- 🔹 View Ongoing Deliveries -->
        <section class="current-cargo">
            <div class="container">
                <h2>Ongoing Cargo Deliveries</h2>
                <asp:GridView ID="gridCargo" runat="server" CssClass="table table-bordered" AutoGenerateColumns="False" OnRowCommand="gridCargo_RowCommand">
                    <Columns>
                        <asp:BoundField DataField="tracking_id" HeaderText="Tracking ID" />
                        <asp:BoundField DataField="sender_name" HeaderText="Sender Name" />
                        <asp:BoundField DataField="receiver_name" HeaderText="Receiver Name" />
                        <asp:BoundField DataField="pickup" HeaderText="Pickup Location" />
                        <asp:BoundField DataField="destination" HeaderText="Destination" />
                        <asp:BoundField DataField="weight" HeaderText="Weight (kg)" />
                        <asp:BoundField DataField="volume" HeaderText="Volume (m³)" />
                        <asp:BoundField DataField="quantity" HeaderText="Quantity" />
                        <asp:BoundField DataField="estimated_delivery" HeaderText="Estimated Delivery Date" />
                        <asp:BoundField DataField="status" HeaderText="Status" />

<asp:TemplateField HeaderText="Action">
    <ItemTemplate>
        <!-- Cancel Button (Only for Pending/In-Transit Deliveries) -->
        <asp:Button ID="btnCancel" runat="server" CssClass="btn btn-danger btn-sm"
            Text="Cancel" CommandName="CancelCargo" CommandArgument='<%# Eval("tracking_id") %>' 
            OnClientClick="return confirm('Are you sure you want to cancel this cargo?');"
            Visible='<%# Eval("status").ToString() != "Delivered" %>' />

        <!-- Invoice Button (Only for Delivered Cargo) -->
        <asp:Button ID="btnInvoice" runat="server" CssClass="btn btn-success btn-sm"
            Text="Invoice" CommandName="ViewInvoice" CommandArgument='<%# Eval("tracking_id") %>' 
            Visible='<%# Eval("status").ToString() == "Delivered" %>' />
    </ItemTemplate>
</asp:TemplateField>

                    </Columns>
                </asp:GridView>
            </div>
        </section>

        <!-- 🔹 Cargo Booking Form -->
        <section class="cargo-form mt-5">
            <div class="container">
                <h2>Book a New Cargo</h2>
                <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>

                <div class="row">
                    <div class="col-md-6 mb-3">
                        <label>Sender Name:</label>
                        <asp:TextBox ID="txtSenderName" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label>Sender Email:</label>
                        <asp:TextBox ID="txtSenderEmail" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-6 mb-3">
                        <label>Sender Contact:</label>
                        <asp:TextBox ID="txtSenderContact" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label>Sender Address:</label>
                        <asp:TextBox ID="txtSenderAddress" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-6 mb-3">
                        <label>Receiver Name:</label>
                        <asp:TextBox ID="txtReceiverName" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label>Receiver Email:</label>
                        <asp:TextBox ID="txtReceiverEmail" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-6 mb-3">
                        <label>Receiver Contact:</label>
                        <asp:TextBox ID="txtReceiverContact" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label>Receiver Address:</label>
                        <asp:TextBox ID="txtReceiverAddress" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-6 mb-3">
                        <label>Pickup Location:</label>
                        <asp:DropDownList ID="ddlPickup" runat="server" CssClass="form-control"></asp:DropDownList>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label>Destination:</label>
                        <asp:DropDownList ID="ddlDestination" runat="server" CssClass="form-control"></asp:DropDownList>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-4 mb-3">
                        <label>Weight (kg):</label>
                        <asp:TextBox ID="txtWeight" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="col-md-4 mb-3">
                        <label>Volume (m³):</label>
                        <asp:TextBox ID="txtVolume" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="col-md-4 mb-3">
                        <label>Quantity:</label>
                        <asp:TextBox ID="txtQuantity" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                </div>

                <div class="text-center mt-3">
                    <asp:Button ID="btnBookCargo" runat="server" CssClass="btn btn-primary" Text="Proceed to Payment" OnClick="btnBookCargo_Click" />
                </div>
            </div>
        </section>

        <!-- 🔹 Load Footer -->
        <uc:Footer runat="server" />
    </form>

</body>
</html>
