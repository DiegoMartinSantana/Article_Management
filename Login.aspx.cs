using AccessBd;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Domain;

namespace SalesSystem
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {



        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            UsersAccess access = new UsersAccess();
            Users user = new Users();

            user.Email = txtEmail.Text;
            user.Password = txtPass.Text;

            try
            {
                if (access.validate(user))
                {
                    Session.Add("user", user);
                    Response.Redirect("Default.aspx", false);
                }
                else
                {
                    //show label with no user found
                }
                
            }

        
            catch (Exception ex)
            {

                throw ex; //redirect to error page !

            }


}
    }
}