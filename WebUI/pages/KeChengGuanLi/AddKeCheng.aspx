<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AddKeCheng.aspx.cs" Inherits="pages_KeChengGuanLi_AddKeCheng" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="../../Scripts/miniui/themes/default/miniui.css" rel="stylesheet" type="text/css" />
    <link href="../../Scripts/miniui/themes/icons.css" rel="stylesheet" type="text/css" />
    <title>开设课程</title>
    <script src="../../Scripts/jquery-1.4.1.min.js" type="text/javascript"></script>
    <script src="../../Scripts/miniui/miniui.js" type="text/javascript"></script>
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
                        课程名称：
                    </td>
                    <td style="width: 150px; text-align: center;">
                        <asp:TextBox ID="txtKeChengName" name="txtKeChengName" runat="server"></asp:TextBox>
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
                </tr>
                <tr>
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
                    <td style="width: 70px; text-align: center;">
                        班级：
                    </td>
                    <td style="width: 150px; text-align: center;">
                        <select id="sltBanJi" name="sltBanJi" style="width: 150px;">
                            <option selected="selected" value="-1">==请选择==</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td style="width: 70px; text-align: center;">
                        授课人：
                    </td>
                    <td style="width: 150px; text-align: center;">
                        <select id="sltTeacher" name="sltTeacher" style="width: 150px;">
                            <option selected="selected" value="-1">==请选择==</option>
                        </select>
                    </td>
                </tr>
                <tr>
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
            //绑定学院
            BindXieBie();
            //注册学院选择事件
            $("#sltYuanXi").change(function () {
                $(this).children("option").each(function () {
                    if ($(this).attr("selected")) {
                        var _XiBieID = $(this).attr("value");
                        BindZhuanYe(_XiBieID);
                        BindShouKeRen();
                    }
                });
            });
            //注册专业选择事件
            $("#sltZhuanYe").change(function () {
                $(this).children("option").each(function () {
                    if ($(this).attr("selected")) {
                        var _ZhuanYeID = $(this).attr("value");
                        BindBanJi(_ZhuanYeID);
                        BindShouKeRen();
                    }
                });
            });

            //注册班级选择事件
            $("#sltBanJi").change(function () {
                BindShouKeRen();
            });

        });

        /*绑定授课人*/
        function BindShouKeRen() {
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
            var params = {
                "funType": "BindTeacher",
                "YuanXi": _sltYuanXi,
                "ZhuanYe": _sltZhuanYe,
                "BanJi": _sltBanJi
            };
            $.ajax({
                type: 'post',
                async: false,
                url: '../Register.aspx',
                data: params,
                success: function (data) {
                    $("#sltTeacher").html("").html(data);
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
            var _txtJiaoShiXingMing = $.trim($("#txtKeChengName").val()); //课程名称

            //判空
            if (_txtJiaoShiXingMing.length == 0) {
                alert("课程名称不得为空");
                $("#txtKeChengName").focus();
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
            if ($.trim($("#sltTeacher").val()) == "-1") {
                alert("请选择授课人");
                $("#sltTeacher").focus();
                return;
            }
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
            var _sltShouKeRen = ""; //授课人
            $("#sltTeacher").children("option").each(function () {
                if ($(this).attr("value") == $.trim($("#sltTeacher").val())) {
                    _sltShouKeRen = $(this).text();
                }
            });

            //课程名称$学院$专业$班级$授课人$授课人ID
            var _params = _txtJiaoShiXingMing + "$" + _sltYuanXi + "$" + _sltZhuanYe + "$" + _sltBanJi + "$" + _sltShouKeRen + "$" + $.trim($("#sltTeacher").val());
            //保存数据
            $.ajax({
                type: 'post',
                async: false,
                url: 'AddKeCheng.aspx',
                data: 'funType=saveData&params=' + _params,
                success: function (data) {
                    CloseWindow("save");
                }
            });
        }

    </script>
    </form>
</body>
</html>
