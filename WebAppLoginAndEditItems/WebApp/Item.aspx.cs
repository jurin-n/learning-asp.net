using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApp
{
    public partial class Item : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void AddOrEdit(object sender, EventArgs e)
        {
            Console.WriteLine(ItemId.Text);
            Console.WriteLine(ItemName.Text);
            Console.WriteLine(Description.Text);
        }
    }
}