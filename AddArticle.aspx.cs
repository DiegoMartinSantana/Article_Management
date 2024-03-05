using AccessBd;
using Domain;
using Security;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace SalesSystem
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!Security.Validation.IsAdmin(Session["user"]))
            {
                Response.Redirect("Login.aspx", false);
            }

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

        }

        protected void btnAddArt_Click(object sender, EventArgs e)
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
                ddlCategories.SelectedIndex = art.category.Id;
                ddlBrands.SelectedIndex = art.brand.Id;
                Response.Redirect("Management.aspx?add=" + 1, false);
            }
            catch (Exception ex)
            {
                Session.Add("error", ex);
                Response.Redirect("error.aspx", false);
            }
        }
    }
}