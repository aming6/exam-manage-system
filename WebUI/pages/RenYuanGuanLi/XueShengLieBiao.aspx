<%@ Page Language="C#" AutoEventWireup="true" CodeFile="XueShengLieBiao.aspx.cs"
    Inherits="pages_RenYuanGuanLi_XueShengLieBiao" %>

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
    <title>考生列表</title>
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
                    <a class="mini-button" onclick="btnAdd" iconcls="icon-add" plain="true">录入考生</a>
                </td>
                <td align="right">
                    查询类别：
                    <select id="sltField" style="width: 80px;">
                        <option selected="selected" value="">全部</option>
                        <option value="XingMing">姓名</option>
                        <option value="XueHao">学号</option>
                        <option value="XingBie">性别</option>
                        <option value="NianLing">年龄</option>
                        <option value="YuanXi">学院</option>
                        <option value="ZhuanYe">专业</option>
                        <option value="BanJi">班级</option>
                        <option value="KaoChangDaiMa">考场代码</option>
                    </select>
                    &nbsp;&nbsp;
                    <input id="key" class="mini-textbox" emptytext="请输入关键字" style="width: 150px;" onenter="onKeyEnter" />
                    <a class="mini-button" plain="true" iconcls="icon-search" onclick="search()">查询</a>
                </td>
            </tr>
        </table>
    </div>
    <div id="datagrid1" class="mini-datagrid" style="width: 100%; height: 300px; border-top: 0px;"
        allowresize="false" url="XueShengLieBiao.aspx?funType=GetXueSheng" idfield="ID">
        <div property="columns">
            <div name="action" width="70" headeralign="center" align="center" renderer="onActionRenderer"
                cellstyle="padding:0;" align="center" headeralign="center">
                #</div>
            <div field="KaoChangDaiMa" width="60" align="center" headeralign="center" align="center">
                考场代码
            </div>
            <div field="XueHao" width="60" align="center" headeralign="center" align="center">
                学号
            </div>
            <div field="XingMing" width="30" align="center" headeralign="center">
                姓名
            </div>
            <div field="XingBie" width="20" headeralign="center" align="center">
                性别
            </div>
            <div field="NianLing" width="20" headeralign="center" align="center">
                年龄
            </div>
            <div field="YuanXi" headeralign="center" align="center">
                学院
            </div>
            <div field="ZhuanYe" headeralign="center" align="center">
                专业
            </div>
            <div field="BanJi" width="40" headeralign="center" align="center">
                班级
            </div>
            <div field="KaoChang" visible="false" headeralign="center" align="center">
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
            var s = ' <a class="Delete_Button" href="javascript:KaoChangMingXi(\'' + uid + '\')">考场明细</a>';
            s += ' <a class="Delete_Button" href="javascript:editRow(\'' + uid + '\')">编辑</a>';
            s += ' <a class="Delete_Button" href="javascript:delRow(\'' + uid + '\')">删除</a>';
            return s;
        }
        //编辑
        function editRow(row_uid) {
            var row = grid.getRowByUID(row_uid);
            mini.open({
                iconCls: "icon-edit",
                url: "EditXueSheng.aspx",
                title: "修改考生",
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
        //查看考场明细
        function KaoChangMingXi(row_uid) {
            var row = grid.getRowByUID(row_uid);
            if (row) {
                mini.open({
                    iconCls: "icon-search",
                    url: "KaoChangMingXi.aspx",
                    title: "考场明细",
                    width: 450,
                    height: 350,
                    onload: function () {
                        //页面加载后的数据
                        var iframe = this.getIFrameEl();
                        var data = { id: row.KaoChang };
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
        //添加考生
        function btnAdd(e) {
            mini.open({
                iconCls: "icon-add",
                url: "AddXueSheng.aspx",
                title: "添加考生",
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
        //删除
        function delRow(row_uid) {
            var row = grid.getRowByUID(row_uid);
            if (row) {
                mini.confirm("确定要删除考生【" + row.XingMing + "】吗？", "删除", function (action) {
                    if (action == "ok") {
                        $.ajax({
                            url: "XueShengLieBiao.aspx?funType=Remove&id=" + row.ID,
                            success: function (text) {
                                grid.reload();
                            },
                            error: function () {
                            }
                        });
                    }
                });
            }
        }
    </script>
    </form>
</body>
</html>
