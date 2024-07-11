<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Favorites.aspx.cs" Inherits="SalesSystem.Favourites" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        body {
            font-family: 'Arial', sans-serif;
            color: #333;
        }

        .boxCute {
            font-style: oblique;
            text-align: center;
            margin-right: 5%;
            color: #6a1b9a;
            margin: 20px 0;
        }

        .imgStar {
            float: left;
            height: auto;
            width: 90px;
            position: relative;
            left: 20%;
            bottom: 10px;
        }

        .card-img-top-wrapper {
            position: relative;
            width: 100%;
            padding-top: 100%;
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

        .overlay {
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

        .card-body {
            padding: 15px;
            text-align: center;
        }

        .card-title {
            font-size: 1.25rem;
            color: #6a1b9a;
        }

        .card-text {
            color: #555;
            margin-bottom: 10px;
        }

        .btn {
            padding: 0.5rem 1rem;
            border: none;
            border-radius: 5px;
            transition: background-color 0.3s;
        }

        .btnGreen {
            background-color: #c0f9ab;
            color: #333;
        }

            .btnGreen:hover {
                background-color: #a8e98c;
            }

        .btnLight {
            background-color: skyblue;
            color: #333;
        }

            .btnLight:hover {
                background-color: #87ceeb;
            }

        .btn-primary {
            background-color: #6a1b9a;
            color: #fff;
        }

            .btn-primary:hover {
                background-color: #571575;
            }

        .text-black-50 {
            color: #6a1b9a;
        }

        .display-4 {
            font-size: 2.5rem;
        }
    </style>
    <div class="row mb-3 row-cols-1 text-lg-center" style="margin-left: 15px">
        <% if (listArt.Count != 0)
            { %>
        <div class="row d-flex justify-content-center" style="margin-top: 1.5%; border: 2px solid grey; border-radius: 22px">
            <div class="mb-3 text-black-50" style="margin-top: 3.5%;">
                <div class="boxCute" style="margin-bottom:3%">
                    <h4 class="display-4">Favorites</h4>
                </div>
            </div>
            <div class="row mb-3 row-cols-1 text-center" style="margin-left: 15px">
                <% foreach (Domain.Article Art in listArt)
                    { %>
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
                            <% if (Security.Validation.Login(Session["user"]))
                                {
                                    AccessBd.FavoritesAccess access = new AccessBd.FavoritesAccess();
                                    Domain.Users user = (Domain.Users)Session["user"];
                                    if (!access.IsFavorite(user.Id, Art.Id))
                                    { %>
                            <div class="mb-3">

                            </div>
                            <% }
                            else
                            { %>
                            <div class="mb-3">
                                <img src="https://pngimg.com/d/star_PNG41462.png" alt="Little Star Img" style="width: 55px; height: auto" />
                            </div>
                            <% }
                            } %>
                            <div>
                                <a href="Favorites.aspx?idDel=<%: Art.Id %>" class="btn btn-danger" >Remove</a>
                                </div>

                        </div>
                    </div>
                </div>
                <% } %>
            </div>
        </div>
        <% }
        else
        { %>
        <div class="row" style="margin-top: 3%">
            <div class="mb-3">
                <h3>You do not have selected Favorites</h3>
            </div>
            <div>
                <p>Do you want to add any?</p>
            </div>
            <a style="width: 12%; margin-left: 44%" href="Default.aspx" class="btn btn-primary">Go</a>
        </div>
        <% } %>
    </div>
</asp:Content>
