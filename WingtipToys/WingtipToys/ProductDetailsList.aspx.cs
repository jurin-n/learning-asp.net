using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WingtipToys.Models;

namespace WingtipToys
{
    public partial class ProductDetailList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        public List<ProductDetails> GetProductDetailsList() {
            string sql = " SELECT "
                        + "    p.ProductID "
                        + "  , p.ProductName "
                        + "  , p.Description ProductDescription "
                        + "  , p.ImagePath "
                        + "  , p.UnitPrice "
                        + "  , p.CategoryID "
                        + "  , c.CategoryName "
                        + "  , c.Description CategoryDescription "
                        + " FROM Products p "
                        + "  INNER JOIN Categories c "
                        + " ON p.CategoryID = c.CategoryID";

            List<ProductDetails> productDetailsList;
            using (var context = new ProductContext())
            {
                productDetailsList = context.Database.SqlQuery<ProductDetails>(sql).ToList();
            }
            return productDetailsList;
        }
    }
}