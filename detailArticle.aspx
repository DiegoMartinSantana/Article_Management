<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="detailArticle.aspx.cs" Inherits="SalesSystem.detailArticle" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .imgSize {
            height: auto;
            max-height: 380px;
            width: auto;
            max-width: 400px;
            border-radius: 22px;
            border: 2px solid grey;
        }

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


    <div class="row">

        <%if (showChanges)
            {
        %>
        <div class="mb-3" style="border: solid; border-color: darkred">
            <h3>Edit you Article : </h3>
        </div>
        <%} %>

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
            <%if (!show && !showChanges)
                {
            %>
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
            <%}
                else
                {

            %>
            <div class="mb-3 ">
                <asp:Label Text="Category : " runat="server" />

            </div>

            <div class="mb-3 ">
                <asp:DropDownList runat="server" ID="ddlCategories" CssClass="formCheck">
                </asp:DropDownList>
            </div>
            <div class="mb-3  ">
                <asp:Label Text="Brand : " runat="server" />

            </div>
            <div class="mb-3 ">
                <asp:DropDownList runat="server" ID="ddlBrands" CssClass="formCheck">
                </asp:DropDownList>
            </div>

            <%} %>
        </div>
        <div class="col ">
            <div class="mb-3 ">
                <asp:Label Text="Price : " runat="server" />

            </div>
            <div class="mb-3 ">
                <asp:TextBox runat="server" ID="txtPrice" class="form-control sizeTxt" PlaceHolder="Enter Price" />
            </div>
            <%if (!show)
                {
            %>
            <div class="mb-3">
                <div class="mb-3">
                    <input type="file" id="fileArticle2" runat="server" cssclass="form-control" visible="false" />
                </div>


                <div class="mb-3" runat="server" id="divUploadUrl" visible="false">
                    <p>Or upload image by Url  : </p>
                    <asp:TextBox runat="server" TextMode="Url" CssClass="form form-control" PlaceHolder="Enter Url" ID="txtUrl2" />
                </div>



                <div class="mb-3">
                    <asp:Image ID="txtImg2" CssClass="imgSize" runat="server" />

                </div>


            </div>
            <%}
                else
                {
            %>
            <div class="mb-3">
                <input type="file" id="fileArticle" runat="server" cssclass="form-control" />
            </div>
            <p>Or upload image by Url  : </p>
            <div class="mb-3">
                <asp:TextBox runat="server" TextMode="Url" CssClass="form form-control" PlaceHolder="Enter Url" ID="txtUrl" />
            </div>
            <div class="mb-3">
                <asp:Image runat="server" CssClass="img-fluid mb-3 imgSize" Style="height: 300PX;" />
            </div>
            <%}%>
        </div>

    </div>
    <div class="row">
        <%if (show)
            {

        %>
        <div class="col">
            <div class="mb-3">
                <asp:Button Text="Save Article" ID="btnsaveArticle" OnClick="btnsaveArticle_Click" CssClass="btn btn-primary" runat="server" />


            </div>
        </div>
        <%}
            else
            {
        %>

        <%if (!showChanges)
            {
        %>
        <div class="mb-3" style="margin-top: 2%">
            <asp:Button Text="Modified Article " CssClass="btn btn-secondary" ID="btnEdit" OnClick="btnEdit_Click" runat="server" />
            <asp:Button Text="Delete Article" CssClass="btn btn-danger" ID="btnDelete" OnClick="btnDelete_Click" runat="server" Style="margin-left:2%" />
        </div>
        <%}
            else
            {  %>
        <div class="mb-3">
            <asp:Button Text="Save Changes " CssClass="btn btn-primary" ID="btnSaveChanges" OnClick="btnSaveChanges_Click" runat="server" />
        </div>
        <%} %>
    </div>


    <%} %>
</asp:Content>
