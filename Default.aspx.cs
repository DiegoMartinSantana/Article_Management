using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Domain;
using Access;
using AccessBd;
namespace SalesSystem
{
    public partial class _Default : Page
    {
        //the list has to be a property of the page to be accessed from the aspx
        public List<Article> list {get;set;}

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ArticleAccess access = new ArticleAccess();
                list = access.listArticle();
                Session.Add("listarticle", list);
            }
        }

        protected void txtsearch_TextChanged(object sender, EventArgs e)
        {
             list = (List <Article>)Session["listarticle"];
            list = list.FindAll(x => x.Name.ToUpper().Contains(txtsearch.Text.ToUpper()) || 
            x.Description.ToUpper().Contains(txtsearch.Text.ToUpper()));


        }

        protected void ddlby_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlcritery.Items.Clear();

            if (ddlby.SelectedItem.ToString() == "Price ")
            {
                ddlcritery.Items.Add("Less than : ");
                ddlcritery.Items.Add("Equals to : ");
                ddlcritery.Items.Add("More than : ");

            }
            else
            {
                ddlcritery.Items.Add("Starts with : ");
                ddlcritery.Items.Add("Ends with : ");
                ddlcritery.Items.Add("Contains  : ");


            }

        }
    }
}