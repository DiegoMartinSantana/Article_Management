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
        public bool show { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {


            if (!IsPostBack)
            {
                //is not admin
                if (Request.QueryString["id"] != null || Request.QueryString["idShow"] != null)
                {

                    show = false;

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
                    txtImg.ImageUrl = art.UrlImg;
                    txtImg.AlternateText = "Img Article";
                    txtCategory.Text = art.category.Description.ToString();
                    txtBrand.Text = art.brand.Description.ToString();

                }
                else
                {
                    categoryAccess catAccess = new categoryAccess();
                    show = true;
                    txtId.ReadOnly = true;

                    try
                    {
                        List<Category> listCat = new List<Category>();
                        listCat= catAccess.categoryList();
                        ddlCategories.DataSource = listCat;
                        ddlCategories.DataValueField = "Id";
                        ddlCategories.DataTextField = "Description";
                        ddlCategories.DataBind();
                    }
                    catch (Exception ex)
                    {

                        throw ex;
                    }

                }


            }


        }
    }
}