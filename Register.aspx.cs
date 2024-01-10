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
                if (Security.Validation.Login(Session["user"]))
                {
                    Users user2 = new Users();

                    user2 = (Users)Session["user"];

                    txtid.Text = user2.Id.ToString();
                    txtPass.Text = user2.Password;
                    txtemailuser.Text = user2.Email;
                    TxtName.Text = user2.Name;
                    TxtSurname.Text = user2.Surname;
                    TxtName.ReadOnly = true;
                    TxtSurname.ReadOnly = true;
                    txtemailuser.ReadOnly = true;
                    txtPass.ReadOnly = true;
                    txtid.ReadOnly = true;
                }
            }
            else if (Request.QueryString["changes"] != null)
            {
                btnEditProfile.Enabled = false;
                btnEditProfile.Visible = false;


                btnSaveChanges.Enabled = true;
                btnSaveChanges.Visible = true;

                TxtName.ReadOnly = true;
                TxtSurname.ReadOnly = true;
                txtemailuser.ReadOnly = false;
                txtPass.ReadOnly = false;
                txtid.ReadOnly = true;
                txtid.ReadOnly = true;
            }//no hago nada para que no pise valores previametne asignados



        }



        protected void btnCreate_Click(object sender, EventArgs e)
        {

            Users user = new Users();

            user.Email = txtemailuser.Text;
            user.Password = txtNewPass.Text;
            user.IsAdmin = false;
            user.Surname = TxtSurname.Text;
            user.Name = TxtName.Text;
            if (file1.PostedFile.FileName != "")
            {
                //here 
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

        }


        protected void btnEditProfile_Click(object sender, EventArgs e)
        {


            string changes = "change";
            Response.Redirect("Register.aspx?changes=" + changes, false);

        }
        protected void btnSaveChanges_Click(object sender, EventArgs e)
        {



        }

    }
}