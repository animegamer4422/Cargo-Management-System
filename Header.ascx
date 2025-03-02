<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Header.ascx.cs" Inherits="CargoManagement.Header" %>

<nav class="navbar navbar-expand-lg navbar-dark">
    <div class="container">
        <a href="Default.aspx" class="navbar-brand">
            <img src="images/logo.png" alt="Cargo Logo" class="logo-img">
        </a>

        <!-- Fix navbar toggle button -->
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
            data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" 
            aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                <asp:Literal ID="navLinks" runat="server"></asp:Literal>
            </ul>
        </div>
    </div>
</nav>
