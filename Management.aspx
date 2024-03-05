<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Management.aspx.cs" Inherits="SalesSystem.Management" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style> 

        .borderInf{
            border: solid 1px grey;
        }
    </style>
    <div class="row">
        <div class="col" style="margin-top: 2%">
            <div class="mb-3">

                <h3>Welcome to the management panel</h3>
                <p>Here you can add, edit and delete articles of your system, If you want more information, please go to how work.</p>

            </div>
        </div>

        <div class="col" style="margin-top: 2%">

            <div class="mb-3">
                <asp:Button Style="margin-top: 8%; margin-left: 30%" class="btn btn-danger text-white" Text="How Work?" ID="btnHorWork" OnClick="btnHorWork_Click" runat="server" />
            </div>

        </div>
    </div>

    <div class="row" style="margin-top: 2%">
        <div class="col-10">
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
        <div class="col">
            <div class="mb-3">
                <asp:Button Text="Add Article" Style="margin-top: 125%" CssClass="btn btn-primary" ID="btnAddArticle" OnClick="btnAddArticle_Click" runat="server" />
            </div>
        </div>
    </div>
   
    <div class="row borderInf" runat="server" id="divInformation"  style="margin-top: 2.5%">
        <div class="col-3 " >
            <div >
                <ul>
                    <li>
                        <h4>Detailed  </h4>
                        <p>To view detailed content of an article, click on show.</p>
                    </li>
                </ul>
            </div>
        </div>
        <div class="col-3">
            <div >
                <ul>

                    <li>
                        <h4>Delete  </h4>
                        <p>If you want delete some article, select the item and go to show , press Delete. (This action will delete the item forever. You will need to upload it again to recover it).</p>
                    </li>
                </ul>
            </div>
        </div>
        <div class="col-3 ">
            <div >

                <ul>

                    <li>
                        <h4>Add </h4>
                        <p>
                            For add some article click on add article and it redirect to form to add.
                        </p>
                    </li>
                </ul>

            </div>
        </div>
        <div class="col-3 ">
            <div >
                <ul>
                    <li>
                        <h4>Wiew </h4>
                        <p>
                            You can see more articles in pages of table ( 1,2,3..).
                        </p>
                    </li>

                </ul>
            </div>
        </div>
    </div>
</asp:Content>
