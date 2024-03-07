using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using AccessBd;
using Domain;
namespace Security
{

    static public class Validation
    {
        public static bool Login(object User)
        {
            Users users = User != null ? (Users)User : null;

            if (users != null && users.Id != 0)
            {
                return true;

            }
            else
            {
                return false;
            }


        }

        public static bool IsAdmin(object User)
        {

            Users users = User != null ? (Users)User : null;
            if (users != null)
            {
                return users.IsAdmin;
            }
            else
            {
                return false;
            }

        }

        public static bool EmailExistence(string email)
        {
            var UAccess = new UsersAccess();
            var listEmails = UAccess.ListEmails();
            foreach (var item in listEmails)
            {
                if (item == email)
                {
                    return true;
                }
            }
            return false;
        }
    }
}
