using System;
using System.Data.SqlClient;
using System.Transactions;

namespace WebApp
{
    public partial class Item : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //ログインチェック
            //TODO:ログインチェック処理を別クラスに抽出
            if (Session["UserId"] == null || Session["UserId"].ToString().Trim().Length == 0)
            {
                Response.Redirect("Login.aspx");
            }
        }
        protected void AddOrEdit(object sender, EventArgs e)
        {
            Console.WriteLine(ItemId.Text);
            Console.WriteLine(ItemName.Text);
            Console.WriteLine(Description.Text);
            /* 登録か更新か判定 */
            //TODO:ロジック実装。

            /* Item新規登録ロジック */
            //ItemIdがすでに登録されてるかチェック
            //TODO:ロジック実装。

            //Item新規登録
            try
            {
                String sql = "INSERT INTO Items (ItemID,Name,Description,CreatedOn) Values(@ItemID,@Name,@Description,@CreatedOn)";

                //トランザクション開始
                using (TransactionScope scope = new TransactionScope())
                {
                    using (SqlConnection conn = new SqlConnection(DbHelper.getConnectionString()))
                    {
                        using (SqlCommand command = new SqlCommand(sql))
                        {
                            command.Parameters.AddWithValue("@ItemID", ItemId.Text);
                            command.Parameters.AddWithValue("@Name", ItemName.Text);
                            command.Parameters.AddWithValue("@Description", Description.Text);
                            //TODO:CreatedOnに現在のDatetimeを取得しセットするロジックの実装。
                            command.Parameters.AddWithValue("@CreatedOn", "2020-07-24");

                            conn.Open();
                            command.Connection = conn;

                            command.ExecuteNonQuery();
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
    }
}