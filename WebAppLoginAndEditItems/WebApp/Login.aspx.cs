using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApp
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void LogIn(object sender, EventArgs e)
        {
            Console.WriteLine(UserId.Text);
            Console.WriteLine(Password.Text);

            if (!IsValid)
            {
                //バリデーションエラーの場合、処理せず終了。
                return;
            }

            var result = Authentication.IdAndPasswordSignIn(UserId.Text, Password.Text);
            switch (result)
            {
                case 0:
                    break;
                case -1:
                default:
                    break;
                    /*
                    case SignInStatus.Success:
                        break;
                    case SignInStatus.Failure:
                    default:
                        FailureText.Text = "無効なログインです";
                        ErrorMessage.Visible = true;
                        break;
                    */
            }
        }
    }
}