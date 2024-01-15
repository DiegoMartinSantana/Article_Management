<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="SalesSystem._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <style>
    
  </style>

    <main>

        <div class="row mb-0">

            <div class="col">

                <div class="md-3 form-control-lg">

                    <asp:Label runat="server" ID="lblfilter"> Search Article by Name or Description :  </asp:Label>


                </div>
                <div class="md-3">
                    <asp:TextBox runat="server" Style="margin-left: 15px" AutoPostBack="true" ID="txtsearch" CssClass="form-control" OnTextChanged="txtsearch_TextChanged" />

                </div>


            </div>
            <div class="col">
                <div class="mb-3 form-control-lg" style="padding: 8.5%">
                    <asp:CheckBox OnCheckedChanged="chkfilter_CheckedChanged" ID="chkfilter" AutoPostBack="true" runat="server" />
                    <asp:Label Text="Show Advanced Filter" CssClass="form-check-label" runat="server" />
                </div>
            </div>
        </div>


        <%if (chkfilter.Checked)
            {
        %>
        <asp:UpdatePanel runat="server">
            <ContentTemplate>
                <div class="row mb-3">

                    <div class="col " style="max-width: 25%">
                        <div class=" form-control-lg ">
                            <asp:Label Text="Search by :" runat="server" />
                        </div>

                        <div class="mb-3 form-control  " style="text-align: center; margin-left: 15px">

                            <asp:DropDownList runat="server" AutoPostBack="true" CssClass="dropdown-item"  ID="ddlby" OnSelectedIndexChanged="ddlby_SelectedIndexChanged">
                                <asp:ListItem Text="Brand" />
                                <asp:ListItem Text="Category" />
                                <asp:ListItem Text="Price" />

                            </asp:DropDownList>
                        </div>
                    </div>

                    <div class="col " style="max-width: 25%">
                        <div class=" form-control-lg ">
                            <asp:Label Text="Critery :" runat="server" />
                        </div>

                        <div class="mb-3 form-control  " style="text-align: center; margin-left: 15px">
                            <asp:DropDownList runat="server" CssClass="dropdown-item"  ID="ddlCritery">
                            </asp:DropDownList>
                        </div>
                    </div>

                    <div class="col " style="max-width: 25%">
                        <div class=" form-control-lg ">
                            <asp:Label Text="Filter :" runat="server" />
                        </div>

                        <div class="md-3 ">
                            <asp:TextBox runat="server" Style="margin-left: 15px" ID="txtFilterAdvanced" CssClass="form-control form-text" />

                        </div>

                    </div>


                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
        <div class="row">
            <div class="col ">

                <div class="mb-3" style="margin-left: 80%">
                    <asp:Button Text="Search" runat="server" Autopostback="true" CssClass="btn btn-primary" ID="btnsearchAdvanced" OnClick="btnsearchAdvanced_Click" Style=" margin-top: -137px" />

                </div>
            </div>
        </div>

        <%} %>


        <div class="row mb-3 row-cols-1 text-lg-center " style="margin-left: 15px">
            <%
                if (list != null)
                {
                    foreach (Domain.Article Art in list)
                    {
            %>

            <div class="card" style="width: 12rem; margin-right: 30px;">

                <% 
                    imgArtCard.ImageUrl = Security.Helper.UrlLocal(Art.UrlImg);
                %>
                <asp:Image alt="Image Article" ID="imgArtCard" runat="server" />
                <div class="card-body ">
                    <h5 class="card-title"><%: Art.Name %></h5>
                    <p class="card-text"><%:Art.Description %>.</p>
                    <p class="card-text"><%:Art.Price %> $</p>

                    <%if (Security.Validation.Login(Session["user"]))
                        {  %>
                    <% AccessBd.FavoritesAccess access = new AccessBd.FavoritesAccess();
                        Domain.Users user = (Domain.Users)Session["user"];
                        if (!access.IsFavorite(user.Id, Art.Id))
                        {  %>

                    <div class="mb-3">
                        <a href="Default.aspx?id=<%: Art.Id %>" class="btn " style="background-color: #C0F9AB">Add to favorites </a>

                    </div>
                    <%}
                        else
                        {
                    %>

                    <div class="mb-3">
                        <label class="btn" style="background-color: gold">Favorite</label>

                    </div>

                    <%} %>
                    <%} %>
                    <a href="detailArticle.aspx?idShow=<%: Art.Id %>" class="btn " style="background-color: skyblue">Go to Article </a>
                </div>
            </div>
            <%}
                }%>
        </div>
    </main>

</asp:Content>
