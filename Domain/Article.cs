using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Domain
{
    public class Article
    {
        public string UrlImg { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public float Price { get; set; }

        public int CodeArticle { get; set; }
        public int IdCategory { get; set; }
        public int IdBrand { get; set; }
    }
}
