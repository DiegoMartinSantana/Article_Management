<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="SalesSystem._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <style>
       .card-img-top-wrapper {
    position: relative;
    width: 100%;
    padding-top: 100%; /* 1:1 Aspect Ratio */
    overflow: hidden;
    border-bottom: 1px solid #ddd;
}

.img-cuadrada {
    position: absolute;
    top: 0;
    bottom: 0;
    left: 0;
    right: 0;
    width: 100%;
    height: 100%;
    object-fit: scale-down;
    transition: transform 0.5s ease;
}

.img-cuadrada:hover {
    transform: scale(1.2);
}

.card {
    border: none;
    transition: transform 0.3s ease, box-shadow 0.3s ease;
}

.card:hover {
    transform: translateY(-20px);
    box-shadow: 0 20px 40px rgba(0, 0, 0, 0.2);
}

.card .overlay {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: rgba(0, 0, 0, 0.5);
    opacity: 0;
    transition: opacity 0.5s ease;
}

.card:hover .overlay {
    opacity: 1;
}

.overlay a {
    color: #fff;
    font-size: 1.25rem;
}

.btn-light {
    background-color: rgba(255, 255, 255, 0.75);
    border: none;
    color: #000;
    padding: 0.5rem 1rem;
    transition: background-color 0.3s ease;
}

.btn-light:hover {
    background-color: #fff;
}

    </style>

    <main>
        <div >
            <div class="row mb-0">
                <div class="col mb-3">
                    <div class="mb-3 form-control fields2" style="margin-left: 15px; margin-top: 2.5%">
                        <asp:Label runat="server" ID="lblfilter"> Search Article by Name or Description: </asp:Label>
                    </div>
                    <div class="mb-3">
                        <asp:TextBox runat="server" Style="margin-left: 15px" AutoPostBack="true" ID="txtsearch" CssClass="form-control" OnTextChanged="txtsearch_TextChanged" PlaceHolder="Enter Filter" />
                    </div>
                </div>
                <div class="col mb-3">
                    <div class="mb-3" style="padding: 1.5%; margin-left: 23%; margin-top: 8.5%">
                        <asp:CheckBox OnCheckedChanged="chkfilter_CheckedChanged" ID="chkfilter" AutoPostBack="true" runat="server" />
                        <asp:Label Text="Show Advanced Filter" CssClass="form-check-label" runat="server" />
                    </div>
                </div>
            </div>

            <asp:UpdatePanel runat="server">
                <ContentTemplate>
                    <% if (chkfilter.Checked) { %>
                    <div class="row mb-3" style="margin-left: 10px">
                        <div class="col mb-3" style="max-width: 25%">
                            <div class="mb-3 form-control fields">
                                <asp:Label Text="Search by:" runat="server" />
                            </div>
                            <div class="mb-3 form-control" style="text-align: center; margin-left: 10px">
                                <asp:DropDownList runat="server" AutoPostBack="true" CssClass="dropdown-item" ID="ddlby" OnSelectedIndexChanged="ddlby_SelectedIndexChanged">
                                    <asp:ListItem Text="Brand" />
                                    <asp:ListItem Text="Category" />
                                    <asp:ListItem Text="Price" />
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="col mb-3" style="max-width: 25%">
                            <div class="mb-3 form-control fields">
                                <asp:Label Text="Critery:" runat="server" />
                            </div>
                            <div class="mb-3 form-control" style="text-align: center; margin-left: 10px">
                                <asp:DropDownList runat="server" CssClass="dropdown-item" ID="ddlCritery">
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="col mb-3" style="max-width: 25%">
                            <div class="mb-3 form-control fields">
                                <asp:Label Text="Filter:" runat="server" />
                            </div>
                            <div class="mb-3">
                                <asp:TextBox runat="server" Style="margin-left: 10px" ID="txtFilterAdvanced" CssClass="form-control form-text mb-3" />
                            </div>
                        </div>
                        <div class="col mb-3">
                            <div class="mb-3" style="margin-left: 8%; margin-top: 18.5%">
                                <asp:Button Text="Search" runat="server" CssClass="btn btn-primary" ID="btnsearchAdvanced" OnClick="btnsearchAdvanced_Click" />
                            </div>
                        </div>
                    </div>
                    <% } %>

               <div class="row mb-3 row-cols-1 text-center" style="margin-left: 15px">
    <% if (list != null) {
        foreach (Domain.Article Art in list) { %>
    <div class="col-md-3 mb-5">
        <div class="card h-100 shadow-sm position-relative">
            <div class="card-img-top-wrapper position-relative">
                <% imgArtCard.ImageUrl = Security.Helper.UrlLocal(Art.UrlImg); %>
                <asp:Image alt="Image Article" CssClass="card-img-top img-cuadrada" ID="imgArtCard" runat="server" />
                <div class="overlay d-flex align-items-center justify-content-center">
                    <a href="detailArticle.aspx?idShow=<%: Art.Id %>" class="btn btn-light">Look More</a>
                </div>
            </div>
            <div class="card-body text-center">
                <h5 class="card-title font-weight-bold"><%: Art.Name %></h5>
                <p class="card-text text-muted mb-2"><%: Art.Description %>.</p>
                <% if (Security.Validation.Login(Session["user"])) {
                    AccessBd.FavoritesAccess access = new AccessBd.FavoritesAccess();
                    Domain.Users user = (Domain.Users)Session["user"];
                    if (!access.IsFavorite(user.Id, Art.Id)) { %>
                <div class="mb-3">
                    <a href="Default.aspx?idFav=<%: Art.Id %>" class="btn btn-dark">Add to favorites</a>
                </div>
                <% } else { %>
                <div class="mb-3">
                    <img src="https://cdn-icons-png.flaticon.com/512/1828/1828884.png" alt="Little Star Img" style="width: 55px; height: auto" />
                </div>
                <% } } %>
            </div>
        </div>
    </div>
    <% } } %>
</div>

                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </main>
</asp:Content>
