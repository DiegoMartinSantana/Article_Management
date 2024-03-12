<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EditArticle.aspx.cs" Inherits="SalesSystem.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .margin {
            margin-top: 4%;
        }

        .sizeTxt {
            width: 60%;
            max-width: 100%;
        }

        .marginBtn {
            margin-left: 3%;
        }
    </style>
    <div class="row ">


        <div class="mb-3 " style="border: solid; border-color: darkred">
            <h3 style="text-align: center">Edit you Article : </h3>
        </div>
    </div>

    <div class="row">

        <div class="col ">


            <div class="mb-3  ">
                <asp:Label Text="Cod Article : " runat="server" />

            </div>
            <div class="mb-3  ">
                <asp:TextBox runat="server" CssClass="sizeTxt form-control" ID="txtCodArticle" />
                <asp:RequiredFieldValidator Style="color: red" ErrorMessage="Required" ControlToValidate="txtCodArticle" runat="server" />
                <asp:RegularExpressionValidator Style="color: red" ErrorMessage="Less than 8 characters" ControlToValidate="txtCodArticle" ValidationExpression="^[A-Za-z\d]{1,7}$" runat="server" />
            </div>

            <div class="mb-3 margin ">
                <asp:Label Text="Name : " runat="server" />

            </div>
            <div class="mb-3  ">
                <asp:TextBox runat="server" ID="txtName" CssClass="form-control sizeTxt" PlaceHolder="Enter Name " />
                <asp:RequiredFieldValidator Style="color: red" ErrorMessage="Required" ControlToValidate="txtName" runat="server" />
                <asp:RegularExpressionValidator Style="color: red" ErrorMessage="Not simbols" ControlToValidate="txtName" ValidationExpression="^[a-zA-Z0-9\s]*$" runat="server" />
            </div>

            <div class="mb-3  margin">
                <asp:Label Text="Description : " runat="server" />

            </div>
            <div class="mb-3 ">
                <asp:TextBox runat="server" ID="txtDescription" CssClass="form-control sizeTxt" PlaceHolder="Enter Description" />
                <asp:RequiredFieldValidator Style="color: red" ErrorMessage="Required" ControlToValidate="txtDescription" runat="server" />
                <asp:RegularExpressionValidator Style="color: red" ErrorMessage="Minimum 10 characters" ControlToValidate="txtDescription" ValidationExpression="^.{10,}$" runat="server" />
            </div>
            <div class="mb-3 margin ">
                <asp:Label Text="Current Category : " runat="server" />
            </div>

            <div class="mb-3 ">
                <asp:TextBox runat="server" ID="txtCurrentCat" CssClass="form-control sizeTxt d-inline" Enabled="false" />
                <asp:Button Text="Edit Category" CssClass="btn btn-dark d-inline marginBtn" runat="server" ID="btnEditCat" OnClick="btnEditCat_Click" />

            </div>

            <div class="mb-3 margin " runat="server" id="divNewCat" visible="false">
                <asp:Label Text=" New Category : " runat="server" />
                <asp:DropDownList runat="server" ID="ddlCategories" CssClass="formCheck dll">
                </asp:DropDownList>
            </div>
            <div class="mb-3 margin ">
                <asp:Label Text="Current Brand : " runat="server" />

            </div>

            <div class="mb-3">
                <asp:TextBox runat="server" ID="txtCurrentBrand" CssClass="form-control sizeTxt d-inline" Enabled="false" />
                <asp:Button Text="Edit Brand" CssClass="btn btn-dark d-inline marginBtn" ID="btnEditBrand" runat="server" OnClick="btnEditBrand_Click" />

            </div>

            <div class="mb-3 margin" runat="server" id="divNewBrand" visible="false">
                <asp:Label Text="New Brand : " runat="server" />
                <asp:DropDownList runat="server" ID="ddlBrands" CssClass="formCheck dll">
                </asp:DropDownList>
            </div>
        </div>


        <div class="col ">
            <div class="mb-3 ">
                <asp:Label Text="Price : " runat="server" />

            </div>
            <div class="mb-3 ">
                <asp:TextBox runat="server" ID="txtPrice" class="form-control sizeTxt" PlaceHolder="Enter Price" />
                <asp:RequiredFieldValidator Style="color: red" ErrorMessage="Required" ControlToValidate="txtPrice" runat="server" />
                <asp:RegularExpressionValidator Style="color: red" ErrorMessage="Only numbers and greater than 0 " ControlToValidate="txtPrice" ValidationExpression="^\d+(\.\d+)?$" runat="server" />
            </div>

            <div class="mb-3">
                <input type="file" id="fileArticle" runat="server" cssclass="form-control" />
            </div>


            <div class="mb-3" runat="server" id="divUploadUrl">
                <p>Or upload image by Url  : </p>
                <asp:TextBox runat="server" TextMode="Url" CssClass="form form-control sizeTxt " PlaceHolder="Enter Url" ID="txtUrl2" />
            </div>

            <div class="mb-3 square">
                <asp:Image ID="txtImg2" CssClass="imgSize " runat="server" />

            </div>

        </div>

    </div>

    <div class="row" style="margin-top: 1%">

        <div class="col">

            <div class="mb-3">
                <a class="btn btn-secondary" href="Management.aspx">Cancel </a>
                <asp:Button Text="Save Changes " CssClass="btn btn-primary" ID="btnSaveChanges" runat="server" OnClick="btnSaveChanges_Click" Style="margin-left: 2%" />
                <p runat="server" style="color: red" visible="false" id="pNotChanges">No changes have been made to the article. Press cancel to back.</p>
            </div>
        </div>
    </div>

</asp:Content>
