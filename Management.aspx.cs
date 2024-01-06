using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AccessBd;
using Domain;
namespace SalesSystem
{
    public partial class Management : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ArticleAccess access = new ArticleAccess();
            if (!IsPostBack)
            {
                

                dvgArticles.DataSource = access.listArticle();
                dvgArticles.DataBind();
            }
        }

        protected void dvgArticles_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            dvgArticles.PageIndex = e.NewPageIndex;
            dvgArticles.DataBind();
        }

        protected void dvgArticles_SelectedIndexChanged(object sender, EventArgs e)
        {
            string article = dvgArticles.SelectedDataKey.Value.ToString();
            Response.Redirect("detailArticle.aspx?id=" + article);



        }

        protected void btnAddArticle_Click(object sender, EventArgs e)
        {
            Response.Redirect("detailArticle.aspx", false);

        }

        
    }
}