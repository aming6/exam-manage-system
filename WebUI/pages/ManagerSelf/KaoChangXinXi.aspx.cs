using System;
using System.Collections;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Common;
public partial class pages_ManagerSelf_HuiDaWenTi : System.Web.UI.Page
{
    public string _funType = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        this.Response.Expires = 0;
        _funType = Request["funType"];
        switch (_funType)
        {
            case "GetWenTi"://获取问题列表
                GetWenTi();
                break;
            default:
                break;
        }
        if (!IsPostBack)
        {

        }
    }
    /// <summary>
    /// 加载页面数据
    /// </summary>
    public void GetWenTi()
    {
        string key = Request["key"];
        if (string.IsNullOrEmpty(key))
        {
            key += " where StudentID=" + Session["ID"].ToString();
        }
        else
        {
            key += " and StudentID=" + Session["ID"].ToString();
        }
        int pageIndex = Convert.ToInt32(Request["pageIndex"].ToString());
        int pageSize = Convert.ToInt32(Request["pageSize"].ToString());

        string sortField = Request["sortField"];
        string sortOrder = Request["sortOrder"];
        string strCmd = " select ID,WenTi,HuiFuDaAn,RightDaAn,KeChengName,JiaoShiName,ShiFouPingYue,CreateTime,ResponeTime,DeFen from WenTi  " + key;
        Hashtable result = MiNiHelper.GetHashTable(strCmd, pageIndex, pageSize, sortField, sortOrder);
        string json = PluSoft.Utils.JSON.Encode(result);
        Response.Write(json);
        Response.End();

    }
}