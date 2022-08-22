<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AddJiaoShi.aspx.cs" Inherits="pages_RenYuanGuanLi_AddorEditJiaoShi" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="../../Scripts/ligerUI/skins/Aqua/css/ligerui-all.css" rel="stylesheet"
        type="text/css" />
    <link href="../../Scripts/miniui/themes/default/miniui.css" rel="stylesheet" type="text/css" />
    <link href="../../Scripts/miniui/themes/icons.css" rel="stylesheet" type="text/css" />
    <title>新增教师</title>
    <script type="text/javascript" src="../../Scripts/jquery-1.4.1.min.js"></script>
    <script type="text/javascript" src="../../Scripts/ligerUI/js/core/base.js"></script>
    <script type="text/javascript" src="../../Scripts/ligerUI/js/ligerui.min.js"></script>
    <script src="../../Scripts/miniui/miniui.js" type="text/javascript"></script>
</head>
<body style="padding: 0px; margin: 0px;">
    <form id="form1" runat="server">
    <div>
        <table cellspacing="5" cellpadding="2" style="width: 300px;">
            <tbody>
                <tr style="height: 15px;">
                    <td colspan="4">
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td style="width: 70px; text-align: center;">
                        教师编号：
                    </td>
                    <td style="text-align: center;">
                        <asp:TextBox ID="txtJiaoShiBianHao" name="txtJiaoShiBianHao" Style="width: 150px"
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
                        教师姓名：
                    </td>
                    <td style="text-align: center;">
                        <input type="text" id="txtJiaoShiXingMing" name="txtJiaoShiXingMing" value="" style="width: 150px" />
                    </td>
                </tr>
                <tr style="height: 15px;">
                    <td colspan="4">
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td style="width: 70px; text-align: center;">
                        学院：
                    </td>
                    <td>
                        <select id="sltYuanXi" name="sltYuanXi" style="width: 150px;">
                            <option selected="selected">==请选择==</option>
                        </select>
                    </td>
                </tr>
                <tr style="height: 15px;">
                    <td colspan="4">
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td style="width: 70px; text-align: center;">
                        专业：
                    </td>
                    <td>
                        <select id="sltZhuanYe" name="sltZhuanYe" style="width: 150px;">
                            <option value="-1">==请选择==</option>
                        </select>
                    </td>
                </tr>
                <tr style="height: 15px;">
                    <td colspan="4">
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td style="width: 70px; text-align: center;">
                        班级：
                    </td>
                    <td>
                        <select id="sltBanJi" name="sltBanJi" style="width: 150px;">
                            <option selected="selected" value="-1">==请选择==</option>
                        </select>
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
        mini.parse();
        $(function () {
            $("#txtJiaoShiXingMing").ligerTextBox({}); //教师姓名
            $("#txtJiaoShiBianHao").ligerTextBox({}); //教师编号
            $("#txtMiMa").ligerTextBox({}); //默认密码
            //自动生成教师编号
            GetJiaoShiBianHao();
            //绑定学院
            BindXieBie();
            //注册学院选择事件
            $("#sltYuanXi").change(function () {
                $(this).children("option").each(function () {
                    if ($(this).attr("selected")) {
                        var _XiBieID = $(this).attr("value");
                        BindZhuanYe(_XiBieID);
                    }
                });
            });
            //注册专业选择事件
            $("#sltZhuanYe").change(function () {
                $(this).children("option").each(function () {
                    if ($(this).attr("selected")) {
                        var _ZhuanYeID = $(this).attr("value");
                        BindBanJi(_ZhuanYeID);
                    }
                });
            });
        });

        /*自动生成教师编号*/
        function GetJiaoShiBianHao() {
            $.ajax({
                type: 'post',
                async: false,
                url: 'AddJiaoShi.aspx',
                data: 'funType=GetRows',
                success: function (data) {
                    $("#txtJiaoShiBianHao").val(data);
                }
            });
        }

        //绑定班级
        function BindBanJi(_ZhuanYeID) {
            if (_ZhuanYeID != "-1") {
                $.ajax({
                    type: 'post',
                    async: false,
                    url: '../Register.aspx',
                    data: 'funType=BindBanJi&ZhuanYeID=' + _ZhuanYeID,
                    success: function (data) {
                        $("#sltBanJi").html("").html(data);
                    }
                });
            }
            else {
                $("#sltBanJi").html("").html("<option value='-1'>==请选择班级==</option>");
            }
        }
        //绑定专业
        function BindZhuanYe(_XieBieID) {
            if (_XieBieID != "-1") {
                $.ajax({
                    type: 'post',
                    async: false,
                    url: '../Register.aspx',
                    data: 'funType=BindZhuanYe&XiBieID=' + _XieBieID,
                    success: function (data) {
                        $("#sltZhuanYe").html("").html(data);
                    }
                });
            }
            else {
                $("#sltZhuanYe").html("").html("<option value='-1'>==请选择学院==</option>");
            }
        }
        /*绑定学院*/
        function BindXieBie() {
            $.ajax({
                type: 'post',
                async: false,
                url: '../Register.aspx',
                data: 'funType=BindXiBie',
                success: function (data) {
                    $("#sltYuanXi").html("").html(data);
                }
            });
        }
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
            var _txtJiaoShiBianHao = $.trim($("#txtJiaoShiBianHao").val()); //教师编号
            var _txtJiaoShiXingMing = $.trim($("#txtJiaoShiXingMing").val()); //教师姓名
            var _sltYuanXi = ""; //学院

            $("#sltYuanXi").children("option").each(function () {
                if ($(this).attr("value") == $.trim($("#sltYuanXi").val())) {
                    _sltYuanXi = $(this).text();
                }
            });
            var _sltZhuanYe = ""; //专业
            $("#sltZhuanYe").children("option").each(function () {
                if ($(this).attr("value") == $.trim($("#sltZhuanYe").val())) {
                    _sltZhuanYe = $(this).text();
                }
            });
            var _sltBanJi = ""; //班级
            $("#sltBanJi").children("option").each(function () {
                if ($(this).attr("value") == $.trim($("#sltBanJi").val())) {
                    _sltBanJi = $(this).text();
                }
            });
            if (_txtJiaoShiXingMing.length == 0) {
                alert("教师姓名不得为空");
                $("#txtJiaoShiXingMing").focus();
                return;
            }
            if ($.trim($("#sltYuanXi").val()) == "-1") {
                alert("请选择所在学院");
                $("#sltYuanXi").focus();
                return;
            }
            if ($.trim($("#sltZhuanYe").val()) == "-1") {
                alert("请选择所在专业");
                $("#sltZhuanYe").focus();
                return;
            }
            if ($.trim($("#sltBanJi").val()) == "-1") {
                alert("请选择所在班级");
                $("#sltBanJi").focus();
                return;
            }
            //教师编号$教师姓名
            var _params = _txtJiaoShiBianHao + "$" + _txtJiaoShiXingMing + "$" + _sltYuanXi + "$" + _sltZhuanYe + "$" + _sltBanJi;
            //保存数据
            $.ajax({
                type: 'post',
                async: false,
                url: 'AddJiaoShi.aspx',
                data: 'funType=saveData&params=' + _params,
                success: function (data) {
                    CloseWindow("1");
                }
            });
        }

    </script>
    </form>
</body>
</html>
