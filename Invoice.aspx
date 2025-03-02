<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Invoice.aspx.cs" Inherits="CargoManagement.Invoice" %>
<%@ Register TagPrefix="uc" Src="Header.ascx" TagName="Header" %>
<%@ Register TagPrefix="uc" Src="Footer.ascx" TagName="Footer" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Invoice - Cargo Management</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/styles.css">
    <script>
        function printInvoice() {
            window.print();
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <uc:Header runat="server" />

        <div class="container mt-5">
            <div class="card shadow-lg p-4">
                <h2 class="text-center mb-4">Cargo Invoice</h2>

                <!-- Sender & Receiver Details -->
                <div class="row">
                    <div class="col-md-6">
                        <div class="card p-3 mb-3">
                            <h4 class="text-primary">Sender Details</h4>
                            <div><strong>Name:</strong> <asp:Label ID="lblSenderName" runat="server"></asp:Label></div>
                            <div><strong>Contact:</strong> <asp:Label ID="lblSenderContact" runat="server"></asp:Label></div>
                            <div><strong>Address:</strong> <asp:Label ID="lblSenderAddress" runat="server"></asp:Label></div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="card p-3 mb-3">
                            <h4 class="text-primary">Receiver Details</h4>
                            <div><strong>Name:</strong> <asp:Label ID="lblReceiverName" runat="server"></asp:Label></div>
                            <div><strong>Contact:</strong> <asp:Label ID="lblReceiverContact" runat="server"></asp:Label></div>
                            <div><strong>Address:</strong> <asp:Label ID="lblReceiverAddress" runat="server"></asp:Label></div>
                        </div>
                    </div>
                </div>

                <!-- Cargo Details -->
                <div class="card p-3 mb-3">
                    <h4 class="text-primary">Cargo Details</h4>
                    <div><strong>Pickup Location:</strong> <asp:Label ID="lblPickup" runat="server"></asp:Label></div>
                    <div><strong>Destination:</strong> <asp:Label ID="lblDestination" runat="server"></asp:Label></div>
                    <div><strong>Weight:</strong> <asp:Label ID="lblWeight" runat="server"></asp:Label> kg</div>
                    <div><strong>Volume:</strong> <asp:Label ID="lblVolume" runat="server"></asp:Label> m³</div>
                    <div><strong>Quantity:</strong> <asp:Label ID="lblQuantity" runat="server"></asp:Label></div>
                    <div><strong>Estimated Delivery:</strong> <asp:Label ID="lblEstimatedDelivery" runat="server"></asp:Label></div>
                </div>

                <!-- Payment Section -->
                <div class="card p-3 mb-4">
                    <h4 class="text-danger">Payment Details</h4>
                    <div><strong>Amount:</strong> <asp:Label ID="lblAmount" runat="server" CssClass="fw-bold text-success fs-5"></asp:Label></div>
                </div>

                <!-- Print Button -->
                <div class="text-center">
                    <button type="button" class="btn btn-primary btn-lg" onclick="printInvoice()">Print Invoice</button>
                </div>
            </div>
        </div>

        <uc:Footer runat="server" />
    </form>
</body>
</html>
