<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs"  Inherits="SalesSystem.Login" Async="true"  %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        body {
            font-family: 'Arial', sans-serif;
            color: #333;
        }

        .card {
            margin-top: 5%;
            border: none;
            border-radius: 15px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .card-header {
            background-color: lavender;
            border-bottom: none;
            border-radius: 15px 15px 0 0;
            text-align: center;
            padding: 20px;
        }

        .card-header h4 {
            margin: 0;
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

        .card-body {
            padding: 30px;
            background-color: #fff;
            border-radius: 0 0 15px 15px;
        }

       
        .form-control {
            border: 1px solid #ddd;
            border-radius: 5px;
        }

    

        .btn-danger {
            border: none;
            color: #fff;
            transition: background-color 0.3s;
        }


        .text-danger {
            color: red;
        }

        .text-success {
            color: green;
        }
    </style>
    <div class="row justify-content-center">
        <div class="col-md-6" style="margin-top:5%">
            <div class="card">
                <div class="card-header" >
                    <h4>Login</h4>
                </div>
                <div class="card-body">
                    <div class="mb-3">
                        <label class="form-label">Email:</label>
                        <asp:TextBox type="email" class="form-control" ID="txtEmail" placeholder="Enter your Email" required="true" runat="server" />
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Password:</label>
                        <asp:TextBox type="password" class="form-control" ID="txtPass" placeholder="Enter your Password" runat="server" />
                    </div>
                    <div class="mb-3">
                        <asp:Label Text="Incorrect Email or Password" ID="txtWrong" Visible="false" CssClass="text-danger form-label" runat="server" />
                    </div>
                    <div style="margin-top:1.5%">
                    <asp:Button Text="Submit" runat="server" class="btn  btn-primary" OnClick="btnSubmit_Click" ID="btnSubmit" />
                    <asp:Button Text="Recover Password" style="margin-left: 3%" runat="server" class="btn btn-danger" OnClick="btnRecoverPassword_Click" ID="btnRecoverPassword" />

                    </div>
                </div>
            </div>
        </div>
        <p runat="server" id="pChangedPass" visible="false" class="text-success" style="margin-left: 50%; margin-top: 1%">The password has been changed successfully.</p>
    </div>
</asp:Content>
