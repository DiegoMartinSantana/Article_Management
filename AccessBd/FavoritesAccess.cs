using Access;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Domain;
using System.Runtime.InteropServices.WindowsRuntime;
using System.Runtime.Remoting.Messaging;
namespace AccessBd
{
    public  class FavoritesAccess
    {
        public void DeleteArticle(int id)
        {
            var access = new BdAccess();
            try
            {
                access.setConsultation("delete from favoritos where IdArticulo = @idart");
                access.setParameter("idart", id);
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

        public void Delete(int idUser, int idDelete)
        { 
            BdAccess bdAccess = new BdAccess();

            try
            {
                // delete From FAVORITOS where IdArticulo = 13 and IdUser = 2

                bdAccess.setConsultation("Delete from Favoritos where IdArticulo =  @IdArt and IdUser =  @IdU");
                bdAccess.setParameter("IdU", idUser);
                bdAccess.setParameter("@IdArt", idDelete);
                bdAccess.executeAccion();
        
            }
            catch (Exception ex)
            {
                throw ex;

            }
            finally {
                bdAccess.close();
            }
        }
    }
}
