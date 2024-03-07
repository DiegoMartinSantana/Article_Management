using Access;
using AccessBd;
using Domain;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Principal;
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

                if (Request.QueryString["id"] != null || Request.QueryString["idShow"] != null)
                {

                    txtName.ReadOnly = true;
                    txtPrice.ReadOnly = true;
                    txtDescription.ReadOnly = true;
                    txtCategory.ReadOnly = true;
                    txtBrand.ReadOnly = true;
                    txtCodArticle.ReadOnly = true;


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

                    var art = access.listArticle(idreceived)[0]; //only one value returned

                    txtName.Text = art.Name;
                    txtPrice.Text = art.Price.ToString();
                    txtDescription.Text = art.Description;
                    if (!string.IsNullOrEmpty(art.UrlImg))
                    {

                        txtImg.ImageUrl = Security.Helper.UrlLocal(art.UrlImg);

                    }
                    else
                    {
                        txtImg.ImageUrl = "https://i.pinimg.com/originals/97/ea/a6/97eaa682491355a6c6b2ad3c7f086a3a.jpg";
                    }

                    txtCategory.Text = art.category.Description.ToString();
                    txtBrand.Text = art.brand.Description.ToString();
                    txtCodArticle.Text = art.CodArticle;

                }

            }
        }
        protected void btnDelete_Click(object sender, EventArgs e)
        {
            btnCancelDelete.Visible = true;
            btnConfirm.Visible = true;

        }


        protected void btnEdit_Click(object sender, EventArgs e)
        {
            int idart;
            if (Request.QueryString["idShow"] != null)
            {
                idart = int.Parse(Request.QueryString["idShow"].ToString());
            }
            else
            {
                idart = int.Parse(Request.QueryString["id"].ToString());
            }
            Response.Redirect("EditArticle.aspx?id=" + idart, false);


        }

        protected void btnConfirm_Click(object sender, EventArgs e)
        {
            ArticleAccess access = new ArticleAccess();
            int id;
            if (Request.QueryString["id"] != null)
            {
                id = int.Parse(Request.QueryString["id"]);
            }
            else
            {
                id = int.Parse(Request.QueryString["idShow"].ToString());
            }

            try
            {
                access.deleteArticle(id);

            }
            catch (Exception ex)
            {

                Session.Add("error", ex);
                Response.Redirect("Error.aspx", false);
            }

            Response.Redirect("Management.aspx");
        }

        protected void btnCancelDelete_Click(object sender, EventArgs e)
        {
            btnCancelDelete.Visible = false;
            btnConfirm.Visible = false;
        }
    }
}