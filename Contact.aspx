﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="SalesSystem.Wholesalers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        body {
        }

        .box {
            margin: auto;
        }

        .card {
            padding: 8%;
            padding-top: 35px;
            margin-top: 60px;
            margin-bottom: 80px;
        }

        textarea[name="message"] {
            resize: none;
        }

        #e-mail {
            height: 45px;
        }

        .textBox {
            max-width: 100%;
        }

        input.input-box:focus,
        textarea.input-box:focus {
            background-color: #DDA0DD; /* Fondo de los cuadros de texto enfocados en lavanda */
            color: #4B0082; /* Texto de los cuadros de texto enfocados en tono lavanda oscuro */
        }

        .rm-border:focus {
            border-color: inherit;
            -webkit-box-shadow: none;
            box-shadow: none;
        }

        .cardBg {
            color: #4B0082; /* Texto adicional de la tarjeta en tono lavanda oscuro */
        }
    </style>

    <div>
        <div class="container">
            <div class="row justify justify-content-center" style="margin-top:5%">
                <div class="col-11 col-md-8 col-lg-6 col-xl-5 ">
                    <div class="card cardBg shadow">
                        <div class="row mt-0">
                            <div class="col-md-12" style="color:black">
                                <h4>Contact Us</h4>
                                <p>For wholesale sales or other inquiries, leave us your information and your question and we will contact you.</p>
                                <div class="form-group row mb-3">
                                    <div class="col-md-12 mb-0">
                                        <p class="mb-1">Email</p>
                                        <asp:TextBox runat="server" ID="txtEmailSend" CssClass="form-control input-box rm-border textBox" TextMode="Email" placeholder="Enter your email" />
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-md-12 mb-2">
                                        <p class="mb-1">Message</p>
                                        <asp:TextBox runat="server" TextMode="MultiLine" ID="txtEmailMessage" Style="height: 120px" CssClass="form-control input-box rm-border textBox" />
                                    </div>
                                </div>
                                <div class="form-group row justify-content-center mb-0">
                                    <div class="col-md-12">
                                        <asp:Button Text="Submit" Style="max-width: 100%; width: 100%; margin-top: 2.5%" CssClass="btn btn-primary rm-border" OnClick="btnSendEmail_Click" ID="Button1" runat="server" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
