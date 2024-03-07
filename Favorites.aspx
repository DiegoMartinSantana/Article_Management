<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Favorites.aspx.cs" Inherits="SalesSystem.Favourites" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .boxCute {
            font-style: oblique;
            text-align: center;
            margin-right: 5%
        }


        .cardsCount4 {
            margin-left: 15%;
        }

        .cardsCount3 {
            margin-left: 20%;
        }

        .cardsCount2 {
            margin-left: 30%;
        }

        .cardsCount1 {
            margin-left: 40%;
            margin-right: 30%
        }

        .imgStar {
            float: left;
            height: auto;
            width: 90px;
            position: relative;
            left: 20%;
            bottom: 10px;
        }

        .cards {
            margin: 1%;
            margin-bottom: 2%;
            width: 12rem;
            display: grid;
            border: 2px solid #ececec;
            border-radius: 22px;
        }

        .bodyCards {
            margin-bottom: 10%;
            padding: 2%
        }

        .imgCard {
            padding-right: 5px;
            width: 100%;
            height: 151px;
            max-height: 100%;
            max-width: 100%;
        }

        .divImgCard {
            max-width: 352px;
            overflow: hidden;
            border: solid 0.5px lightgrey;
            border-radius: 22px;
            margin-top: 10%;
            height: 151px;
        }

        .cardGral {
            width: 12rem;
            margin-right: 30px;
            margin-block-end: inherit;
            display: grid;
            border-radius: 22px;
        }
    </style>
    <div class="row mb-3 row-cols-1 text-lg-center " style="margin-left: 15px">


        <%
            if (listArt.Count != 0)
            { %>
        <div class="row d-flex justify-content-center" style="margin-top: 1.5%; border: 2px solid grey; border-radius: 22px">
            <div class="mb-3 text-black-50" style="margin-top: 3.5%;">


                <div class="boxCute">
                    <img src="https://pngimg.com/d/star_PNG41462.png" alt="Star Image" class="imgStar" />

                    <h4 style="margin-left: 10%; text-align: center" class="display-4">These are your Favorites</h4>

                </div>
            </div>

            <%   foreach (Domain.Article Art in listArt)
                {
            %>

            <div class="card cards cardGral <%if (first == true)
                {
                    if (listArt.Count == 1)
                    {
                        first = false; %>     cardsCount1         <%} %>
                    <%else if (listArt.Count == 2)
                {
                    first = false;  %>     cardsCount2         <%} %>
                    <%else if (listArt.Count == 3)
                {
                    first = false; %>     cardsCount3        <%}
             %>
                    <%else if (listArt.Count == 4)
                {
                    first = false; %>     cardsCount4       <%}
                         %>

            <%} %> ">
                <% 
                    imgArtFav.ImageUrl = Security.Helper.UrlLocal(Art.UrlImg);
                %>
                <div class="divImgCard">
                    <asp:Image class="card-img-top imgCard" runat="server" alt="Img Article" ID="imgArtFav" />
                </div>


                <div class="card-body mb-3 " style="max-width: 150px">
                    <div class="bodyCards">
                        <h5 class="card-title"><%: Art.Name %></h5>
                        <p class="card-text"><%:Art.Description %>.</p>
                        <p class="card-text"><%:Art.Price %> $</p>
                    </div>
                    <div class="mb-3">
                        <a href="Default.aspx?idD=<%: Art.Id %>" class="btn btnGreen" style="background-color: #C0F9AB">Remove from Favorites </a>

                    </div>
                    <a href="detailArticle.aspx?idShow=<%: Art.Id %>" class="btn btnLigth " style="background-color: skyblue">Look More </a>
                </div>
            </div>



            <%} %>
            <%}
                else
                { %>
            <div class="row" style="margin-top:3%">
                <div class="mb-3">

                    <h3>You do not have selected Favorites </h3>

                </div>
                <div class="">
                    <p>Do you want add Any?</p>
                </div>
                <a style="width:12%;margin-left:44%" href="Default.aspx" class=" btn btn-primary">Go</a>
                <div>
                </div>
            </div>

            <%}%>
        </div>
    </div>
</asp:Content>
