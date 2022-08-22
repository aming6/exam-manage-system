<%@ Page Language="C#" AutoEventWireup="true" CodeFile="KaoChangMingXi.aspx.cs" Inherits="pages_RenYuanGuanLi_KaoChangMingXi" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="../../Scripts/ligerUI/skins/Aqua/css/ligerui-all.css" rel="stylesheet"
        type="text/css" />
    <link href="../../Scripts/miniui/themes/default/miniui.css" rel="stylesheet" type="text/css" />
    <link href="../../Scripts/miniui/themes/icons.css" rel="stylesheet" type="text/css" />
    <title>考场明细</title>
    <script type="text/javascript" src="../../Scripts/jquery-1.4.1.min.js"></script>
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
        <table cellspacing="5" cellpadding="2" style="width: 400px;">
            <tbody>
                <tr style="height: 15px;">
                    <td colspan="4">
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td style="width: 70px; text-align: center;">
                        <label for="KaoChangDaiMa$text">
                            考场代码：</label>
                    </td>
                    <td style="text-align: center;">
                        <input id="KaoChangDaiMa" name="KaoChangDaiMa" class="mini-textbox" required="true"
                            requirederrortext="考场代码不得为空！" enabled="false" />
                    </td>
                    <td style="width: 70px; text-align: center;">
                        <label for="RenShu$text">
                            考场人数：</label>
                    </td>
                    <td style="text-align: center;">
                        <input class="mini-spinner" id="RenShu" name="RenShu" value="30" minvalue="20" maxvalue="35" />
                    </td>
                </tr>
                <tr style="height: 15px;">
                    <td colspan="4">
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td style="width: 70px; text-align: center;">
                        <label for="DiDian$text">
                            监考教师：</label>
                    </td>
                    <td style="text-align: left;" colspan="3">
                        <div id="JianKaoJiaoShi" name="JianKaoJiaoShi" class="mini-combobox" style="width: 320px;"
                            popupwidth="250" textfield="JiaoShiName" valuefield="JiaoShiName" url="../KaoChangGuanLi/AddKaoChang.aspx?funType=GetJiaoShi"
                            value="" multiselect="true" showclose="true" oncloseclick="onCloseClick">
                            <div property="columns">
                                <div header="ID" field="ID">
                                </div>
                                <div header="教师姓名" field="JiaoShiName">
                                </div>
                            </div>
                        </div>
                    </td>
                </tr>
                <tr style="height: 15px;">
                    <td colspan="4">
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td style="width: 70px; text-align: center;">
                        <label for="KaiShiShiJian$text">
                            开考时间：</label>
                    </td>
                    <td style="text-align: center;">
                        <input id="KaiShiShiJian" name="KaiShiShiJian" class="mini-datepicker" text="" format="yyyy-MM-dd H:mm:ss"
                            timeformat="H:mm:ss" ondrawdate="onDrawDate" showtodaybutton="false" showtime="true"
                            showokbutton="true" showclearbutton="false" required="true" requirederrortext="开考时间不得为空！" />
                    </td>
                    <td style="width: 70px; text-align: center;">
                        <label for="JieSuShiJian$text">
                            结束时间：</label>
                    </td>
                    <td style="text-align: center;">
                        <input id="JieSuShiJian" ondrawdate="onDrawDate" name="JieSuShiJian" class="mini-datepicker"
                            text="" format="yyyy-MM-dd H:mm:ss" timeformat="H:mm:ss" showtodaybutton="false"
                            showtime="true" showokbutton="true" showclearbutton="false" required="true" requirederrortext="结束时间不得为空！" />
                    </td>
                </tr>
                <tr style="height: 15px;">
                    <td colspan="4">
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td style="width: 70px; text-align: center;">
                        <label for="DiDian$text">
                            考场地点：</label>
                    </td>
                    <td style="text-align: center;">
                        <input id="DiDian" name="DiDian" class="mini-textbox" required="true" requirederrortext="考场地点不得为空！" />
                    </td>
                    <td style="width: 70px; text-align: center;">
                        <label for="KaoShiKeMu$text">
                            考试科目：</label>
                    </td>
                    <td style="text-align: center;">
                        <input id="KaoShiKeMu" name="KaoShiKeMu" class="mini-combobox" textfield="KeChengName"
                            valuefield="KeChengName" required="true" requirederrortext="考试科目不得为空！" url="../KaoChangGuanLi/AddKaoChang.aspx?funType=GetKeCheng"
                            shownullitem="false" />
                    </td>
                </tr>
                <tr style="height: 15px;">
                    <td colspan="4">
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td colspan="4" align="center" valign="middle">
                        <a class="mini-button" iconcls="icon-cancel" onclick="btnCancel">关闭</a>
                    </td>
                </tr>
            </tbody>
        </table>
        <%--隐藏域--%>
        <input class="mini-textbox" style="display: none;" id="ID" name="ID" />
    </div>
    <script type="text/javascript">
        mini.parse();

        //禁用时间
        function onDrawDate(e) {
            var date = e.date;
            var d = new Date();

            if (date.getTime() < d.getTime()) {
                e.allowSelect = false;
            }
        }
        //监考教师关闭事件
        function onCloseClick(e) {
            var obj = e.sender;
            obj.setText("");
            obj.setValue("");
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
        var Form = new mini.Form("#divForm");

        function SetData(data) {
            //跨页面传递的数据对象，克隆后才可以安全使用
            data = mini.clone(data);
            //批量加载表单数据
            $.ajax({
                type: 'post',
                async: false,
                cache: false,
                data: 'funType=SetData&id=' + data.id,
                url: 'KaoChangMingXi.aspx',
                success: function (text) {
                    var o = mini.decode(text); //将json字符串反序列化json对象
                    Form.setData(o[0]);
                }
            });
        }
    </script>
    </form>
</body>
</html>
