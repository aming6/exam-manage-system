using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Common;
public partial class pages_EditPassword : System.Web.UI.Page
{
    public string _funType = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        _funType = Request["funType"];
        switch (_funType)
        {
            case "ChangePassword":
                ChangePassword();
                break;

            default:
                break;
        }
    }

    /// <summary>
    /// 修改密码
    /// </summary>
    private void ChangePassword()
    {
        string _params = Request["params"];
        string strCmd = "";
        switch (Session["role"].ToString())
        {
            case "管理员":
                strCmd = " update Admin set  MiMa='" + _params + "' where ID=" + Session["ID"].ToString() + "  ";
                break;
            case "考生":
                strCmd = " update Students set  MiMa='" + _params + "' where ID=" + Session["ID"].ToString() + " ";
                break;
            default:
                break;
        }
        SqlHelper.Execute(strCmd);
        Response.Write("True");
        Response.End();
    }
}