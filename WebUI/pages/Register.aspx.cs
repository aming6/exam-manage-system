using System;
using System.Collections.Generic;
using System.Data;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Common;
public partial class pages_Register : System.Web.UI.Page
{
    public string _funType = "";
    public string optionType = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        _funType = Request["funType"];
        switch (_funType)
        {
            case "BindXiBie"://绑定学院
                BindXiBie();
                break;
            case "BindZhuanYe"://绑定专业
                BindZhuanYe();
                break;
            case "BindBanJi"://绑定班级
                BindBanJi();
                break;
            case "BindTeacher"://绑定授课人
                BindTeacher();
                break;
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
            this.txtXueHao.ReadOnly = true;
        }
    }
    /// <summary>
    /// 保存数据
    /// </summary>
    private void saveData()
    {
        //学号$姓名$性别$年龄$密码$确认密码$学院$专业$班级
        string _params = Request["params"];
        string sql = " insert into  Students ( XueHao, XingMing, XingBie, NianLing, MiMa, YuanXi, ZhuanYe, BanJi ) values ( '" + _params.Split('$')[0] + "','" + _params.Split('$')[1] + "','" + _params.Split('$')[2] + "','" + _params.Split('$')[3] + "','" + _params.Split('$')[5] + "','" + _params.Split('$')[6] + "','" + _params.Split('$')[7] + "','" + _params.Split('$')[8] + "' )";
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
        string sql = " select count(*) FROM  Students ";
        Response.Write(DateTime.Now.ToString("yyyyMMdd") + SqlHelper.GetData(sql).Rows[0][0].ToString());
        Response.End();
    }

    /// <summary>
    /// 绑定授课人
    /// </summary>
    private void BindTeacher()
    {
        StringBuilder sql = new StringBuilder();
        sql.Append(" SELECT  ID, JiaoShiName FROM  Teachers where BanJi='" + Request["BanJi"].ToString() + "'");
        if (Request["YuanXi"].Trim() != "==请选择==")
        {
            sql.Append(" and YuanXi='" + Request["YuanXi"].ToString() + "' ");
        }
        if (Request["ZhuanYe"].Trim() != "==请选择==")
        {
            sql.Append(" and ZhuanYe='" + Request["ZhuanYe"].ToString() + "' ");
        }
        DataTable dt = SqlHelper.GetData(sql.ToString());
        StringBuilder sb = new StringBuilder();
        sb.Append("<option value='-1'>==请选择授课人==</option>");
        if (dt != null && dt.Rows.Count > 0)
        {
            foreach (DataRow row in dt.Rows)
            {
                sb.Append("<option value='" + row["ID"].ToString() + "'>" + row["JiaoShiName"].ToString() + "</option>");
            }
        }
        else
        {
            //
        }
        Response.Write(sb.ToString());
        Response.End();
    }

    /// <summary>
    /// 绑定班级
    /// </summary>
    private void BindBanJi()
    {
        string sql = " SELECT  ID, ZhuanYeID, BanJiName FROM  BanJi where ZhuanYeID=" + Request["ZhuanYeID"].ToString() + " ";
        DataTable dt = SqlHelper.GetData(sql);
        StringBuilder sb = new StringBuilder();
        sb.Append("<option value='-1'>==请选择==</option>");
        if (dt != null && dt.Rows.Count > 0)
        {
            foreach (DataRow row in dt.Rows)
            {
                sb.Append("<option value='" + row["ID"].ToString() + "'>" + row["BanJiName"].ToString() + "</option>");
            }
        }
        else
        {
            //
        }
        Response.Write(sb.ToString());
        Response.End();
    }

    /// <summary>
    /// 绑定专业
    /// </summary>
    private void BindZhuanYe()
    {
        string sql = " SELECT   ID, XiBieID, ZhuanYeName FROM ZhuanYe  where XiBieID=" + Request["XiBieID"].ToString() + " ";
        DataTable dt = SqlHelper.GetData(sql);
        StringBuilder sb = new StringBuilder();
        sb.Append("<option value='-1'>==请选择==</option>");
        if (dt != null && dt.Rows.Count > 0)
        {
            foreach (DataRow row in dt.Rows)
            {
                sb.Append("<option value='" + row["ID"].ToString() + "'>" + row["ZhuanYeName"].ToString() + "</option>");
            }
        }
        else
        {
            //
        }
        Response.Write(sb.ToString());
        Response.End();
    }

    /// <summary>
    /// 绑定学院
    /// </summary>
    private void BindXiBie()
    {
        string sql = " SELECT ID, XiBieName FROM  XiBie ";
        DataTable dt = SqlHelper.GetData(sql);
        StringBuilder sb = new StringBuilder();
        sb.Append("<option value='-1'>==请选择==</option>");
        if (dt != null && dt.Rows.Count > 0)
        {
            foreach (DataRow row in dt.Rows)
            {
                sb.Append("<option value='" + row["ID"].ToString() + "'>" + row["XiBieName"].ToString() + "</option>");
            }
        }
        else
        {
            //
        }
        Response.Write(sb.ToString());
        Response.End();
    }
}