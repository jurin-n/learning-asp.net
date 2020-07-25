using System;

namespace WebApp.Messages
{
    public partial class SuccessMessage : System.Web.UI.UserControl
    {
        public String Action { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            Action = "登録";
        }
    }
}