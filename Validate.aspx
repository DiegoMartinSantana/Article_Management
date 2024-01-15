<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Validate.aspx.cs" Inherits="SalesSystem.Validate" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <div class="col">
            <div class="mb-3">
                <h4>Please Enter your Password to make Changes </h4>

            </div>
            <div class="mb-3">
                <asp:TextBox runat="server" CssClass="form form-control" PlaceHolder="Enter Pass" ID="txtValidatePass" />
                <asp:Button Text="Validate" runat="server" ID="btnValidatePass" OnClick="btnValidatePass_Click" CssClass="btn btn-primary"/>
            </div>

        </div>
    </div>
</asp:Content>
