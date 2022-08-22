using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.OleDb;
using System.Data;
using System.Collections;
using System.Text.RegularExpressions;
using System.Data.SqlClient;
using System.Configuration;
namespace Common
{
    public class SqlHelper
    {
        public SqlHelper()
        {
            //
            //TODO: 在此处添加构造函数逻辑
            //
        }
        static string connectionString = ConfigurationSettings.AppSettings["ConnectionString"].ToString();

        public static SqlConnection createConnection()
        {
            //数据库连接字符串
            SqlConnection cnn;
            cnn = new SqlConnection(connectionString);
            return cnn;
        }
        public static DataTable GetData(string sqlStr)
        {
            //定义数据库连接　将要查询的数据集　填充到DataSet中
            SqlConnection tmpCnn = SqlHelper.createConnection();
            if (tmpCnn.State != 0)
            {
                tmpCnn.Close();
            }
            tmpCnn.Open();

            SqlDataAdapter cmd = new SqlDataAdapter(sqlStr, tmpCnn);
            DataSet tmpDataSet = new DataSet();
            cmd.Fill(tmpDataSet);
            tmpCnn.Close();
            return tmpDataSet.Tables[0];
        }

        public static void Execute(string sqlStr)
        {
            //定义数据库连接　　执行数据库的增加　修改和删除数据的功能
            SqlConnection tmpCnn = SqlHelper.createConnection();
            if (tmpCnn.State != 0)
            {
                tmpCnn.Close();
            }
            tmpCnn.Open();

            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = sqlStr;
            cmd.Connection = tmpCnn;
            cmd.ExecuteNonQuery();
            tmpCnn.Close();

        }
    }
}
