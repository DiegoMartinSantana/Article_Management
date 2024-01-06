using AccessBd;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Domain;
namespace SalesSystem
{
    public partial class Favourites : System.Web.UI.Page
    {

       public List<Article> listArt = new List<Article>();
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {

                ArticleAccess accessArt = new ArticleAccess();
                FavoritesAccess accessFav = new FavoritesAccess();
                Users user= (Users)Session["user"];

                List<Favorites> listFav = accessFav.listFav(user.Id);
                try
                {
                    foreach (Favorites itemFav in listFav)
                    {
                        listArt.Add(accessArt.returnById(itemFav.Id.ToString()));

                    }

                }
                catch (Exception ex)
                {

                    throw ex; 
                }



            }
        }
    }
}