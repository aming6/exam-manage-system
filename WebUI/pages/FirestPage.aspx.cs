using System;
using System.Collections.Generic;
using System.Data;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Common;
public partial class pages_FirestPage : System.Web.UI.Page
{
    public string _funType = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["role"].ToString() == "考生")
        {
            _funType = Request["funType"];
            switch (_funType)
            {
                case "saveKeChengInfo":
                    saveKeChengInfo();
                    break;
                case "loadKeChengInfo"://加载课程信息
                    loadKeChengInfo();
                    break;
                default:
                    break;
            }
        }

    }
    /// <summary>
    /// 加载课程信息
    /// </summary>
    private void loadKeChengInfo()
    {
        string strCmd = " select * from KeChengBiao where XueHao='" + Session["user"].ToString() + "' ";
        DataTable dt = new DataTable();
        StringBuilder sb = new StringBuilder();
        dt = SqlHelper.GetData(strCmd);
        if (dt != null && dt.Rows.Count > 0)
        {
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                sb.Append(dt.Rows[i]["KeChengName"].ToString());
                sb.Append("|");
                sb.Append(dt.Rows[i]["YanSe"].ToString());
                sb.Append("|");
                sb.Append(dt.Rows[i]["LieBianHao"].ToString());
                sb.Append("|");
                sb.Append(dt.Rows[i]["KeChengBianHao"].ToString());
                sb.Append("$");
            }
            Response.Write(sb.ToString());
        }
        else
        {
            Response.Write("");
        }
        Response.End();

    }
    /// <summary>
    /// 插入课程信息
    /// </summary>
    private void saveKeChengInfo()
    {
        //KeChengName$YanSe$LieBianHao$KeChengBianHao
        string _params = Request["params"];
        string XueHao = Session["user"].ToString();
        //判断该课程信息是否存在
        string strCmd = " select * from KeChengBiao where XueHao='" + XueHao + "' and LieBianHao='" + _params.Split('$')[2] + "' ";
        string strCmd2 = "";
        DataTable dt = new DataTable();
        dt = SqlHelper.GetData(strCmd);
        if (dt != null && dt.Rows.Count > 0)
        {
            //修改数据
            strCmd2 = " update KeChengBiao set KeChengName='" + _params.Split('$')[0] + "',YanSe='" + _params.Split('$')[1] + "',LieBianHao='" + _params.Split('$')[2] + "',KeChengBianHao='" + _params.Split('$')[3] + "' where XueHao='" + XueHao + "' and LieBianHao='" + _params.Split('$')[2] + "'  ";
        }
        else
        {
            strCmd2 = " insert into KeChengBiao( KeChengName,XueHao,YanSe,LieBianHao,KeChengBianHao ) values( '" + _params.Split('$')[0] + "','" + XueHao + "','" + _params.Split('$')[1] + "','" + _params.Split('$')[2] + "','" + _params.Split('$')[3] + "' ) ";
        }
        SqlHelper.Execute(strCmd2);

        Response.Write("True");

        Response.End();


    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        string strCmd3 = "truncate table KeChengBiao";
        SqlHelper.Execute(strCmd3);
    }
}