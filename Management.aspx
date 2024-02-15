<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Management.aspx.cs" Inherits="SalesSystem.Management" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script type="text/javascript">
        setTimeout(function () {
            document.getElementById('<%=lblAdded.ClientID %>').style.display = 'none'); }, 2500);

    </script>

    <div class="row">
        <div class="col" style="margin-top: 2%">
            <div class="mb-3">

                <h3>Welcome to your Article Manager</h3>
            </div>
        </div>

        <div class="col" style="margin-top: 2%">

            <div class="mb-3">
                <a class="btn btn-danger text-white" href="HowWork.aspx">How Work? </a>
            </div>

        </div>

    </div>

    <div class="row" style="margin-top: 2%">
        <div class="col">
            <div class="mb-3">
                <asp:GridView runat="server" ID="dvgArticles" AutoGenerateColumns="false" AllowPaging="true" OnPageIndexChanging="dvgArticles_PageIndexChanging"
                    DataKeyNames="Id" PageSize="5" OnSelectedIndexChanged="dvgArticles_SelectedIndexChanged" CssClass="table">
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
                <asp:Label ID="lblAdded" Text="An Article has been added successfully " CssClass="form-label" Style="color: red" Visible="false" runat="server" />
            </div>

            <div class="mb-3">
                <asp:Button Text="Add Article" CssClass="btn btn-primary" ID="btnAddArticle" OnClick="btnAddArticle_Click" runat="server" />
            </div>

        </div>

    </div>
</asp:Content>
