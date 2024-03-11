using AccessBd;
using Security;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SalesSystem
{
    public partial class RecoverPass : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRecover_Click(object sender, EventArgs e)
        {
            Page.Validate();

            

            if (!Page.IsValid)
            {
                return;
            }
            if (txtNewPass.Text != txtRepeatNewPass.Text)
            {
                pNotEquals.Visible = true;
                return;
            }


            try
            {
                var email = (string)Session["emailRecover"];
                var UAccess = new UsersAccess();
                UAccess.ChangePass(email, txtNewPass.Text);
                string changeOk = "Ok";
                Response.Redirect("Login.aspx?PassChanged="+changeOk, false);
                    
            }
            catch (Exception ex)
            {

                Session.Add("error", ex);
                Response.Redirect("error.aspx", false);
            }

        }

        protected void btnSend_Click(object sender, EventArgs e)
        {
            Page.Validate();
           

            if (!Page.IsValid)
            {
                return;
            }
            string code = (string)Session["codeRecover"] ; 
            string codeInput= "\"" +txtCod.Text  + "\"";   
            if (codeInput == code)
            {
                //comprobar las ""
                rowRecover.Visible = true;  
            }
            else
            {
                //muestro que es invalido el codigo.
                pCodeInvalid.Visible = true;
                return;
            }
        }
    }
}