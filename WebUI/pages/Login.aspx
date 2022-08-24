<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="pages_Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <link href="../Scripts/ligerUI/skins/Aqua/css/ligerui-dialog.css" rel="stylesheet"
        type="text/css" />
    <style type="text/css">
        *
        {
            padding: 0;
            margin: 0;
        }
        body
        {
            text-align: center;
            background: #4974A4;
        }
        #login
        {
            width: 740px;
            margin: 0 auto;
            font-size: 12px;
        }
        #loginlogo
        {
            width: 700px;
            height: 100px;
            overflow: hidden;
            background: url('../images/login/logo3.png') no-repeat;
            margin-left: 140px;
            margin-top: 50px;
        }
        #loginpanel
        {
            width: 729px;
            position: relative;
            height: 300px;
        }
        .panel-h
        {
            width: 729px;
            height: 20px;
            background: url('../images/login/panel-h.gif') no-repeat;
            position: absolute;
            top: 0px;
            left: 0px;
            z-index: 3;
        }
        .panel-f
        {
            width: 729px;
            height: 13px;
            background: url('../images/login/panel-f.gif') no-repeat;
            position: absolute;
            bottom: 0px;
            left: 0px;
            z-index: 3;
        }
        .panel-c
        {
            z-index: 2;
            background: url('../images/login/panel-c.gif') repeat-y;
            width: 729px;
            height: 299px;
        }
        .panel-c-l
        {
            position: absolute;
            left: 60px;
            top: 40px;
        }
        .panel-c-r
        {
            position: absolute;
            right: 20px;
            top: 50px;
            width: 222px;
            line-height: 200%;
            text-align: left;
        }
        .panel-c-l h3
        {
            color: #556A85;
            margin-bottom: 10px;
        }
        .panel-c-l td
        {
            padding: 7px;
        }
        
        
        .login-text
        {
            height: 24px;
            left: 24px;
            border: 1px solid #e9e9e9;
            background: #f9f9f9;
        }
        .login-text-focus
        {
            border: 1px solid #E6BF73;
        }
        .login-btn
        {

            margin-top: 20px;
            width: 60%;
            height: 30px;
            border-radius: 10px;
            border: 0;
            color: #fff;
            cursor: pointer;
            text-align: center;
            line-height: 30px;
            font-size: 15px;
            background-image: linear-gradient(to right, #74ebd5 0%, #9face6 100%);
           /* width: 114px;
            height: 29px;
            color: #E9FFFF;
            line-height: 29px;
            background: url('../images/login/login-btn.gif') no-repeat;
            border: none;
            overflow: hidden;
            cursor: pointer;*/
        }
        #txtUsername, #txtPassword
        {
            width: 191px;
        }
        #logincopyright
        {
            text-align: center;
            color: White;
            margin-top: 50px;
        }
    </style>
    <title>高校考务管理信息系统</title>
    <script type="text/javascript" src="../Scripts/jquery-1.4.1.min.js"></script>
    <script type="text/javascript" src="../Scripts/ligerUI/js/core/base.js"></script>
    <script type="text/javascript" src="../Scripts/ligerUI/js/ligerui.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div id="login">
        <div id="loginlogo">
        </div>
        <div id="loginpanel">
            <div class="panel-h">
            </div>
            <div class="panel-c">
                <div class="panel-c-l">
                    <table cellpadding="0" cellspacing="0">
                        <tbody>
                            <tr>
                                <td align="left" colspan="2">
                                    <h3>
                                        请使用根据角色使用高校考务系统账号登陆</h3>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    账号：
                                </td>
                                <td align="left">
                                    <input type="text" name="txtUsername" id="txtUsername" value="XH201402171" class="login-text" />
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    密码：
                                </td>
                                <td align="left">
                                    <input type="password" name="txtPassword" value="888888" id="txtPassword" class="login-text" />
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    角色：
                                </td>
                                <td align="left">
                                    <select id="sltRole" name="sltRole" class="login-text" style="width: 193px;">
                                        <option value="2" selected="selected">考生</option>
                                        <option value="1">管理员</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td align="center" colspan="2">
                                    <input type="button" id="btnLogin" value="登陆" class="login-btn" />
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="panel-c-r">
                    <p>
                        请从左侧输入登录账号和密码登录</p>
                    <p>
                        如果遇到系统问题，请联系网络管理员。</p>
                    <p>
                        电话：8888-8888</p>
                </div>
            </div>
            <div class="panel-f">
            </div>
        </div>
        <div id="logincopyright">
            Copyright © 2022 xxx
        </div>
    </div>
    <script type="text/javascript">
        var $txtUsername = "";
        var $txtPassword = "";
        var $sltRole = "";
        var _PARAMS = "";
        $(function () {
            $("#btnLogin").bind({
                click: function () {
                    $txtUsername = $.trim($("#txtUsername").val());
                    $txtPassword = $.trim($("#txtPassword").val());
                    $sltRole = $.trim($("#sltRole").val());
                    //判断用户名和密码是否为空
                    if ($txtUsername.length == 0) {
                        $.ligerDialog.waitting('<div style=\'color:red;font-size:15px;text-align:center;\'>用户名不得为空</div>');
                        setTimeout(function () { $.ligerDialog.closeWaitting(); }, 1000);
                        $("#txtUsername").focus();
                        return;
                    }
                    if ($txtPassword.length == 0) {
                        $.ligerDialog.waitting('<div style=\'color:red;font-size:15px;text-align:center;\'>密码不得为空</div>');
                        setTimeout(function () { $.ligerDialog.closeWaitting(); }, 1000);
                        $("#txtPassword").focus();
                        return;
                    }
                    _PARAMS = $txtUsername + "$" + $txtPassword + "$" + $sltRole;

                    $.ajax({
                        type: 'post',
                        //async: false,
                        url: 'Login.aspx',
                        data: 'funType=chkUserNameAndPassword&params=' + _PARAMS,
                        success: function (data) {
                            if ("True" == data) {
                                window.location.href = "Main.aspx";
                            }
                            else {
                                $.ligerDialog.waitting('<div style=\'color:red;font-size:15px;text-align:center;\'>用户名或密码不正确</div>');
                                setTimeout(function () { $.ligerDialog.closeWaitting(); }, 3000);
                                $("#txtPassword").focus();
                                $("#txtPassword").select();
                                return;
                            }
                        }
                    });



                }
            });
        });


        var windowRegister;

        /*注册*/
        function btnRegister() {

            windowRegister = $.ligerDialog.open({
                url: 'Register.aspx',
                title: '注册',
                height: 350,
                width: 500,
                isResize: false,
                isDrag: false,
                buttons: [
                  {
                      text: '提交',
                      onclick: function (item, dialog) {
                          //父窗体调用子窗体函数
                          dialog.frame.SaveData();
                          $.ligerDialog.waitting('<div style=\'color:green;font-size:15px;text-align:center;\'>注册成功...</div>');
                          setTimeout(function () { $.ligerDialog.closeWaitting(); }, 1000);
                          $("#txtUsername").focus();
                      }
                  },
                  { text: '取消', onclick: function () { windowRegister.close(); } }
                  ]
            });

            windowRegister.show();
        }
    </script>
    </form>
</body>
</html>
