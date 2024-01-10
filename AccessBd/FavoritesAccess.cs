using Access;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Domain;
using System.Runtime.InteropServices.WindowsRuntime;
namespace AccessBd
{
    public  class FavoritesAccess
    {
        public bool IsFavorite(int idUser, int idArticle)
        {
            BdAccess access = new BdAccess();
            try
            {
                access.setConsultation("select IdArticulo from FAVORITOS where  Iduser=@iduser and IdArticulo = @idart");
                access.setParameter("iduser", idUser);
                access.setParameter("idart", idArticle);

                access.executeRead();
                return access.reader.Read(); //Read is 

            }
            catch (Exception ex )
            {

                throw ex;
            }


            //si la lectura es != null es porque existe

        }
        public void AddFavorite(int idUser,int idArticle)
        {
            BdAccess access = new BdAccess();
            try
            {
                access.setConsultation(" insert into favoritos (IdUser,IdArticulo ) values (@iduser,@idart)");
                access.setParameter("iduser", idUser);
                access.setParameter("idart", idArticle);
                access.executeAccion();

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
        public List <Favorites> listFav(int iduser)
        {
            BdAccess access = new BdAccess();

            try
            {

                access.setConsultation("select IdArticulo from FAVORITOS where  Iduser=@iduser ");
                access.setParameter("iduser", iduser);
                access.executeRead();

                List<Favorites> listfav = new List<Favorites>();


                while (access.reader.Read())
                {
                    var fav = new Favorites();
                    fav.IdUser = iduser;
                    fav.IdArticle = int.Parse(access.reader["IdArticulo"].ToString());

                    listfav.Add(fav);

                }
                return listfav;

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
