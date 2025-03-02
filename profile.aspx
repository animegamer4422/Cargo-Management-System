<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="profile.aspx.cs" Inherits="CargoManagement.Profile" %>
<%@ Register TagPrefix="uc" Src="~/Header.ascx" TagName="Header" %>
<%@ Register TagPrefix="uc" Src="~/Footer.ascx" TagName="Footer" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Profile - Cargo Management</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/styles.css">
</head>
<body>

    <form id="form1" runat="server">
        <!-- 🔹 Load Header -->
        <uc:Header runat="server" />

        <!-- Profile Form -->
        <section class="cargo-form mb-5">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="lg-offset-2 col-lg-8 col-md-12">
                        <div class="sender-details mt-5 p-5" style="background-color: whitesmoke;">

                            <h5 style="font-weight: bold;" class="text-center mb-5">
                                <asp:Literal ID="lblProfileTitle" runat="server"></asp:Literal>
                            </h5>

                            <asp:Label ID="lblMessage" runat="server" ForeColor="Red" CssClass="text-center d-block"></asp:Label>

                            <div class="form-outline mb-4">
                                <div class="row">
                                    <div class="col-md-3">
                                        <label class="form-label">Full Name:</label>
                                    </div>
                                    <div class="col-md-9">
                                        <asp:TextBox ID="txtFullname" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                            </div>

                            <div class="form-outline mb-4">
                                <div class="row">
                                    <div class="col-md-3">
                                        <label class="form-label">Email Address:</label>
                                    </div>
                                    <div class="col-md-9">
                                        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                                    </div>
                                </div>
                            </div>

                            <div class="form-outline mb-4">
                                <div class="row">
                                    <div class="col-md-3">
                                        <label class="form-label">Contact Number:</label>
                                    </div>
                                    <div class="col-md-9">
                                        <asp:TextBox ID="txtContact" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                            </div>

                            <div class="form-outline mb-4">
                                <div class="row">
                                    <div class="col-md-3">
                                        <label class="form-label">City Name:</label>
                                    </div>
                                    <div class="col-md-9">
                                        <asp:TextBox ID="txtCity" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                            </div>

                            <div class="button-sub text-center">
                                <asp:Button ID="btnUpdateProfile" runat="server" CssClass="btn btn-dark btn-block mt-4" Text="Update Profile" OnClick="btnUpdateProfile_Click" />
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- 🔹 Load Footer -->
        <uc:Footer runat="server" />
    </form>

</body>
</html>
