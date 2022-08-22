using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Data.OleDb;
using System.Collections;
using System.Data.SqlClient;
using System.Text.RegularExpressions;
using System.Data.Common;

public class DBUtil
{
    #region 私有

    /// <summary>
    /// 将数据表转换成ArrayList数据
    /// </summary>
    /// <param name="data"></param>
    /// <returns></returns>
    public static ArrayList DataTable2ArrayList(DataTable data)
    {
        ArrayList array = new ArrayList();
        for (int i = 0; i < data.Rows.Count; i++)
        {
            DataRow row = data.Rows[i];

            Hashtable record = new Hashtable();
            for (int j = 0; j < data.Columns.Count; j++)
            {
                object cellValue = row[j];
                if (cellValue.GetType() == typeof(DBNull))
                {
                    cellValue = null;
                }
                record[data.Columns[j].ColumnName] = cellValue;
            }
            array.Add(record);
        }
        return array;
    }
    #endregion
}