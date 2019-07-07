<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FreeTruck.aspx.cs" Inherits="Logistics.Command.FreeTruck" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>当前可调度车辆</title>
    <link href="../CSS/niceforms-default.css"  type="text/css" rel="stylesheet"/>
</head>
<body>
    <form id="form1" runat="server">
    <div>
         <fieldset style="margin-left: auto; margin-right: auto; text-align: left; width: 820px">
        <div class="title">
            当前可调度车辆
        </div>
        <hr />                                                          
         <asp:Repeater ID="rpschedulable" runat="server">
             <HeaderTemplate> <table>

                         <tr>
                             <td>车牌号码</td> 
                             <td>车辆类型</td> 
                             <td>车队</td> 
                             <td>驾驶员</td>
                             <td>车长</td>
                             <td>吨位</td> 
                             <td>调度</td>
                            
                         </tr></HeaderTemplate>
             <ItemTemplate>
                  <tr>
                             <td> <%# Eval("Number") %> </td> 
                             <td> <%# Eval("Type") %></td> 
                             <td> <%# Eval("TeamID") %></td> 
                             <td> <%# Eval("Name") %> </td> 
                             <td> <%# Eval("Leader") %></td> 
                             <td> <%# Eval("Tonnage") %></td> 
                             <td><asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">调度</asp:LinkButton></td>
                   </tr>                    
             </ItemTemplate>
             <FooterTemplate></table></FooterTemplate>

         </asp:Repeater>
        &nbsp;&nbsp;&nbsp;
        </fieldset>&nbsp;&nbsp;&nbsp;&nbsp;
    </div>
    </form>
</body>
</html>
