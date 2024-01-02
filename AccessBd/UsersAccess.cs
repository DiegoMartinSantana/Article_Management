using Access;
using Domain;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Policy;
using System.Text;
using System.Threading.Tasks;

namespace AccessBd
{
    public class UsersAccess
    {
        public int insert(Users user)
        {
            BdAccess access = new BdAccess();
            try
            {
                access.setConsultation("insert into USERS (email,pass,apellido,nombre,admin,urlImagenPerfil) output inserted.Id VALUES ( @Email,@Pass,@Apellido,@Nombre,@Admin,@Url)" );
                access.setParameter("@Email", user.Email);
                access.setParameter("@Pass", user.Password);
                access.setParameter("@Apellido", (object)user.Surname ?? DBNull.Value);
                access.setParameter("@Nombre", (object)user.Name ?? DBNull.Value);
                access.setParameter("@Url", (object)user.UrlImgProfile ?? DBNull.Value);
                access.setParameter("@Admin", false);

                //returned id (add execute scalar)

                return access.executeScalar();
            }
            catch (Exception ex)
            {

                throw ex;
            }
            finally
            {
                access.close();
            }


        }
       public  bool validate(Users user)
        {
            BdAccess access = new BdAccess();

            try
            {

                access.setConsultation("Select Id,email,pass,nombre,apellido,urlImagenPerfil,admin from USERS where email= @Email and pass= @Pass");

                access.setParameter("@Email", user.Email);
                access.setParameter("@Pass", user.Password);


                access.executeRead();

                if (access.reader.Read())
                {
                    user.Id = (int)access.reader["Id"];
                    if(!(access.reader["apellido"] is DBNull))
                        user.Surname = (string)access.reader["apellido"];
                    
                    if (!(access.reader["nombre"] is DBNull))
                        user.Name = (string)access.reader["nombre"];

                    if (!(access.reader["urlImagenPerfil"] is DBNull))
                        user.UrlImgProfile = (string)access.reader["urlImagenPerfil"];
                    
                    
                    user.IsAdmin = (bool)access.reader["admin"];

                    user.Password = (string)access.reader["pass"];
                    
                        user.Email = (string)access.reader["email"];
                    return true;
                }
                return false;
            }
            catch (Exception ex)
            {

                throw ex;
            }
            finally
            {
                access.close();
            }

        }
    }
}
