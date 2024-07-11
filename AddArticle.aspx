<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddArticle.aspx.cs" Inherits="SalesSystem.WebForm2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        body {
            font-family: 'Arial', sans-serif;
            color: #333;
        }



        .form-control {
            border: none;
            border-bottom: 2px solid #ddd;
            border-radius: 0;
            box-shadow: none;
            margin-bottom: 1.5rem;
        }

            .form-control:focus {
                border-color: #5a67d8;
                box-shadow: none;
            }

        .form-label {
            font-weight: bold;
            color: #5a67d8;
        }

        .btn-primary {
            background-color: #5a67d8;
            border: none;
            color: #fff;
            transition: background-color 0.3s, transform 0.3s;
        }

            .btn-primary:hover {
                background-color: #434190;
                transform: translateY(-2px);
            }

        .btn-danger {
            background-color: #e53e3e;
            border: none;
            color: #fff;
            transition: background-color 0.3s, transform 0.3s;
        }

            .btn-danger:hover {
                background-color: #c53030;
                transform: translateY(-2px);
            }

        .btn-success {
            background-color: #48bb78;
            border: none;
            color: #fff;
            transition: background-color 0.3s, transform 0.3s;
        }

            .btn-success:hover {
                background-color: #38a169;
                transform: translateY(-2px);
            }

        .text-danger {
            color: #e53e3e;
        }

        .text-success {
            color: #48bb78;
        }

        .imgBorder {
            border: 1px solid #ddd;
            border-radius: 5px;
            max-width: 400px;
            margin-top: 3%;
            height: auto;
        }

        .margin {
            margin-top: 6%;
        }

        .sizeTxt {
            width: 60%;
            max-width: 100%;
        }
    </style>

    <div class="row" style="margin-top: 2%">
        <div class="mb-3 " style="border: solid; border-color: dodgerblue; border-radius: 10px">
            <h3 style="text-align: center; padding: 1.5%; border-radius: 20px">Complete the Fields </h3>
        </div>
    </div>

    <div class="row " style="margin-top: 1%">

        <div class="col-6 ">

            <div class="mb-3  ">
                <asp:Label Text="Cod Article : " CssClass="form-label" runat="server" />

            </div>
            <div class="mb-3  ">
                <asp:TextBox runat="server" CssClass="sizeTxt form-control" ID="txtCodArticle" PlaceHolder="Enter Cod Article" />
                <asp:RequiredFieldValidator Style="color: red" ErrorMessage="Required" ControlToValidate="txtCodArticle" runat="server" />
                <asp:RegularExpressionValidator Style="color: red" ErrorMessage="Less than 8 characters" ControlToValidate="txtCodArticle" ValidationExpression="^[A-Za-z\d]{1,7}$" runat="server" />
            </div>
            <div class="mb-3  ">
                <asp:Label Text="Name : " CssClass="form-label" runat="server" />

            </div>
            <div class="mb-3  ">
                <asp:TextBox runat="server" ID="txtName" CssClass="form-control sizeTxt" PlaceHolder="Enter Name " />
                <asp:RequiredFieldValidator Style="color: red" ErrorMessage="Required" ControlToValidate="txtName" runat="server" />
                <asp:RegularExpressionValidator Style="color: red" ErrorMessage="Not Simbols " ControlToValidate="txtName" ValidationExpression="^[a-zA-Z0-9\s]*$" runat="server" />
            </div>
            <div class="mb-3 ">
                <asp:Label Text="Description : " CssClass="form-label" runat="server" />

            </div>
            <div class="mb-3 ">
                <asp:TextBox runat="server" ID="txtDescription" class="form-control sizeTxt" PlaceHolder="Enter Description" />
                <asp:RequiredFieldValidator Style="color: red" ErrorMessage="Required" ControlToValidate="txtDescription" runat="server" />
                <asp:RegularExpressionValidator Style="color: red" ErrorMessage="Minimum  characters" ControlToValidate="txtDescription" ValidationExpression="^.{10,}$" runat="server" />

            </div>

            <div class="mb-3  ">
                <asp:Label Text="Category : " CssClass="form-label" runat="server" />

            </div>

            <div class="mb-3 ">
                <asp:DropDownList runat="server" ID="ddlCategories" CssClass="formcontrol form-select">
                </asp:DropDownList>

            </div>
            <div class="mb-3 ">
                <asp:Label Text="Brand : " CssClass="form-label" runat="server" />

            </div>
            <div class="mb-3 ">
                <asp:DropDownList runat="server" ID="ddlBrands" CssClass="formcontrol form-select">
                </asp:DropDownList>

            </div>

        </div>
        <div class="col-6 ">
            <div class="mb-3 ">
                <asp:Label Text="Price : " CssClass="form-label" runat="server" />


            </div>
            <div>
                <asp:TextBox runat="server" ID="txtPrice" class="form-control sizeTxt" PlaceHolder="Enter Price" />
                <asp:RequiredFieldValidator Style="color: red" ErrorMessage="Required" ControlToValidate="txtPrice" runat="server" />
                <asp:RegularExpressionValidator Style="color: red" ErrorMessage="Only numbers and greater than 0 " ControlToValidate="txtPrice" ValidationExpression="^\d+(\.\d+)?$" runat="server" />
            </div>

            <div class="mb-2">
                <div class="mb-2">
                    <input style="padding: 1.22%" type="file" id="fileArticle" runat="server" class="form-control" />
                </div>

                <div class="mb-3" runat="server" style="margin-top: 2%" id="divUploadUrl">
                    <p>Or upload image by Url  : </p>
                    <asp:UpdatePanel runat="server">
                        <ContentTemplate>
                            <asp:TextBox Style="margin-top: 2%" runat="server" TextMode="Url" CssClass="form form-control sizeTxt" OnTextChanged="txtUrl2_TextChanged" PlaceHolder="Enter Url" ID="txtUrl2">
                            </asp:TextBox>

                        </ContentTemplate>
                    </asp:UpdatePanel>

                    <p runat="server" id="pImgRequired" style="color: red" visible="false">Image required by url or by file </p>

                </div>

            </div>
            <div class="mb-3">


                <asp:Image ID="ImgArticuloNueva" ImageUrl="https://cdn.icon-icons.com/icons2/1993/PNG/512/ecommerce_home_market_mart_shop_shopping_store_icon_123207.png" Style="max-width: 300px; border: solid 1px black; border-radius: 15px" CssClass="img-fluid" runat="server" />
            </div>

        </div>

    </div>
    <div class="row" style="margin-top: 1%">

        <div class="col">

            <div class="mb-3" style="margin-left: 50%">
                <a class="btn btn-secondary" href="Management.aspx">Cancel </a>
                <asp:Button Text="Upload Article " Style="margin-left: 3%" CssClass="btn btn-primary" ID="btnAddArt" OnClick="btnAddArt_Click" runat="server" />
            </div>
        </div>
    </div>
</asp:Content>
