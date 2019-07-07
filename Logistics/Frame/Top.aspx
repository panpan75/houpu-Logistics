<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Top.aspx.cs" Inherits="Logistics.Frame.Top" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>头部导航栏</title>
    <style type="text/css">
        body {
            margin-left: 0px;
            margin-top: 0px;
            margin-right: 0px;
            margin-bottom: 0px;
        }

        .STYLE1 {
            font-size: 12px;
            color: #000000;
        }

        .STYLE5 {
            font-size: 12px;
        }

        .STYLE7 {
            font-size: 12px;
            color: #FFFFFF;
        }

            .STYLE7 a {
                font-size: 12px;
                color: #FFFFFF;
            }

        a img {
            border: none;
        }
    </style>
    <script src="../JQ/jquery-1.7.2.js" type="text/javascript"></script>
    <script type="text/javascript">
        //定义一个刷新器 每一秒执行一次
        $(function () {
            setInterval("getTime();", 1000); //每隔一秒执行一次
        })
        //取得系统当前时间
        function getTime() {
            var myDate = new Date();
            var hours = myDate.getHours();
            var minutes = myDate.getMinutes();
            //判断是不是小于10
            if (minutes < 10) {
                minutes = '0' + minutes;
            }
            else {
                minutes;
            }
            var seconds = myDate.getSeconds();
            if (seconds < 10) {
                seconds = '0' + seconds;
            }
            else {
                seconds;
            }

            //$("#DataNow").html(hours + ":" + minutes < 10 ? '0' + minutes : minutes + ":" + seconds < 10 ? '0' + seconds : seconds); //将值赋给div
            $("#DataNow").html( hours + ":" + minutes + ":" + seconds); //将值赋给div
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td height="57" background="../images/main_03.gif">
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                                <td width="378" height="57" background="../images/main_01.gif">&nbsp;
                                </td>
                                <td>&nbsp;
                                </td>
                                <td width="281" valign="bottom">
                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                        <tr>
                                            <td width="33" height="27">
                                                <img src="../images/main_05.gif" width="33" height="27" />
                                            </td>
                                            <td width="248" background="../images/main_06.gif">
                                                <table width="225" border="0" align="center" cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td height="17">
                                                            <div align="right">
                                                                <a  target="rightFrame" >
                                                                   <img src="../images/pass.gif" width="69" height="17" />
                                                                </a>
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div align="right">
                                                                <a  href="../Index.aspx" target="rightFrame">
                                                                    <img src="../images/user.gif" width="69" height="17" />
                                                                </a>
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div align="right">
                                                                <a target="_parent">
                                                                    <asp:ImageButton ID="ibtnWriteOff" ImageUrl="../images/quit.gif"
                                                                        runat="server" OnClick="ibtnWriteOff_Click" />
                                                                </a>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td height="40" background="../images/main_10.gif">
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                                <td width="194" height="40" background="../images/main_07.gif">&nbsp;
                                </td>
                                <td>
                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                        <tr>
                                            <td width="21">
                                                <img src="../images/main_13.gif" width="19" height="14" />
                                            </td>
                                            <td width="35" class="STYLE7">
                                                <div align="center">
                                                    <a href="../Index.aspx" target="rightFrame">首页 </a>
                                                </div>
                                            </td>
                                            <td width="21" class="STYLE7">
                                                <img src="../images/main_15.gif" width="19" height="14" />
                                            </td>
                                            <td width="35" class="STYLE7">
                                                <div align="center">
                                                    <a href="javascript:history.go(-1);">后退</a>
                                                </div>
                                            </td>
                                            <td width="21" class="STYLE7">
                                                <img src="../images/main_17.gif" width="19" height="14" />
                                            </td>
                                            <td width="35" class="STYLE7">
                                                <div align="center">
                                                    <a href="javascript:history.go(1);">前进 </a>
                                                </div>
                                            </td>
                                            <td width="21" class="STYLE7">
                                                <img src="../images/main_19.gif" width="19" height="14" />
                                            </td>
                                            <td width="35" class="STYLE7">
                                                <div align="center">
                                                    <a href="javascript:window.parent.location.reload();" target="rightFrame">刷新 </a>
                                                </div>
                                            </td>
                                            <td width="21" class="STYLE7">
                                                <%--<img src="../images/main_21.gif" width="19" height="14" />--%>
                                            </td>
                                            <td width="35" class="STYLE7">
                                                <%--<div align="center">
                                                <a href="http://www.xmstc.cn" target="_parent">帮助 </a>
                                            </div>--%>
                                            </td>
                                            <td>&nbsp;
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                                <td width="248" background="../images/main_11.gif">
                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                        <tr>
                                            <td width="16%">
                                                <span class="STYLE5"></span>
                                            </td>
                                            <td width="75%">
                                                <div align="center">
                                                    <span class="STYLE7">
                                                        <div id="Clock" align="center" style="font-size: 20; color: White;">
                                                            当前时间：
                                                            <asp:Label ID="showDate" runat="server"></asp:Label>
                                                            <asp:Label ID="DataNow" runat="server"></asp:Label>
                                                        </div>
                                                    </span>
                                                </div>
                                            </td>
                                            <td width="9%">&nbsp;
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td height="30" background="../images/main_31.gif">
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                                <td width="8" height="30">
                                    <img src="../images/main_28.gif" width="8" height="30" />
                                </td>
                                <td width="147" background="../images/main_29.gif">
                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                        <tr>
                                            <td width="24%">&nbsp;
                                            </td>
                                            <td width="43%" height="20" valign="bottom" class="STYLE1">管理菜单
                                            </td>
                                            <td width="33%">&nbsp;
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                                <td width="39">
                                    <img src="../images/main_30.gif" width="39" height="30" />
                                </td>
                                <td>
                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                        <tr>
                                            <td height="20" valign="bottom">
                                                <span class="STYLE1">当前登录用户：<asp:Label ID="lblUserName" runat="server"></asp:Label>
                                                    &nbsp;用户角色：<asp:Label ID="lblRoleName" runat="server"></asp:Label></span>
                                            </td>
                                            <td valign="bottom" class="STYLE1">
                                                <div align="right">
                                                </div>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                                <td width="17">
                                    <img src="../images/main_32.gif" width="17" height="30" />
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>

