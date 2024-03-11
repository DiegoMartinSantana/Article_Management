<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="RecoverPass.aspx.cs" Inherits="SalesSystem.RecoverPass" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .marginleft {
            margin-left: 35%;
        }
    </style>
    <div style="margin-top: 5%" class="row marginleft">

        <div class="col">

            <div class="mb-3">
                <asp:Label Text="We have sent a code to your email to reset your password." CssClass="form-label" runat="server" />
            </div>
            <div class="mb-2 ">
                <asp:TextBox runat="server" PlaceHolder="Enter Recover code" CssClass="form-control d-inline" ID="txtCod" />
                <asp:Button Style="margin-left: 4%" Text="Send" CssClass="btn btn-primary d-inline" ID="btnSend" OnClick="btnSend_Click" runat="server" />
            </div>

            <div>
                <asp:RequiredFieldValidator Style="color: red" CssClass="d-lg-table-row" ErrorMessage="Required" ControlToValidate="txtCod" runat="server" />
                <p id="pCodeInvalid" runat="server" visible="false" style="color: red">Invalid Code </p>
            </div>
        </div>


    </div>
    <div class="row marginleft" runat="server" id="rowRecover" visible="false">
        <div class="mb-3">
            <asp:Label Text="Enter New pass : " CssClass="form-label" runat="server" />

        </div>
        <div class="mb-3">
            <asp:TextBox runat="server" PlaceHolder="Enter New pass" CssClass="form-control" ID="txtNewPass" />
            <asp:RequiredFieldValidator Style="color: red" ErrorMessage="Required" ControlToValidate="txtNewPass" runat="server" />
            <asp:RegularExpressionValidator Style="color: red" ErrorMessage="Minimum eight characters, at least one letter , one number and not simbols."
                ControlToValidate="txtNewPass"
                ValidationExpression="^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$" runat="server" />
        </div>
        <div class="mb-3">
            <asp:TextBox runat="server" PlaceHolder="Confirm password" CssClass="form-control" ID="txtRepeatNewPass" />

            <p id="pNotEquals" runat="server" visible="false" style="color: red">Passwords are not equals. </p>
            <asp:Button Text="Recover" style="margin-top:3%" CssClass="btn btn-primary" ID="btnRecover" OnClick="btnRecover_Click" runat="server" />

        </div>
    </div>

</asp:Content>
