<%@ Page Language="C#" AutoEventWireup="true" CodeFile="KaoChangLieBiao.aspx.cs"
    Inherits="pages_XuanYuanGuanLi_WenTiLieBiao" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="../../Scripts/miniui/themes/default/miniui.css" rel="stylesheet" type="text/css" />
    <link href="../../Scripts/miniui/themes/icons.css" rel="stylesheet" type="text/css" />
    <link href="../../Scripts/ligerUI/skins/Aqua/css/ligerui-dialog.css" rel="stylesheet"
        type="text/css" />
    <style type="text/css">
        *
        {
            font-size: 12px;
        }
        .New_Button, .Edit_Button, .Delete_Button, .Update_Button, .Cancel_Button
        {
            font-size: 11px;
            color: #1B3F91;
            font-family: Verdana;
            margin-right: 5px;
        }
    </style>
    <title>考场列表</title>
    <script src="../../Scripts/jquery-1.4.1.min.js" type="text/javascript"></script>
    <script src="../../Scripts/miniui/miniui.js" type="text/javascript"></script>
    <script type="text/javascript" src="../../Scripts/ligerUI/js/core/base.js"></script>
    <script type="text/javascript" src="../../Scripts/ligerUI/js/ligerui.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div class="mini-toolbar" style="border-bottom: 0px;">
        <table cellpadding="0" cellspacing="0" style="width: 100%;">
            <tr>
                <td style="width: 100px;" align="left">
                    <a class="mini-button" onclick="btnAdd();" iconcls="icon-add" plain="true">编排考场</a>
                </td>
                <td align="right">
                    查询类别：
                    <select id="sltField" style="width: 80px;">
                        <option selected="selected" value="">全部</option>
                        <option value="KaoChangDaiMa">考场代码</option>
                        <option value="DiDian">考场地点</option>
                        <option value="RenShu">考场人数</option>
                        <option value="JianKaoJiaoShi">监考老师</option>
                        <option value="KaoShiKeMu">考试科目</option>
                    </select>
                    &nbsp;&nbsp;
                    <input id="key" class="mini-textbox" emptytext="请输入关键字" style="width: 150px;" onenter="onKeyEnter" />
                    <a class="mini-button" plain="true" iconcls="icon-search" onclick="search()">查询</a>
                </td>
            </tr>
        </table>
    </div>
    <div id="datagrid1" class="mini-datagrid" style="width: 100%; height: 300px; border-top: 0px;"
        allowresize="false" url="KaoChangLieBiao.aspx?funType=GetData" idfield="ID">
        <div property="columns">
            <div name="action" width="40" headeralign="center" align="center" renderer="onActionRenderer"
                cellstyle="padding:0;" align="center" headeralign="center">
                #</div>
            <div field="KaoChangDaiMa" width="30" align="center" headeralign="center" align="center">
                考场代码
            </div>
            <div field="DiDian" width="30" align="center" headeralign="center">
                考场地点
            </div>
            <div field="RenShu" width="20" headeralign="center" align="center">
                考场人数
            </div>
            <div field="KaoShiKeMu" width="20" headeralign="center" align="center">
                考试科目
            </div>
            <div field="JianKaoJiaoShi" width="20" headeralign="center" align="center">
                监考教师
            </div>
            <div field="KaiShiShiJian" allowsort="true" dateformat="yyyy-MM-dd HH:mm" width="20"
                headeralign="center" align="center">
                开始时间
            </div>
            <div field="JieSuShiJian" allowsort="true" dateformat="yyyy-MM-dd HH:mm" width="20"
                headeralign="center" align="center">
                结束时间
            </div>
        </div>
    </div>
    <script type="text/javascript">
        mini.parse();
        var grid = mini.get("datagrid1");
        grid.load();
        grid.sortBy("id", "desc");
        $(function () {
            $("#sltField").change(function () {
                search();
            });
        });
        /*#操作列*/
        function onActionRenderer(e) {
            var grid = e.sender;
            var record = e.record;
            var uid = record._uid;
            var rowIndex = e.rowIndex;
            var s = ' <a class="Delete_Button" href="javascript:delRow(\'' + uid + '\')">删除</a>&nbsp;&nbsp;';
            s += ' <a class="Delete_Button" href="javascript:editRow(\'' + uid + '\')">编辑</a>&nbsp;&nbsp;';
            s += ' <a class="Delete_Button" href="javascript:KaoShengMingDanRow(\'' + uid + '\')">考生名单</a>&nbsp;&nbsp;';
            s += ' <a class="Delete_Button" href="javascript:KaoChangZhuoTieRow(\'' + uid + '\')">考场桌帖</a>&nbsp;&nbsp;';
            return s;
        }
        //考生名单
        function KaoShengMingDanRow(row_uid) {
            var row = grid.getRowByUID(row_uid);
            window.location.href = encodeURI("KaoShengMingDan.aspx?KaoChangDaiMa=" + row.KaoChangDaiMa + '&DiDian=' + row.DiDian);
        }
        //考生桌贴
        function KaoChangZhuoTieRow(row_uid) {
            var row = grid.getRowByUID(row_uid);
            window.location.href = encodeURI("KaoChangZhuoTie.aspx?KaoChangDaiMa=" + row.KaoChangDaiMa + '&DiDian=' + row.DiDian);
        }
        //编辑
        function editRow(row_uid) {
            var row = grid.getRowByUID(row_uid);
            if (row) {
                mini.open({
                    iconCls: "icon-edit",
                    url: "EditKaoChang.aspx",
                    title: "修改考场",
                    width: 450,
                    height: 350,
                    onload: function () {
                        //页面加载后的数据
                        var iframe = this.getIFrameEl();
                        var data = { id: row.ID };
                        iframe.contentWindow.SetData(data);
                    },
                    ondestroy: function (action) {
                        if (action == "1") {
                            grid.reload();
                        }
                    }
                });
            }
        }
        //删除
        function delRow(row_uid) {
            var row = grid.getRowByUID(row_uid);
            if (row) {
                mini.confirm("确定要删除考场【" + row.KaoChangDaiMa + "】吗？", "删除", function (data) {
                    if ("ok" == data) {
                        $.ajax({
                            url: 'KaoChangLieBiao.aspx?funType=Remove&id=' + row.ID,
                            success: function () {
                                grid.reload();
                            }
                        });
                    }
                });
            }
        }
        //编排考场
        function btnAdd() {
            mini.open({
                iconCls: "icon-add",
                url: "AddKaoChang.aspx",
                title: "编排考场",
                width: 450,
                height: 350,
                onload: function () {
                    //页面加载后的数据
                },
                ondestroy: function (action) {
                    if (action == "1") {
                        grid.reload();
                    }
                }
            });
        }
        /*查询*/
        function search() {
            var key = mini.get("key").getValue();
            var strWhere = "";

            if ($.trim($("#sltField").val()).length != 0) {
                strWhere = " where " + $.trim($("#sltField").val()) + " like '%" + key + "%'";

                mini.get("key").enable();
            }
            else {
                mini.get("key").disable();
            }
            grid.load({ key: strWhere });
        }
        function onKeyEnter(e) {
            search();
        }
    </script>
    </form>
</body>
</html>
