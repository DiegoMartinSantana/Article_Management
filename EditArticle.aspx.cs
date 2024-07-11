using AccessBd;
using Domain;
using Security;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SalesSystem
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {


            if (!Security.Validation.IsAdmin(Session["user"]))
            {
                Response.Redirect("Login.aspx", false);
            }

            if (!IsPostBack)
            {

                if (Request.QueryString["id"] != null)
                {

                    try
                    {
                        ddlCategories.DataSource = Helper.Categories();
                        ddlCategories.DataValueField = "Id";
                        ddlCategories.DataTextField = "Description";
                        ddlCategories.DataBind();

                        ddlBrands.DataSource = Helper.Brands();
                        ddlBrands.DataValueField = "Id";
                        ddlBrands.DataTextField = "Description";
                        ddlBrands.DataBind();
                    }
                    catch (Exception ex)
                    {
                        Session.Add("error", ex);
                        Response.Redirect("error.aspx", false);
                    }

                    ArticleAccess access = new ArticleAccess();

                    var idreceived = Request.QueryString["id"] != null ? Request.QueryString["id"].ToString() : "";


                    var art = access.listArticle(idreceived)[0]; //only one value returned
                    txtCurrentCat.Text = art.category.Description;
                    txtCurrentBrand.Text = art.brand.Description;
                    txtCodArticle.Text = art.CodArticle;
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
                }
                else
                {
                    Session.Add("error", "Denegate Access");
                    Response.Redirect("Error.aspx", false);
                }
            }
        }
        protected void btnSaveChanges_Click(object sender, EventArgs e)
        {
            Page.Validate();
            if (!Page.IsValid)
            {
                return;
            }
            ArticleAccess access = new ArticleAccess();
            Article art = new Article();
            try
            {

                art.Description = txtDescription.Text;
                art.Price = decimal.Parse(txtPrice.Text.ToString());
                art.CodArticle = txtCodArticle.Text;
                art.Name = txtName.Text;
                art.category = new Category();
                var idreceived = Request.QueryString["id"] != null ? Request.QueryString["id"].ToString() : "";
                var art2 = access.listArticle(idreceived)[0];
                if (divNewCat.Visible)
                {
                    art.category.Id = int.Parse(ddlCategories.SelectedValue.ToString());
                    art.category.Description = ddlCategories.Text;
                }
                else
                {
                    art.category.Id = art2.category.Id;
                    art.category.Description = art2.category.Description;
                }

                art.brand = new Brand();
                if (divNewBrand.Visible)
                {
                    art.brand.Id = int.Parse(ddlBrands.SelectedValue.ToString());
                    art.brand.Description = ddlBrands.Text;
                }
                else
                {
                    art.brand.Id = art2.brand.Id;
                    art.brand.Description = art2.brand.Description;
                }

                var idart = int.Parse(Request.QueryString["id"].ToString());

                art.Id = idart;

                if (!string.IsNullOrEmpty(fileArticle.PostedFile.FileName))
                {
                    string route = Server.MapPath("./Images/Imgs_Art/");

                    fileArticle.PostedFile.SaveAs(route + "ArtCod_" + idart + ".jpg");
                    art.UrlImg = "ArtCod_" + idart + ".jpg";
                }
                else if (!string.IsNullOrEmpty(txtUrl2.Text))
                {
                    art.UrlImg = txtUrl2.Text;
                }
                else
                {
                    art.UrlImg = txtImg2.ImageUrl.ToString();

                }
               
                access.editArticle(art);

                Response.Redirect("Management.aspx", false);
            }
            catch (Exception ex)
            {
                Session.Add("error", ex);
                Response.Redirect("Error.aspx", false);
            }

        }

        protected void btnEditCat_Click(object sender, EventArgs e)
        {
            divNewCat.Visible = !divNewCat.Visible;
        }

        protected void btnEditBrand_Click(object sender, EventArgs e)
        {
            divNewBrand.Visible = !divNewBrand.Visible;
        }
    }
}
