<%@ Page Language="C#" AutoEventWireup="true" CodeFile="KaoShengMingDan.aspx.cs"
    Inherits="pages_KaoChangGuanLi_KaoShengMingDan" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>考生名单</title>
    <style type="text/css">
        *
        {
            font-size: 14px;
        }
    </style>
    <script src="../../Scripts/jquery-1.4.1.min.js" type="text/javascript"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table cellpadding="5" cellspacing="0" style="border: 1px solid Gray; width: 98%;
            padding: 5px; text-align: center; margin: 0 auto;">
            <tbody>
                <tr height="25">
                    <td style="border-bottom: 1px solid Gray; text-align: center; font-size: 18px; font-weight: bold;"
                        colspan="11">
                        考生名单<span style="font-size: 14px; font-weight: lighter;">(考场：<%= Request["KaoChangDaiMa"].ToString()%>
                            &nbsp;地点：<%= Request["DiDian"].ToString()%>
                            )</span>
                    </td>
                </tr>
                <tr height="25">
                    <td style="border-bottom: 1px solid Gray; text-align: center; font-weight: bold;">
                        准考证号
                    </td>
                    <td style="border-bottom: 1px solid Gray; text-align: center; font-weight: bold;">
                        学号
                    </td>
                    <td style="border-bottom: 1px solid Gray; text-align: center; font-weight: bold;">
                        座位号
                    </td>
                    <td style="border-bottom: 1px solid Gray; text-align: center; font-weight: bold;">
                        姓名
                    </td>
                    <td style="border-bottom: 1px solid Gray; text-align: center; font-weight: bold;">
                        性别
                    </td>
                    <td style="border-bottom: 1px solid Gray; text-align: center; font-weight: bold;">
                        年龄
                    </td>
                    <td style="border-bottom: 1px solid Gray; text-align: center; font-weight: bold;">
                        学院
                    </td>
                    <td style="border-bottom: 1px solid Gray; text-align: center; font-weight: bold;">
                        专业
                    </td>
                    <td style="border-bottom: 1px solid Gray; text-align: center; font-weight: bold;">
                        班级
                    </td>
                    <td style="border-bottom: 1px solid Gray; text-align: center; font-weight: bold;">
                        签到
                    </td>
                </tr>
                <%
                    int cnt = dt.Rows.Count;
                    if (dt != null && cnt > 0)
                    {
                        for (int i = 0; i < cnt; i++)
                        {%>
                <tr height="25">
                    <td style="border-bottom: 1px solid Gray; text-align: center;">
                        <%=dt.Rows[i]["ZhunKaoZhengHao"].ToString() %>
                    </td>
                    <td style="border-bottom: 1px solid Gray; text-align: center;">
                        <%=dt.Rows[i]["XueHao"].ToString() %>
                    </td>
                    <td style="border-bottom: 1px solid Gray; text-align: center;">
                        <%=i+1 %>
                    </td>
                    <td style="border-bottom: 1px solid Gray; text-align: center;">
                        <%=dt.Rows[i]["XingMing"].ToString() %>
                    </td>
                    <td style="border-bottom: 1px solid Gray; text-align: center;">
                        <%=dt.Rows[i]["XingBie"].ToString() %>
                    </td>
                    <td style="border-bottom: 1px solid Gray; text-align: center;">
                        <%=dt.Rows[i]["NianLing"].ToString() %>
                    </td>
                    <td style="border-bottom: 1px solid Gray; text-align: center;">
                        <%=dt.Rows[i]["YuanXi"].ToString()%>
                    </td>
                    <td style="border-bottom: 1px solid Gray; text-align: center;">
                        <%=dt.Rows[i]["ZhuanYe"].ToString()%>
                    </td>
                    <td style="border-bottom: 1px solid Gray; text-align: center;">
                        <%=dt.Rows[i]["BanJi"].ToString()%>
                    </td>
                    <td style="border-bottom: 1px solid Gray; text-align: center;">
                    </td>
                </tr>
                <%}

                    }
                    else
                    { %>
                <tr height="25">
                    <td style="border-bottom: 1px solid Gray; text-align: center; color: Red;" colspan="11">
                        当前没有数据！
                    </td>
                </tr>
                <%}%>
                <tr height="25">
                    <td colspan="11">
                        &nbsp;
                    </td>
                </tr>
            </tbody>
        </table>
        <br />
        <div id="divFoot" style="text-align: center;">
            <input type="button" onclick="$('#divFoot').hide();window.print();$('#divFoot').show()"
                value="打印" />&nbsp;&nbsp;
            <input type="button" onclick="window.location.href='KaoChangLieBiao.aspx'" value="返回列表" />&nbsp;&nbsp;
        </div>
    </div>
    </form>
</body>
</html>
