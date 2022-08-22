<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="pages_Register" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="../Scripts/ligerUI/skins/Aqua/css/ligerui-all.css" rel="stylesheet" type="text/css" />
    <link href="../Scripts/miniui/themes/default/miniui.css" rel="stylesheet" type="text/css" />
    <link href="../Scripts/miniui/themes/icons.css" rel="stylesheet" type="text/css" />
    <title>注册</title>
    <script type="text/javascript" src="../Scripts/jquery-1.4.1.min.js"></script>
    <script type="text/javascript" src="../Scripts/ligerUI/js/core/base.js"></script>
    <script type="text/javascript" src="../Scripts/ligerUI/js/ligerui.min.js"></script>
    <script src="../Scripts/miniui/miniui.js" type="text/javascript"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table cellspacing="5" cellpadding="2">
            <tbody>
                <tr>
                    <td colspan="4">
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td style="width: 70px; text-align: center;">
                        学号：
                    </td>
                    <td style="width: 150px; text-align: center;">
                        <asp:TextBox ID="txtXueHao" name="txtXueHao" Style="width: 150px" runat="server"></asp:TextBox>
                    </td>
                    <td style="width: 70px; text-align: center;">
                        年龄：
                    </td>
                    <td style="width: 150px; text-align: center;">
                        <input type="text" id="txtNianLing" name="txtNianLing" value="20" style="width: 150px" />
                    </td>
                </tr>
                <tr>
                    <td colspan="4">
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td style="width: 70px; text-align: center;">
                        姓名：
                    </td>
                    <td style="width: 150px; text-align: center;">
                        <input type="text" id="XingMing" name="XingMing" value="" style="width: 150px" />
                    </td>
                    <td style="width: 70px; text-align: center;">
                        性别：
                    </td>
                    <td style="width: 150px; text-align: left;">
                        <input id="rbtnl_0" type="radio" name="rbtnl" value="1" checked="checked" /><label
                            for="rbtnl_0">男</label>&nbsp;&nbsp;&nbsp;&nbsp;
                        <input id="rbtnl_1" type="radio" name="rbtnl" value="2" /><label for="rbtnl_1">女</label>
                    </td>
                </tr>
                <tr>
                    <td colspan="4">
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td style="width: 70px; text-align: center;">
                        密码：
                    </td>
                    <td style="width: 150px; text-align: center;">
                        <input type="password" id="txtMiMa" name="txtMiMa" value="" style="width: 150px" />
                    </td>
                    <td style="width: 70px; text-align: center;">
                        确认密码：
                    </td>
                    <td style="width: 150px; text-align: center;">
                        <input type="password" id="txtQueRenMiMa" name="txtQueRenMiMa" value="" style="width: 150px" />
                    </td>
                </tr>
                <tr>
                    <td colspan="4">
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td style="width: 70px; text-align: center;">
                        学院：
                    </td>
                    <td style="width: 150px; text-align: center;">
                        <select id="sltYuanXi" name="sltYuanXi" style="width: 150px;">
                            <option selected="selected">==请选择==</option>
                        </select>
                    </td>
                    <td style="width: 70px; text-align: center;">
                        专业：
                    </td>
                    <td style="width: 150px; text-align: center;">
                        <select id="sltZhuanYe" name="sltZhuanYe" style="width: 150px;">
                            <option value="-1">==请选择==</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td colspan="4">
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td style="width: 70px; text-align: center;">
                        班级：
                    </td>
                    <td style="width: 150px; text-align: center;">
                        <select id="sltBanJi" name="sltBanJi" style="width: 150px;">
                            <option selected="selected" value="-1">==请选择==</option>
                        </select>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
    <script type="text/javascript">

        $(function () {
            $("#XingMing").ligerTextBox({}); //姓名
            $("#txtXueHao").ligerTextBox({}); //学号
            $("#txtMiMa").ligerTextBox({}); //密码
            $("#txtQueRenMiMa").ligerTextBox({}); //确认密码
            $("#txtNianLing").ligerSpinner({ type: 'int' }); //年龄
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
            //自动生成学号
            GetXueHao();


        });

        function GetXueHao() {
            $.ajax({
                type: 'post',
                async: false,
                url: 'Register.aspx',
                data: 'funType=GetRows',
                success: function (data) {
                    $("#txtXueHao").val(data);
                }
            });
        }

        //绑定班级
        function BindBanJi(_ZhuanYeID) {
            if (_ZhuanYeID != "-1") {
                $.ajax({
                    type: 'post',
                    async: false,
                    url: 'Register.aspx',
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
                    url: 'Register.aspx',
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
                url: 'Register.aspx',
                data: 'funType=BindXiBie',
                success: function (data) {
                    $("#sltYuanXi").html("").html(data);
                }
            });
        }

        /*保存数据*/
        function SaveData() {
            var _XueHao = $.trim($("#txtXueHao").val()); //学好
            var _XingMing = $.trim($("#XingMing").ligerGetTextBoxManager().getValue()); //姓名
            var _XingBie = $("#rbtnl_0").attr("checked") ? "男" : "女"; //性别
            var _NianLing = $.trim($("#txtNianLing").val()); //年龄
            var _MiMa = $.trim($("#txtMiMa").val()); //密码
            var _QueRenMiMa = $.trim($("#txtQueRenMiMa").val()); //确认密码
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

            //判空
            if (_XueHao.length == 0) {
                $.ligerDialog.waitting('<div style=\'color:red;font-size:15px;text-align:center;\'>学号不得为空</div>');
                setTimeout(function () { $.ligerDialog.closeWaitting(); }, 1000);
                $("#txtXueHao").focus();
                return;
            }
            if (_XingMing.length == 0) {
                $.ligerDialog.waitting('<div style=\'color:red;font-size:15px;text-align:center;\'>姓名不得为空</div>');
                setTimeout(function () { $.ligerDialog.closeWaitting(); }, 1000);
                $("#XingMing").focus();
                return;
            }
            if (_MiMa.length == 0) {
                $.ligerDialog.waitting('<div style=\'color:red;font-size:15px;text-align:center;\'>密码不得为空</div>');
                setTimeout(function () { $.ligerDialog.closeWaitting(); }, 1000);
                $("#txtMiMa").focus();
                return;
            }
            if (_QueRenMiMa.length == 0) {
                $.ligerDialog.waitting('<div style=\'color:red;font-size:15px;text-align:center;\'>确认密码不得为空</div>');
                setTimeout(function () { $.ligerDialog.closeWaitting(); }, 1000);
                $("#txtQueRenMiMa").focus();
                return;
            }
            if (_QueRenMiMa != _MiMa) {
                $.ligerDialog.waitting('<div style=\'color:red;font-size:15px;text-align:center;\'>密码输入不一致</div>');
                setTimeout(function () { $.ligerDialog.closeWaitting(); }, 1000);
                $("#txtQueRenMiMa").focus();
                return;
            }
            if ($.trim($("#sltYuanXi").val()) == "-1") {
                $.ligerDialog.waitting('<div style=\'color:red;font-size:15px;text-align:center;\'>请选择所在学院</div>');
                setTimeout(function () { $.ligerDialog.closeWaitting(); }, 1000);
                $("#sltYuanXi").focus();
                return;
            }
            if ($.trim($("#sltZhuanYe").val()) == "-1") {
                $.ligerDialog.waitting('<div style=\'color:red;font-size:15px;text-align:center;\'>请选择所在专业</div>');
                setTimeout(function () { $.ligerDialog.closeWaitting(); }, 1000);
                $("#sltZhuanYe").focus();
                return;
            }
            if ($.trim($("#sltBanJi").val()) == "-1") {
                $.ligerDialog.waitting('<div style=\'color:red;font-size:15px;text-align:center;\'>请选择所在班级</div>');
                setTimeout(function () { $.ligerDialog.closeWaitting(); }, 1000);
                $("#sltBanJi").focus();
                return;
            }
            //学好$姓名$性别$年龄$密码$确认密码$学院$专业$班级
            var _params = _XueHao + "$" + _XingMing + "$" + _XingBie + "$" + _NianLing + "$" + _MiMa + "$" + _QueRenMiMa + "$" + _sltYuanXi + "$" + _sltZhuanYe + "$" + _sltBanJi;
            //保存数据
            $.ajax({
                type: 'post',
                async: false,
                url: 'Register.aspx',
                data: 'funType=saveData&params=' + _params,
                success: function (data) {
                    window.parent.windowRegister.close();
                }
            });
        }
    </script>
    </form>
</body>
</html>
