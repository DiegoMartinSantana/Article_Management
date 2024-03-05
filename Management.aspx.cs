using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AccessBd;
using Domain;
using Security;
namespace SalesSystem
{
    public partial class Management : System.Web.UI.Page
    {
        public bool a { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!Validation.IsAdmin(Session["user"]))
            {
                Response.Redirect("Login.aspx");
            }
            ArticleAccess access = new ArticleAccess();
            var list = access.listArticle();
            Session.Add("listarticle", list);
            dvgArticles.DataSource = list;
            dvgArticles.DataBind();
            if (!IsPostBack)
            {
                divInformation.Visible = false;
            }

        }

        protected void dvgArticles_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            dvgArticles.PageIndex = e.NewPageIndex;
            dvgArticles.DataSource = Session["listArticle"];
            dvgArticles.DataBind();
        }

        protected void dvgArticles_SelectedIndexChanged(object sender, EventArgs e)
        {
            string article = dvgArticles.SelectedDataKey.Value.ToString();
            Response.Redirect("detailArticle.aspx?id=" + article, false);

        }

        protected void btnAddArticle_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddArticle.aspx", false);

        }

        protected void btnHorWork_Click(object sender, EventArgs e)
        {
            divInformation.Visible=!divInformation.Visible; //every time I click I set the opposite of how this is
        }
    }
}