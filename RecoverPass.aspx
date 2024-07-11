<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="RecoverPass.aspx.cs" Inherits="SalesSystem.RecoverPass" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .marginleft {
            margin-left: 35%;
        }

        .form-label {
            font-weight: bold;
            color: #6a1b9a; /* Lavanda */
        }

        .form-control {
            width: 100%;
            padding: 0.75rem;
            border: 1px solid #ddd;
            border-radius: 5px;
        }

        .btn {
            padding: 0.75rem 1.5rem;
            border: none;
            border-radius: 5px;
            transition: background-color 0.3s;
        }

        .btn-primary {
            background-color: #6a1b9a; /* Lavanda */
            color: #fff;
        }

        .btn-primary:hover {
            background-color: #492a68; /* Tonos más oscuros */
        }

        .btn-secondary {
            background-color: #fbc02d; /* Amarillo */
            color: #333;
        }

        .btn-secondary:hover {
            background-color: #d4a600; /* Tonos más oscuros */
        }

        .error-message {
            color: red;
            margin-top: 0.5rem;
        }
    </style>

    <div style="margin-top: 5%;" class="row marginleft">
        <div class="col">
            <div class="mb-3">
                <asp:Label Text="We have sent a code to your email to reset your password." CssClass="form-label" runat="server" />
            </div>
            <div class="mb-2">
                <asp:TextBox runat="server" PlaceHolder="Enter Recovery Code" CssClass="form-control d-inline" ID="txtCod" />
                <asp:Button Text="Send" CssClass="btn btn-primary d-inline" ID="btnSend" OnClick="btnSend_Click" runat="server" />
            </div>
            <div>
                <asp:RequiredFieldValidator Style="color: red" CssClass="d-lg-table-row" ErrorMessage="Required" ControlToValidate="txtCod" runat="server" />
                <p id="pCodeInvalid" runat="server" visible="false" class="error-message">Invalid Code</p>
            </div>
        </div>
    </div>

    <div class="row marginleft" runat="server" id="rowRecover" visible="false">
        <div class="mb-3">
            <asp:Label Text="Enter New Password:" CssClass="form-label" runat="server" />
        </div>
        <div class="mb-3">
            <asp:TextBox runat="server" PlaceHolder="Enter New Password" CssClass="form-control" ID="txtNewPass" />
            <asp:RequiredFieldValidator Style="color: red" ErrorMessage="Required" ControlToValidate="txtNewPass" runat="server" />
            <asp:RegularExpressionValidator Style="color: red" ErrorMessage="Minimum eight characters, at least one letter, one number, and no symbols."
                ControlToValidate="txtNewPass"
                ValidationExpression="^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$" runat="server" />
        </div>
        <div class="mb-3">
            <asp:TextBox runat="server" PlaceHolder="Confirm Password" CssClass="form-control" ID="txtRepeatNewPass" />
            <p id="pNotEquals" runat="server" visible="false" class="error-message">Passwords do not match.</p>
            <asp:Button Text="Recover" CssClass="btn btn-primary" ID="btnRecover" OnClick="btnRecover_Click" runat="server" style="margin-top: 1rem;" />
        </div>
    </div>
</asp:Content>
