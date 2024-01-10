using Access;
using AccessBd;
using Domain;
using Security;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;

namespace SalesSystem
{
    public partial class detailArticle : System.Web.UI.Page
    {
        public bool show { get; set; }
        public bool showChanges { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Validation.Login(Session["user"]))
            {
                Response.Redirect("Login.aspx");
            }

            if (!IsPostBack)
            {

                //is not admin
                if (Request.QueryString["id"] != null || Request.QueryString["idShow"] != null)
                {

                    show = false;

                    txtName.ReadOnly = true;
                    txtPrice.ReadOnly = true;
                    txtDescription.ReadOnly = true;
                    txtCategory.ReadOnly = true;
                    txtBrand.ReadOnly = true;
                    txtCodArticle.ReadOnly = true;
                    Article art = new Article();

                    string idreceived;
                    if (Request.QueryString["id"] == null)
                    {
                        idreceived = Request.QueryString["idShow"] != null ? Request.QueryString["idShow"].ToString() : "";
                    }
                    else
                    {
                        idreceived = Request.QueryString["id"] != null ? Request.QueryString["id"].ToString() : "";
                    }

                    ArticleAccess access = new ArticleAccess();

                    art = access.listArticle(idreceived)[0]; //only one value returned

                    txtName.Text = art.Name;
                    txtPrice.Text = art.Price.ToString();
                    txtDescription.Text = art.Description;
                    txtImg.ImageUrl = art.UrlImg;
                    txtImg.AlternateText = "Img Article";
                    txtCategory.Text = art.category.Description.ToString();
                    txtBrand.Text = art.brand.Description.ToString();
                    txtCodArticle.Text = art.CodArticle;
                }
                else
                {

                    txtName.ReadOnly = false;
                    txtPrice.ReadOnly = false;
                    txtDescription.ReadOnly = false;
                    txtCategory.ReadOnly = false;
                    txtBrand.ReadOnly = false;
                    txtCodArticle.ReadOnly = false;
                    categoryAccess catAccess = new categoryAccess();
                    brandAccess brandAccess = new brandAccess();
                    show = true;

                    try
                    {
                        List<Category> listCat = new List<Category>();
                        listCat = catAccess.categoryList();
                        ddlCategories.DataSource = listCat;
                        ddlCategories.DataValueField = "Id";
                        ddlCategories.DataTextField = "Description";
                        ddlCategories.DataBind();
                        List<Brand> listBrand = new List<Brand>();
                        listBrand = brandAccess.brandList();
                        ddlBrands.DataSource = listBrand;
                        ddlBrands.DataValueField = "Id";
                        ddlBrands.DataTextField = "Description";
                        ddlBrands.DataBind();

                    }
                    catch (Exception ex)
                    {

                        throw ex;
                    }

                }


            }
           
            

        }

        protected void btnsaveArticle_Click(object sender, EventArgs e)
        {
            ArticleAccess accessArt = new ArticleAccess();
            var art = new Article();


            try
            {
                art.Description = txtDescription.Text;
                art.Price = decimal.Parse(txtPrice.Text);
                art.CodArticle = txtCodArticle.Text;
                art.Name = txtName.Text;
                art.brand = new Brand();
                art.brand.Id = int.Parse(ddlBrands.SelectedValue);
                art.category = new Category();
                art.category.Id = int.Parse(ddlCategories.SelectedValue);
                accessArt.addArticle(art);
                Response.Redirect("detailArticle.aspx", false);
            }
            catch (Exception ex)
            {

                throw ex;
            }




        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            showChanges = true;
            txtName.ReadOnly = false;
            txtPrice.ReadOnly = false;
            txtDescription.ReadOnly = false;
            txtCategory.ReadOnly = false;
            txtBrand.ReadOnly = false;
            txtCodArticle.ReadOnly = false;
            categoryAccess catAccess = new categoryAccess();
            brandAccess brandAccess = new brandAccess();
            show = true;

            try
            {
                List<Category> listCat = new List<Category>();
                listCat = catAccess.categoryList();
                ddlCategories.DataSource = listCat;
                ddlCategories.DataValueField = "Id";
                ddlCategories.DataTextField = "Description";
                ddlCategories.DataBind();
                List<Brand> listBrand = new List<Brand>();
                listBrand = brandAccess.brandList();
                ddlBrands.DataSource = listBrand;
                ddlBrands.DataValueField = "Id";
                ddlBrands.DataTextField = "Description";
                ddlBrands.DataBind();

            }
            catch (Exception ex)
            {

                throw ex;
            }

        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            ArticleAccess access = new ArticleAccess();
            access.deleteArticle(int.Parse(Request.QueryString["id"].ToString()));

            Response.Redirect("Management.aspx");

        }

        protected void btnSaveChanges_Click(object sender, EventArgs e)
        {

            ArticleAccess access = new ArticleAccess();
            Article art = new Article();

            art.Description = txtDescription.Text;
            art.Price = decimal.Parse(txtPrice.Text);
            art.CodArticle = txtCodArticle.Text;
            art.Name = txtName.Text;
            art.brand = new Brand();
            art.brand.Id = int.Parse(ddlBrands.SelectedValue);
            art.category = new Category();
            art.category.Id = int.Parse(ddlCategories.SelectedValue);
            access.editArticle(art);

            Response.Redirect("detail.Article.aspx");
        }
    }
}