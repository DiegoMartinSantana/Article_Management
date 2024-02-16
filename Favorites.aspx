<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Favorites.aspx.cs" Inherits="SalesSystem.Favourites" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .boxCute {
            font-style: oblique;
            text-align: center;
            margin-right: 5%
        }

        .btnLigth {
            border: 1.5px solid #96eafc;
        }

        .btnGreen {
            border: 1.5px solid #ACE1AF;
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
            margin-bottom: 2%;
            width: 12rem;
            margin-right: 30px;
            display: grid;
            display: grid;
            border: 2px solid #ececec;
            border-radius: 22px;
        }

        .bodyCards {
            margin-bottom: 10%;
            padding: 2%
        }
    </style>
    <div class="row mb-3 row-cols-1 text-lg-center " style="margin-left: 15px">


        <%
            if (listArt.Count != 0)
            { %>
        <div class="row d-flex justify-content-center" style="margin-top: 1.5%; border: 2px solid grey; border-radius: 22px">
            <div class="mb-3 text-black-50" style="margin-top: 3.5%; padding-bottom: 1.5%">


                <div class="boxCute">
                    <img src="https://pngimg.com/d/star_PNG41462.png" alt="Star Image" class="imgStar" />

                    <h4 style="margin-left: 10%; text-align: center" class="display-4">These are your Favorites</h4>

                </div>
            </div>

            <%   foreach (Domain.Article Art in listArt)
                {
            %>

            <div class="card cards <%if (first == true)
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

                    Art.UrlImg = Security.Helper.UrlLocal(Art.UrlImg);


                %>
                <div style="max-width: 352px; overflow: hidden">

                    <img src="<%:Art.UrlImg %>"
                        class="card-img-top" alt="Img Article" style="margin-top: 10%; width: 100%; height: auto">
                </div>


                <div class="card-body  ">
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
            <div class="col-6">
                <div class="mb-3">

                    <h3>You do not have selected Favorites </h3>

                </div>
                <div class="mb-3">
                    <p>Do you want add Any?</p>
                </div>
            </div>
            <div class="col-6">
                <a href="Default.aspx" class="btns  btn btn-primary">Go</a>
                <div>
                </div>
            </div>

            <%}%>
        </div>
    </div>
</asp:Content>
