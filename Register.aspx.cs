using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AccessBd;
using Domain;
using Security;
using Microsoft.AspNet.FriendlyUrls;
namespace SalesSystem
{
    public partial class Register : System.Web.UI.Page
    {


        public int Changes { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["changes"] != null)
            {
                Changes = int.Parse(Request.QueryString["changes"]);
            }

            if (!IsPostBack && Changes != 1 && Changes != 2)
            {

                txtImgUser1.ImageUrl = "https://i.pinimg.com/originals/97/ea/a6/97eaa682491355a6c6b2ad3c7f086a3a.jpg";

                if (Security.Validation.Login(Session["user"]))
                {

                    Users user2 = (Users)Session["user"];
                    lblPass.Text = "Pass :";

                    txtemailuser.Text = user2.Email;
                    TxtName.Text = user2.Name;
                    TxtSurname.Text = user2.Surname;
                    TxtName.ReadOnly = true;
                    TxtSurname.ReadOnly = true;
                    txtemailuser.ReadOnly = true;
                    txtPass.ReadOnly = true;
                    fileUser1.Visible = false;
                    lblUrlImg.Text = "Profile Image";
                    lblUrlLink.Visible = false;
                    txtUrlLink.Visible = false;
                    txtRepeatPass.Visible = false;
                    txtPass.Text = "********";
                    lblRepeatPass.Visible = false;
                    if (!string.IsNullOrEmpty(user2.UrlImgProfile))
                    {
                        if (user2.UrlImgProfile.Contains("IdUser_"))
                        {
                            txtImgUser1.ImageUrl = "~/Images/Imgs_Profile/" + user2.UrlImgProfile;
                        }
                        else
                        {
                            txtImgUser1.ImageUrl = user2.UrlImgProfile;
                        }
                    }
                    else
                    {
                        txtImgUser1.ImageUrl = "https://i.pinimg.com/originals/97/ea/a6/97eaa682491355a6c6b2ad3c7f086a3a.jpg";
                    }
                }

            }

            else if (Changes == 1)
            {
                Users user2 = (Users)Session["user"];


                txtPass.Text = user2.Password;
                txtRepeatPass.Text = user2.Password;
                txtemailuser.Text = user2.Email;
                TxtName.Text = user2.Name;
                TxtSurname.Text = user2.Surname;



                btnCancel.Visible = true;

                TxtName.ReadOnly = false;
                TxtSurname.ReadOnly = false;

                txtPass.ReadOnly = false;

                if (!string.IsNullOrEmpty(user2.UrlImgProfile))
                {
                    if (user2.UrlImgProfile.Contains("IdUser_"))
                    {
                        txtImgUser1.ImageUrl = "~/Images/Imgs_Profile/" + user2.UrlImgProfile;
                    }
                    else
                    {
                        txtImgUser1.ImageUrl = user2.UrlImgProfile;
                    }
                }
                else
                {
                    txtImgUser1.ImageUrl = "https://i.pinimg.com/originals/97/ea/a6/97eaa682491355a6c6b2ad3c7f086a3a.jpg";
                }
            }
            else if (Changes == 2)
            {
                pPasswords.Visible = true;
                Users user2 = (Users)Session["user"];


                txtPass.Text = user2.Password;
                txtRepeatPass.Text = user2.Password;
                txtemailuser.Text = user2.Email;
                TxtName.Text = user2.Name;
                TxtSurname.Text = user2.Surname;





                TxtName.ReadOnly = false;
                TxtSurname.ReadOnly = false;

                txtPass.ReadOnly = false;

                if (!string.IsNullOrEmpty(user2.UrlImgProfile))
                {
                    if (user2.UrlImgProfile.Contains("IdUser_"))
                    {
                        txtImgUser1.ImageUrl = "~/Images/Imgs_Profile/" + user2.UrlImgProfile;
                    }
                    else
                    {
                        txtImgUser1.ImageUrl = user2.UrlImgProfile;
                    }
                }
                else
                {
                    txtImgUser1.ImageUrl = "https://i.pinimg.com/originals/97/ea/a6/97eaa682491355a6c6b2ad3c7f086a3a.jpg";
                }

            }

        }




        protected void btnCreate_Click(object sender, EventArgs e)
        {

            if (string.IsNullOrEmpty(txtemailuser.Text) || string.IsNullOrEmpty(txtPass.Text))
            {
                return;
            }

            Users user = new Users();
            try
            {
                if (txtPass.Text == txtRepeatPass.Text)
                {
                    user.Email = txtemailuser.Text;
                    user.Password = txtPass.Text;
                    user.IsAdmin = false;
                    user.Surname = TxtSurname.Text;
                    user.Name = TxtName.Text;

                    UsersAccess accessU = new UsersAccess();
                    int idSend = accessU.listIdUsers().Last() + 1;

                    if (!string.IsNullOrEmpty(fileUser1.PostedFile.FileName))
                    {
                        string route = Server.MapPath("./Images/Imgs_Profile/");
                        fileUser1.PostedFile.SaveAs(route + "IdUser_" + idSend + ".jpg");
                        user.UrlImgProfile = "IdUser_" + idSend + ".jpg";
                    }
                    else if (!string.IsNullOrEmpty(txtUrlLink.Text))
                    {
                        user.UrlImgProfile = txtUrlLink.Text;
                    }
                    UsersAccess access = new UsersAccess();

                    user.Id = access.insert(user);
                    Session.Add("user", user);
                }
                else
                {
                    int changes = 2;
                    Response.Redirect("Register.aspx?changes=" + changes, false);

                }

            }
            catch (Exception ex)
            {
                Session.Add("error", ex);
                Response.Redirect("error.aspx", false);
            }
            
                Response.Redirect("Default.aspx" ,false);
            

        }

        protected void btnEditProfile_Click(object sender, EventArgs e)
        {

            Response.Redirect("Profile.aspx", false);

        }


        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx", false);
        }


    }
}