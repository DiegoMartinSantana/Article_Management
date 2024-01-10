<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="SalesSystem.Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    


    <div class="row" style="font-size: large">
        <div class="col-md-6">

            <%if (Security.Validation.Login(Session["user"]))
                { %>
            <div class="mb-3">

                <asp:Label ID="lblId" runat="server" Text="Id :" CssClass="form-label "></asp:Label>
                <asp:TextBox runat="server" CssClass="form-control" ID="txtid" Style="max-width: 80%" />
            </div>

            <% } %>
            <div class="mb-3">

                <asp:Label ID="lblEmailUser" runat="server" Text="Email :" CssClass="form-label"></asp:Label>
                <asp:TextBox runat="server" CssClass="form-control" ID="txtemailuser" Style="max-width: 80%" />
            </div>
            <%if (!Security.Validation.Login(Session["user"]))
                {%>
            <div class="mb-3">

                <asp:Label ID="lblPass" runat="server" Text="New Pass : " CssClass="form-label"></asp:Label>
                <asp:TextBox runat="server" TextMode="Password" CssClass="form-control" ID="txtNewPass" Style="max-width: 80%" />
            </div>
            <%//add other pass check %>

            <%}
                else
                { %>

            <div class="mb-3">

                <asp:Label ID="Label1" runat="server" Text="Pass : " CssClass="form-label"></asp:Label>
                <asp:TextBox runat="server" CssClass="form-control" ID="txtPass" Style="max-width: 80%" />
            </div>
            <%} %>
            <div class="mb-3">
                <asp:Label ID="lblName" runat="server" Text="Name :" CssClass="form-label"></asp:Label>
                <asp:TextBox runat="server" CssClass="form-control" ID="TxtName" Style="max-width: 80%" />
            </div>
            <div class="mb-3">
                <asp:Label ID="lblSurname" runat="server" Text="Surname :" CssClass="form-label"></asp:Label>
                <asp:TextBox runat="server" CssClass="form-control" ID="TxtSurname" Style="max-width: 80%" />
            </div>

        </div>

        <div class="col-md-6">
            <div class="mb-3">
                <asp:Label ID="lblUrlImg" runat="server" Text="Url Image :" CssClass="form-label"></asp:Label>

            </div>
            <div class="mb-3">
                <input type="file" id="file1" runat="server" cssclass="form-control" />
            </div>

            <div class="mb-3">
                <asp:Image runat="server" ID="img300px" CssClass="img-fluid mb-3" Style="height: 300PX;" />

            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-6">
            <%if (Security.Validation.Login(Session["user"]))
                {

            %>
            <div>
                <asp:Button Text="Save your Changes" ID="btnSaveChanges" OnClick="btnSaveChanges_Click" CssClass="btn btn-success" Enabled="false" Visible="false" runat="server" />

            </div>
            <div class="mb-3">

                <asp:Button Text="Edit Profile" ID="btnEditProfile" AutoPostBack="false"  OnClick="btnEditProfile_Click" CssClass="btn btn-success" runat="server" />
                 
            </div>



            <%}
                else
                {  %>
            <asp:Button Text="Create User" ID="btnCreate" OnClick="btnCreate_Click" CssClass="btn btn-primary" runat="server" />



            <%
                }%>
        </div>
    </div>
</asp:Content>
