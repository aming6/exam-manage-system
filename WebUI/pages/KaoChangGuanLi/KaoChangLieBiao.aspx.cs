using System;
using System.Collections;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Common;
public partial class pages_XuanYuanGuanLi_WenTiLieBiao : System.Web.UI.Page
{
    public string _funType = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        this.Response.Expires = 0;
        _funType = Request["funType"];
        switch (_funType)
        {
            case "GetData":
                GetData();
                break;
            case "Remove":
                Remove();
                break;
            default:
                break;
        }
    }
    /// <summary>
    /// 删除
    /// </summary>
    private void Remove()
    {
        string _id = Request["id"];
        string strCmd = " delete from KaoChang where ID=" + _id;
        SqlHelper.Execute(strCmd);
        Response.Write("1");
        Response.End();
    }
    /// <summary>
    /// 加载页面数据
    /// </summary>
    public void GetData()
    {
        string key = Request["key"];

        int pageIndex = Convert.ToInt32(Request["pageIndex"].ToString());
        int pageSize = Convert.ToInt32(Request["pageSize"].ToString());

        string sortField = Request["sortField"];
        string sortOrder = Request["sortOrder"];
        string strCmd = " select ID,KaoChangDaiMa,KaiShiShiJian,JieSuShiJian,DiDian,RenShu,KaoShiKeMu,JianKaoJiaoShi from KaoChang  " + key;
        Hashtable result = MiNiHelper.GetHashTable(strCmd, pageIndex, pageSize, sortField, sortOrder);
        string json = PluSoft.Utils.JSON.Encode(result);
        Response.Write(json);
        Response.End();
    }
}