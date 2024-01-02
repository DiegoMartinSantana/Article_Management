using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AccessBd;
using Domain;
namespace SalesSystem
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            Users user2 = new Users();
            if (Session["user"] != null)
            {
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

        protected void btnSave_Click(object sender, EventArgs e)
        {
            
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
               user.Id= access.insert(user);
               
                Session.Add("user", user);



            }
            catch (Exception ex)
            {

                throw ex;
            }

        }
    }
}