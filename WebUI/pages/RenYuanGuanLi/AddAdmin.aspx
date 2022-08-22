<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AddAdmin.aspx.cs" Inherits="pages_RenYuanGuanLi_AddAdmin" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="../../Scripts/ligerUI/skins/Aqua/css/ligerui-all.css" rel="stylesheet"
        type="text/css" />
    <link href="../../Scripts/miniui/themes/default/miniui.css" rel="stylesheet" type="text/css" />
    <link href="../../Scripts/miniui/themes/icons.css" rel="stylesheet" type="text/css" />
    <title>新增管理员</title>
    <script type="text/javascript" src="../../Scripts/jquery-1.4.1.min.js"></script>
    <script type="text/javascript" src="../../Scripts/ligerUI/js/core/base.js"></script>
    <script type="text/javascript" src="../../Scripts/ligerUI/js/ligerui.min.js"></script>
    <script src="../../Scripts/miniui/miniui.js" type="text/javascript"></script>
    <style type="text/css">
        .txt
        {
            border: 1px solid Gray;
            height: 20px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div id="divForm">
        <table cellspacing="5" cellpadding="2" style="width: 300px;">
            <tbody>
                <tr style="height: 15px;">
                    <td colspan="4">
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td style="width: 70px; text-align: center;">
                        账号：
                    </td>
                    <td style="text-align: center;">
                        <asp:TextBox ID="txtZhangHao" CssClass="txt" name="txtZhangHao" Style="width: 150px"
                            runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr style="height: 15px;">
                    <td colspan="4">
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td style="width: 70px; text-align: center;">
                        密码：
                    </td>
                    <td style="text-align: center;">
                        <asp:TextBox ID="txtMiMa" CssClass="txt" name="txtMiMa" Style="width: 150px" runat="server"
                            Text="888888"></asp:TextBox>
                    </td>
                </tr>
                <tr style="height: 15px;">
                    <td colspan="4">
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td colspan="4" align="center" valign="middle">
                        <a class="mini-button" iconcls="icon-save" onclick="SaveData();">保存</a> &nbsp;&nbsp;
                        <a class="mini-button" iconcls="icon-cancel" onclick="btnCancel">取消</a>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
    <script type="text/javascript">
        $(function () {
            $("#txtZhangHao").focus();
        });

        /*取消*/
        function btnCancel(e) {
            CloseWindow("0");
        }
        /*关闭window时所执行的操作：cancel、save*/
        function CloseWindow(action) {
            if (window.CloseOwnerWindow) window.CloseOwnerWindow(action);
            else window.close();
        }
        /*保存数据*/
        function SaveData() {
            var ZhangHao = $.trim($("#txtZhangHao").val());
            var MiMa = $.trim($("#txtMiMa").val());
            if (0 == ZhangHao.length) {
                alert("账号不得为空！");
                $("#txtZhangHao").focus();
                return;
            }
            if (0 == MiMa.length) {
                alert("密码不得为空！");
                $("#txtMiMa").focus();
                return;
            }
            if (ChkIsExist(ZhangHao)) {
                alert("账号已存在！");
                $("#txtZhangHao").focus();
                $("#txtZhangHao").select();
                return;
            }
            var params = ZhangHao + "!" + MiMa;
            if (Save(params)) {
                CloseWindow("1");
            }
        }

        /*保存数据*/
        function Save(params) {
            var IsSave = false;
            $.ajax({
                type: 'post',
                async: false,
                data: 'funType=Save&params=' + params,
                url: 'AddAdmin.aspx',
                success: function (data) {
                    if ("1" == data) {
                        IsSave = true;
                    }
                    else {
                        IsSave = false;
                    }
                }
            });
            return IsSave;
        }

        /*验证账号是否存在*/
        function ChkIsExist(params) {
            var IsExist = false;
            $.ajax({
                type: 'post',
                async: false,
                data: 'funType=ChkIsExist&params=' + params,
                url: 'AddAdmin.aspx',
                success: function (data) {
                    if ("1" == data) {
                        IsExist = true;
                    }
                    else {
                        IsExist = false;
                    }
                }
            });
            return IsExist;
        }
    </script>
    </form>
</body>
</html>
