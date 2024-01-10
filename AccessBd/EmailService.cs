using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
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
        public void buildEmail(string destination, string subject,  string message)
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
