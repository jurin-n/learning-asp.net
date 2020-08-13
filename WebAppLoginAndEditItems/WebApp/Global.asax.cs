using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Routing;
using System.Web.Security;
using System.Web.SessionState;

namespace WebApp
{
    public class Global : System.Web.HttpApplication
    {
        protected void Application_Start(object sender, EventArgs e)
        {
            RouteTable.Routes.MapPageRoute(
                 "orderPage"
                ,"orders"
                ,"~/Views/Order.aspx"
                );
            RouteTable.Routes.MapPageRoute(
                 "orderPage2"
                , "orders/{orderId}"
                , "~/Views/Order.aspx"
                );

            RouteTable.Routes.MapPageRoute(
                 "loginPage"
                , "login"
                , "~/Views/Login.aspx"
                );

            RouteTable.Routes.MapPageRoute(
                 "itemPage"
                , "items"
                , "~/Views/Item.aspx"
                );
            RouteTable.Routes.MapPageRoute(
                 "itemPage2"
                , "items/{itemId}"
                , "~/Views/Item.aspx"
                );
        }
    }
}