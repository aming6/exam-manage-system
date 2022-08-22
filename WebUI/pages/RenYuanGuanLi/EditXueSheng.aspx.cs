using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Common;
using System.Text;
using System.Collections;
using System.Data;
public partial class pages_RenYuanGuanLi_EditXueSheng : System.Web.UI.Page
{
    public string _funType = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request["funType"] != null)
        {
            _funType = Request["funType"].ToString();
        }
        switch (_funType)
        {
            case "Save":
                Save(Request["json"].ToString());
                break;
            case "SetData":
                SetData();
                break;
            case "GetXueYuanID":
                GetXueYuanID(Request["XueYuanName"].ToString());
                break;
            case "GetZhuanYeID":
                GetZhuanYeID(Request["ZhuanYeName"].ToString());
                break;
            default:
                break;
        }
    }
    /// <summary>
    /// 根据专业Name获取专业ID
    /// </summary>
    /// <param name="ZhuanYeName"></param>
    private void GetZhuanYeID(string ZhuanYeName)
    {
        string strCmd = " select ID from ZhuanYe where ZhuanYeName='" + ZhuanYeName + "'";
        DataTable dt = new DataTable();
        dt = SqlHelper.GetData(strCmd);
        Response.Write(dt.Rows[0]["ID"].ToString());
        Response.End();
    }

    /// <summary>
    /// 根据学院名称获取学院编号
    /// </summary>
    /// <param name="XueYuanName"></param>
    private void GetXueYuanID(string XueYuanName)
    {
        string strCmd = " select ID from XiBie where XiBieName='" + XueYuanName + "'";
        DataTable dt = new DataTable();
        dt = SqlHelper.GetData(strCmd);
        Response.Write(dt.Rows[0]["ID"].ToString());
        Response.End();
    }
    /// <summary>
    /// 加载页面数据
    /// </summary>
    private void SetData()
    {
        string ID = Request["id"];
        string sql = " select * from Students where ID= " + ID;
        string json = MiNiHelper.SQLToJson(sql);
        Response.Write(json);
        Response.End();
    }
    /// <summary>
    /// 保存数据
    /// </summary>
    /// <param name="json"></param>
    private void Save(string json)
    {
        StringBuilder sb = new StringBuilder();
        ArrayList arrayList = (ArrayList)PluSoft.Utils.JSON.Decode(json);
        foreach (Hashtable array in arrayList)
        {
            try
            {
                if (Convert.ToInt32(array["YuanXi"].ToString()) > 0)
                {
                    array["YuanXi"] = XueYuanName(array["YuanXi"].ToString());
                }

            }
            catch
            {

            }
            try
            {
                if (Convert.ToInt32(array["ZhuanYe"].ToString()) > 0)
                {
                    array["ZhuanYe"] = ZhuanYeName(array["ZhuanYe"].ToString());
                }

            }
            catch
            {

            }
            try
            {
                if (Convert.ToInt32(array["BanJi"].ToString()) > 0)
                {
                    array["BanJi"] = BanJiName(array["BanJi"].ToString());
                }
            }
            catch
            {

            }
            sb.Append(" update  Students set ");
            sb.Append(" [XingMing]='" + array["XingMing"].ToString() + "', ");
            sb.Append(" [XingBie]='" + array["XingBie"].ToString() + "', ");
            sb.Append(" [NianLing]=" + array["NianLing"].ToString() + ", ");
            sb.Append(" [YuanXi]='" + array["YuanXi"].ToString() + "', ");
            sb.Append(" [ZhuanYe]='" + array["ZhuanYe"].ToString() + "', ");
            sb.Append(" [KaoChang]='" + array["KaoChang"].ToString() + "', ");
            sb.Append(" [KaoChangDaiMa]='" + array["KaoChangDaiMa"].ToString() + "', ");
            sb.Append(" [BanJi]='" + array["BanJi"].ToString() + "' ");

            sb.Append(" where ID=" + array["ID"].ToString());
            SqlHelper.Execute(sb.ToString());
        }
        Response.Write("1");
        Response.End();
    }

    /// <summary>
    /// 根据系别ID获取系别名称
    /// </summary>
    /// <param name="XueYuanID"></param>
    /// <returns></returns>
    private string XueYuanName(string XiBieID)
    {
        string strCmd = " select XiBieName from XiBie where ID= " + XiBieID;
        DataTable dt = new DataTable();
        dt = SqlHelper.GetData(strCmd);
        return dt.Rows[0]["XiBieName"].ToString();
    }

    /// <summary>
    /// 根据专业ID获取专业名称
    /// </summary>
    /// <param name="ZhuanYeID"></param>
    private string ZhuanYeName(string ZhuanYeID)
    {
        string strCmd = " select ZhuanYeName from ZhuanYe where ID= " + ZhuanYeID;
        DataTable dt = new DataTable();
        dt = SqlHelper.GetData(strCmd);
        return dt.Rows[0]["ZhuanYeName"].ToString();
    }

    /// <summary>
    /// 根据班级ID获取班级信息
    /// </summary>
    /// <param name="BanJiID"></param>
    private string BanJiName(string BanJiID)
    {
        string strCmd = " select BanJiName from BanJi where ID= " + BanJiID;
        DataTable dt = new DataTable();
        dt = SqlHelper.GetData(strCmd);
        return dt.Rows[0]["BanJiName"].ToString();
    }
}