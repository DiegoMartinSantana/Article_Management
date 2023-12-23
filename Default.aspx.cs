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
           ArticleAccess access = new ArticleAccess();
            list = access.listArticle();


        }
    }
}