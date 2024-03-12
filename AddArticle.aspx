<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddArticle.aspx.cs" Inherits="SalesSystem.WebForm2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .margin {
            margin-top: 6%;
        }

        .sizeTxt {
            width: 60%;
            max-width: 100%;
        }
    </style>

    <div class="row">
        <div class="mb-3 " style="border: solid; border-color: dodgerblue">
            <h4 style="text-align: center">Complete the Fields </h4>
        </div>
    </div>

    <div class="row " style="margin-top: 1%">

        <div class="col ">


            <div class="mb-3  ">
                <asp:Label Text="Cod Article : " runat="server" />

            </div>
            <div class="mb-3  ">
                <asp:TextBox runat="server" CssClass="sizeTxt form-control" ID="txtCodArticle" PlaceHolder="Enter Cod Article" />
                <asp:RequiredFieldValidator Style="color: red" ErrorMessage="Required" ControlToValidate="txtCodArticle" runat="server" />
                <asp:RegularExpressionValidator Style="color: red" ErrorMessage="Less than 8 characters" ControlToValidate="txtCodArticle" ValidationExpression="^[A-Za-z\d]{1,7}$" runat="server" />
            </div>
            <div class="mb-3 margin ">
                <asp:Label Text="Name : " runat="server" />

            </div>
            <div class="mb-3  ">
                <asp:TextBox runat="server" ID="txtName" CssClass="form-control sizeTxt" PlaceHolder="Enter Name " />
                <asp:RequiredFieldValidator Style="color: red" ErrorMessage="Required" ControlToValidate="txtName" runat="server" />
                <asp:RegularExpressionValidator Style="color: red" ErrorMessage="Not Simbols " ControlToValidate="txtName" ValidationExpression="^[a-zA-Z0-9]+$" runat="server" />
            </div>
            <div class="mb-3  margin">
                <asp:Label Text="Description : " runat="server" />

            </div>
            <div class="mb-3 ">
                <asp:TextBox runat="server" ID="txtDescription" class="form-control sizeTxt" PlaceHolder="Enter Description" />
                <asp:RequiredFieldValidator Style="color: red" ErrorMessage="Required" ControlToValidate="txtDescription" runat="server" />
                <asp:RegularExpressionValidator Style="color: red" ErrorMessage="Minimum 10 characters" ControlToValidate="txtDescription" ValidationExpression="^.{10,}$" runat="server" />

            </div>

            <div class="mb-3  ">
                <asp:Label Text="Category : " runat="server" />

            </div>

            <div class="mb-3 ">
                <asp:DropDownList runat="server" ID="ddlCategories" CssClass="formCheck dll">
                </asp:DropDownList>

            </div>
            <div class="mb-3 margin">
                <asp:Label Text="Brand : " runat="server" />

            </div>
            <div class="mb-3 ">
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
                <div class="mb-3">
                    <input style="margin-top: 2%" type="file" id="fileArticle" runat="server" cssclass="form-control" />
                </div>

                <div class="mb-3" runat="server" style="margin-top: 2%" id="divUploadUrl">
                    <p>Or upload image by Url  : </p>
                    <asp:TextBox Style="margin-top: 2%" runat="server" TextMode="Url" CssClass="form form-control sizeTxt" PlaceHolder="Enter Url" ID="txtUrl2">
                    </asp:TextBox>
                    <p runat="server" id="pImgRequired" style="color:red" visible="false">Image required by url or by file </p>

                </div>

            </div>

        </div>

    </div>
    <div class="row" style="margin-top: 1%">

        <div class="col">

            <div class="mb-3">
                <a class="btn btn-secondary" href="Management.aspx">Cancel </a>
                <asp:Button Text="Upload Article " Style="margin-left: 3%" CssClass="btn btn-primary" ID="btnAddArt" OnClick="btnAddArt_Click" runat="server" />
            </div>
        </div>
    </div>
</asp:Content>
