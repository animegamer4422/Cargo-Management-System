<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManageAdmins.aspx.cs" Inherits="CargoManagement.ManageAdmins" %>
<%@ Register TagPrefix="uc" Src="Header.ascx" TagName="Header" %>
<%@ Register TagPrefix="uc" Src="Footer.ascx" TagName="Footer" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Admins - Cargo Management</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="css/styles.css">
</head>
<body>
    <uc:Header runat="server" />

    <div class="container mt-5">
        <h2 class="text-center">Manage Admin Users</h2>

        <form id="form1" runat="server">
            <asp:Label ID="lblMessage" runat="server" CssClass="text-danger"></asp:Label>

            <!-- ADD ADMIN FORM -->
            <div class="card mt-4">
                <div class="card-header bg-primary text-white">Add New Admin</div>
                <div class="card-body">
                    <div class="mb-3">
                        <asp:TextBox ID="txtNewFullName" runat="server" CssClass="form-control" Placeholder="Full Name"></asp:TextBox>
                    </div>
                    <div class="mb-3">
                        <asp:TextBox ID="txtNewContact" runat="server" CssClass="form-control" Placeholder="Contact"></asp:TextBox>
                    </div>
                    <div class="mb-3">
                        <asp:TextBox ID="txtNewCity" runat="server" CssClass="form-control" Placeholder="City"></asp:TextBox>
                    </div>
                    <div class="mb-3">
                        <asp:TextBox ID="txtNewEmail" runat="server" CssClass="form-control" Placeholder="Email"></asp:TextBox>
                    </div>
                    <div class="mb-3">
                        <asp:TextBox ID="txtNewPassword" runat="server" TextMode="Password" CssClass="form-control" Placeholder="Password"></asp:TextBox>
                    </div>
                    <div class="d-grid">
                        <asp:Button ID="btnAddAdmin" runat="server" CssClass="btn btn-success" Text="Add Admin" OnClick="btnAddAdmin_Click" />
                    </div>
                </div>
            </div>

            <!-- ADMIN LIST -->
            <div class="table-responsive mt-4">
                <asp:GridView ID="gridAdmins" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered"
                    DataKeyNames="id" OnRowEditing="gridAdmins_RowEditing" OnRowUpdating="gridAdmins_RowUpdating"
                    OnRowCancelingEdit="gridAdmins_RowCancelingEdit" OnRowDeleting="gridAdmins_RowDeleting">
                    <Columns>
                        <asp:BoundField DataField="id" HeaderText="ID" ReadOnly="True" />
                        <asp:TemplateField HeaderText="Full Name">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtFullName" runat="server" Text='<%# Bind("fullname") %>' CssClass="form-control"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblFullName" runat="server" Text='<%# Eval("fullname") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Contact">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtContact" runat="server" Text='<%# Bind("contact") %>' CssClass="form-control"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblContact" runat="server" Text='<%# Eval("contact") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="City">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtCity" runat="server" Text='<%# Bind("city") %>' CssClass="form-control"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblCity" runat="server" Text='<%# Eval("city") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Email">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtEmail" runat="server" Text='<%# Bind("email") %>' CssClass="form-control"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblEmail" runat="server" Text='<%# Eval("email") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:CommandField ShowEditButton="True" HeaderText="Actions" />
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Button ID="btnDelete" runat="server" Text="Delete" CssClass="btn btn-danger btn-sm"
                                    CommandName="Delete" CommandArgument='<%# Eval("id") %>' OnClientClick="return confirm('Are you sure?');"/>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </form>
    </div>

    <uc:Footer runat="server" />
</body>
</html>
