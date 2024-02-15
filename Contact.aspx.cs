using Domain;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SalesSystem
{
    public partial class Wholesalers : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSendEmail_Click(object sender, EventArgs e)
        {

            EmailService service = new EmailService();
            service.buildEmailUser(txtEmailSend.Text, "Contact Sales System");
            try
            {
                service.sendEmail();
            }
            catch (Exception ex)
            {

                Session.Add("error", ex);
                Response.Redirect("error.aspx", false);
            }

            string AdminEmail = "diegomartinsa02@gmail.com";
             
            service.buildEmailAdmin(AdminEmail, "Sales system message ", "From : " + txtEmailSend.Text + " Message : " + txtEmailMessage.Text);

            try
            {
                service.sendEmail();
            }
            catch (Exception ex)
            {

                Session.Add("error", ex);
                Response.Redirect("error.aspx", false);
            }

        }
    }
}