using System;
using System.Collections.Generic;
using System.Web;
using System.Collections;
using System.Data;

namespace Common
{
    /// <summary>
    ///MiNiHelper 、DBHelper和PluSoft.dll结合使用的帮助类库
    /// </summary>
    public class MiNiHelper
    {
        public MiNiHelper()
        {
            //
            //TODO: 在此处添加构造函数逻辑
            //
        }

        #region 简单的数据表格操作

        /// <summary>
        /// 根据指定的SQL执行语句将数据表转换成JSON字符串
        /// </summary>
        /// <param name="sql"></param>
        /// <returns></returns>
        public static string SQLToJson(string sql)
        {
            DataTable dt = SqlHelper.GetData(sql);
            ArrayList data = DataTableToArrayList(dt);
            return PluSoft.Utils.JSON.Encode(data);
        }

        /// <summary>
        /// 将DataTable转换成ArrayList对象
        /// </summary>
        /// <param name="data">DataTable对象</param>
        /// <returns>ArrayList对象</returns>
        public static ArrayList DataTableToArrayList(DataTable data)
        {
            ArrayList arrayList = new ArrayList();
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
                arrayList.Add(record);
            }
            return arrayList;
        }

        /// <summary>
        /// 根据要执行的语句获取HashTable汇总数据
        /// </summary>
        /// <param name="sql">SQL执行语句</param>
        /// <param name="index">当前页数</param>
        /// <param name="size">页数大小</param>
        /// <param name="sortField">排序字段</param>
        /// <param name="sortOrder">排序类型</param>
        /// <returns>HashTable</returns>
        public static Hashtable GetHashTable(string sql, int index, int size, string sortField, string sortOrder)
        {
            //string sql = " select id,loginname,name,salary,gender,age,birthday,createtime from t_employee where   name like '%" + key + "%' ";

            if (string.IsNullOrEmpty(sortField) == false)
            {
                if (sortOrder != "desc") sortOrder = "asc";
                sql += " order by  " + sortField + " " + sortOrder;
            }

            ArrayList dataAll = DataTableToArrayList(SqlHelper.GetData(sql));
            //实现一个内存分页(实际应该使用SQL分页)
            ArrayList data = new ArrayList();
            int start = index * size, end = start + size;
            for (int i = 0; i < dataAll.Count; i++)
            {
                Hashtable record = (Hashtable)dataAll[i];
                if (record == null) continue;
                if (start <= i && i < end)
                {
                    data.Add(record);
                }
            }
            Hashtable result = new Hashtable();
            result["data"] = data;
            result["total"] = dataAll.Count;
            return result;
        }

        #endregion

        #region  简单的数据树操作



        #endregion
    }
}
