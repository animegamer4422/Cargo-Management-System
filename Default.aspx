<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="CargoManagement.Default" %>
<%@ Register TagPrefix="uc" Src="Header.ascx" TagName="Header" %>
<%@ Register TagPrefix="uc" Src="Footer.ascx" TagName="Footer" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cargo Management System</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="css/styles.css">
</head>
<body>

    <form id="form1" runat="server">
        <!-- 🔹 Load Header -->
        <uc:Header runat="server" />

        <!-- 🔹 Banner -->
        <div class="banner">
            <h1>Welcome to Cargo Booking System</h1>
        </div>

        <!-- 🔹 Services Section -->
        <div class="service-container">
            <div class="container">
                <h2>Our Services</h2>
                <p>Reliable and efficient cargo management.</p>
                <div class="service-box">
                    <div class="card">
                        <h3>Fast Delivery</h3>
                        <p>Get your cargo delivered in record time with our express shipping options.</p>
                    </div>
                    <div class="card">
                        <h3>Global Coverage</h3>
                        <p>We ship worldwide with a reliable tracking system.</p>
                    </div>
                    <div class="card">
                        <h3>Secure Packaging</h3>
                        <p>Your items are handled with care to ensure safe delivery.</p>
                    </div>
                </div>
            </div>
        </div>

        <!-- 🔹 Our Members Section -->
        <div class="members-section py-5 bg-light">
            <div class="container text-center">
                <h2>Our Members</h2>
                <p>Meet the team behind our success.</p>

                <div class="row justify-content-center">
                    <!-- Member 1 -->
                    <div class="col-md-4">
                        <div class="member-card">
                            <img src="images/mem-1.png" alt="Rob Boss" class="profile-img">
                            <h4>Rob Boss</h4>
                        </div>
                    </div>

                    <!-- Member 2 -->
                    <div class="col-md-4">
                        <div class="member-card">
                            <img src="images/mem-2.png" alt="Member 2" class="profile-img">
                            <h4>Knee-Onu Reefs</h4>
                        </div>
                    </div>

                    <!-- Member 3 -->
                    <div class="col-md-4">
                        <div class="member-card">
                            <img src="images/mem-3.png" alt="Member 3" class="profile-img">
                            <h4>Nail daGrass Bison</h4>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- 🔹 Load Footer -->
        <uc:Footer runat="server" />
    </form>

</body>
</html>
