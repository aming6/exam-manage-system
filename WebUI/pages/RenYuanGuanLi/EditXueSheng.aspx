<%@ Page Language="C#" AutoEventWireup="true" CodeFile="EditXueSheng.aspx.cs" Inherits="pages_RenYuanGuanLi_EditXueSheng" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="../../Scripts/ligerUI/skins/Aqua/css/ligerui-all.css" rel="stylesheet"
        type="text/css" />
    <link href="../../Scripts/miniui/themes/default/miniui.css" rel="stylesheet" type="text/css" />
    <link href="../../Scripts/miniui/themes/icons.css" rel="stylesheet" type="text/css" />
    <title>编辑学生</title>
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
                    <td colspan="4" style="width: 400px;">
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td style="text-align: center; width: 100px;">
                        <label for="ZhunKaoZhengHao$text">
                            准考证号：</label>
                    </td>
                    <td style="text-align: center;">
                        <input id="ZhunKaoZhengHao" name="ZhunKaoZhengHao" class="mini-textbox" required="true"
                            requirederrortext="准考证号不得为空！" enabled="false" />
                    </td>
                    <td style="text-align: center; width: 100px;">
                        <label for="XueHao$text">
                            学号：</label>
                    </td>
                    <td style="text-align: center;">
                        <input class="mini-textbox" required="true" enabled="false" requirederrortext="学号不得为空！"
                            id="XueHao" name="XueHao" />
                    </td>
                </tr>
                <tr style="height: 15px;">
                    <td colspan="4">
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td style="text-align: center;">
                        <label for="XingMing$text">
                            姓名：</label>
                    </td>
                    <td style="text-align: left;">
                        <input class="mini-textbox" required="true" requirederrortext="姓名不得为空！" id="XingMing"
                            name="XingMing" />
                    </td>
                    <td style="text-align: center;">
                        <label for="NianLing$text">
                            年龄：</label>
                    </td>
                    <td style="text-align: left;">
                        <input class="mini-spinner" required="true" requirederrortext="年龄不得为空！" id="NianLing"
                            name="NianLing" value="男" minvalue="16" maxvalue="24" text="20" />
                    </td>
                </tr>
                <tr style="height: 15px;">
                    <td colspan="4">
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td style="text-align: center;">
                        <label for="XingBie$text">
                            性别：</label>
                    </td>
                    <td style="text-align: left;">
                        <input class="mini-combobox" shownullitem="false" required="true" requirederrortext="性别不得为空！"
                            id="XingBie" name="XingBie" value="男" url="../data/Sex.txt" textfield="text"
                            valuefield="id" />
                    </td>
                    <td style="text-align: center;">
                        <label for="YuanXi$text">
                            学院：</label>
                    </td>
                    <td style="text-align: left;">
                        <input onvaluechanged="onXueYuanChanged" class="mini-combobox" shownullitem="false"
                            required="true" requirederrortext="学院不得为空！" id="YuanXi" name="YuanXi" url=""
                            textfield="XiBieName" valuefield="ID" />
                    </td>
                </tr>
                <tr style="height: 15px;">
                    <td colspan="4">
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td style="text-align: center;">
                        <label for="ZhuanYe$text">
                            专业：</label>
                    </td>
                    <td style="text-align: left;">
                        <input class="mini-combobox" shownullitem="false" required="true" requirederrortext="专业不得为空！"
                            onvaluechanged="onZhuanYeChanged" id="ZhuanYe" name="ZhuanYe" textfield="ZhuanYeName"
                            valuefield="ID" />
                    </td>
                    <td style="text-align: center;">
                        <label for="BanJi$text">
                            班级：</label>
                    </td>
                    <td style="text-align: left;">
                        <input class="mini-combobox" shownullitem="false" required="true" requirederrortext="班级不得为空！"
                            id="BanJi" name="BanJi" textfield="BanJiName" valuefield="ID" />
                    </td>
                </tr>
                <tr style="height: 15px;">
                    <td colspan="4">
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td style="text-align: center;">
                        <label for="KaoChang$text">
                            考场：</label>
                    </td>
                    <td style="text-align: left;">
                        <input onvaluechanged="onKaoChangChanged" class="mini-combobox" shownullitem="false"
                            required="true" requirederrortext="考场不得为空！" id="KaoChang" name="KaoChang" url="AddXueSheng.aspx?funType=GetKaoChang"
                            textfield="KaoChangDaiMa" valuefield="ID" />
                        <input type="text" class="mini-textbox" id="KaoChangDaiMa" name="KaoChangDaiMa" visible="false" />
                    </td>
                    <td style="text-align: center; color: Red;" colspan="2">
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
        <%--隐藏域--%>
        <input class="mini-textbox" style="display: none;" id="ID" name="ID" />
    </div>
    <script type="text/javascript">
        mini.parse();

        var XueYuan = mini.get("YuanXi");
        var ZhuanYe = mini.get("ZhuanYe");
        var BanJi = mini.get("BanJi");
        var KaoChang = mini.get("KaoChang");


        //学院和专业联动
        function onXueYuanChanged(e) {
            var XueYuanID = XueYuan.getValue();
            GetZhuanYeByXueYuanID(XueYuanID);
        }
        //根据学院ID获取专业信息
        function GetZhuanYeByXueYuanID(XueYuanID) {
            ZhuanYe.setValue("");
            var url = "AddXueSheng.aspx?funType=GetZhuanYeByXueYuanID&XueYuanID=" + XueYuanID
            ZhuanYe.setUrl(url);
            ZhuanYe.select(0);
        }

        //专业和班级联动
        function onZhuanYeChanged(e) {
            var ZhuanYeID = ZhuanYe.getValue();
            GetBanJiByZhuanYeID(ZhuanYeID);
        }
        //根据专业ID获取班级信息
        function GetBanJiByZhuanYeID(ZhuanYeID) {
            BanJi.setValue("");
            var url = "AddXueSheng.aspx?funType=GetBanJiByZhuanYeID&ZhuanYeID=" + ZhuanYeID
            BanJi.setUrl(url);
            BanJi.select(0);
        }
        //考场代码联动
        function onKaoChangChanged(e) {
            var KaoChangDaiMa = mini.get("KaoChangDaiMa");
            KaoChangDaiMa.setValue(KaoChang.getText());
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
        /*保存数据*/
        function SaveData() {
            Form.validate();
            if (Form.isValid() == false) return;
            var o = Form.getData();
            var json = mini.encode([o]);
            if (Save(json)) {
                CloseWindow("1");
            }
        }

        /*保存数据*/
        function Save(json) {
            var IsSave = false;
            $.ajax({
                type: 'post',
                async: false,
                data: 'funType=Save&json=' + json,
                url: 'EditXueSheng.aspx',
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

        function SetData(data) {
            //跨页面传递的数据对象，克隆后才可以安全使用
            data = mini.clone(data);
            //批量加载表单数据
            $.ajax({
                type: 'post',
                async: false,
                cache: false,
                data: 'funType=SetData&id=' + data.id,
                url: 'EditXueSheng.aspx',
                success: function (text) {
                    XueYuan.setValue("");
                    var url = "AddXueSheng.aspx?funType=GetXueYuan";
                    XueYuan.setUrl(url);
                    var o = mini.decode(text); //将json字符串反序列化json对象
                    Form.setData(o[0]);
                    XueYuan.setText(o[0].YuanXi);
                    $.ajax({
                        type: 'post',
                        data: 'funType=GetXueYuanID&XueYuanName=' + o[0].YuanXi,
                        url: 'EditXueSheng.aspx',
                        success: function (data) {
                            GetZhuanYeByXueYuanID(data);
                            ZhuanYe.setText(o[0].ZhuanYe);
                            /**/
                            $.ajax({
                                type: 'post',
                                data: 'funType=GetZhuanYeID&ZhuanYeName=' + o[0].ZhuanYe,
                                url: 'EditXueSheng.aspx',
                                success: function (data) {
                                    GetBanJiByZhuanYeID(data);
                                    BanJi.setText(o[0].BanJi);
                                }
                            });
                            /**/
                        }
                    });
                }
            });
        }
    </script>
    </form>
</body>
</html>
