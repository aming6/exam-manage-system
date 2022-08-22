<%@ Page Language="C#" AutoEventWireup="true" CodeFile="KeChengLieBiao.aspx.cs" Inherits="pages_KeChengGuanLi_KeChengLieBiao" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="../../Scripts/miniui/themes/default/miniui.css" rel="stylesheet" type="text/css" />
    <link href="../../Scripts/miniui/themes/icons.css" rel="stylesheet" type="text/css" />
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
    <title>课程列表</title>
    <script src="../../Scripts/jquery-1.4.1.min.js" type="text/javascript"></script>
    <script src="../../Scripts/miniui/miniui.js" type="text/javascript"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <div class="mini-toolbar" style="border-bottom: 0px;">
            <table cellpadding="0" cellspacing="0" style="width: 100%;">
                <tr>
                    <td style="width: 100px;" align="left">
                        <a class="mini-button" onclick="btnAddKeCheng();" iconcls="icon-add" plain="true">开设课程</a>
                    </td>
                    <td align="right">
                        查询类型：
                        <select id="sltChkType">
                            <option selected="selected" value="KeChengName">课程名称</option>
                            <option value="YuanXi">学院</option>
                            <option value="ZhuanYe">专业</option>
                            <option value="BanJi">班级</option>
                            <option value="ShouKeRen">授课人</option>
                        </select>
                        <input id="key" class="mini-textbox" style="width: 150px;" onenter="onKeyEnter" />
                        <a class="mini-button" plain="true" iconcls="icon-search" onclick="search()">查询</a>
                    </td>
                </tr>
            </table>
        </div>
        <div id="datagrid1" class="mini-datagrid" style="width: 100%; height: 300px; border-top: 0px;"
            allowresize="false" url="KeChengLieBiao.aspx?funType=GetKeCheng" idfield="ID">
            <div property="columns">
                <div field="KeChengName" width="40" align="center" headeralign="center" align="center">
                    课程名称
                </div>
                <div field="YuanXi" width="20" align="center" headeralign="center" align="center">
                    学院
                </div>
                <div field="ZhuanYe" width="20" align="center" headeralign="center" align="center">
                    专业
                </div>
                <div field="BanJi" align="center" headeralign="center" align="center">
                    班级
                </div>
                <div field="ShouKeRen" width="40" align="center" headeralign="center" align="center">
                    授课老师
                </div>
                <div name="action" width="70" headeralign="center" align="center" renderer="onActionRenderer"
                    cellstyle="padding:0;" align="center" headeralign="center">
                    #</div>
            </div>
        </div>
    </div>
    <script type="text/javascript">

        mini.parse();

        var grid = mini.get("datagrid1");
        grid.load();
        grid.sortBy("ID", "desc");

        /*#操作列*/
        function onActionRenderer(e) {
            var grid = e.sender;
            var record = e.record;
            var uid = record._uid;
            var rowIndex = e.rowIndex;
            var s = ' <a class="Delete_Button" href="javascript:delRow(\'' + uid + '\')">删除</a>';
            return s;
        }

        /*查询*/
        function search() {
            var key = mini.get("key").getValue();
            var strWhere = " where " + $.trim($("#sltChkType").val()) + " like '%" + key + "%'";
            grid.load({ key: strWhere });
        }
        function onKeyEnter(e) {
            search();
        }

        /*删除课程信息*/
        function delRow(row_uid) {
            var row = grid.getRowByUID(row_uid);
            if (row) {
                mini.confirm("确定要删除课程【" + row.KeChengName + "】吗？", "删除", function (action) {
                    if (action == "ok") {
                        $.ajax({
                            url: "KeChengLieBiao.aspx?funType=RemoveKeChengInfo&id=" + row.ID,
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

        /*新增*/
        function btnAddKeCheng() {
            mini.open({
                iconCls: "icon-add",
                url: "AddKeCheng.aspx",
                title: "开设课程",
                width: 320,
                height: 310,
                onload: function () {
                    //页面加载后的数据
                },
                ondestroy: function (action) {
                    if (action != "0") {
                        grid.reload();
                    }

                }
            });

        }
        
    </script>
    </form>
</body>
</html>
