<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="SalesSystem._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
     <style>
    
  </style>
    <main>
        <div class="col">

            <div class="row ">

                <div class="md-3" style="margin-block-end:30px">
                    <h3>These are all the products we can offer you! </h3>

                </div>
            </div>
        </div>

            <div class="row row-cols-1 text-lg-center " style="margin-left:15px">

                <% foreach (Domain.Article Art in list)
                    {
                %>
                <div class="card" style="width: 15rem; margin-right:30px ">
                    <img src="<%:Art.UrlImg %>" class="card-img-top" alt="Img Article">
                    <div class="card-body ">
                        <h5 class="card-title"><%: Art.Name %></h5>
                        <p class="card-text"><%:Art.Description %>.</p>
                        <a href="#" class="btn btn-primary">Go to Article </a>
                    </div>
                </div>
                <%} %>
            </div>

    </main>

</asp:Content>
