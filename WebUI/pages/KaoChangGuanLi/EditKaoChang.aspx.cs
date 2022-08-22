using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Common;
using System.Text;
using System.Collections;
public partial class pages_KaoChangGuanLi_EditKaoChang : System.Web.UI.Page
{
    public string _funType = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request["funType"] != null)
        {
            _funType = Request["funType"].ToString();
        }
        switch (_funType)
        {
            case "GetKeCheng":
                GetKeCheng();
                break;
            case "GetJiaoShi":
                GetJiaoShi();
                break;
            case "Save":
                Save(Request["json"].ToString());
                break;
            case "SetData":
                SetData();
                break;
            default:
                break;
        }
    }


    private void SetData()
    {
        string ID = Request["id"];
        string sql = " select * from KaoChang where ID= " + ID;
        string json = MiNiHelper.SQLToJson(sql);
        Response.Write(json);
        Response.End();
    }


    /// <summary>
    /// 保存数据
    /// </summary>
    /// <param name="json"></param>
    private void Save(string json)
    {
        StringBuilder sb = new StringBuilder();
        ArrayList arrayList = (ArrayList)PluSoft.Utils.JSON.Decode(json);
        foreach (Hashtable array in arrayList)
        {
            sb.Append(" update  KaoChang set ");

            sb.Append(" [KaiShiShiJian]='" + array["KaiShiShiJian"].ToString() + "', ");
            sb.Append(" [JieSuShiJian]='" + array["JieSuShiJian"].ToString() + "', ");
            sb.Append(" [DiDian]='" + array["DiDian"].ToString() + "', ");
            sb.Append(" [RenShu]='" + array["RenShu"].ToString() + "', ");
            sb.Append(" [KaoShiKeMu]='" + array["KaoShiKeMu"].ToString() + "', ");
            sb.Append(" [JianKaoJiaoShi]='" + array["JianKaoJiaoShi"].ToString() + "' ");

            sb.Append(" where ID=" + array["ID"].ToString());
            SqlHelper.Execute(sb.ToString());
        }
        Response.Write("1");
        Response.End();
    }

    /*获取监考教师*/
    private void GetJiaoShi()
    {
        string strCmd = " select ID,JiaoShiName from Teachers ";
        string json = MiNiHelper.SQLToJson(strCmd);
        Response.Write(json);
        Response.End();
    }

    /// <summary>
    /// 加载考试科目
    /// </summary>
    private void GetKeCheng()
    {
        string StrCmd = " select  ID,KeChengName from KeCheng order by ID desc ";
        string json = MiNiHelper.SQLToJson(StrCmd);
        Response.Write(json);
        Response.End();
    }
}