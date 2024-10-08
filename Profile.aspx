﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="SalesSystem.Profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        body {
            font-family: 'Arial', sans-serif;
            color: #333;
        }

        .container {
            margin-top: 3%;
        }

        .form-control {
            border: none;
            border-bottom: 2px solid #ddd;
            border-radius: 0;
            box-shadow: none;
            margin-bottom: 1.5rem;
            background: white;
        }

            .form-control:focus {
                border-color: #5a67d8;
                box-shadow: none;
            }

        .form-label {
            font-weight: bold;
            color: #5a67d8;
        }

        .btn-primary {
            background-color: #5a67d8;
            border: none;
            color: #fff;
            transition: background-color 0.3s, transform 0.3s;
        }

            .btn-primary:hover {
                background-color: #434190;
                transform: translateY(-2px);
            }

        .btn-danger {
            background-color: #e53e3e;
            border: none;
            color: #fff;
            transition: background-color 0.3s, transform 0.3s;
        }

            .btn-danger:hover {
                background-color: #c53030;
                transform: translateY(-2px);
            }

        .btn-success {
            background-color: #48bb78;
            border: none;
            color: #fff;
            transition: background-color 0.3s, transform 0.3s;
        }

            .btn-success:hover {
                background-color: #38a169;
                transform: translateY(-2px);
            }

        .text-danger {
            color: #e53e3e;
        }

        .text-success {
            color: #48bb78;
        }

        .imgBorder {
            border: 1px solid #ddd;
            border-radius: 5px;
            max-width: 400px;
            margin-top: 3%;
            height: auto;
        }

        .txt {
            max-width: 60%;
            margin-top: 2.5%;
        }
    </style>
    <div class="container mt-5">

        <div class="row" style="margin-top: 3%">
            <div class="col-md-6">

                <div class="mb-3">
                    <p style="color: red" runat="server" id="pGeneric" visible="false">Generic users cannot be modified. </p>

                    <asp:Label ID="lblEmailUser" runat="server" Text="Email :" CssClass="form-label"></asp:Label>
                    <asp:TextBox runat="server" CssClass="form-control txt fondoTextBox" ID="txtemailuser" Style="max-width: 80%; background-color: white" PlaceHolder="Enter Email" TextMode="Email" />
                    <p style="color: red" runat="server" id="pEmailValidateEdit" visible="false">That email has already been registered </p>

                    <asp:RequiredFieldValidator Style="color: red" ErrorMessage="Email Required" ControlToValidate="txtemailuser" runat="server" />
                </div>


                <div class="mb-3">

                    <asp:Label ID="lblPass" runat="server" Text="Enter new Pass : " CssClass="form-label"></asp:Label>
                    <asp:TextBox runat="server" CssClass="form-control txt fondoTextBox" ID="txtPass" Style="max-width: 80%; background-color: white" PlaceHolder="Enter New Password" />
                    <asp:RequiredFieldValidator Style="color: red" ErrorMessage="Password Required" ControlToValidate="txtPass" runat="server" />
                    <div>
                        <asp:RegularExpressionValidator Style="color: red" ErrorMessage="Minimum eight characters, at least one letter, one number and not simbols."
                            ControlToValidate="txtPass"
                            ValidationExpression="^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$" runat="server" />
                    </div>
                </div>
                <div class="mb-3">

                    <asp:Label runat="server" ID="lblRepeatPass" Text="Repeat Pass : " CssClass="form-label"></asp:Label>
                    <asp:TextBox runat="server" CssClass="form-control txt fondoTextBox" ID="txtRepeatPass" Style="max-width: 80%; background-color: white" PlaceHolder="Repeat Password " />



                </div>
                <p style="color: red" runat="server" visible="false" id="pPasswordWrong">The passwords are not Equals </p>

                <div class="mb-3">
                    <asp:Label ID="lblName" runat="server" Text="Name :" CssClass="form-label"></asp:Label>
                    <asp:TextBox runat="server" CssClass="form-control txt fondoTextBox" ID="TxtName" Style="max-width: 80%; background-color: white" PlaceHolder="Enter your Name" />
                    <asp:RequiredFieldValidator Style="color: red" ErrorMessage="Name Required" ControlToValidate="TxtName" runat="server" />

                </div>
                <div class="mb-3">
                    <asp:Label ID="lblSurname" runat="server" Text="Surname :" CssClass="form-label"></asp:Label>
                    <asp:TextBox runat="server" CssClass="form-control txt fondoTextBox" ID="TxtSurname" Style="max-width: 80%; background-color: white" PlaceHolder="Enter your Surname" />
                </div>

            </div>


            <div class="col-md-6">
                <div class="mb-3">
                    <asp:Label ID="lblUrlImg" runat="server" Text="Url Image :" CssClass="form-label "></asp:Label>

                </div>
                <div class="mb-3">
                    <input type="file" id="fileUser2" runat="server" class="form-control" />
                </div>
                <div class="mb-3">
                    <asp:Label Text="Or enter your Url: " runat="server" CssClass="form-label" />
                </div>
                <div class="mb-3">
                    <asp:TextBox runat="server" PlaceHolder="Enter Url " ID="txtUrlLink2" Style="background-color: white" CssClass="form-control txt fondoTextBox" />
                </div>
                <div class="mb-3">
                    <asp:Image runat="server" ID="txtImgUser2"  CssClass="img-fluid mb-3 imgBorder" AlternateText="User Image" Style="max-width: 400px; background-color: white; height: auto; margin-top: 3%" />

                </div>

            </div>
        </div>
        <div class="row" style="margin-top: 2%">
           
            <div class="col-md-12">

                <div class="mb-3">
                    <a href="Register.aspx" class="btn btn-danger">Cancel</a>
                    <asp:Button Text="Save your Changes" ID="btnSave" OnClick="btnSave_Click" CssClass="btn btn-success" Style="margin-left: 3%;" runat="server" AutoPostback="false" />


                </div>
            </div>

        </div>
    </div>
</asp:Content>
