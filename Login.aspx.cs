using AccessBd;
using System;
using System.Web.UI;
using Domain;
using System.Threading.Tasks;
using System.Net.Http;



namespace SalesSystem
{
    public partial class Login : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {

            if (Request.QueryString["PassChanged"]!= null)
            {
                pChangedPass.Visible= true; 
            }

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (!(txtEmail.Text == "admin@admin.com") && !(txtEmail.Text == "user@user.com"))
            {
                Page.Validate();
                if (!Page.IsValid)
                {
                    return;
                }
            }


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
                    txtWrong.Visible = true;
                }

            }

            catch (Exception ex)
            {
                Session.Add("error", ex);
                Response.Redirect("error.aspx", false);
            }

        }

      async protected void btnRecoverPassword_Click(object sender, EventArgs e)
        {
           RecoverPassController controller = new RecoverPassController();
            Session.Add("codeRecover",await controller.GetCodePassword());
            Session.Add("emailRecover", txtEmail.Text);

            var Email = new EmailService();
            try
            {
                Email.BuildEmailRecoverPass(txtEmail.Text, (string)Session["codeRecover"]);
                Email.sendEmail();
            }
            catch (Exception ex )
            {
                Session.Add("error", ex);
                Response.Redirect("error.aspx", false);
            }


            Response.Redirect("RecoverPass.aspx", false);




        }
    }
}