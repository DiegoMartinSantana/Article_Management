<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Wholesalers.aspx.cs" Inherits="SalesSystem.Wholesalers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">

        <div class="col">
            <div class="mb-4" style="margin-top:2.5%">
                <h4>For wholesale sales give us your email and we will comunicate with you. </h4>
                <h5>(Minimum of 5 Articles)</h5>
            </div>
        </div>
        </div>
    <div class="row">
        <div class="col">
            
            <div class="mb-3">
                <asp:TextBox runat="server" ID="txtEmailSend" style="max-width:80%" CssClass="form-control"/>
            </div>

        </div>
    </div>
    <div class="row">
        <div class="mb-4">
            <asp:Button Text="Send" CssClass="btn btn-primary " style="" OnClick="btnSendEmail_Click" ID="btnSendEmail"   runat="server" />
            <asp:Label Text="Thanks, we will contact with you!." CssClass="form-label" runat ="server" ID="txtThanks" Visible="false" Enabled="false"/>
            </div>
    
    </div>
</asp:Content>
