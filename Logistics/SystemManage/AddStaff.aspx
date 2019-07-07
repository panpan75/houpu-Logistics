<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddStaff.aspx.cs" Inherits="Logistics.SystemManage.AddStaff" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>添加用户信息</title>
     <link href="../CSS/niceforms-default.css"  type="text/css" rel="stylesheet"/>
</head>
<body>
    <form id="form1" runat="server">
    <div>
      <fieldset style="margin-left: auto; margin-right: auto; text-align: left; width: 1000px">
                <div class="title">
                    添加成员信息
                </div>
                <hr />
                <table width="100%">
                    <tr>
                        <td>用户姓名：
                        </td>
                        <td>
                            <asp:TextBox ID="txtUserName" runat="server"></asp:TextBox>
                        </td>
                        <td>性别：
                        </td>
                        <td>
                            <asp:RadioButtonList ID="rblSex" runat="server">
                                <asp:ListItem Value="0" >男</asp:ListItem>
                                <asp:ListItem Value="1">女</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                        <td>账号：
                        </td>
                        <td>
                            <asp:TextBox ID="txtAccount" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>密码：
                        </td>
                        <td>
                            <asp:TextBox ID="txtPwd" runat="server"></asp:TextBox>
                        </td>
                        <td>电话：
                        </td>
                        <td>
                            <asp:TextBox ID="txtTel" runat="server"></asp:TextBox>
                        </td>
                        <td>Email:
                        </td>
                        <td>
                            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>

                        </td>
                    </tr>
                    <tr>
                        <td>角色id：
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlRoleList" runat="server">
                                <asp:ListItem Value="-1">请选择</asp:ListItem>
                            </asp:DropDownList>                          
                        </td>
                        <td></td>
                        <td>
                            <asp:Button ID="addStaff" runat="server" Text="添加" OnClick="addStaff_Click" style="width: 42px; height: 29px;" />
                        </td>
                    </tr>
                    </table>
            </fieldset>
    </div>
    </form>
</body>
</html>
