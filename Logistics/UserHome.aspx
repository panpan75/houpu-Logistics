<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserHome.aspx.cs" Inherits="Logistics.TruckTeam.UserHome" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>用户信息页面</title>
     <link href="../CSS/niceforms-default.css"  type="text/css" rel="stylesheet"/>
    <style type="text/css">
        .auto-style1 {
            height: 24px;
        }
    </style>
</head>
<%-- <frameset rows="134,*">
    <frame scrolling="0" frameborder="0" border="0" src="Frame/Top.aspx"></frame>
    <frameset  cols="175,*">
        <frame frameborder="0" src="Frame/Left.aspx"></frame>
         <frame  frameborder="0"  name="mainframe"></frame>
    </frameset>
</frameset>--%>
<body >
    <form id="form1" runat="server">
<fieldset style="margin-left: auto; margin-right: auto; text-align: left; width:300px;">
        <div class="title">
            欢迎登陆XMSTC物流管理平台</div>
        <hr />
        <table>
            <tr>
                <td align="right">姓名：
                </td>
                <td align="left">

                    <asp:Label ID="Username" runat="server" style="color: #6584A8"  ></asp:Label>

                </td>
            </tr>
            <tr>
                <td align="right" class="auto-style1">性别：
                </td>
                <td align="left" class="auto-style1">

                    <asp:Label ID="UserSex" runat="server" style="color: #6584A8"></asp:Label>

                </td>
            </tr>
            <tr>
                <td align="right" class="auto-style1">角色：
                </td>
                <td align="left" class="auto-style1">

                    <asp:Label ID="FK_RoleID" runat="server" style="color: #6600CC"></asp:Label>

                </td>
            </tr>
            <tr>
                <td align="right">
                    电话：</td>
                <td align="left">

                    <asp:Label ID="UserPhone" runat="server" style="color: #6584A8"></asp:Label>

                </td>
            </tr>
            <tr>
                <td align="right">
                    E-mail：</td>
                <td align="left">

                    <asp:Label ID="UserEmail" runat="server" style="color: #6584A8"></asp:Label>

                </td>
            </tr>
        </table>
    </fieldset>
    </form>
</body>
</html>
