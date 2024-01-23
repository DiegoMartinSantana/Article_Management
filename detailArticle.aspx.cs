using Access;
using AccessBd;
using Domain;
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
            if (!Security.Validation.Login(Session["user"]))
            {
                Response.Redirect("Login.aspx");
            }

            if (!IsPostBack)
            {

                //is not admin
                if (Request.QueryString["id"] != null || Request.QueryString["idShow"] != null)
                {

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
                    if (!string.IsNullOrEmpty(art.UrlImg))
                    {
                        txtImg2.ImageUrl = Security.Helper.UrlLocal(art.UrlImg);

                    }
                    else
                    {
                        txtImg2.ImageUrl = "https://i.pinimg.com/originals/97/ea/a6/97eaa682491355a6c6b2ad3c7f086a3a.jpg";
                    }
                    txtImg2.AlternateText = "Img Article";
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
                        Session.Add("error", ex);
                        Response.Redirect("error.aspx", false);
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


                //create de route "automatically" 
                //mappath = route of pokedexweb 

                //I get the last id and add 1
                Article lastArt;
                try
                {
                    lastArt = accessArt.listArticle().Last(); //with Linq
                }
                catch (Exception ex)
                {
                    throw ex;
                }
                int idSend = lastArt.Id + 1;
                if (!string.IsNullOrEmpty(fileArticle.PostedFile.FileName))
                {
                    string route = Server.MapPath("./Images/Imgs_Art/");
                    fileArticle.PostedFile.SaveAs(route + "ArtCod_" + idSend + ".jpg");
                    art.UrlImg = "ArtCod_" + idSend + ".jpg";
                }

                try
                {
                    accessArt.addArticle(art);
                }
                catch (Exception ex)
                {
                    Session.Add("error", ex);
                    Response.Redirect("error.aspx", false);
                }
                Response.Redirect("Management.aspx?add=" + 1, false);
            }
            catch (Exception ex)
            {
                Session.Add("error", ex);
                Response.Redirect("error.aspx", false);
            }




        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            show = false;
            showChanges = true;
            txtName.ReadOnly = false;
            txtPrice.ReadOnly = false;
            txtDescription.ReadOnly = false;
            txtCategory.ReadOnly = false;
            txtBrand.ReadOnly = false;
            txtCodArticle.ReadOnly = false;
            fileArticle2.Visible = true;
            divUploadUrl.Visible = true;
            categoryAccess catAccess = new categoryAccess();
            brandAccess brandAccess = new brandAccess();

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
                Session.Add("error", ex);
                Response.Redirect("error.aspx", false);
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

                int idart = int.Parse(Request.QueryString["id"]);
                art.Id = idart;

                if (!string.IsNullOrEmpty(fileArticle2.PostedFile.FileName))
                {
                    string route = Server.MapPath("./Images/Imgs_Art/");

                    fileArticle2.PostedFile.SaveAs(route + "Art_" + idart + ".jpg");
                    art.UrlImg = "Art_" + idart + ".jpg";
                }
                else if (!string.IsNullOrEmpty(txtUrl2.Text))
                {
                    art.UrlImg = txtUrl2.Text;
                }

                access.editArticle(art);

                Response.Redirect("detail.Article.aspx", false);
            }
            catch (Exception ex)
            {
                Session.Add("error", ex);
                Response.Redirect("error.aspx", false);
            }
        }
    }
}