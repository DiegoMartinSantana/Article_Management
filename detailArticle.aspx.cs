using Access;
using AccessBd;
using Domain;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SalesSystem
{
    public partial class detailArticle : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
            
                //is not admin
                txtId.ReadOnly = true;
                txtName.ReadOnly = true;
                txtPrice.ReadOnly = true;
                txtDescription.ReadOnly = true;
                txtCategory.ReadOnly = true;
                txtBrand.ReadOnly = true;

                Article art = new Article();

                string idreceived = Request.QueryString["idShow"] != null ? Request.QueryString["idShow"].ToString() : "";
                ArticleAccess access = new ArticleAccess();

                art = access.listArticle(idreceived)[0]; //only one value returned

                txtId.Text = art.Id.ToString();
                txtName.Text = art.Name;
                txtPrice.Text = art.Price.ToString();
                txtDescription.Text = art.Description;
                txtImg.ImageUrl= art.UrlImg;
                txtImg.AlternateText = "Img Article";
                txtCategory.Text = art.category.Description.ToString();
                txtBrand.Text = art.brand.Description.ToString();



            
        }
    }
}