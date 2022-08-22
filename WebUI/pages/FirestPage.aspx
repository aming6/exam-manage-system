<%@ Page Language="C#" AutoEventWireup="true" CodeFile="FirestPage.aspx.cs" Inherits="pages_FirestPage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>首页</title>
    <style type="text/css">
        .tbKeCheng td
        {
            padding: 2px;
            margin: 1px;
        }
        .tbKeChengBiao th
        {
            font-weight: bold;
            border: 1px solid black;
            text-align: center;
        }
        .tbKeChengBiao td
        {
            border: 1px solid black;
            text-align: center;
        }
        /*课程表可拖动操作*/
        .proxy
        {
            border: 1px splid #333;
            position: absolute;
            z-index: 4;
            background: #f1f1f1;
        }
        .box
        {
            width: 115px;
            height: 50px;
            border: 2px solid #bbb;
            float: left;
            margin: 5px;
            cursor: move;
        }
        .receive
        {
            border: 1px solid #bbb;
            margin: 1px;
        }
        
        .txt
        {
            margin: 0 auto;
            margin-top: 0px;
            margin-left: 5px;
            width: 60px;
            text-align: center;
            font-weight: bold;
            border: 0px solid #333;
        }
    </style>
    <link href="../Scripts/ligerUI/skins/Aqua/css/ligerui-all.css" rel="stylesheet" type="text/css" />
    <link href="../Scripts/ligerUI/skins/Aqua/css/ligerui-menu.css" rel="stylesheet"
        type="text/css" />
    <script type="text/javascript" src="../Scripts/jquery-1.4.1.min.js"></script>
    <script type="text/javascript" src="../Scripts/ligerUI/js/core/base.js"></script>
    <script type="text/javascript" src="../Scripts/ligerUI/js/ligerui.all.js"></script>
    <script type="text/javascript" src="../Scripts/ligerUI/js/plugins/ligerDrag.js"></script>
    <script type="text/javascript">
        function itemclick(item) {
            alert(item.text);
        }
        $(function () {
            $(".box").ligerDrag({
                proxy: 'clone',
                revert: true,
                receive: '.receive',
                onStartDrag: function () {
                    this.set({ cursor: "not-allowed" });
                },
                onDragEnter: function (receive, source, e) {
                    this.set({ cursor: "pointer" });
                    //this.proxy.html("释放注入颜色");
                },
                onDragLeave: function (receive, source, e) {
                    this.set({ cursor: "not-allowed" });
                    //this.proxy.html("");
                },
                onDrop: function (receive, source, e) {
                    if (!this.proxy) return;
                    this.proxy.hide();

                    var bgcolor = this.proxy.css('backgroundColor');
                    if (this.target.hasClass("receive")) {
                        //颜色调换
                        this.target.css("backgroundColor", $(receive).css("backgroundColor"));
                    }
                    $(receive).css("backgroundColor", bgcolor);
                    $(receive).attr("title", source.find(".txt").val());
                    $(receive).find(".txt").val(source.find(".txt").val());
                    var $d = $(receive).find(".txt");
                    var $KeChengMingCheng = $.trim(source.find(".txt").val());
                    var $YanCe = bgcolor;
                    var $LieBianHao = $d.parent("td").attr("id");
                    var $KeChengBianHao = $d.attr("id");
                    var _params = $KeChengMingCheng + "$" + $YanCe + "$" + $LieBianHao + "$" + $KeChengBianHao;
                    saveKeChengInfo(_params);
                }
            });
            loadKeChengInfo();
        });
        /*保存课程表信息*/
        function saveKeChengInfo(_params) {
            var _IsSuccess = false;
            $.ajax({
                type: 'post',
                async: false,
                url: 'FirestPage.aspx',
                data: 'funType=saveKeChengInfo&params=' + _params,
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
        /*加载课程信息*/
        function loadKeChengInfo() {
            $.ajax({
                type: 'post',
                async: false,
                url: 'FirestPage.aspx',
                data: 'funType=loadKeChengInfo',
                success: function (data) {
                    if ($.trim(data).length != 0) {
                        var Rows = data.split('$');
                        var Columns = "";
                        var $KeChengMingCheng = "";
                        var $YanSe = "";
                        var $LieHao = "";
                        var $KeChengBianHao = "";
                        for (var i = 0; i < Rows.length - 1; i++) {
                            //课程名称|颜色|列号|课程编号
                            $KeChengMingCheng = Rows[i].split('|')[0];
                            $YanSe = Rows[i].split('|')[1];
                            $LieHao = Rows[i].split('|')[2];
                            $KeChengBianHao = Rows[i].split('|')[3];
                            $("#" + $LieHao).css("background-color", $YanSe);
                            $("#" + $KeChengBianHao).val($KeChengMingCheng);
                        }

                        $(".receive").each(function () {
                            var $title = $(this).children("input:eq(0)");
                            $(this).attr("title", $title.val());
                        });
                    }

                }
            });
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <br />
        <br />
        <table cellpadding="3" cellspacing="5" style="width: 100%; padding: 5px;">
            <tr>
                <td>
                    <div>
                        <table class="tbKeCheng" style="margin: 0 auto;" cellpadding="2" cellspacing="2">
                            <tbody>
                                <tr>
                                    <td class="box" style="background-color: #A6DBD8;">
                                        <input class="txt" type="text" value="大学语文" />
                                    </td>
                                    <td class="box" style="background-color: #AFCCF1;">
                                        <input class="txt" type="text" value="高等数学" />
                                    </td>
                                    <td class="box" style="background-color: #DA9188;">
                                        <input class="txt" type="text" value="大学英语" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="box" style="background-color: #9CD88A;">
                                        <input class="txt" type="text" value="大学物理" />
                                    </td>
                                    <td class="box" style="background-color: #D09CC5;">
                                        <input class="txt" type="text" value="C语言" />
                                    </td>
                                    <td class="box" style="background-color: #E2DC6B;">
                                        <input class="txt" type="text" value="JAVA" />
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </td>
                <td style="width: 40%;">
                    <div id="dateTime" style="width: 100%; float: right; overflow: hidden; border: 1px solid #A3C0E8;">
                        <div title="课程表" style="height: 300px">
                            <div id="toptoolbar">
                            </div>
                            <table class="tbKeChengBiao" style="width: 100%; height: 250px" align="center">
                                <tbody>
                                    <tr>
                                        <th style="border: 0px;">
                                            &nbsp;
                                        </th>
                                        <th style="border-left: 0px; border-right: 0px; border-top: 0px;">
                                            周一
                                        </th>
                                        <th style="border-left: 0px; border-right: 0px; border-top: 0px;">
                                            周二
                                        </th>
                                        <th style="border-left: 0px; border-right: 0px; border-top: 0px;">
                                            周三
                                        </th>
                                        <th style="border-left: 0px; border-right: 0px; border-top: 0px;">
                                            周四
                                        </th>
                                        <th style="border-left: 0px; border-right: 0px; border-top: 0px;">
                                            周五
                                        </th>
                                        <th style="border-left: 0px; border-right: 0px; border-top: 0px;">
                                            周六
                                        </th>
                                        <th style="border-left: 0px; border-right: 0px; border-top: 0px;">
                                            周日
                                        </th>
                                    </tr>
                                    <tr>
                                        <td rowspan="4">
                                            上<br />
                                            <br />
                                            午
                                        </td>
                                        <td id="td11" class="receive">
                                            <input class="txt" readonly="readonly" id="11" type="text" />
                                        </td>
                                        <td id="td21" class="receive">
                                            <input class="txt" readonly="readonly" id="21" type="text" />
                                        </td>
                                        <td id="td31" class="receive">
                                            <input class="txt" readonly="readonly" id="31" type="text" />
                                        </td>
                                        <td id="td41" class="receive">
                                            <input class="txt" readonly="readonly" id="41" type="text" />
                                        </td>
                                        <td id="td51" class="receive">
                                            <input class="txt" readonly="readonly" id="51" type="text" />
                                        </td>
                                        <td id="td61" class="receive">
                                            <input class="txt" readonly="readonly" id="61" type="text" />
                                        </td>
                                        <td id="td71" class="receive">
                                            <input class="txt" readonly="readonly" id="71" type="text" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td id="td12" class="receive">
                                            <input class="txt" readonly="readonly" id="12" type="text" />
                                        </td>
                                        <td id="td22" class="receive">
                                            <input class="txt" readonly="readonly" id="22" type="text" />
                                        </td>
                                        <td id="td32" class="receive">
                                            <input class="txt" readonly="readonly" id="32" type="text" />
                                        </td>
                                        <td id="td42" class="receive">
                                            <input class="txt" readonly="readonly" id="42" type="text" />
                                        </td>
                                        <td id="td52" class="receive">
                                            <input class="txt" readonly="readonly" id="52" type="text" />
                                        </td>
                                        <td id="td62" class="receive">
                                            <input class="txt" readonly="readonly" id="62" type="text" />
                                        </td>
                                        <td id="td72" class="receive">
                                            <input class="txt" readonly="readonly" id="72" type="text" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td id="td13" class="receive">
                                            <input class="txt" readonly="readonly" id="13" type="text" />
                                        </td>
                                        <td id="td23" class="receive">
                                            <input class="txt" readonly="readonly" id="23" type="text" />
                                        </td>
                                        <td id="td33" class="receive">
                                            <input class="txt" readonly="readonly" id="33" type="text" />
                                        </td>
                                        <td id="td43" class="receive">
                                            <input class="txt" readonly="readonly" id="43" type="text" />
                                        </td>
                                        <td id="td53" class="receive">
                                            <input class="txt" readonly="readonly" id="53" type="text" />
                                        </td>
                                        <td id="td63" class="receive">
                                            <input class="txt" readonly="readonly" id="63" type="text" />
                                        </td>
                                        <td id="td73" class="receive">
                                            <input class="txt" readonly="readonly" id="73" type="text" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td id="td14" class="receive">
                                            <input class="txt" readonly="readonly" id="14" type="text" />
                                        </td>
                                        <td id="td24" class="receive">
                                            <input class="txt" readonly="readonly" id="24" type="text" />
                                        </td>
                                        <td id="td34" class="receive">
                                            <input class="txt" readonly="readonly" id="34" type="text" />
                                        </td>
                                        <td id="td44" class="receive">
                                            <input class="txt" readonly="readonly" id="44" type="text" />
                                        </td>
                                        <td id="td54" class="receive">
                                            <input class="txt" readonly="readonly" id="54" type="text" />
                                        </td>
                                        <td id="td64" class="receive">
                                            <input class="txt" readonly="readonly" id="64" type="text" />
                                        </td>
                                        <td id="td74" class="receive">
                                            <input class="txt" readonly="readonly" id="74" type="text" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="8">
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td rowspan="3">
                                            下<br />
                                            <br />
                                            午
                                        </td>
                                        <td id="td15" class="receive">
                                            <input class="txt" readonly="readonly" id="15" type="text" />
                                        </td>
                                        <td id="td25" class="receive">
                                            <input class="txt" readonly="readonly" id="25" type="text" />
                                        </td>
                                        <td id="td35" class="receive">
                                            <input class="txt" readonly="readonly" id="35" type="text" />
                                        </td>
                                        <td id="td45" class="receive">
                                            <input class="txt" readonly="readonly" id="45" type="text" />
                                        </td>
                                        <td id="td55" class="receive">
                                            <input class="txt" readonly="readonly" id="55" type="text" />
                                        </td>
                                        <td id="td65" class="receive">
                                            <input class="txt" readonly="readonly" id="65" type="text" />
                                        </td>
                                        <td id="td75" class="receive">
                                            <input class="txt" readonly="readonly" id="75" type="text" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td id="td16" class="receive">
                                            <input class="txt" readonly="readonly" id="16" type="text" />
                                        </td>
                                        <td id="td26" class="receive">
                                            <input class="txt" readonly="readonly" id="26" type="text" />
                                        </td>
                                        <td id="td36" class="receive">
                                            <input class="txt" readonly="readonly" id="36" type="text" />
                                        </td>
                                        <td id="td46" class="receive">
                                            <input class="txt" readonly="readonly" id="46" type="text" />
                                        </td>
                                        <td id="td56" class="receive">
                                            <input class="txt" readonly="readonly" id="56" type="text" />
                                        </td>
                                        <td id="td66" class="receive">
                                            <input class="txt" readonly="readonly" id="66" type="text" />
                                        </td>
                                        <td id="td76" class="receive">
                                            <input class="txt" readonly="readonly" id="76" type="text" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td id="td17" class="receive">
                                            <input class="txt" readonly="readonly" id="17" type="text" />
                                        </td>
                                        <td id="td27" class="receive">
                                            <input class="txt" readonly="readonly" id="27" type="text" />
                                        </td>
                                        <td id="td37" class="receive">
                                            <input class="txt" readonly="readonly" id="37" type="text" />
                                        </td>
                                        <td id="td47" class="receive">
                                            <input class="txt" readonly="readonly" id="47" type="text" />
                                        </td>
                                        <td id="td57" class="receive">
                                            <input class="txt" readonly="readonly" id="57" type="text" />
                                        </td>
                                        <td id="td67" class="receive">
                                            <input class="txt" readonly="readonly" id="67" type="text" />
                                        </td>
                                        <td id="td77" class="receive">
                                            <input class="txt" readonly="readonly" id="77" type="text" />
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
