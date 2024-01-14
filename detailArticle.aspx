<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="detailArticle.aspx.cs" Inherits="SalesSystem.detailArticle" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">



    <div class="row" style="font-size: large">

        <%if (showChanges)
            {
        %>
        <div class="mb-3" style="border: solid; border-color: darkred">
            <h3>Edit you Article : </h3>
        </div>
        <%} %>

        <div class="col form-control">


            <div class="mb-3  ">
                <asp:Label Text="Cod Article : " class="form-control-lg" runat="server" />

            </div>
            <div class="mb-3  ">
                <asp:TextBox runat="server" class="form-control" ID="txtCodArticle" PlaceHolder="Enter Cod Article" />
            </div>
            <div class="mb-3  form-control-lg">
                <asp:Label Text="Name : " runat="server" />

            </div>
            <div class="mb-3  ">
                <asp:TextBox runat="server" ID="txtName" class="form-control" PlaceHolder="Enter Name " />
            </div>
            <div class="mb-3  ">
                <asp:Label Text="Description : " class="form-control-lg" runat="server" />

            </div>
            <div class="mb-3">
                <asp:TextBox runat="server" ID="txtDescription" class="form-control" PlaceHolder="Enter Description" />
            </div>
            <%if (!show && !showChanges)
                {
            %>
            <div class="mb-3  ">
                <asp:Label Text="Brand : " runat="server" class="form-control-lg" />

            </div>
            <div class="mb-3 ">
                <asp:TextBox runat="server" ID="txtBrand" class="form-control" />
            </div>

            <div class="mb-3 ">
                <asp:Label Text="Category : " runat="server" class="form-control-lg" />

            </div>
            <div class="mb-3 ">
                <asp:TextBox runat="server" ID="txtCategory" class="form-control" />
            </div>
            <%}
                else
                {
            %>
            <div class="mb-3 ">
                <asp:Label Text="Category : " runat="server" class="form-control-lg" />

            </div>

            <div class="mb-3">
                <asp:DropDownList runat="server" ID="ddlCategories">
                </asp:DropDownList>
            </div>
            <div class="mb-3  ">
                <asp:Label Text="Brand : " runat="server" class="form-control-lg" />

            </div>
            <div class="mb-3">
                <asp:DropDownList runat="server" ID="ddlBrands">
                </asp:DropDownList>
            </div>

            <%} %>
        </div>
        <div class="col form-control">
            <div class="mb-3 ">
                <asp:Label Text="Price : " runat="server" class="form-control-lg" />

            </div>
            <div class="mb-3 ">
                <asp:TextBox runat="server" ID="txtPrice" class="form-control" PlaceHolder="Enter Price" />
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
                    <asp:Image ID="txtImg2" runat="server" class="form-control" />

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
                <asp:Image runat="server" ID="img300px" CssClass="img-fluid mb-3" Style="height: 300PX;" />
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
        <div class="col">
            <%if (!showChanges)
                {
            %>
            <div class="mb-3">
                <asp:Button Text="Modified Article " CssClass="btn btn-secondary" ID="btnEdit" OnClick="btnEdit_Click" runat="server" />
            </div>
            <%}
                else
                {  %>
            <div class="mb-3">
                <asp:Button Text="Save Changes " CssClass="btn btn-primary" ID="btnSaveChanges" OnClick="btnSaveChanges_Click" runat="server" />
            </div>
            <%} %>
        </div>
        <div class="col">
            <div class="mb-3">
                <asp:Button Text="Delete Article" CssClass="btn btn-danger" ID="btnDelete" OnClick="btnDelete_Click" runat="server" />
            </div>
        </div>
        <%} %>
    </div>


</asp:Content>
