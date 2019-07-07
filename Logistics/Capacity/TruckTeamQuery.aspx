<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TruckTeamQuery.aspx.cs" Inherits="Logistics.Capacity.TruckTeamQuery" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>查询承运车队</title>
     <link href="../CSS/niceforms-default.css"  type="text/css" rel="stylesheet"/>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <fieldset style="margin-left: auto; margin-right: auto; text-align: left; width: 1000px">
                 查询承运车队<hr />
                 车队名称：<asp:DropDownList ID="ddlTeamName" runat="server"></asp:DropDownList>
                 车队负责人：<asp:TextBox ID="txtLeader" runat="server"></asp:TextBox>
                 <asp:Button ID="Button1" runat="server" Text="查询" OnClick="Button1_Click" />
                 <hr />
        <asp:DataList ID="dlTruckTeam" runat="server" Width="704px">
            <HeaderTemplate><table></HeaderTemplate>
            <ItemTemplate>             
                    <tr>
                        <td>车队编号</td>
                        <td>车队名称</td>
                        <td>负责人</td>
                        <td>创队时间</td>
                        <td>更新时间</td>
                        <td>备注</td>
                        <td>查看车辆</td>
                    </tr>
                      <tr>

                        <td><%# Eval("TeamID") %></td>
                        <td><%# Eval("TeamName") %></td>
                        <td><%# Eval("Leader") %></td>
                        <td><%# Eval("CheckInTime") %></td>
                        <td><%# Eval("AlterTime") %></td>
                        <td><%# Eval("Remark") %></td>
                        <td><a href="CarriersInfo.aspx?id=<%# Eval("TeamID") %>">查看车辆</a></td>
                    </tr>
               
            </ItemTemplate>
            <FooterTemplate>
                 </table>
            </FooterTemplate>
        </asp:DataList>
       </fieldset>
    </div>
    </form>
</body>
</html>
