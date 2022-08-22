using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Common;
using System.Text;
using System.Collections;

public partial class pages_RenYuanGuanLi_AddXueSheng : System.Web.UI.Page
{
    public string _funType = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request["funType"] != null)
            _funType = Request["funType"].ToString();
        switch (_funType)
        {
            case "CreateZhunKaoZhengHao":
                CreateZhunKaoZhengHao();
                break;
            case "CreateXueHao":
                CreateXueHao();
                break;
            case "GetXueYuan":
                GetXueYuan();
                break;
            case "GetZhuanYeByXueYuanID":
                GetZhuanYeByXueYuanID(Request["XueYuanID"].ToString());
                break;
            case "GetBanJiByZhuanYeID":
                GetBanJiByZhuanYeID(Request["ZhuanYeID"].ToString());
                break;
            case "GetKaoChang":
                GetKaoChang();
                break;
            case "Save":
                Save(Request["json"].ToString());
                break;
            case "GetRenShu":
                GetRenShu(Request["KaoChangDaiMa"]);
                break;
            default:
                break;
        }
    }
    /// <summary>
    /// 根据考场代码获取考场人数
    /// </summary>
    /// <param name="KaoChangDaiMa"></param>
    private void GetRenShu(string KaoChangDaiMa)
    {
        string strCmd = " select RenShu from KaoChang where KaoChangDaiMa='" + KaoChangDaiMa + "' ";
        DataTable dt = new DataTable();
        dt = SqlHelper.GetData(strCmd);
        string strCmd2 = " select count(*) from Students where KaoChangDaiMa='" + KaoChangDaiMa + "' ";
        DataTable dt2 = new DataTable();
        dt2 = SqlHelper.GetData(strCmd2);
        Response.Write(dt.Rows[0]["RenShu"].ToString() + "$" + dt2.Rows[0][0].ToString());
        Response.End();
    }

    /// <summary>
    /// 保存
    /// </summary>
    /// <param name="json"></param>
    private void Save(string json)
    {
        StringBuilder sb = new StringBuilder();
        ArrayList arrayList = (ArrayList)PluSoft.Utils.JSON.Decode(json);
        foreach (Hashtable array in arrayList)
        {

            sb.Append(" insert into Students ( ");
            sb.Append(" [ZhunKaoZhengHao], ");
            sb.Append(" [XueHao], ");
            sb.Append(" [XingMing], ");
            sb.Append(" [XingBie], ");
            sb.Append(" [NianLing], ");
            sb.Append(" [MiMa], ");
            sb.Append(" [YuanXi], ");
            sb.Append(" [ZhuanYe], ");
            sb.Append(" [BanJi], ");
            sb.Append(" [KaoChang], ");
            sb.Append(" [KaoChangDaiMa] ");
            sb.Append(" ) ");
            sb.Append(" values ( ");

            sb.Append(" '" + array["ZhunKaoZhengHao"].ToString() + "', ");
            sb.Append(" '" + array["XueHao"].ToString() + "', ");
            sb.Append(" '" + array["XingMing"].ToString() + "', ");
            sb.Append(" '" + array["XingBie"].ToString() + "', ");
            sb.Append(array["NianLing"].ToString() + ", ");
            sb.Append(" '" + array["MiMa"].ToString() + "', ");
            sb.Append(" '" + XueYuanName(array["XueYuan"].ToString()) + "', ");
            sb.Append(" '" + ZhuanYeName(array["ZhuanYe"].ToString()) + "', ");
            sb.Append(" '" + BanJiName(array["BanJi"].ToString()) + "', ");
            sb.Append(" '" + array["KaoChang"].ToString() + "', ");
            sb.Append(" '" + array["KaoChangDaiMa"].ToString() + "' ");

            sb.Append(" ) ");
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

    /// <summary>
    /// 获取考场信息
    /// </summary>
    private void GetKaoChang()
    {
        string strCmd = " select ID,KaoChangDaiMa from KaoChang order by ID DESC  ";
        string json = MiNiHelper.SQLToJson(strCmd);
        Response.Write(json);
        Response.End();
    }

    /// <summary>
    /// 根据专业ID获取班级信息
    /// </summary>
    /// <param name="ZhuanYeID"></param>
    private void GetBanJiByZhuanYeID(string ZhuanYeID)
    {
        string strCmd = " select ID,BanJiName from BanJi WHERE ZhuanYeID=" + ZhuanYeID + " order by ID DESC  ";
        string json = MiNiHelper.SQLToJson(strCmd);
        Response.Write(json);
        Response.End();
    }

    /// <summary>
    /// 根据学院ID获取专业信息
    /// </summary>
    /// <param name="XueYuanID"></param>
    private void GetZhuanYeByXueYuanID(string XueYuanID)
    {
        string strCmd = " select ID,ZhuanYeName from ZhuanYe WHERE XiBieID=" + XueYuanID + " order by ID DESC  ";
        string json = MiNiHelper.SQLToJson(strCmd);
        Response.Write(json);
        Response.End();
    }
    /// <summary>
    /// 获取学院列表
    /// </summary>
    private void GetXueYuan()
    {
        string strCmd = " select ID,XiBieName from XiBie order by ID DESC ";
        string json = MiNiHelper.SQLToJson(strCmd);
        Response.Write(json);
        Response.End();
    }

    /// <summary>
    /// 自动生成学号
    /// </summary>
    private void CreateXueHao()
    {
        string strCmd = " select count(*) from Students ";
        DataTable dt = new DataTable();
        dt = SqlHelper.GetData(strCmd);
        int result = Convert.ToInt32(dt.Rows[0][0].ToString()) + 1;
        string text = "XH" + DateTime.Now.ToString("yyyyMMdd") + result.ToString();
        Response.Write(text);
        Response.End();
    }

    /// <summary>
    /// 自动生成准考证号
    /// </summary>
    protected void CreateZhunKaoZhengHao()
    {
        string strCmd = " select count(*) from Students ";
        DataTable dt = new DataTable();
        dt = SqlHelper.GetData(strCmd);
        int result = Convert.ToInt32(dt.Rows[0][0].ToString()) + 1;
        string text = "ZKZ" + DateTime.Now.ToString("yyyyMMdd") + result.ToString();
        Response.Write(text);
        Response.End();
    }
}
