<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Cancel.aspx.cs" Inherits="CargoManagement.Cancel" %>
<%@ Register TagPrefix="uc" Src="Header.ascx" TagName="Header" %>
<%@ Register TagPrefix="uc" Src="Footer.ascx" TagName="Footer" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cancel Cargo - Cargo Management</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/styles.css">
</head>
<body>

    <form id="form1" runat="server">
        <!-- 🔹 Load Header -->
        <uc:Header runat="server" />

        <div class="container mt-5">
            <h2>Cancel Cargo</h2>
            <asp:Label ID="lblCancelMessage" runat="server" ForeColor="Red"></asp:Label>
            <div class="card p-3">
                <p><strong>Tracking ID:</strong> <asp:Label ID="lblTrackingId" runat="server"></asp:Label></p>
                <p><strong>Pickup Location:</strong> <asp:Label ID="lblPickup" runat="server"></asp:Label></p>
                <p><strong>Destination:</strong> <asp:Label ID="lblDestination" runat="server"></asp:Label></p>
                <p><strong>Original Payment:</strong> ₹<asp:Label ID="lblAmount" runat="server"></asp:Label></p>
                <p><strong>Refund After Fee:</strong> ₹<asp:Label ID="lblRefundAmount" runat="server"></asp:Label></p>
            </div>

            <div class="text-center mt-3">
                <asp:Button ID="btnConfirmCancel" runat="server" CssClass="btn btn-danger" Text="Confirm Cancellation" OnClick="btnConfirmCancel_Click" />
            </div>
        </div>

        <!-- 🔹 Load Footer -->
        <uc:Footer runat="server" />
    </form>

</body>
</html>
