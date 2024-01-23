using AccessBd;
using Domain;
using Security;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SalesSystem
{
    public partial class Validate : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Validation.Login(Session["User"]))
            {
                Response.Redirect("Login.aspx", false);
            }
        }

        protected void btnValidatePass_Click(object sender, EventArgs e)
        {

            UsersAccess accessU = new UsersAccess();

            try
            {
                Users User = (Users)Session["user"];

               bool equals= accessU.validatePass(User.Id,txtValidatePass.Text);

                if (equals)
                {
                    int send = 1;
                    Response.Redirect("Register.aspx?changes=" + send, false);
                }
                else
                {
                    Response.Redirect("Login.aspx", false);

                }

            }
            catch (Exception ex)
            {
                Session.Add("error", ex);
                Response.Redirect("error.aspx", false);
            }

        }
    }
}