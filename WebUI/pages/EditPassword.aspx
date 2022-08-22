<%@ Page Language="C#" AutoEventWireup="true" CodeFile="EditPassword.aspx.cs" Inherits="pages_EditPassword" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <style type="text/css">
        *
        {
            padding: 0px;
            margin: 0px;
            font-size: 14px;
        }
    </style>
    <title>修改密码</title>
    <link href="../Scripts/ligerUI/skins/Gray/css/form.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../Scripts/jquery-1.4.1.min.js"></script>
    <script type="text/javascript" src="../Scripts/ligerUI/js/core/base.js"></script>
    <script type="text/javascript" src="../Scripts/ligerUI/js/ligerui.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div style="width: 100%;">
        <table cellpadding="2" cellspacing="4" style="width: auto; margin: 0 auto;">
            <tbody>
                <tr>
                    <td style="width: 70px;">
                        &nbsp;
                    </td>
                    <td style="width: 150px;">
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td style="width: 70px;">
                        原来密码：
                    </td>
                    <td style="width: 150px;">
                        <input class="l-text" type="password" style="width: 150px;" id="txtOldPassword" />
                    </td>
                </tr>
                <tr>
                    <td style="width: 70px;">
                        &nbsp;
                    </td>
                    <td style="width: 150px;">
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td style="width: 70px;">
                        新的密码：
                    </td>
                    <td style="width: 150px;">
                        <input class="l-text" type="password" style="width: 150px;" id="txtXinDeMiMa" />
                    </td>
                </tr>
                <tr>
                    <td style="width: 70px;">
                        &nbsp;
                    </td>
                    <td style="width: 150px;">
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td style="width: 70px;">
                        确认密码：
                    </td>
                    <td style="width: 150px;">
                        <input class="l-text" type="password" style="width: 150px;" id="txtQuerRenMiMa" />
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
    <script type="text/javascript">
        /*保存数据*/
        function saveData() {
            var $password = '<%=Session["password"]%>';
            var $role = '<%=Session["role"]%>';
            var $txtOldPassword = $.trim($("#txtOldPassword").val()); //旧密码
            var $txtXinDeMiMa = $.trim($("#txtXinDeMiMa").val()); //新密码
            var $txtQuerRenMiMa = $.trim($("#txtQuerRenMiMa").val()); //确认密码
            if (IsVoid($txtOldPassword)) {
                alert("旧的密码不得为空");
                $("#txtOldPassword").focus();
                return;
            }
            if ($txtOldPassword != $password) {
                alert("旧的密码不正确");
                $("#txtOldPassword").focus();
                $("#txtOldPassword").select();
                return;
            }
            if (IsVoid($txtXinDeMiMa)) {
                alert("新的密码不得为空");
                $("#txtXinDeMiMa").focus();
                return;
            }
            if (IsVoid($txtQuerRenMiMa)) {
                alert("确认密码不得为空");
                $("#txtQuerRenMiMa").focus();
                return;
            }
            if ($txtQuerRenMiMa != $txtXinDeMiMa) {
                alert("密码输入不一致");
                $("#txtQuerRenMiMa").focus();
                $("#txtQuerRenMiMa").select();
                return;
            }
            //更新数据
            if (!ChangePassword($txtXinDeMiMa)) {
                alert("更新失败，请联系开发人员！");
            } else {
                alert("修改成功");
            }
        }
        /*更新密码*/
        function ChangePassword(params) {
            var _IsSuccess = false;
            $.ajax({
                type: 'post',
                async: false,
                url: 'EditPassword.aspx',
                data: 'funType=ChangePassword&params=' + params,
                success: function (data) {
                    if (data == "True") {
                        _IsSuccess = true;
                    }
                    else {
                        _IsSuccess = false;
                    }
                }
            });
            return _IsSuccess;
        }


        /*判断字符串是否为空*/
        function IsVoid(text) {
            var IsSuccess = false;
            if (text == null || text.length == 0) {
                IsSuccess = true;
            }
            else {
                IsSuccess = false;
            }
            return IsSuccess;
        }
    </script>
    </form>
</body>
</html>
