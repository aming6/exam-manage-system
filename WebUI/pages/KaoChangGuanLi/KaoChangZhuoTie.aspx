<%@ Page Language="C#" AutoEventWireup="true" CodeFile="KaoChangZhuoTie.aspx.cs"
    Inherits="pages_KaoChangGuanLi_KaoChangZhuoTie" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>考场桌贴</title>
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
        <table cellpadding="5" cellspacing="0" style="border: 0px solid Gray; width: 98%;
            padding: 5px; margin: 0 auto;">
            <tbody>
                <%
                    int cnt = dt.Rows.Count;
                    if (dt != null && cnt > 0)
                    {

                        for (int i = 0; i < cnt; i++)
                        {%>
                <tr>
                    <td>
                        <table cellpadding="0" cellspacing="5" style="border: 1px solid Gray; width: 360px;
                            padding: 5px; margin: 0 auto;">
                            <tbody>
                                <tr height="25">
                                    <td colspan="2" style="color: Black; font-weight: bold; border-bottom: 1px solid Gray;">
                                        考场桌贴
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        学号：
                                    </td>
                                    <td>
                                        <%=dt.Rows[i]["XueHao"].ToString()%>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        座号：
                                    </td>
                                    <td>
                                        <%=i+1%>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        姓名：
                                    </td>
                                    <td>
                                        <%=dt.Rows[i]["XingMing"].ToString()%>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        考场：
                                    </td>
                                    <td>
                                        <%=dt.Rows[i]["KaoChangDaiMa"].ToString()%>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </td>
                </tr>
                <%}
                    }
                    else
                    { %>
                <tr>
                    <td style="color: Red;">
                        当前没有数据！
                    </td>
                </tr>
                <%} %>
            </tbody>
        </table>
    </div>
    <br />
    <div id="divFoot" style="text-align: center;">
        <input type="button" onclick="$('#divFoot').hide();window.print();$('#divFoot').show()"
            value="打印" />&nbsp;&nbsp;
        <input type="button" onclick="window.location.href='KaoChangLieBiao.aspx'" value="返回列表" />&nbsp;&nbsp;
    </div>
    </form>
</body>
</html>
