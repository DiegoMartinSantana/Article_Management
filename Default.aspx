<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="SalesSystem._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .fields {
            text-align: center;
            width: 70%;
        }

        .fields2 {
            width: 60%;
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

    <main>


        <div class="bg-light " style="margin-left: 4%; padding-left: 6%">
            <div class="row mb-0">

                <div class="col mb-3">

                    <div class="mb-3 form-control fields2" style="margin-left: 15px; margin-top: 2.5%">

                        <asp:Label runat="server" ID="lblfilter"> Search Article by Name or Description :  </asp:Label>


                    </div>
                    <div class="mb-3">
                        <asp:TextBox runat="server" Style="margin-left: 15px" AutoPostBack="true" ID="txtsearch" CssClass="form-control"
                            OnTextChanged="txtsearch_TextChanged" PlaceHolder="Enter Filter" />

                    </div>


                </div>
                <div class="col mb-3">
                    <div class="mb-3  " style="padding: 1.5%; margin-left: 23%; margin-top: 8.5%">
                        <asp:CheckBox OnCheckedChanged="chkfilter_CheckedChanged" ID="chkfilter" AutoPostBack="true" runat="server" />
                        <asp:Label Text="Show Advanced Filter" CssClass="form-check-label" runat="server" />
                    </div>
                </div>
            </div>

            <asp:UpdatePanel runat="server">
                <ContentTemplate>
                    <%if (chkfilter.Checked)
                        {
                    %>

                    <div class="row mb-3" style="margin-left: 10px">

                        <div class="col mb-3" style="max-width: 25%">
                            <div class=" mb-3 form-control fields ">
                                <asp:Label Text="Search by :" runat="server" />
                            </div>

                            <div class="mb-3 form-control " style="text-align: center; margin-left: 10px">

                                <asp:DropDownList runat="server" AutoPostBack="true" CssClass="dropdown-item" ID="ddlby" OnSelectedIndexChanged="ddlby_SelectedIndexChanged">
                                    <asp:ListItem Text="Brand" />
                                    <asp:ListItem Text="Category" />
                                    <asp:ListItem Text="Price" />

                                </asp:DropDownList>
                            </div>
                        </div>

                        <div class="col mb-3 " style="max-width: 25%">
                            <div class=" mb-3 form-control fields  ">
                                <asp:Label Text="Critery :" runat="server" />
                            </div>

                            <div class="mb-3 form-control  " style="text-align: center; margin-left: 10px">
                                <asp:DropDownList runat="server" CssClass="dropdown-item" ID="ddlCritery">
                                </asp:DropDownList>
                            </div>
                        </div>

                        <div class="col mb-3" style="max-width: 25%">
                            <div class=" mb-3 form-control fields ">
                                <asp:Label Text="Filter :" runat="server" />
                            </div>

                            <div class="mb-3 ">
                                <asp:TextBox runat="server" Style="margin-left: 10px" ID="txtFilterAdvanced" CssClass="form-control form-text mb-3" />

                            </div>

                        </div>

                        <div class="col mb-3 ">

                            <div class="mb-3" style="margin-left: 8%; margin-top: 18.5%">
                                <asp:Button Text="Search" runat="server" CssClass="btn btn-primary" ID="btnsearchAdvanced" OnClick="btnsearchAdvanced_Click" />

                            </div>
                        </div>



                        <%} %>
                        <div class="row mb-3 row-cols-1 text-center " style="margin-left: 15px">
                            <%
                                if (list != null)
                                {
                                    foreach (Domain.Article Art in list)
                                    {
                            %>

                            <div class="card cardGral">

                                <% 

                                    imgArtCard.ImageUrl = Security.Helper.UrlLocal(Art.UrlImg);


                                %><div class="divImgCard">
                                    <asp:Image alt="Image Article" CssClass="imgCard" ID="imgArtCard" runat="server" />

                                </div>
                                <div class="card-body  mb-3" style="max-width: 150px">
                                    <h5 class="card-title"><%: Art.Name %></h5>
                                    <p class="card-text"><%:Art.Description %>.</p>

                                    <%if (Security.Validation.Login(Session["user"]))
                                        {  %>
                                    <% AccessBd.FavoritesAccess access = new AccessBd.FavoritesAccess();
                                        Domain.Users user = (Domain.Users)Session["user"];
                                        if (!access.IsFavorite(user.Id, Art.Id))
                                        {  %>

                                    <div class="mb-3">
                                        <a href="Default.aspx?idFav=<%: Art.Id %>" class="btn  btnGreen" style="background-color: #C0F9AB">Add to favorites </a>
                                    </div>


                                    <%}
                                        else
                                        {
                                    %>

                                    <div class="mb-3">
                                        <img src="https://clipart-library.com/img/2184494.png" alt="Little Star Img " style="width: 70px; height: auto" />

                                    </div>

                                    <%} %>
                                    <%} %>
                                    <a href="detailArticle.aspx?idShow=<%: Art.Id %>" class="btn btnLigth" style="background-color: skyblue">Go to Article </a>
                                </div>
                            </div>
                            <%}
                                }%>
                        </div>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>

    </main>

</asp:Content>
