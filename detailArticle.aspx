<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="detailArticle.aspx.cs" Inherits="SalesSystem.detailArticle" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        

        .sizeTxt {
            width: 60%;
            max-width: 100%;
        }

        .formCheck {
            height: 33px;
            max-width: 400px;
            width: 200px;
            margin-left: 75px;
            text-align: center;
        }
    </style>


    <div class="row" ">

       
        <div class="col ">


            <div class="mb-3  ">
                <asp:Label Text="Cod Article : " runat="server" />

            </div>
            <div class="mb-3  ">
                <asp:TextBox runat="server" CssClass="sizeTxt form-control" ID="txtCodArticle" PlaceHolder="Enter Cod Article" />
            </div>
            <div class="mb-3  ">
                <asp:Label Text="Name : " runat="server" />

            </div>
            <div class="mb-3  ">
                <asp:TextBox runat="server" ID="txtName" CssClass="form-control sizeTxt" PlaceHolder="Enter Name " />
            </div>
            <div class="mb-3  ">
                <asp:Label Text="Description : " runat="server" />

            </div>
            <div class="mb-3">
                <asp:TextBox runat="server" ID="txtDescription" class="form-control sizeTxt" PlaceHolder="Enter Description" />
            </div>
          
            <div class="mb-3  ">
                <asp:Label Text="Brand : " runat="server" />

            </div>
            <div class="mb-3 ">
                <asp:TextBox runat="server" ID="txtBrand" class="form-control sizeTxt" />
            </div>

            <div class="mb-3 ">
                <asp:Label Text="Category : " runat="server" />

            </div>
            <div class="mb-3 ">
                <asp:TextBox runat="server" ID="txtCategory" class="form-control sizeTxt" />
            </div>
          
        </div>
        <div class="col ">
            <div class="mb-3 ">
                <asp:Label Text="Price : " runat="server" />

            </div>
            <div class="mb-3 ">
                <asp:TextBox runat="server" ID="txtPrice" class="form-control sizeTxt" PlaceHolder="Enter Price" />
            </div>
          
            <div class="mb-3">
                <asp:Image runat="server" CssClass="img-fluid mb-3 imgSize" ID="txtImg" AlternateText="Img Article" />
            </div>
          
        </div>

    </div>
    <div class="row">
        <%if (Security.Validation.IsAdmin(Session["user"])) {  %>
       
        <div class="mb-3" style="margin-top: 2%">
            <asp:Button Text="Edit Article " CssClass="btn btn-secondary" ID="btnEdit" OnClick="btnEdit_Click" runat="server" />
            <asp:Button Text="Delete Article" CssClass="btn btn-danger" ID="btnDelete" OnClick="btnDelete_Click" runat="server" Style="margin-left:2%" />


            <asp:Button Visible="false" Text="Cancel Delete" CssClass="btn btn-outline-dark" ID="btnCancelDelete" OnClick="btnCancelDelete_Click" runat="server" Style="margin-left:5%" />

            <asp:Button Visible="false" Text="Confirm Delete" CssClass="btn btn-outline-danger" ID="btnConfirm" OnClick="btnConfirm_Click" runat="server" Style="margin-left:5%" />
        </div>

        
        <%} %>
    </div>
        


</asp:Content>
