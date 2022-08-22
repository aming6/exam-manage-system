<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Main.aspx.cs" Inherits="pages_Main" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <link href="../css/common.css" rel="stylesheet" type="text/css" />
    <link href="../css/index.css" rel="stylesheet" type="text/css" />
    <link href="../Scripts/ligerUI/skins/Aqua/css/ligerui-all.css" rel="stylesheet" type="text/css" />
    <link href="../Scripts/ligerUI/skins/Gray/css/all.css" rel="stylesheet" type="text/css" />
    <title>欢迎使用高校考务网站后台管理中心</title>
    <style type="text/css">
        body
        {
            padding: 3px;
            margin: 0;
            text-align: center;
            background: #F0F0F0;
            overflow: hidden;
        }
        #layout1
        {
            width: 100%;
            margin: 40px;
            height: 400px;
            margin: 0;
            padding: 0;
        }
        #CaiDanMianBan
        {
            height: 400px;
        }
        h4
        {
            margin: 20px;
        }
        .l-link
        {
            display: block;
            line-height: 22px;
            height: 22px;
            padding-left: 16px;
            border: 1px solid white;
            margin: 4px;
        }
        .l-link-over
        {
            background: #FFEEAC;
            border: 1px solid #DB9F00;
            cursor: hand;
        }
    </style>
    <script type="text/javascript" src="../Scripts/jquery-1.4.1.min.js"></script>
    <script type="text/javascript" src="../Scripts/ligerUI/js/core/base.js"></script>
    <script type="text/javascript" src="../Scripts/ligerUI/js/ligerui.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div id="mainForm">
        <div id="caidanmianban" position="left" style="border: 0px;" title="菜单面板">
            <div id="CaiDanMianBan">
                <%if (Session["role"].ToString() == "考生")
                  {%>
                <div title="个人管理">
                    <ul>
                        <li class="l-link">
                            <img src="../images/function_icon_set/home_48.png" style="width: 20px;" alt="首页" />&nbsp;&nbsp;首页</li>
                        <li class="l-link">
                            <img src="../images/function_icon_set/app_48.png" style="width: 20px;" alt="个人信息" />个人信息</li>
                        <li class="l-link">
                            <img src="../images/function_icon_set/delicious_48.png" alt="考场信息" style="width: 20px;" />考场信息</li>
                    </ul>
                </div>
                <%} %>
                <%if (Session["role"].ToString() == "管理员")
                  {%>
                <div title="人员管理">
                    <ul>
                        <li class="l-link">
                            <img src="../images/function_icon_set/users_two_48.png" style="width: 20px;" alt="管理员列表" />管理员列表</li>
                        <li class="l-link">
                            <img src="../images/function_icon_set/reddit_48.png" style="width: 20px;" alt="考生列表" />考生列表</li>
                        <li class="l-link">
                            <img src="../images/function_icon_set/reddit_48.png" style="width: 20px;" alt="监考教师" />监考教师</li>
                    </ul>
                </div>
                <div title="课程管理">
                    <ul>
                        <li class="l-link">
                            <img src="../images/function_icon_set/users_two_48.png" style="width: 20px;" alt="课程列表" />课程列表</li>
                    </ul>
                </div>
                <div title="考场管理">
                    <ul>
                        <li class="l-link">
                            <img src="../images/function_icon_set/users_two_48.png" style="width: 20px;" alt="考生列表" />考场列表</li>
                    </ul>
                </div>
                <%} %>
            </div>
        </div>
        <div id="caozuomianban" position="center">
            <div tabid="home" title="首页">
                <%if (Session["role"].ToString() == "考生")
                  {%>
                <iframe frameborder="0" style="width: 100%; height: 100%;" name="home" id="home"
                    src="FirestPage.aspx"></iframe>
                <%} %>
                <%else
                  { %>
                <iframe frameborder="0" style="width: 100%; height: 100%;" name="home" id="home"
                    src="RenYuanGuanLi/AdminLieBiao.aspx"></iframe>
                <%} %>
            </div>
        </div>
        <div position="top">
            <div id="topmenu" class="l-topmenu">
                <div class="l-topmenu-logo" style="font-size: 20px; font-family: Felix Titling; color: White;">
                    高校考务管理系统</div>
                <div class="l-topmenu-welcome" style="font-family: Felix Titling; color: White;">
                    <span class="l-topmenu-username"></span>欢迎您：[<%=Session["role"]%>]&nbsp;&nbsp;<%=Session["Name"]%>
                    &nbsp; [<a href="javascript:f_changepassword()" style="color: White;">修改密码</a>]
                    [<a onclick="btnExit();" href="javascript:void(0);" style="color: White;">安全退出</a>]
                </div>
            </div>
        </div>
        <div position="bottom" style="text-align: center; line-height: 50px;">
            <span style="margin-left: 10px; float: left; font-weight: bold;">
                <img src="../images/function_icon_set/clock_48.png" alt="当前时间" style="width: 20px;" />
                &nbsp;&nbsp;<span style="font-weight: lighter;" id="Mytimer"></span></span> Copyright © 2022 xxx
        </div>
    </div>
    <script type="text/javascript">
        var tab = null;
        $(function () {
            $("#mainForm").ligerLayout();
            var height = $("#CaiDanMianBan").height();
            var $caozuomianbanHeight = $("#caozuomianban").height();

            var height = $("#caozuomianban").height();

            //Tab
            $("#caozuomianban").ligerTab({ height: height });

            $("#CaiDanMianBan").ligerAccordion({ height: $caozuomianbanHeight, speed: null }); //菜单面板

            tab = $("#caozuomianban").ligerGetTabManager();

            $(".l-link").hover(function () {
                $(this).addClass("l-link-over");
            }, function () {
                $(this).removeClass("l-link-over");
            }).click(function () {
                var $title = "", tabid = "", text = "", url = "";

                switch ($.trim($(this).text())) {
                    /*考生操作*/ 
                    case "首页":
                        tabid = "FirstPage";
                        text = "首页";
                        url = "FirestPage.aspx";
                        break;
                    case "个人信息":
                        tabid = "UserInfo";
                        text = "个人信息";
                        url = "ManagerSelf/UserInfo.aspx";
                        break;
                    case "考场信息":
                        tabid = "KaoChangXinXi";
                        text = "考场信息";
                        url = "ManagerSelf/KaoChangXinXi.aspx";
                        break;
                    /*管理员操作*/ 
                    case "管理员列表":
                        text = "管理员列表";
                        tabid = "GuanLiYuanLieBiao";
                        url = "RenYuanGuanLi/AdminLieBiao.aspx";
                        break;
                    case "考生列表":
                        text = "考生列表";
                        tabid = "XueShengLieBiao";
                        url = "RenYuanGuanLi/XueShengLieBiao.aspx";
                        break;
                    case "监考教师":
                        text = "监考教师";
                        tabid = "JianKaoJiaoShi";
                        url = "RenYuanGuanLi/JiaoShiLieBiao.aspx";
                        break;
                    case "课程列表":
                        text = "课程列表";
                        tabid = "KeChengLieBiao";
                        url = "KeChengGuanLi/KeChengLieBiao.aspx";
                        break;
                    case "考场列表":
                        text = "考场列表";
                        tabid = "KaoChangLieBiao";
                        url = "KaoChangGuanLi/KaoChangLieBiao.aspx";
                        break;
                    default:
                        break;

                }
                f_addTab(tabid, text, url);
            });
            //时间显示
            setInterval(show_time, 1000);
        });


        //添加tab
        function f_addTab(tabid, text, url) {
            tab.addTabItem({ tabid: tabid, text: text, url: url });
        }

        //显示当前时间s
        function show_time() {
            var today, hour, second, minute, year, month, date, time;
            today = new Date();
            year = today.getYear();
            month = today.getMonth() + 1;
            date = today.getDate();
            hour = today.getHours();
            minute = today.getMinutes();
            second = today.getSeconds();
            week = today.getDay();

            if (week == 0)
                week = "星期日";
            else if (week == 1)
                week = "星期一";
            else if (week == 2)
                week = "星期二";
            else if (week == 3)
                week = "星期三";
            else if (week == 4)
                week = "星期四";
            else if (week == 5)
                week = "星期五";
            else if (week == 6)
                week = "星期六";

            if (second < 10) {
                time = year + "年" + month + "月" + date + "日 " + week + " " + hour + ":" + minute + ":0" + second;
            }
            else {
                time = year + "年" + month + "月" + date + "日 " + week + " " + hour + ":" + minute + ":" + second;
            }
            if (hour == "16" & minute == "29" & second == "59") {
                window.location.href = window.location.href;
            }
            $("#Mytimer").text(time);
        }

        /*安全退出*/
        function btnExit() {
            $.ligerDialog.confirm("<label style='font-size:12px;'>亲，您确定要【安全退出】本系统吗？</label>", "系统提示", function (action) {
                if (action) {
                    window.location.href = "Layout.aspx";
                }
            });
        }

        /*修改密码*/
        function f_changepassword() {
            $.ligerDialog.open({
                title: '修改密码',
                url: 'EditPassword.aspx',
                width: null,
                height: 200,
                modal: true,
                buttons: [{
                    text: '确定',
                    onclick: function (item, dialog) {
                        dialog.frame.saveData();
                        //dialog.close();
                        //$.ligerDialog.waitting('<div style=\'color:green;font-size:15px;text-align:center;\'>修改成功...</div>');
                        //setTimeout(function () { $.ligerDialog.closeWaitting(); }, 3000);
                    }
                }, {
                    text: '取消',
                    onclick: function (item, dialog) {
                        dialog.close();
                    }
                }]
            });
        }
            
    </script>
    </form>
</body>
</html>
