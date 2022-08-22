using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Common;
public partial class pages_RenYuanGuanLi_AddorEditJiaoShi : System.Web.UI.Page
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
            case "GetRows"://自动生成学好
                GetRows();
                break;
            default:
                break;
        }
        if (!IsPostBack)
        {
            this.txtJiaoShiBianHao.ReadOnly = true;
        }
    }
    /// <summary>
    /// 保存数据
    /// </summary>
    private void saveData()
    {
        //教师编号$教师姓名
        string _params = Request["params"];
        string sql = " insert into  Teachers ( JiaoShiBianHao, JiaoShiName,YuanXi,ZhuanYe,BanJi ) values ( '" + _params.Split('$')[0] + "','" + _params.Split('$')[1] + "','" + _params.Split('$')[2] + "','" + _params.Split('$')[3] + "','" + _params.Split('$')[4] + "' )";
        SqlHelper.Execute(sql);
        Response.Write("");
        Response.End();
    }

    /// <summary>
    /// 获取考生行数
    /// </summary>
    /// <returns></returns>
    private void GetRows()
    {
        string sql = " select count(*) FROM  Teachers ";
        Response.Write(DateTime.Now.ToString("yyyyMMdd") + SqlHelper.GetData(sql).Rows[0][0].ToString());
        Response.End();
    }
}