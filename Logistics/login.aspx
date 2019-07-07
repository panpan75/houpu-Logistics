<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="Logistics.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
     <title>XMSTC物流管理平台</title>
 <link rel="stylesheet" type="text/css"   href="CSS/login.css"     /> 


   
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div id="main">
                <div id="top">
                </div>
                <div id="logo">
                </div>
                <div id="bottom">
                                             
                <div id="login">
                    <table  style="width:100%; height: 111px;" border="0">
                        <tr>
                            <td style="width:460px">&nbsp;
                            </td>
                            <td style="width:187px">
                                <div id="inputs">
                                    <table>
                                        <tr>
                                            <td class="auto-style1">用户名：
                                            </td>
                                            <td class="auto-style1">
                                                <asp:TextBox ID="txtAccount" runat="server"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="txtAccount"
                                                    runat="server" Display="None" ErrorMessage="账号不能为空"></asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>密&nbsp;&nbsp;&nbsp;&nbsp;码：
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtPassword" TextMode="Password" runat="server"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="txtPassword"
                                                    runat="server" ErrorMessage="密码不能为空" Display="None"></asp:RequiredFieldValidator>                                            </td>
                                        </tr>                      
                                    </table>
                                </div>
                            </td>
                            <td>
                                <div id="buttons">
                                    <div class="button">
                                        <asp:ImageButton ID="ibtnLogin" runat="server" ImageUrl="Images/login_dl.gif" Width="56px"
                                            Height="20px" OnClick="ibtnLogin_Click"  />
                                        <br />
                                        <br />
                                        <div class="button">
                                            <img src="images/login_cz.gif" alt="" width="57" height="20" onclick="reset();" style="cursor: pointer" />
                                        </div>
                                    </div>
                                </div>
                            </td>
                            <td>&nbsp;
                            </td>
                        </tr>
                    </table>
                </div>
                                             
                </div>
            </div>
        </div>
      
    </form>
</body>
</html>
