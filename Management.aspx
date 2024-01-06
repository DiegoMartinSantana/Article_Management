<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Management.aspx.cs" Inherits="SalesSystem.Management" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <div class="col">
            <div class="mb-3">

                <h3>Welcome to your Article Manager</h3>

            </div>
        </div>

    </div>
    <div class="row">
        <div class="col">
            <div class="mb-3">
                <asp:GridView runat="server" ID="dvgArticles" AutoGenerateColumns="false" PageSize="5" OnPageIndexChanging="dvgArticles_PageIndexChanging"
                    DataKeyNames="Id" OnSelectedIndexChanged="dvgArticles_SelectedIndexChanged" AllowPaging="true">
                    <Columns>
                        <asp:BoundField HeaderText="Cod" DataField="CodArticle" />
                        <asp:BoundField HeaderText="Name" DataField="Name" />
                        <asp:BoundField HeaderText="Description" DataField="Description" />
                        <asp:BoundField HeaderText="Price" DataField="Price" />
                        <asp:BoundField HeaderText="Category" DataField="Category.Description" />
                        <asp:BoundField HeaderText="Brand" DataField="Brand.Description" />

                        <asp:CommandField HeaderText="Show More" ShowSelectButton="true" SelectText="Show" />


                    </Columns>
                </asp:GridView>

            </div>
        </div>
    </div>
    <div class="row">
        <div class="col">
            <div class="mb-3">
                <asp:Button Text="Add Article" CssClass="btn btn-primary" ID="btnAddArticle" OnClick="btnAddArticle_Click" runat="server" />
            </div>
        </div>
       
    </div>
</asp:Content>
