using System;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Common;
public partial class pages_ManagerSelf_UserInfo : System.Web.UI.Page
{
    public string _funType = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        _funType = Request["funType"];
        switch (_funType)
        {
            case "EditUserInfo"://修改个人信息
                EditUserInfo();
                break;
            default:
                break;
        }
        if (!IsPostBack)
        {
            BindData();
        }
    }

    /// <summary>
    /// 修改个人信息
    /// </summary>
    private void EditUserInfo()
    {
        string XingMing = Request["XingMing"].ToString();
        string XingBie = Request["XingBie"].ToString();
        string NianLing = Request["NianLing"].ToString();
        string strCmd = " update Students set  XingMing='" + XingMing + "',NianLing=" + NianLing + " where ID=" + Session["ID"].ToString();
        SqlHelper.Execute(strCmd);
        Response.Write("1");
        Response.End();
    }

    /// <summary>
    /// 绑定页面信息
    /// </summary>
    private void BindData()
    {
        string strCmd = " SELECT  ID, XueHao, XingMing, XingBie, NianLing, MiMa, YuanXi, ZhuanYe, BanJi FROM Students where ID=" + Session["ID"].ToString() + " ";
        DataTable dt = new DataTable();
        dt = SqlHelper.GetData(strCmd);
        if (dt != null && dt.Rows.Count > 0)
        {
            this.txtXueHao.Text = dt.Rows[0]["XueHao"].ToString();
            this.txtXingMing.Text = dt.Rows[0]["XingMing"].ToString();
            this.txtNianLing.Text = dt.Rows[0]["NianLing"].ToString();
            this.txtXingBie.Text = dt.Rows[0]["XingBie"].ToString();
            this.txtYuanXi.Text = dt.Rows[0]["YuanXi"].ToString();
            this.txtZhuanYe.Text = dt.Rows[0]["ZhuanYe"].ToString();
            this.txtBanJi.Text = dt.Rows[0]["BanJi"].ToString();
        }
    }
}