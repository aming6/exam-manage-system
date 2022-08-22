using System;
using System.Collections;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Util;
using Common;
public partial class pages_RenYuanGuanLi_JiaoShiLieBiao : System.Web.UI.Page
{
    public string _funType = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        this.Response.Expires = 0;
        _funType = Request["funType"];
        switch (_funType)
        {
            case "GetJiaoShi"://获取教师
                GetJiaoShi();
                break;
            case "RemoveJiaoShi"://删除教师
                RemoveJiaoShi();
                break;
            default:
                break;
        }
    }
    /// <summary>
    /// 删除
    /// </summary>
    private void RemoveJiaoShi()
    {
        string _id = Request["id"];
        string strCmd = " delete from Teachers where ID=" + _id;
        SqlHelper.Execute(strCmd);
        Response.Write("");
        Response.End();
    }
    /// <summary>
    /// 加载页面数据
    /// </summary>
    public void GetJiaoShi()
    {
        string key = Request["key"];
        int pageIndex = Convert.ToInt32(Request["pageIndex"].ToString());
        int pageSize = Convert.ToInt32(Request["pageSize"].ToString());
        string sortField = Request["sortField"];
        string sortOrder = Request["sortOrder"];
        string strCmd = "";
        strCmd = " select id,JiaoShiBianHao,JiaoShiName,YuanXi,ZhuanYe,BanJi from Teachers  " + key;
        Hashtable result = MiNiHelper.GetHashTable(strCmd, pageIndex, pageSize, sortField, sortOrder);
        string json = PluSoft.Utils.JSON.Encode(result);
        Response.Write(json);
        Response.End();

    }
}