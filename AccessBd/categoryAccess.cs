using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Access;
using Domain;
namespace AccessBd
{
    public class categoryAccess
    {
        public List<Category> categoryList()
        {
            List<Category> list = new List<Category>();

            BdAccess access = new BdAccess();

            try
            {
                access.setConsultation("select Id,Descripcion from Categorias");
                access.executeRead();

                while (access.reader.Read())
                {
                    Category cat = new Category();

                    cat.Id = (int)access.reader["Id"];
                    cat.Description = (string)access.reader["Descripcion"];
                    list.Add(cat);


                }
                return list;
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
