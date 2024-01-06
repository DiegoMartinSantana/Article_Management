using Access;
using Domain;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AccessBd
{
    public class brandAccess
    {
        public List<Brand> brandList()
        {
            List<Brand> list = new List<Brand>();

            BdAccess access = new BdAccess();

            try
            {
                access.setConsultation("select Id,Descripcion from Marcas");
                access.executeRead();

                while (access.reader.Read())
                {
                    Brand brand = new Brand();

                    brand.Id = (int)access.reader["Id"];
                    brand.Description = (string)access.reader["Descripcion"];
                    list.Add(brand);


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
