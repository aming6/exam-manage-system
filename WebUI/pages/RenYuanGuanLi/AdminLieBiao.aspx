<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AdminLieBiao.aspx.cs" Inherits="pages_RenYuanGuanLi_AdminLieBiao" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="../../Scripts/miniui/themes/default/miniui.css" rel="stylesheet" type="text/css" />
    <link href="../../Scripts/miniui/themes/icons.css" rel="stylesheet" type="text/css" />
    <link href="../../Scripts/ligerUI/skins/ligerui-icons.css" rel="stylesheet" type="text/css" />
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
    <title>管理员列表</title>
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
                    <a class="mini-button" onclick="btnAdd" iconcls="icon-add" plain="true">新增</a>
                </td>
                <td align="right">
                    查询类别：
                    <select id="sltField" style="width: 80px;">
                        <option selected="selected" value="">全部</option>
                        <option value="ZhangHao">账号</option>
                        <option value="ChuangJianRen">创建人</option>
                    </select>
                    &nbsp;&nbsp;
                    <input id="key" class="mini-textbox" style="width: 150px;" onenter="onKeyEnter" />
                    <a class="mini-button" plain="true" iconcls="icon-search" onclick="search()">查询</a>
                </td>
            </tr>
        </table>
    </div>
    <div id="datagrid1" class="mini-datagrid" style="width: 100%; height: 300px; border-top: 0px;"
        allowresize="false" url="AdminLieBiao.aspx?funType=GetData" idfield="ID">
        <div property="columns">
            <div name="action" width="20" headeralign="center" align="center" renderer="onActionRenderer"
                cellstyle="padding:0;" align="center" headeralign="center">
                #</div>
            <div field="ZhangHao" width="30" align="center" headeralign="center" align="center">
                账号
            </div>
            <div field="ChuangJianRen" width="30" align="center" headeralign="center">
                创建人
            </div>
            <div field="ChuangJianShiJian" width="30" align="center" allowsort="true" dateformat="yyyy-MM-dd HH:mm:ss"
                headeralign="center">
                创建时间
            </div>
        </div>
    </div>
    <script type="text/javascript">

        mini.parse();

        var grid = mini.get("datagrid1");
        grid.load();
        grid.sortBy("ID", "desc");

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
            var s = ' <a class="Delete_Button" href="javascript:delRow(\'' + uid + '\')">删除</a>';
            return s;
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
            var cureentUser = '<%=Session["user"].ToString()%>';
            if (cureentUser != row.ChuangJianRen) {
                alert("无法删除，请查看是否您创建的用户！");
                return;
            }
            if (row) {
                mini.confirm("确定要删除管理员【" + row.ZhangHao + "】吗？", "删除", function (action) {
                    if (action == "ok") {
                        $.ajax({
                            url: "AdminLieBiao.aspx?funType=Remove&id=" + row.ID,
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

        var windowRegister = null;
        /*新增*/
        function btnAdd(e) {
            mini.open({
                iconCls: "icon-add",
                url: "AddAdmin.aspx?funType=add",
                title: "新增管理员",
                width: 310,
                height: 185,
                resize: false,
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
    </script>
    </form>
</body>
</html>
