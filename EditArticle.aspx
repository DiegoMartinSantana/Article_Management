<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EditArticle.aspx.cs" Inherits="SalesSystem.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        body {
            font-family: 'Arial', sans-serif;
            color: #333;
        }

        .container {
            max-width: 900px;
            margin: 50px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 15px;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
        }

        .form-group {
            margin-bottom: 0.8rem;
        }

        .form-label {
            font-weight: bold;
            display: block;
            margin-bottom: 0.5rem;
            color: #3f51b5;
        }

        .form-control {
            width: 100%;
            padding: 0.75rem;
            border: 1px solid #ddd;
            border-radius: 5px;
            transition: border-color 0.3s;
        }

            .form-control:focus {
                border-color: #3f51b5;
                outline: none;
            }

        .img-container {
            text-align: center;
            margin: 20px 0;
        }

        .imgSize {
            max-width: 100%;
            height: auto;
            border-radius: 10px;
            box-shadow: 0 5px 10px rgba(0, 0, 0, 0.1);
        }

        .btn {
            padding: 0.75rem 1.5rem;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s, transform 0.3s;
        }

            .btn:hover {
                transform: translateY(-3px);
            }

        .btn-primary {
            background-color: #3f51b5;
            color: #fff;
        }

        .btn-secondary {
            background-color: #f44336;
            color: #fff;
        }

        .btn-dark {
            background-color: #333;
            color: #fff;
        }

        .btn-outline {
            background-color: transparent;
            color: #333;
            border: 2px solid #333;
        }

        .row {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
        }

        .col {
            flex: 1;
            min-width: 300px;
        }

        .title {
            font-size: 2rem;
            text-align: center;
            margin-bottom: 20px;
        }

        .header {
            text-align: center;
            padding: 20px;
            background-color: #e3f2fd;
            border-radius: 15px;
            margin-bottom: 30px;
        }
    </style>
        <div class="header">
            <h3 class="title">Edit your Article</h3>
        </div>

        <div class="row">
            <div class="col">
                <div class="form-group">
                    <asp:Label Text="Cod Article:" CssClass="form-label" runat="server" />
                    <asp:TextBox CssClass="form-control" ID="txtCodArticle" runat="server" />
                    <asp:RequiredFieldValidator Style="color: red" ErrorMessage="Required" ControlToValidate="txtCodArticle" runat="server" />
                    <asp:RegularExpressionValidator ErrorMessage="Less than 8 characters" ControlToValidate="txtCodArticle" ValidationExpression="^[A-Za-z\d]{1,7}$" runat="server" />
                </div>

                <div class="form-group">
                    <asp:Label Text="Name:" CssClass="form-label" runat="server" />
                    <asp:TextBox CssClass="form-control" ID="txtName" runat="server" />
                    <asp:RequiredFieldValidator Style="color: red" ErrorMessage="Required" ControlToValidate="txtName" runat="server" />
                    <asp:RegularExpressionValidator ErrorMessage="No symbols" ControlToValidate="txtName" ValidationExpression="^[a-zA-Z0-9\s]*$" runat="server" />
                </div>

                <div class="form-group">
                    <asp:Label Text="Description:" CssClass="form-label" runat="server" />
                    <asp:TextBox CssClass="form-control" ID="txtDescription" runat="server" />
                    <asp:RequiredFieldValidator Style="color: red" ErrorMessage="Required" ControlToValidate="txtDescription" runat="server" />
                    <asp:RegularExpressionValidator Style="color: red" ErrorMessage="Minimum 10 characters" ControlToValidate="txtDescription" ValidationExpression="^.{10,}$" runat="server" />
                </div>
                <asp:UpdatePanel runat="server">
                    <ContentTemplate>
                        <div class="form-group">
                            <asp:Label Text="Current Category:" CssClass="form-label " runat="server" />
                            <asp:TextBox CssClass="form-control mb-3" ID="txtCurrentCat" Enabled="false" runat="server" />
                            <asp:Button Text="Edit Category" CssClass="btn " Style="background: #3f51b5ba" runat="server" ID="btnEditCat" OnClick="btnEditCat_Click" />
                        </div>

                        <div class="form-group" runat="server" id="divNewCat" visible="false">
                            <asp:Label Text="New Category:" CssClass="form-label" runat="server" />
                            <asp:DropDownList CssClass="form-control" runat="server" ID="ddlCategories" />
                        </div>

                        <div class="form-group">
                            <asp:Label Text="Current Brand:" CssClass="form-label" runat="server" />
                            <asp:TextBox CssClass="form-control mb-3" ID="txtCurrentBrand" Enabled="false" runat="server" />
                            <asp:Button Text="Edit Brand" CssClass="btn" Style="background: #3f51b5ba" ID="btnEditBrand" runat="server" OnClick="btnEditBrand_Click" />
                        </div>

                        <div class="form-group" runat="server" id="divNewBrand" visible="false">
                            <asp:Label Text="New Brand:" CssClass="form-label" runat="server" />
                            <asp:DropDownList CssClass="form-control" runat="server" ID="ddlBrands" />
                        </div>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
                <div class="col">
                    <div class="form-group">
                        <asp:Label Text="Price:" CssClass="form-label" runat="server" />
                        <asp:TextBox CssClass="form-control" ID="txtPrice" runat="server" />
                        <asp:RequiredFieldValidator ErrorMessage="Required" ControlToValidate="txtPrice" runat="server" />
                        <asp:RegularExpressionValidator Style="color: red" ErrorMessage="Only numbers greater than 0" ControlToValidate="txtPrice" ValidationExpression="^(?=.*[1-9])\d*(?:[\.,]\d+)?$" runat="server" />


                    </div>

                    <div class="form-group">
                        <label class="form-label" for="fileArticle">Upload Image</label>
                        <input type="file" id="fileArticle" style="padding: 0.35rem" class="form-control" runat="server" />
                    </div>

                    <div class="form-group">
                        <asp:Label Text="Or upload image by URL:" CssClass="form-label" runat="server" />
                        <asp:TextBox CssClass="form-control" TextMode="Url" runat="server" ID="txtUrl2" />
                    </div>

                    <div class="img-container">
                        <asp:Image ID="txtImg2" CssClass="imgSize" runat="server" />
                    </div>
                </div>
            </div>

            <div class="row" style="margin-top: 2rem;">
                <div class="col text-center">
                    <a class="btn btn-secondary" href="Management.aspx">Cancel</a>
                    <asp:Button Text="Save Changes" CssClass="btn btn-primary" ID="btnSaveChanges" runat="server" OnClick="btnSaveChanges_Click" />
                    <p runat="server" cssclass="form-label" visible="false" id="pNotChanges">No changes have been made to the article. Press cancel to go back.</p>
                </div>
            </div>
        </div>
</asp:Content>
