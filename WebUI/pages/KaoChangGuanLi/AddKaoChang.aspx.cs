using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Common;
using System.Text;
using System.Collections;
public partial class pages_KaoChangGuanLi_AddKaoChang : System.Web.UI.Page
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
            case "CreateKaoChangDaiMa"://自动生成考场代码
                CreateKaoChangDaiMa();
                break;
            default:
                break;
        }
    }

    /// <summary>
    /// 自动生成考场代码
    /// </summary>
    private void CreateKaoChangDaiMa()
    {
        string text = "KC" + DateTime.Now.ToString("yyyyMMdd");
        string strCmd = " select count(*) from KaoChang  ";
        DataTable dt = new DataTable();
        dt = SqlHelper.GetData(strCmd);
        int result = Convert.ToInt32(dt.Rows[0][0].ToString()) + 1;
        Response.Write(text + result.ToString());
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
            sb.Append(" insert into KaoChang ( ");
            sb.Append(" [KaoChangDaiMa], ");
            sb.Append(" [KaiShiShiJian], ");
            sb.Append(" [JieSuShiJian], ");
            sb.Append(" [DiDian], ");
            sb.Append(" [RenShu], ");
            sb.Append(" [KaoShiKeMu], ");
            sb.Append(" [JianKaoJiaoShi] ");
            sb.Append(" ) ");
            sb.Append(" values ( ");

            sb.Append(" '" + array["KaoChangDaiMa"].ToString() + "', ");
            sb.Append(" '" + array["KaiShiShiJian"].ToString() + "', ");
            sb.Append(" '" + array["JieSuShiJian"].ToString() + "', ");
            sb.Append(" '" + array["DiDian"].ToString() + "', ");
            sb.Append(" '" + array["RenShu"].ToString() + "', ");
            sb.Append(" '" + array["KaoShiKeMu"].ToString() + "', ");
            sb.Append(" '" + array["JianKaoJiaoShi"].ToString() + "' ");

            sb.Append(" ) ");
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