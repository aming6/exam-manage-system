using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Common;
public partial class pages_RenYuanGuanLi_AddAdmin : System.Web.UI.Page
{
    public string _funType = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        _funType = Request["funType"].ToString();
        switch (_funType)
        {
            case "ChkIsExist"://验证账号是否存在
                ChkIsExist(Request["params"].ToString());
                break;
            case "Save"://保存
                Save(Request["params"].ToString());
                break;
            default:
                break;
        }
    }

    /// <summary>
    /// 保存
    /// </summary>
    private void Save(string _params)
    {
        string strCmd = " insert into Admin ( ZhangHao,MiMa,ChuangJianRen,ChuangJianShiJian ) values( '" + _params.Split('!')[0] + "','" + _params.Split('!')[1] + "','" + Session["user"].ToString() + "','" + DateTime.Now.ToString() + "' ) ";
        SqlHelper.Execute(strCmd);
        Response.Write("1");
        Response.End();
    }

    /// <summary>
    /// 验证是否存在
    /// </summary>
    private void ChkIsExist(string _params)
    {
        string strCmd = " select * from Admin where ZhangHao='" + _params + "'";
        DataTable dt = new DataTable();
        dt = SqlHelper.GetData(strCmd);
        if (dt != null && dt.Rows.Count > 0)
        {
            Response.Write("1");
        }
        else
        {
            Response.Write("0");
        }
        Response.End();
    }
}