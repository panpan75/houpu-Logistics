<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CommandTask.aspx.cs" Inherits="Logistics.Command.CommandTask" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>调度任务管理</title>
    <link href="../CSS/niceforms-default.css"  type="text/css" rel="stylesheet"/>
</head>
<body>
    <form id="form1" runat="server">
    <div>
         <fieldset style="margin-left: auto; margin-right: auto; text-align: left; width: 820px">
        <div class="title">
            调度任务管理
        </div>
        <hr />               
                                     
         <asp:Repeater ID="rpDispatching" runat="server">
             <HeaderTemplate> <table>

                         <tr>
                             <td>发货单位地址</td> 
                             <td>收货单位地址</td> 
                             <td>承运日期</td> 
                             <td>承运单详情</td>
                             <td>车辆调度</td>
                         </tr></HeaderTemplate>
             <ItemTemplate>

                  <tr>
                             <td> <%# Eval("SendAddress") %> </td> 
                             <td> <%# Eval("FK_ReceiveAddress") %></td> 
                             <td> <%# Eval("LeaverDate") %></td> 
                             <td><a href="../Capacity/CarriersInfo.aspx?Carriersid=<%# Eval("CarriersID") %>">详情</a></td>
                             <td><a href="FreeTruck.aspx?Carriersid=<%# Eval("CarriersID") %>">调度</a></td>
                   </tr>
                    
             </ItemTemplate>
             <FooterTemplate>    </table></FooterTemplate>

         </asp:Repeater>
        </fieldset>
    </div>
    </form>
</body>
</html>
