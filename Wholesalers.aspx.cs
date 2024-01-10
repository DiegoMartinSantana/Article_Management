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
            txtThanks.Enabled = true;
            txtThanks.Visible = true;
            EmailService service = new EmailService();
            service.buildEmail(txtEmailSend.Text, "Wholesalers", "All wholesale sales have a 15% discount, please respond with the list of items you wish to purchase. (Minimum of 5). Thanks for your time!");
            try
            {
                service.sendEmail();
            }
            catch (Exception ex)
            {

                throw ex;
            }       

          
        }
    }
}