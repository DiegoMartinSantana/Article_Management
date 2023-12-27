using Access;
using Domain;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http.Headers;
using System.Reflection.Emit;
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
                    a.Id = (int)data.reader["Idart"];
                    a.Name = (string)data.reader["Nombre"];
                    a.Price = (decimal)data.reader["Precio"];

                    a.category = new Category();
                    a.brand = new Brand();
                    a.brand.Id = (int)data.reader["IdMarca"];
                    a.brand.Description = (string)data.reader["DescMarca"];

                    a.category.Id = (int)data.reader["IdCategoria"];

                    a.category.Description = (string)data.reader["CatDesc"];

                    a.CodArticle = (string)data.reader["Codigo"];
                    a.Description = (string)data.reader["artDesc"];
                    if (!(data.reader["ImagenUrl"] is DBNull))
                    {
                        a.UrlImg = (string)data.reader["ImagenUrl"];
                    }

                    list.Add(a);

                }
                data.close();

                return list;
            }
            catch (Exception ex)
            {

                throw ex;
            }
            finally
            {
                data.close();
            }
        }

        public List<Article> filter(string by, string critery, string filter)
        {
            List<Article> list = new List<Article>();
            BdAccess access = new BdAccess();

            try
            {
                string query = "Select  A.Id Idar, A.Codigo, Nombre, A.Descripcion ArtDesc, IdMarca  ,IdCategoria , ImagenURL ,Precio, C.Descripcion Catdesc , M.Descripcion Marcadesc From ARTICULOS A , CATEGORIAS C , MARCAS M Where A.IdMarca = M.Id and C.Id = IdCategoria and ";
              
                if (by == "Price")
                {
                    switch (critery)
                    {

                        case "Less than : ":
                            query += "Precio < " + filter;
                            break;
                        case "Equals to : ":
                            query += "Precio = " + filter;

                            break;
                        case "More than : ":
                            query += "Precio > " + filter;

                            break;

                    }
                }

                if (by == "Brand")
                {
                    switch (critery)
                    {
                        case "Starts with : ":
                            query += "Marcadesc like '" + filter + "%'"; 

                            break;
                        case "Ends with :  ":
                            query += "Marcadesc like '%" + filter + "'";

                            break;
                        case "Contains  :  ":
                            query += "Marcadesc like '%" + filter + "%'";


                            break;

                    }
                }
                if (by == "Category")
                {
                    switch (critery)
                    {
                        case "Starts with : ":
                            query += "Catdesc like '" + filter + "%'";

                            break;
                        case "Ends with :  ":
                            query += "Catdesc like '%"+filter +"'";

                            break;
                        case "Contains  :  ":
                            query += "Catdesc like '%"+filter +"%'";

                            break;

                    }
                }

                access.setConsultation(query);
                access.executeRead();

                while (access.reader.Read())
                {
                Article a = new Article();

                    a.Id = (int)access.reader["Idar"];
                    a.Name = (string)access.reader["Nombre"];
                    a.Price = (decimal)access.reader["Precio"];

                    a.category = new Category();
                    a.brand = new Brand();
                    a.brand.Id = (int)access.reader["IdMarca"];
                    a.brand.Description = (string)access.reader["Marcadesc"];

                    a.category.Id = (int)access.reader["IdCategoria"];

                    a.category.Description = (string)access.reader["CatDesc"];

                    a.CodArticle = (string)access.reader["Codigo"];
                    a.Description = (string)access.reader["ArtDesc"];
                    if (!(access.reader["ImagenURL"] is DBNull))
                    {
                        a.UrlImg = (string)access.reader["ImagenURL"];
                    }
                    list.Add(a);
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
