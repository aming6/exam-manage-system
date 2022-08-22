using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Common;
public partial class pages_KeChengGuanLi_AddKeCheng : System.Web.UI.Page
{
    public string _funType = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        _funType = Request["funType"];
        switch (_funType)
        {
            case "saveData"://保存数据
                saveData();
                break;
            default:
                break;
        }
    }
    /// <summary>
    /// 保存数据
    /// </summary>
    private void saveData()
    {
        string _params = Request["params"];//课程名称$学院$专业$班级$授课人$授课人ID
        string sql = " insert into  KeCheng ( KeChengName, YuanXi,ZhuanYe,BanJi,ShouKeRen,ShouKeRenID ) values ( '" + _params.Split('$')[0] + "','" + _params.Split('$')[1] + "','" + _params.Split('$')[2] + "','" + _params.Split('$')[3] + "','" + _params.Split('$')[4] + "','" + _params.Split('$')[5] + "' )";
        SqlHelper.Execute(sql);
        Response.Write("");
        Response.End();
    }
}