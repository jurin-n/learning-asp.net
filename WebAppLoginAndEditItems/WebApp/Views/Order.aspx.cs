using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Transactions;
using System.Web;
using System.Web.ModelBinding;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApp.Models;

namespace WebApp.Views
{
    public partial class Order : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                //submitボタン押すなどしPOSTした場合、処理せず終了
                return;
            }

            if (Request.QueryString["Id"] == null)
            {
                //クエリにIdが含まれてない場合、処理せず終了
                return;
            }

            /* 更新用画面として表示するための処理 */
            //更新データ初期表示
            using (SqlConnection conn = new SqlConnection(DbHelper.getConnectionString()))
            {
                String sql = "SELECT OrderId FROM Orders WHERE OrderId=@OrderId";
                conn.Open();
                using (SqlCommand command = new SqlCommand(sql))
                {
                    command.Parameters.AddWithValue("@OrderId", Request.QueryString["Id"]);

                    command.Connection = conn;
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        reader.Read();
                        OrderId.Text = (String)reader["OrderId"];
                    }
                }
            }

            //コントロール設定
            OrderId.ReadOnly = true;
            AddOrUpdateButton.Text = "更新";
        }

        public IEnumerable<WebApp.Models.Item> GetItems([QueryString("Id")] string orderId)
        {
            if(orderId == null || orderId.Trim()=="")
            {
                return new List<Models.Item>() {
                    new Models.Item(1,"","","",""),
                    new Models.Item(2,"","","",""),
                    new Models.Item(3,"","","",""),
                    new Models.Item(4,"","","",""),
                    new Models.Item(5,"","","","")
                };
            }

            /* 更新用画面として表示するための処理 */
            //更新データ初期表示
            var list = new List<Models.Item>();
            using (SqlConnection conn = new SqlConnection(DbHelper.getConnectionString()))
            {
                conn.Open();

                String sqlForList = @"
                    SELECT
                        T1.OrderID
                        ,T1.No
                        ,T1.ItemID
                        ,(CASE WHEN T2.Name IS NULL THEN '' ELSE T2.Name END) AS NAME
                        ,(CASE WHEN T2.Description IS NULL THEN '' ELSE T2.Description END) AS Description
                        ,(CASE WHEN T2.Type IS NULL THEN 'NVARCHAR' ELSE T2.Type END) AS Type
                    FROM Orders_Items T1 LEFT JOIN Items T2
                    ON T1.ItemID = T2.ItemID
                    WHERE T1.OrderId = @OrderId ORDER BY T1.No
                ";
                using (SqlCommand command = new SqlCommand(sqlForList))
                {
                    command.Parameters.AddWithValue("@OrderId", orderId);

                    command.Connection = conn;
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            list.Add(
                                new Models.Item(
                                    (int)reader["No"]
                                   ,(String)reader["ItemID"]
                                   ,(String)reader["Name"]
                                   ,(String)reader["Description"]
                                   ,(String)reader["Type"]
                                )
                            );
                        }
                    }
                }
            }
            return list;
        }

        public String getSelected(String value, String currentValue)
        {
            if (value.Equals(currentValue))
            {
                return "selected";
            }
            return "";
        }

        protected void AddOrUpdate(object sender, EventArgs e)
        {
            
            if (Request.QueryString["Id"] == null)
            {
                //Order新規登録
                AddOrder();
                return;
            }

            //Order更新
            UpdateOrder();
        }

        /* Order新規登録 */
        protected void AddOrder()
        {
            try
            {
                //トランザクション開始
                using (TransactionScope scope = new TransactionScope())
                {
                    using (SqlConnection conn = new SqlConnection(DbHelper.getConnectionString()))
                    {
                        String insertSql = "INSERT INTO Orders(OrderID,CreatedOn) Values(@OrderID,@CreatedOn)";
                        using (SqlCommand command = new SqlCommand(insertSql))
                        {
                            command.Parameters.AddWithValue("@OrderID", OrderId.Text);
                            command.Parameters.AddWithValue("@CreatedOn", "2020-07-24");
                            conn.Open();
                            command.Connection = conn;
                            command.ExecuteNonQuery();
                        }
                    }

                    using (SqlConnection conn = new SqlConnection(DbHelper.getConnectionString()))
                    {

                        String insertSql = "INSERT INTO Orders_Items(OrderID,ItemID,No) Values(@OrderID,@ItemID,@No)";
                        using (SqlCommand command = new SqlCommand(insertSql))
                        {
                            conn.Open();
                            command.Connection = conn;
                            for (int i = 0; i < Request.Form.GetValues("ItemNo").Length; i++)
                            {
                                //System.Diagnostics.Debug.WriteLine("--------------------------------------------");
                                //System.Diagnostics.Debug.WriteLine(Request.Form.GetValues("ItemNo").GetValue(i));
                                //System.Diagnostics.Debug.WriteLine(Request.Form.GetValues("ItemId").GetValue(i));
                                //System.Diagnostics.Debug.WriteLine(Request.Form.GetValues("ItemName").GetValue(i));
                                //System.Diagnostics.Debug.WriteLine(Request.Form.GetValues("ItemQuantity").GetValue(i));
                                command.Parameters.Clear();
                                command.Parameters.AddWithValue("@OrderID", OrderId.Text);
                                command.Parameters.AddWithValue("@No", Request.Form.GetValues("ItemNo").GetValue(i));
                                command.Parameters.AddWithValue("@ItemID", Request.Form.GetValues("ItemId").GetValue(i));

                                //TODO: INSERT INTOをループの回数繰り返しているのか（実際どのようなSQLが発行されているのか）確認する。
                                command.ExecuteNonQuery();
                            }
                        }
                    }
                    scope.Complete();
                }
            }
            catch (TransactionAbortedException ex)
            {
                //TODO:入れるべきロジック検討中。
                throw ex;
            }
        }

        /* Order更新 */
        private void UpdateOrder()
        {
        }
    }
}
