using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;

using Common;

public partial class pages_Login : System.Web.UI.Page
{
    public string _funType = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        _funType = Request["funType"];
        switch (_funType)
        {
            case "chkUserNameAndPassword"://验证用户名和密码是否正确
                chkUserNameAndPassword();
                break;
            default:
                break;
        }
    }
    /// <summary>
    /// 验证用户名和密码是否正确
    /// </summary>
    private void chkUserNameAndPassword()
    {
        //用户名$密码$角色
        string _params = Request["params"];
        string sql = "";
        switch (_params.Split('$')[2])
        {
            case "1"://管理员
                sql = " select * from Admin where ZhangHao='" + _params.Split('$')[0] + "' and MiMa='" + _params.Split('$')[1] + "' ";
                break;
            case "2"://考生
                sql = " select * from Students where XueHao='" + _params.Split('$')[0] + "' and MiMa='" + _params.Split('$')[1] + "' ";
                break;
            default:
                break;
        }
        DataTable dt = SqlHelper.GetData(sql);
        if (dt != null && dt.Rows.Count > 0)
        {
            Session["user"] = _params.Split('$')[0];
            Session["password"] = _params.Split('$')[1];
            if (_params.Split('$')[2] == "1")
            {
                Session["role"] = "管理员";
                Session["Name"] = dt.Rows[0]["ZhangHao"].ToString();
                Session["ID"] = dt.Rows[0]["ID"].ToString();
            }
            else
            {
                Session["role"] = "考生";
                Session["XueHao"] = dt.Rows[0]["XueHao"].ToString();
                Session["Name"] = dt.Rows[0]["XingMing"].ToString();
                Session["ID"] = dt.Rows[0]["ID"].ToString();
                Session["XingBie"] = dt.Rows[0]["XingBie"].ToString();
                Session["NianLing"] = dt.Rows[0]["NianLing"].ToString();
                Session["KaoChangDaiMa"] = dt.Rows[0]["KaoChangDaiMa"].ToString();
                Session["YuanXi"] = dt.Rows[0]["YuanXi"].ToString();
                Session["ZhuanYe"] = dt.Rows[0]["ZhuanYe"].ToString();
                Session["BanJi"] = dt.Rows[0]["BanJi"].ToString();
            }
            Session.Timeout = 1400;
            Response.Write("True");
        }
        else
        {
            Response.Write("False");
        }
        Response.End();
    }
}