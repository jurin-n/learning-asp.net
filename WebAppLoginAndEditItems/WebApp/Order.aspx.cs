using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApp.Models;

namespace WebApp
{
    public partial class Order : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public IEnumerable<WebApp.Models.Item> GetItems()
        {
            return new List<WebApp.Models.Item>() {
                new WebApp.Models.Item("ID001"),
                new WebApp.Models.Item("ID002"),
                new WebApp.Models.Item("ID003"),
                new WebApp.Models.Item("ID004"),
                new WebApp.Models.Item("ID005")
            };
        }
    }
}