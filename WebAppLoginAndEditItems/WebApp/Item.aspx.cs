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

            if(IsPostBack)
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
                String sql = "SELECT ItemID,Name,Description FROM Items WHERE ItemId=@ItemId";
                using (SqlCommand command = new SqlCommand(sql))
                {
                    command.Parameters.AddWithValue("@ItemId", Request.QueryString["Id"]);

                    conn.Open();
                    command.Connection = conn;
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        reader.Read();
                        ItemId.Text = (String)reader["ItemID"];
                        ItemName.Text = (String)reader["Name"];
                        Description.Text = (String)reader["Description"];
                    }
                }
            }

            //コントロール設定
            ItemId.ReadOnly = true;
            AddOrUpdateButton.Text = "更新";
        }

        protected void AddOrUpdate(object sender, EventArgs e)
        {
            if (Request.QueryString["Id"] == null)
            {
                //Item新規登録
                AddItem();
                return;
            }

            //Item更新
            UpdateItem();
        }

        /* Item新規登録 */
        protected void AddItem()
        {
            //ItemIdが登録されていないことをチェック
            //TODO:ロジック実装。

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

        /* Item更新 */
        private void UpdateItem()
        {
            //ItemIdが登録されていることをチェック
            //TODO:ロジック実装。

            //排他制御関連
            //TODO:ロジック実装。

            try
            {
                String sql = @"
                      UPDATE Items
                      SET
                          Name = @Name
                        , Description = @Description
                        , CreatedOn = @CreatedOn
                      WHERE ItemID = @ItemID
                    ";

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
                            command.Parameters.AddWithValue("@CreatedOn", "2020-07-25");

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