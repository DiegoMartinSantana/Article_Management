<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Favorites.aspx.cs" Inherits="SalesSystem.Favourites" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">



    <div class="row mb-3 row-cols-1 text-lg-center " style="margin-left: 15px">


        <%if (listArt != null)
            {
                foreach (Domain.Article Art in listArt)
                {        %>
        <div class="card" style="width: 20rem; margin-right: 30px;">
            <img src="<%:Art.UrlImg %>" class="card-img-top" alt="Img Article">
            <div class="card-body ">
                <h5 class="card-title"><%: Art.Name %></h5>
                <p class="card-text"><%:Art.Description %>.</p>
                <p class="card-text"><%:Art.Price %> $</p>

                <div class="mb-3">
                    <a href="Default.aspx?id=<%: Art.Id %>" class="btn " style="background-color: #C0F9AB">Remove from Favorites </a>

                </div>
                <a href="detailArticle.aspx?idShow=<%: Art.Id %>" class="btn " style="background-color: skyblue">Look More </a>
            </div>
        </div>



        <%} %>
        <%}
            else
            { %>
        <div class="col-6">
        <div class="mb-3">

            <h3>You do not have selected Favorites </h3>

        </div>
        <div class="mb-3">
            <p>Do you want add Any?</p>
        </div>
    </div>
        <div class="col-6">
            <a href="Default.aspx" class=" btn btn-primary">Go</a>
    <div>
    </div>
    </div>

    <%}%>
    </div>


</asp:Content>
