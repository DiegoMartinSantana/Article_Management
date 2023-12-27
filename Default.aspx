<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="SalesSystem._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <style>
    
  </style>

    <main>

        <div class="row mb-3">

            <div class="col">

                <div class="md-3 form-control-lg">

                    <asp:Label runat="server" ID="lblfilter"> Search Article by Name or Description :  </asp:Label>


                </div>
                <div class="md-3">
                    <asp:TextBox runat="server" Style="margin-left: 15px" AutoPostBack="true" ID="txtsearch" CssClass="form-control" OnTextChanged="txtsearch_TextChanged" />

                </div>


            </div>

        </div>

        <asp:UpdatePanel runat="server">
            <ContentTemplate>
                <div class="col">
                    <div class="mb-3">
                        <asp:CheckBox Text="Show Advanced Filter" CssClass="form-check" OnCheckedChanged="chkAdvfilter_CheckedChanged" ID="chkAdvfilter" AutoPostBack="true" runat="server" />

                    </div>
                </div>


                <%if (chkAdvfilter.Checked)
                    {
                %>
                <div class="row mb-3">
                    <div class="col " style="max-width: 25%">
                        <div class=" form-control-lg ">
                            <asp:Label Text="Search by :" runat="server" />
                        </div>
                        <div class="mb-3 form-control  " style="text-align: center; margin-left: 15px">
                            <asp:DropDownList runat="server" AutoPostBack="true" CssClass="dropdown-item" Style="font-size: larger" ID="ddlby" OnSelectedIndexChanged="ddlby_SelectedIndexChanged">
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
                            <asp:DropDownList runat="server" CssClass="dropdown-item" Style="font-size: larger" ID="ddlcritery">
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="col " style="max-width: 25%">
                        <div class=" form-control-lg ">
                            <asp:Label Text="Filter :" runat="server" />
                        </div>

                        <div class="md-3">
                            <asp:TextBox runat="server" Style="margin-left: 15px" ID="txtFilterAdvanced" CssClass="form-control" />

                        </div>

                    </div>


                    <div class="col " style="max-width: 25%">
                        <div class="md-3 form-control-lg">
                        </div>
                        <div class="mb-3" style="margin-left: 80px">
                            <asp:Button Text="Search" runat="server" Autopostback="true" CssClass="btn btn-primary" ID="btnsearchAdvanced" OnClick="btnsearchAdvanced_Click" Style="font-size: larger" />

                        </div>
                    </div>
                </div>

                <%} %>
            </ContentTemplate>
        </asp:UpdatePanel>


        <div class="row mb-3 row-cols-1 text-lg-center " style="margin-left: 15px">
            <%
                if (list != null)
                {
                    foreach (Domain.Article Art in list)
                    {
            %>
            <div class="card " style="width: 15rem; margin-right: 30px">
                <img src="<%:Art.UrlImg %>" class="card-img-top" alt="Img Article">
                <div class="card-body ">
                    <h5 class="card-title"><%: Art.Name %></h5>
                    <p class="card-text"><%:Art.Description %>.</p>
                    <a href="#" class="btn btn-primary">Go to Article </a>
                </div>
            </div>
            <%}
                }%>
        </div>
    </main>

</asp:Content>
