using System;
using System.Collections;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Common;
public partial class pages_ManagerSelf_WoYaoLiuYan : System.Web.UI.Page
{

    public string KaoShiShiJian = "";
    public string DiDian = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        string strCmd = " select * from KaoChang where KaoChangDaiMa='" + Request["KaoChangDaiMa"].ToString() + "' ";
        DataTable dt = new DataTable();
        dt = SqlHelper.GetData(strCmd);
        KaoShiShiJian += "考试科目：" + dt.Rows[0]["KaoShiKeMu"].ToString();
        KaoShiShiJian += "<br>开始时间：" + Convert.ToDateTime(dt.Rows[0]["KaiShiShiJian"].ToString()).ToString("yyyy年MM月dd日 HH：mm");
        KaoShiShiJian += "<br>结束时间：" + Convert.ToDateTime(dt.Rows[0]["JieSuShiJian"].ToString()).ToString("yyyy年MM月dd日 HH：mm");
        DiDian += dt.Rows[0]["DiDian"].ToString();
    }


}