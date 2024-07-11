<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="detailArticle.aspx.cs" Inherits="SalesSystem.detailArticle" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f7f7f7;
            color: #333;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 2rem;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
        }



        .form-group {
            margin-bottom: 1.5rem;
        }

        .form-label {
            font-weight: bold;
            display: block;
            margin-bottom: 0.5rem;
            color: #6a1b9a; /* Lavanda */
        }

        .form-control {
            width: 100%;
            padding: 0.75rem;
            border: 1px solid #ddd;
            border-radius: 5px;
        }

        .img-container {
        text-align: center;
        flex: 0 0 70%; /* La imagen ocupa el 70% de la columna */
    }

    .imgSize {
        width: 100%; /* Asegura que la imagen ocupe el 100% del contenedor */
        height: auto; /* Mantiene la proporción de la imagen */
        object-fit:contain
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
        .btn-primary:hover{
            background-color: #6a1b9a; /* Lavanda */

        }

        .btn-secondary {
            background-color: #fbc02d;
            color: #fff;
        }

        .btn-danger {
            background-color: #d32f2f;
            color: #fff;
        }

        .btn-outline-dark {
            background-color: transparent;
            color: #333;
            border: 1px solid #333;
        }

        .btn-outline-danger {
            background-color: transparent;
            color: #d32f2f;
            border: 1px solid #d32f2f;
        }

        .row {
            display: flex;
            flex-wrap: wrap;
            align-items: flex-start;
            gap: 1.5rem;
        }

        .col {
            flex: 1;
            min-width: 300px;
        }

        .mb-3 {
            margin-bottom: 1.5rem;
        }

        .product-actions {
            display: flex;
            gap: 1rem;
            flex-wrap: wrap;
        }

        .title {
            font-size: 2rem;
            color: #6a1b9a; /* Lavanda */
            margin-bottom: 1rem;
        }

        .price {
            font-size: 1.5rem;
            color: #6a1b9a; /* Lavanda */
            margin-bottom: 1rem;
        }
    </style>

    <div class="container">
        <div class="row">
           <div class="col img-container">
            <asp:Image CssClass="mb-3 imgSize" ID="txtImg" style="margin-top:10%" AlternateText="Img Article" runat="server" />
        </div>
            <div class="col">
                <div class="form-group">
                    <asp:Label Text="Cod Article:" CssClass="form-label" runat="server" />
                    <asp:TextBox CssClass="form-control" ID="txtCodArticle" PlaceHolder="Enter Cod Article" runat="server" />
                </div>
                <div class="form-group">
                    <asp:Label Text="Name:" CssClass="form-label" runat="server" />
                    <asp:TextBox CssClass="form-control" ID="txtName" PlaceHolder="Enter Name" runat="server" />
                </div>
                <div class="form-group">
                    <asp:Label Text="Description:" CssClass="form-label" runat="server" />
                    <asp:TextBox CssClass="form-control" ID="txtDescription" PlaceHolder="Enter Description" runat="server" />
                </div>
                <div class="form-group">
                    <asp:Label Text="Brand:" CssClass="form-label" runat="server" />
                    <asp:TextBox CssClass="form-control" ID="txtBrand" runat="server" />
                </div>
                <div class="form-group">
                    <asp:Label Text="Category:" CssClass="form-label" runat="server" />
                    <asp:TextBox CssClass="form-control" ID="txtCategory" runat="server" />
                </div>
                <div class="form-group">
                    <asp:Label Text="Price:" CssClass="form-label" runat="server" />
                    <asp:TextBox CssClass="form-control" ID="txtPrice"  PlaceHolder="Enter Price" runat="server" />
                </div>
            </div>
        </div>
        <div class="product-actions">
            <% if (Security.Validation.IsAdmin(Session["user"])) { %>
            <asp:Button Text="Edit Article" CssClass="btn btn-primary" style="background-color:#3f51b5ba;" ID="btnEdit" OnClick="btnEdit_Click" runat="server" />
            <asp:Button Text="Delete Article" CssClass="btn btn-danger" ID="btnDelete" OnClick="btnDelete_Click" runat="server" />
            <asp:Button Visible="false" Text="Cancel Delete" CssClass="btn btn-outline-dark" ID="btnCancelDelete" OnClick="btnCancelDelete_Click" runat="server" />
            <asp:Button Visible="false" Text="Confirm Delete" CssClass="btn btn-outline-danger" ID="btnConfirm" OnClick="btnConfirm_Click" runat="server" />
            <% } %>
        </div>
    </div>
</asp:Content>
