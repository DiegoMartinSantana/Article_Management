using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Domain
{
    public class Article
    {

        public int Id { get; set; }
        public string UrlImg { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public decimal Price { get; set; }

        public string CodArticle { get; set; }

        public Category category { get; set; }
        public Brand brand { get; set; }
    }
}
