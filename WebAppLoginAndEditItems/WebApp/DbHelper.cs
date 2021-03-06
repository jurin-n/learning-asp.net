﻿using System;
using System.Configuration;
using System.Data.SqlClient;

namespace WebApp
{
    public class DbHelper
    {
        public static String getConnectionString()
        {
            //暗号化パスワードがついたConnectionStringを取得し
            //SqlConnectionStringBuilderオブジェクト作成する。
            String connectionStringWithEncryptedPassword = ConfigurationManager.ConnectionStrings["MainDatabaseWithEncryptedPassword"].ConnectionString;
            SqlConnectionStringBuilder builder = new SqlConnectionStringBuilder(connectionStringWithEncryptedPassword);

            //パスワードのみ復号化
            String EncryptedPassword = builder.Password;
            builder.Password = decryptionPassword(EncryptedPassword);
            return builder.ToString();
        }

        private static string decryptionPassword(string encryptedPassword)
        {
            //TODO:復号ロジックを実装
            return encryptedPassword;
        }
    }
}
