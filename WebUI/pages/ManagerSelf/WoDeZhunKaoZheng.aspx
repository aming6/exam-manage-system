<%@ Page Language="C#" AutoEventWireup="true" CodeFile="WoDeZhunKaoZheng.aspx.cs"
    Inherits="pages_ManagerSelf_WoYaoLiuYan" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>我的准考证</title>
    <script type="text/javascript" src="../../Scripts/jquery-1.4.1.min.js"></script>
    <script type="text/javascript">
        $(function () {
            window.print();
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table cellpadding="0" cellspacing="5" style="border: 1px solid Gray; width: 360px;
            padding: 5px; margin: 0 auto;">
            <tbody>
                <tr height="25">
                    <td colspan="2" style="color: Black; font-weight: bold; border-bottom: 1px solid Gray;">
                        考试准考证
                    </td>
                </tr>
                <tr>
                    <td>
                        学号：
                    </td>
                    <td>
                        <%=Session["XueHao"].ToString()%>
                    </td>
                </tr>
                <tr>
                    <td>
                        姓名：
                    </td>
                    <td>
                        <%=Session["Name"].ToString()%>
                    </td>
                </tr>
                <tr>
                    <td>
                        性别：
                    </td>
                    <td>
                        <%=Session["XingBie"].ToString()%>
                    </td>
                </tr>
                <tr>
                    <td>
                        考场：
                    </td>
                    <td>
                        <%=Session["KaoChangDaiMa"].ToString()%>
                    </td>
                </tr>
                <tr>
                    <td style="font-weight: bold;">
                        考试时间：
                    </td>
                    <td>
                        <div id="KaoShiJian">
                            <%=KaoShiShiJian%>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td style="font-weight: bold;">
                        考试地点：
                    </td>
                    <td>
                        <div id="DiDian">
                            <%=DiDian %>
                        </div>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
    </form>
</body>
</html>
