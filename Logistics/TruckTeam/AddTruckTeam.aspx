<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddTruckTeam.aspx.cs" Inherits="Logistics.TruckTeam.AddTruckTeam" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>添加车队信息</title>
    <link href="../CSS/niceforms-default.css" type="text/css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <fieldset style="margin-left: auto; margin-right: auto; text-align: left;">
                <div class="title">添加车队信息</div>
                <hr />
                <table border="0" cellpadding="0" cellspacing="0">
                    <tr>
                        <td>车队名称：
                        </td>
                        <td colspan="2">
                            <asp:TextBox ID="txtTeamName" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Display="None"
                                ErrorMessage="车队名称不能为空！" ControlToValidate="txtTeamName"></asp:RequiredFieldValidator>
                        </td>
                        <td>车队负责人：
                        </td>
                        <td>
                            <asp:TextBox ID="txtTeamLeader" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="车队负责人不能为空！" Display="None" ControlToValidate="txtTeamLeader"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td colspan="4" rowspan="3">
                            <asp:TextBox ID="txtRemark" runat="server" TextMode="MultiLine" Height="100%" Width="400px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>备 注：
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                            <asp:Button ID="btnAdd" runat="server" Text="添加" OnClick="btnAdd_Click" />
                        </td>
                        <td>
                            <input id="btnReset" onclick="reset();" type="reset" value="重置" />
                        </td>
                        <td></td>
                        <td align="left" valign="top">&nbsp;
                        </td>
                    </tr>
                </table>
            </fieldset>
        </div>
    </form>
</body>
</html>
