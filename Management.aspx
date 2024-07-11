<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Management.aspx.cs" Inherits="SalesSystem.Management" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            color: #333;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 1200px;
            margin: auto;
            padding: 20px;
        }

        h3, h4 {
            color: #2c3e50;
        }

        p, ul {
            color: #7f8c8d;
        }

        .btn-primary {
            background-color: #3498db;
            border-color: #3498db;
            color: #fff;
            border-radius: 5px;
            padding: 10px 20px;
            transition: background-color 0.3s ease;
        }

        .btn-primary:hover {
            background-color: #2980b9;
            border-color: #2980b9;
        }

        .btn-danger {
            background-color: #e74c3c;
            border-color: #e74c3c;
            color: #fff;
            border-radius: 5px;
            padding: 10px 20px;
            transition: background-color 0.3s ease;
        }

        .btn-danger:hover {
            background-color: #c0392b;
            border-color: #c0392b;
        }

        .table {
            width: 100%;
            margin-bottom: 1rem;
            color: #212529;
            background-color: #fff;
            border-collapse: collapse;
        }

        .table th,
        .table td {
            padding: 1rem;
            text-align: left;
            border-top: 1px solid #dee2e6;
        }

        .table thead th {
            border-bottom: 2px solid #dee2e6;
        }

        .table-hover tbody tr:hover {
            background-color: rgba(0, 0, 0, 0.075);
        }

        .card {
            background-color: #fff;
            border: 1px solid #dee2e6;
            border-radius: 5px;
            padding: 20px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
        }

        .row {
            display: flex;
            flex-wrap: wrap;
            margin: 0 -15px;
        }

        .col {
            flex: 1;
            padding: 15px;
        }

        .col-3 {
            flex: 0 0 25%;
            max-width: 25%;
        }

        .col-10 {
            flex: 0 0 83.33333%;
            max-width: 83.33333%;
        }

        .mb-3 {
            margin-bottom: 1rem;
        }

        .mt-2 {
            margin-top: 2rem;
        }

        .borderInf {
            border: solid 1px #dee2e6;
            padding: 1rem;
            border-radius: 5px;
            background-color: #fff;
            margin-top: 2.5%;
        }
    </style>

    <div class="container">
        <div class="row mt-2">
            <div class="col">
                <div class="mb-3">
                    <h3>Welcome to the management panel</h3>
                    <p>Here you can add, edit, and delete articles of your system. For more information, please go to How It Works.</p>
                </div>
            </div>

            <div class="col">
                <div class="mb-3">
                    <asp:Button class="btn btn-danger" Text="How It Works?" ID="btnHorWork" OnClick="btnHorWork_Click" runat="server" />
                </div>
            </div>
        </div>

        <div class="row mt-2">
            <div class="col-10">
                <div class="card">
                    <asp:GridView runat="server" ID="dvgArticles" AutoGenerateColumns="false" AllowPaging="true" OnPageIndexChanging="dvgArticles_PageIndexChanging"
                        DataKeyNames="Id" PageSize="5" OnSelectedIndexChanged="dvgArticles_SelectedIndexChanged" CssClass="table table-hover">
                        <Columns>
                            <asp:BoundField HeaderText="Code" DataField="CodArticle" />
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
                    <asp:Button Text="Add Article" class="btn btn-primary" ID="btnAddArticle" OnClick="btnAddArticle_Click" runat="server" />
                </div>
            </div>
        </div>

        <div class="row borderInf" runat="server" id="divInformation">
            <div class="col-3">
                <div>
                    <ul>
                        <li>
                            <h4>Detailed</h4>
                            <p>To view detailed content of an article, click on Show.</p>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="col-3">
                <div>
                    <ul>
                        <li>
                            <h4>Delete</h4>
                            <p>If you want to delete an article, select the item and click Show, then press Delete. (This action will permanently delete the item. You will need to upload it again to recover it).</p>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="col-3">
                <div>
                    <ul>
                        <li>
                            <h4>Add</h4>
                            <p>To add an article, click on Add Article and you will be redirected to the form to add it.</p>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="col-3">
                <div>
                    <ul>
                        <li>
                            <h4>View</h4>
                            <p>You can see more articles on the table pages (1, 2, 3..).</p>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
