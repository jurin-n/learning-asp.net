﻿using System;

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
                    //認証成功した場合
                    Session["UserId"] = UserId.Text;
                    Response.Redirect("Item.aspx");
                    break;
                case -1:
                default:
                    //認証失敗した場合
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