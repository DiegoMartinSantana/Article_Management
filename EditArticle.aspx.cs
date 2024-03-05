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
                  Response.Redirect("Login.aspx",false);
              }
           


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
                txtCodArticle.Text = art.CodArticle;
                ddlCategories.SelectedIndex = art.category.Id;
                ddlBrands.SelectedIndex = art.brand.Id;

               
            }
            else
            {
                Session.Add("error", "Denegate Access");
                Response.Redirect("Error.aspx", false);
            }

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
               

               var idart = int.Parse(Request.QueryString["id"].ToString());

                art.Id = idart;

                if (!string.IsNullOrEmpty(fileArticle.PostedFile.FileName))
                {
                    string route = Server.MapPath("./Images/Imgs_Art/");

                    fileArticle.PostedFile.SaveAs(route + "Art_" + idart + ".jpg");
                    art.UrlImg = "Art_" + idart + ".jpg";
                }
                else if (!string.IsNullOrEmpty(txtUrl2.Text))
                {
                    art.UrlImg = txtImg2.ImageUrl;
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
    }
}
