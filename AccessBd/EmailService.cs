using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;

namespace Domain
{
    public class EmailService
    {

        private SmtpClient server;
        private MailMessage email;
        public EmailService()
        {
            server = new SmtpClient();
            server.Credentials = new NetworkCredential("aspprueba500@gmail.com", "jcgfphrzwljlsqow");
            server.EnableSsl = true;
            server.Port = 587;
            server.Host = "smtp.gmail.com";
        }
        public void buildEmailUser(string destination, string subject)
        {
            email = new MailMessage();
            email.From = new MailAddress("noresponder@ecommerceasp.com");
            email.To.Add(destination);
            email.Subject = subject;
            email.IsBodyHtml = true;
            //this is a template email from :https://app.bootstrapemail.com/templates/free-simple-card ;

            string message = "<body class=\"bg-light\">\r\n  <div class=\"container\">\r\n    <img class=\"ax-center my-10 w-24\" src=\"https://img.freepik.com/vector-premium/caja-empresa-creativa-logotipo-generico_579677-624.jpg\" />\r\n    <div class=\"card p-6 p-lg-10 space-y-4\">\r\n      <h1 class=\"h3 fw-700\">\r\n       Hi!! \r\n      </h1>\r\n      <p>\r\n        Thank you for contacting us, we will soon be answering your questions.\r\n           </p>\r\n      <div class=\"text-muted text-center my-6\">\r\n      Sent  from Sales System. <br>\r\n      Calle falsa 123, Buenos Aires, Argentina<br>\r\n      </div>\r\n  </div>\r\n</body>";
            email.Body = message;

        }
        public void BuildEmailRecoverPass(string destination, string code)
        {
            email = new MailMessage();
            email.From = new MailAddress("noresponder@ecommerceasp.com");
            email.To.Add(destination);
            email.Subject = "Recover Pass";
            email.IsBodyHtml = true;
            string message = "RECOVER CODE : " + code +  "  Enter the code without the quotes (\"\")."; 
            email.Body = message;


        }
        public void buildEmailAdmin(string destination, string subject, string message)
        {
            email = new MailMessage();
            email.From = new MailAddress("noresponder@ecommerceasp.com");
            email.To.Add(destination);
            email.Subject = subject;
            email.IsBodyHtml = true;
            email.Body = message;

        }
        public void sendEmail()
        {
            try
            {
                server.Send(email);
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }
    }
}
