using Access;
using Domain;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AccessBd
{
    public class ArticleAccess
    {
        public List<Article> listArticle()
        {
			BdAccess data = new BdAccess();
			List<Article> list = new List<Article>();
            //I bring everything and then I use what I want
            try
            {
                data.setConsultation("select  A.Codigo, Nombre, A.Descripcion artDesc, M.Descripcion DescMarca,C.Descripcion Catdesc,ImagenUrl,Precio , A.Id Idart, IdCategoria,IdMarca from ARTICULOS A, MARCAS M, CATEGORIAS C where M.Id=A.IdMarca and C.Id= A.IdCategoria");
                data.executeRead();

                while (data.reader.Read())
                {
                    Article a = new Article();
                    a.Id=(int)data.reader["Idart"];
                    a.Name = (string)data.reader["Nombre"];
                    a.Price =(decimal)data.reader["Precio"];

                    a.category = new Category();
                    a.brand = new Brand();
                    a.brand.Id = (int)data.reader["IdMarca"];
                    a.brand.Description = (string)data.reader["DescMarca"];

                    a.category.Id  = (int)data.reader["IdCategoria"];

                    a.category.Description = (string)data.reader["CatDesc"];

                    a.CodArticle = (string)data.reader["Codigo"];
                    a.Description= (string)data.reader["artDesc"];
                    if (!(data.reader["ImagenUrl"] is DBNull))
                    {
                        a.UrlImg = (string)data.reader["ImagenUrl"];
                    }

                    list.Add(a);

                }
                data.close();

                return list;
            }
			catch (Exception ex )
			{

				throw ex;
            }
            finally
            {
                data.close();
            }
        }


    }
}
