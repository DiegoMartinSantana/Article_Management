using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Domain;
using AccessBd;
namespace SalesSystem
{
    public partial class Profile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Security.Validation.Login(Session["user"]))
            {
                Response.Redirect("Default.aspx");
            }

            Users user = (Users)Session["user"];

            if (!IsPostBack)
            {
                txtemailuser.Text = user.Email;
                txtPass.Text = user.Password;
                txtRepeatPass.Text = user.Password;
                TxtName.Text = user.Name;
                TxtSurname.Text = user.Surname;

                if (user.UrlImgProfile.Contains("IdUser_"))
                {
                    if (string.IsNullOrEmpty(user.UrlImgProfile))
                    {
                        txtImgUser2.ImageUrl = "https://i.pinimg.com/originals/97/ea/a6/97eaa682491355a6c6b2ad3c7f086a3a.jpg";

                    }
                    else
                    {
                        txtImgUser2.ImageUrl = "~/Images/Imgs_Profile/" + user.UrlImgProfile;
                    }
                }
                else if (!string.IsNullOrEmpty(user.UrlImgProfile))
                {
                    txtImgUser2.ImageUrl = user.UrlImgProfile;

                }
                else
                {
                    txtImgUser2.ImageUrl = "https://i.pinimg.com/originals/97/ea/a6/97eaa682491355a6c6b2ad3c7f086a3a.jpg";

                }

            }

            int send = 0;
            if (Request.QueryString["send"] != null)
            {
                send = int.Parse(Request.QueryString["send"]);
            }
            if (send == 1)
            {
                txtemailuser.Text = user.Email;
                txtPass.Text = user.Password;
                txtRepeatPass.Text = user.Password;
                TxtName.Text = user.Name;
                TxtSurname.Text = user.Surname;
                if (user.UrlImgProfile.Contains("IdUser_"))
                {
                    if (string.IsNullOrEmpty(user.UrlImgProfile))
                    {
                        txtImgUser2.ImageUrl = "https://i.pinimg.com/originals/97/ea/a6/97eaa682491355a6c6b2ad3c7f086a3a.jpg";

                    }
                    else
                    {
                        txtImgUser2.ImageUrl = "~/Images/Imgs_Profile/" + user.UrlImgProfile;
                    }
                }
                else if (!string.IsNullOrEmpty(user.UrlImgProfile))
                {
                    txtImgUser2.ImageUrl = user.UrlImgProfile;

                }
                else
                {
                    txtImgUser2.ImageUrl = "https://i.pinimg.com/originals/97/ea/a6/97eaa682491355a6c6b2ad3c7f086a3a.jpg";

                }

                pPasswords.Visible = true;

            }

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            Users user = (Users)Session["user"];
            if (!string.IsNullOrEmpty(txtPass.Text))
            {
                if (txtPass.Text == txtRepeatPass.Text)
                {
                    user.Password = txtPass.Text;
                    user.Name = TxtName.Text;
                    user.Surname = TxtSurname.Text;
                    if (!string.IsNullOrEmpty(fileUser2.PostedFile.FileName))
                    {
                        string route = Server.MapPath("./Images/Imgs_Profile/");
                        fileUser2.PostedFile.SaveAs(route + "IdUser_" + user.Id + ".jpg");

                        user.UrlImgProfile = "IdUser_" + user.Id + ".jpg";
                    }
                    else if (!string.IsNullOrEmpty(txtUrlLink2.Text))
                    {
                        user.UrlImgProfile = txtUrlLink2.Text;
                    }

                    UsersAccess accessUser = new UsersAccess();

                    try
                    {
                        accessUser.editUser(user);

                    }
                    catch (Exception ex)
                    {
                        Session.Add("error", ex);
                        Response.Redirect("error.aspx", false);
                    }

                    Session.Add("user", user);

                    Response.Redirect("Register.aspx", false);
                }
                else
                {
                    int send = 1;
                    Response.Redirect("Register.aspx?send=" + send, false);

                }
            }
            else
            {
                int send = 1;
                Response.Redirect("Register.aspx?send=" + send, false);
            }
        }
    }
}