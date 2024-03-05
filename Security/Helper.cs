using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Domain;
using AccessBd;

namespace Security
{
    public static class Helper
    {

        public static string UrlLocal(string url)
        {

            if (url != null && url.Contains("ArtCod_"))
            {
                string url2 = "~/Images/Imgs_Art/" + url;
                return url2;
            }
            else if (url == null)
            {
                string urlDefault = "https://i.pinimg.com/originals/97/ea/a6/97eaa682491355a6c6b2ad3c7f086a3a.jpg";
                return urlDefault;
            }
            return url;
        }

        public  static List<Category> Categories()
        {
            var catAccess = new categoryAccess();
            var listCat = new List<Category>();
            listCat = catAccess.categoryList();
            return listCat;

        }
        public static List<Brand> Brands()
        {   
            var brandAccess = new brandAccess();
            var listBrand = new List<Brand>();
            listBrand = brandAccess.brandList();
            return listBrand;
        }

    }
}
