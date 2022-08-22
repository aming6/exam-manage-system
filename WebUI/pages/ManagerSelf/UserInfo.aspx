<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UserInfo.aspx.cs" Inherits="pages_ManagerSelf_UserInfo" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="../../Scripts/ligerUI/skins/Gray/css/all.css" rel="stylesheet" type="text/css" />
    <link href="../../Scripts/miniui/themes/default/miniui.css" rel="stylesheet" type="text/css" />
    <link href="../../Scripts/miniui/themes/icons.css" rel="stylesheet" type="text/css" />
    <title>个人信息</title>
    <script type="text/javascript" src="../../Scripts/jquery-1.4.1.min.js"></script>
    <script type="text/javascript" src="../../Scripts/ligerUI/js/core/base.js"></script>
    <script type="text/javascript" src="../../Scripts/ligerUI/js/ligerui.min.js"></script>
    <script src="../../Scripts/miniui/miniui.js" type="text/javascript"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table>
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
                    学号：
                </td>
                <td style="width: 150px;">
                    <asp:TextBox  ReadOnly="true" ID="txtXueHao" class="l-text" Style="width: 150px;"
                        runat="server"></asp:TextBox>
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
                    姓名：
                </td>
                <td style="width: 150px;">
                    <asp:TextBox ID="txtXingMing" class="l-text" Style="width: 150px;" runat="server"></asp:TextBox>
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
                    年龄：
                </td>
                <td style="width: 150px;">
                    <asp:TextBox ID="txtNianLing" class="l-text" Style="width: 150px;" runat="server"></asp:TextBox>
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
                    性别：
                </td>
                <td style="width: 150px;">
                    <asp:TextBox ID="txtXingBie" ReadOnly="true" class="l-text" Style="width: 150px;"
                        runat="server"></asp:TextBox>
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
                    学院：
                </td>
                <td style="width: 150px;">
                    <asp:TextBox ReadOnly="true" ID="txtYuanXi" class="l-text" Style="width: 150px;"
                        runat="server"></asp:TextBox>
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
                    专业：
                </td>
                <td style="width: 150px;">
                    <asp:TextBox ReadOnly="true" ID="txtZhuanYe" class="l-text" Style="width: 150px;"
                        runat="server"></asp:TextBox>
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
                    班级：
                </td>
                <td style="width: 150px;">
                    <asp:TextBox ID="txtBanJi" ReadOnly="true" class="l-text" Style="width: 150px;" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <input type="button" value="修改" style="width: 60px;" onclick="btnEdit();" />
                </td>
            </tr>
        </table>
    </div>
    <script type="text/javascript">
        var manager = null;
        $(function () {

        });

        /*修改*/
        function btnEdit() {
            var $txtXingMing = $.trim($("#txtXingMing").val());
            var $txtNianLing = $.trim($("#txtNianLing").val());
            var $txtXingBie = $.trim($("#txtXingBie").val());
            if ($txtXingMing.length == 0) {
                alert("【姓名】不得为空");
                $("#txtXingMing").focus();
                return;
            }
            if ($txtNianLing.length == 0) {
                alert("【年龄】不得为空");
                $("#txtNianLing").focus();
                return;
            }
            if ($txtXingBie.length == 0) {
                alert("【性别】不得为空");
                $("#txtXingBie").focus();
                return;
            }
            var params = {
                "funType": "EditUserInfo",
                "XingMing": $txtXingMing,
                "NianLing": $txtNianLing,
                "XingBie": $txtXingBie
            };
            if (EditUserInfo(params)) {
                mini.alert("修改成功！");
            }
        }

        /*修改个人信息*/
        function EditUserInfo(params) {
            var _IsSuccess = false;
            $.ajax({
                type: 'post',
                async: false,
                url: 'UserInfo.aspx',
                data: params,
                success: function (data) {
                    _IsSuccess = data == "1" ? true : false;
                }
            });
            return _IsSuccess;
        }
    </script>
    </form>
</body>
</html>
