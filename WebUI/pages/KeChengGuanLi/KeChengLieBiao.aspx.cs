using System;
using System.Collections;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Common;
public partial class pages_KeChengGuanLi_KeChengLieBiao : System.Web.UI.Page
{
    public string _funType = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        this.Response.Expires = 0;
        _funType = Request["funType"];
        switch (_funType)
        {
            /*课程列表信息*/
            case "GetKeCheng"://课程列表信息
                GetKeCheng();
                break;
            case "RemoveKeChengInfo"://删除课程信息
                RemoveKeChengInfo();
                break;
            default:
                break;
        }
        if (!IsPostBack)
        {

        }
    }
    /// <summary>
    /// 删除课程信息
    /// </summary>
    private void RemoveKeChengInfo()
    {
        string _id = Request["id"];
        string strCmd = " delete from KeCheng where id=" + _id;
        SqlHelper.Execute(strCmd);
        Response.Write("");
        Response.End();
    }

    /// <summary>
    /// 加载页面数据
    /// </summary>
    public void GetKeCheng()
    {
        string key = Request["key"];
        int pageIndex = Convert.ToInt32(Request["pageIndex"].ToString());
        int pageSize = Convert.ToInt32(Request["pageSize"].ToString());

        string sortField = Request["sortField"];
        string sortOrder = Request["sortOrder"];

        string strCmd = "";

        strCmd = " SELECT  ID, KeChengName, YuanXi, ZhuanYe, BanJi, ShouKeRen FROM KeCheng  " + key;

        Hashtable result = MiNiHelper.GetHashTable(strCmd, pageIndex, pageSize, sortField, sortOrder);

        string json = PluSoft.Utils.JSON.Encode(result);


        Response.Write(json);
        Response.End();

    }
}