<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="SalesSystem.Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <style>
        body {
            font-family: 'Arial', sans-serif;
            color: #333;
        }

        .container {
            margin-top: 3%;
        }

        .form-control {
            border: none;
            border-bottom: 2px solid #ddd;
            border-radius: 0;
            box-shadow: none;
            margin-bottom: 1.5rem;
        }

        .form-control:focus {
            border-color: #5a67d8;
            box-shadow: none;
        }

        .form-label {
            font-weight: bold;
            color: #5a67d8;
        }

        .btn-primary {
            background-color: #5a67d8;
            border: none;
            color: #fff;
            transition: background-color 0.3s, transform 0.3s;
        }

        .btn-primary:hover {
            background-color: #434190;
            transform: translateY(-2px);
        }

        .btn-danger {
            background-color: #e53e3e;
            border: none;
            color: #fff;
            transition: background-color 0.3s, transform 0.3s;
        }

        .btn-danger:hover {
            background-color: #c53030;
            transform: translateY(-2px);
        }

        .btn-success {
            background-color: #48bb78;
            border: none;
            color: #fff;
            transition: background-color 0.3s, transform 0.3s;
        }

        .btn-success:hover {
            background-color: #38a169;
            transform: translateY(-2px);
        }

        .text-danger {
            color: #e53e3e;
        }

        .text-success {
            color: #48bb78;
        }

        .imgBorder {
            border: 1px solid #ddd;
            border-radius: 5px;
            max-width: 400px;
            margin-top: 3%;
            height: auto;
        }
    </style>

    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card shadow-sm p-4">
                    <div class="card-body">
                        <div class="mb-3">
                            <asp:Label ID="lblEmailUser" runat="server" Text="Email:" CssClass="form-label"></asp:Label>
                            <asp:TextBox runat="server" CssClass="form-control" ID="txtemailuser" PlaceHolder="Enter Email" TextMode="Email" />
                            <p class="text-danger" runat="server" id="pEmailValidate" visible="false">That email has already been registered</p>
                            <asp:RequiredFieldValidator Style="color: red" ErrorMessage="Email Required" ControlToValidate="txtemailuser" runat="server" />
                        </div>

                        <div class="mb-3">
                            <asp:Label ID="lblPass" runat="server" Text="Enter new Password:" CssClass="form-label"></asp:Label>
                            <asp:TextBox runat="server" CssClass="form-control" ID="txtPass" PlaceHolder="Enter New Password" TextMode="Password" />
                            <asp:RequiredFieldValidator Style="color: red" ErrorMessage="Password Required" ControlToValidate="txtPass" runat="server" />
                            <asp:RegularExpressionValidator Style="color: red" ErrorMessage="Minimum eight characters, at least one letter, one number and no symbols." ControlToValidate="txtPass" ValidationExpression="^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$" runat="server" />
                        </div>

                        <div class="mb-3">
                            <asp:Label runat="server" ID="lblRepeatPass" Text="Repeat Password:" CssClass="form-label"></asp:Label>
                            <asp:TextBox runat="server" CssClass="form-control" ID="txtRepeatPass" PlaceHolder="Repeat Password" TextMode="Password" />
                        </div>
                        <p class="text-danger" runat="server" visible="false" id="pPasswords">The passwords do not match</p>

                        <div class="mb-3">
                            <asp:Label ID="lblName" runat="server" Text="Name:" CssClass="form-label"></asp:Label>
                            <asp:TextBox runat="server" CssClass="form-control" ID="TxtName" PlaceHolder="Enter your Name" />
                            <asp:RequiredFieldValidator Style="color: red" ErrorMessage="Name Required" ControlToValidate="TxtName" runat="server" />
                        </div>

                        <div class="mb-3">
                            <asp:Label ID="lblSurname" runat="server" Text="Surname:" CssClass="form-label"></asp:Label>
                            <asp:TextBox runat="server" CssClass="form-control" ID="TxtSurname" PlaceHolder="Enter your Surname" />
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-md-6">
                <div class="card shadow-sm p-4">
                    <div class="card-body">
                        <div class="mb-3">
                            <asp:Label ID="lblUrlImg" runat="server" Text="Url Image:" CssClass="form-label"></asp:Label>
                        </div>

                        <div class="mb-3">
                            <input type="file" id="fileUser1" runat="server" class="form-control" />
                        </div>

                        <div class="mb-3">
                            <asp:Label ID="lblUrlLink" Text="Or enter your Url:" runat="server" CssClass="form-label" />
                        </div>

                        <div class="mb-3">
                            <asp:TextBox runat="server" PlaceHolder="Enter Url" ID="txtUrlLink" CssClass="form-control" />
                        </div>

                        <div class="mb-3">
                            <asp:Image runat="server" ID="txtImgUser1" CssClass="img-fluid mb-3 imgBorder" AlternateText="User Image" />
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="row justify-content-center mt-4">
            <div class="col-md-6 text-center">
                <% if (Security.Validation.Login(Session["user"])) { %>
                    <asp:Button Text="Cancel" ID="btnCancel" OnClick="btnCancel_Click" CssClass="btn btn-danger mx-2" Visible="false" runat="server" />
                    <a href="Profile.aspx" class="btn btn-success mx-2">Edit Profile</a>
                <% } else { %>
                    <asp:Button Text="Create User" ID="btnCreate" OnClick="btnCreate_Click" CssClass="btn btn-primary mx-2" runat="server" AutoPostback="false" />
                <% } %>
            </div>
        </div>
    </div>

</asp:Content>

