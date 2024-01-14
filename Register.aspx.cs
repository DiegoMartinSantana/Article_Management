using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AccessBd;
using Domain;
using Microsoft.AspNet.FriendlyUrls;
namespace SalesSystem
{
    public partial class Register : System.Web.UI.Page
    {


        protected void Page_Load(object sender, EventArgs e)
        {


            if (!IsPostBack && Request.QueryString["changes"] == null)
            {
                txtImgUser1.ImageUrl = "https://i.pinimg.com/originals/97/ea/a6/97eaa682491355a6c6b2ad3c7f086a3a.jpg";

                if (Security.Validation.Login(Session["user"]))
                {

                    Users user2 = (Users)Session["user"];

                    txtPass.Text = user2.Password;
                    txtemailuser.Text = user2.Email;
                    TxtName.Text = user2.Name;
                    TxtSurname.Text = user2.Surname;
                    TxtName.ReadOnly = true;
                    TxtSurname.ReadOnly = true;
                    txtemailuser.ReadOnly = true;
                    txtPass.ReadOnly = true;
                    fileUser1.Visible = false;

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
            
            else if (Request.QueryString["changes"] =="1" )
            {
                Users user2 = (Users)Session["user"];

                btnEditProfile.Enabled = false;
                btnEditProfile.Visible = false;

                btnCancel.Enabled = true;
                btnCancel.Visible = true;
                btnSaveChanges.Enabled = true;
                btnSaveChanges.Visible = true;

                TxtName.ReadOnly = false;
                TxtSurname.ReadOnly = false;
                txtemailuser.ReadOnly = false;
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
                    if (Security.Validation.Login(Session["user"]))
                    {

                        Users user3 = (Users)Session["user"];

                        txtPass.Text = user3.Password;
                        txtemailuser.Text = user3.Email;
                        TxtName.Text = user3.Name;
                        TxtSurname.Text = user3.Surname;
                        TxtName.ReadOnly = true;
                        TxtSurname.ReadOnly = true;
                        txtemailuser.ReadOnly = true;
                        txtPass.ReadOnly = true;
                        fileUser1.Visible = false;

                        if (!string.IsNullOrEmpty(user3.UrlImgProfile))
                        {
                            if (user2.UrlImgProfile.Contains("IdUser_"))
                            {
                                txtImgUser1.ImageUrl = "~/Images/Imgs_Profile/" + user3.UrlImgProfile;


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

            }else if (Request.QueryString["changes"] == "2")
            {
                //show label o p with changes ok
            }
        }


        protected void btnCreate_Click(object sender, EventArgs e)
        {

            Users user = new Users();

            user.Email = txtemailuser.Text;
            user.Password = txtNewPass.Text;
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
            UsersAccess access = new UsersAccess();
            try
            {
                user.Id = access.insert(user);
                Session.Add("user", user);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                Response.Redirect("Register.aspx", false);
            }



        }

        protected void btnEditProfile_Click(object sender, EventArgs e)
        {

            Response.Redirect("Register.aspx?changes=" + "1", false);

        }
        protected void btnSaveChanges_Click(object sender, EventArgs e)
        {
            UsersAccess accessU = new UsersAccess();
            try
            {
                var User = (Users)Session["user"];
                User.Email = txtemailuser.Text;
                User.Name = TxtName.Text;
                User.Surname = TxtSurname.Text;
                User.Password = txtPass.Text;

                if (!string.IsNullOrEmpty(fileUser1.PostedFile.FileName))
                {
                    User.UrlImgProfile = "IdUser_" + User.Id + ".jpg";
                }

                accessU.editUser(User);
            }
            catch (Exception ex)
            {
                throw ex;
            }

            Response.Redirect("Register.aspx?changes=" + "2", false);

        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx", false);
        }


    }
}