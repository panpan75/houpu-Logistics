<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddDriver.aspx.cs" Inherits="Logistics.Driver.AddDriver" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link href="../CSS/niceforms-default.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript">
         function remove() {
             var x = document.getElementByTagName("input").value;
             x.remove();

         }
    </script>

</head>
<body>
    <form id="form1" runat="server">
        <div>
            <fieldset style="margin-left: auto; margin-right: auto; text-align: left; width: 734px">
                <div class="title">
                    添加司机信息
                </div>

                <hr />

                <table>

                    <tr>
                        <td>司机姓名：</td>
                        <td>
                            <asp:TextBox ID="txtname" runat="server" Width="150px"></asp:TextBox></td>
                        <td class="auto-style1">司机所属车队</td>
                        <td>
                            <asp:DropDownList ID="ddlTruckTeamID" runat="server">
                                <asp:ListItem Value="-1">请选择</asp:ListItem>
                            </asp:DropDownList></td>
                    </tr>
                    <tr>
                        <td>司机性别：</td>
                        <td>
                            <asp:RadioButtonList ID="rblDriverSex" runat="server" BorderStyle="None" RepeatDirection="Horizontal" Width="140px">
                                <asp:ListItem Value="0" Selected="True">男</asp:ListItem>
                                <asp:ListItem Value="1">女</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                        <td class="auto-style1">出生日期：</td>
                        <td>
                            <asp:TextBox ID="txtBirth" runat="server" Width="150px" Height="23px"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td class="auto-style2">联系电话：</td>
                        <td class="auto-style2">
                            <asp:TextBox ID="txtphone" runat="server" Width="150px"></asp:TextBox></td>
                        <td colspan="2" rowspan="2">备份：
                          <asp:TextBox ID="txtramrk" runat="server" Height="44px" TextMode="MultiLine"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>

                        <td>身份证号码：</td>
                        <td>
                            <asp:TextBox ID="txtCarID" runat="server" Width="150px"></asp:TextBox></td>
                    </tr>
                    <tr>

                        <td class="auto-style1">司机状态</td>
                        <td class="auto-style1">
                            <asp:RadioButtonList ID="rblstate" runat="server" BorderStyle="None" RepeatDirection="Horizontal" Width="192px">
                                <asp:ListItem Value="0">承运中</asp:ListItem>
                                <asp:ListItem Value="1"  Selected="True">空闲中</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                        <td colspan="2" style="text-align: right">

                            <asp:Button ID="Button1" runat="server" Text="添加" OnClick="Button1_Click" />
                            &nbsp;
                              <input id="btnReset" onclick="reset();" type="button" value="重置" />


                        </td>
                    </tr>


                </table>


            </fieldset>
        </div>
    </form>
</body>
</html>
