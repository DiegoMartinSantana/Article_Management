<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="SalesSystem.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card" style="margin-top: 5%">
                <div class="card-header">
                    <h4>Login</h4>
                </div>
                <div class="card-body">
                    <div class="mb-3">
                        <label for="inputEmail" class="form-label">Email : </label>
                        <asp:TextBox type="email" class="form-control" ID="txtEmail" placeholder="Enter your Email : " required="true" runat="server" />
                    </div>
                    <div class="mb-3">
                        <label for="inputPassword" class="form-label">Password :</label>
                        <asp:TextBox type="password" class="form-control" ID="txtPass" placeholder="Enter your Password" required="true" runat="server" />
                       
                    </div>
                    <div class="mb-3">
                        <asp:Label Text="Incorrect Email or Password " Style="color: red" ID="txtWrong" Visible="false" CssClass="form-label" runat="server" />
                    </div>
                    <asp:Button Text="Submit" runat="server" class="btn btn-primary" OnClick="btnSubmit_Click" ID="btnSubmit" />
                </div>
            </div>
        </div>
    </div>

</asp:Content>
