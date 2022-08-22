using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Common;
public partial class pages_KaoChangGuanLi_KaoChangZhuoTie : System.Web.UI.Page
{
    public DataTable dt = new DataTable();
    protected void Page_Load(object sender, EventArgs e)
    {
        string strCmd = " select * from Students where KaoChangDaiMa='" + Request["KaoChangDaiMa"].ToString() + "'";
        dt = SqlHelper.GetData(strCmd);
    }
}