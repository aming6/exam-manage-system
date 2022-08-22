using System;
using System.Collections;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Common;
public partial class pages_XuanYuanGuanLi_XueShengLieBiao : System.Web.UI.Page
{
    public string _funType = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        this.Response.Expires = 0;
        _funType = Request["funType"];
        switch (_funType)
        {
            case "GetXueSheng"://获取考生列表
                GetXueSheng();
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
    public void GetXueSheng()
    {
        string key = Request["key"];
        if (string.IsNullOrEmpty(key))
        {
            key += " where YuanXi='" + Session["YuanXi"].ToString() + "' and ZhuanYe='" + Session["ZhuanYe"].ToString() + "' and BanJi='" + Session["BanJi"].ToString() + "' ";
        }
        else
        {
            key += " and YuanXi='" + Session["YuanXi"].ToString() + "' and ZhuanYe='" + Session["ZhuanYe"].ToString() + "' and BanJi='" + Session["BanJi"].ToString() + "' ";
        }
        int pageIndex = Convert.ToInt32(Request["pageIndex"].ToString());
        int pageSize = Convert.ToInt32(Request["pageSize"].ToString());

        string sortField = Request["sortField"];
        string sortOrder = Request["sortOrder"];
        string strCmd = "";
        strCmd = " select ID,XueHao,XingMing,XingBie,NianLing from Students  " + key;
        Hashtable result = MiNiHelper.GetHashTable(strCmd, pageIndex, pageSize, sortField, sortOrder);
        string json = PluSoft.Utils.JSON.Encode(result);
        Response.Write(json);
        Response.End();

    }
}