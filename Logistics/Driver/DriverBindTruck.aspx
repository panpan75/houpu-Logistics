<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DriverBindTruck.aspx.cs" Inherits="Logistics.Driver.DriverBindTruck1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>驾驶员绑定车辆</title>
     <link href="../CSS/niceforms-default.css"  type="text/css" rel="stylesheet"/>
</head>
<body>
    <form id="form1" runat="server">
    <div>
         <fieldset>
           车辆绑定
        <hr style="height: -12px; width: 1083px" />
              

            <asp:Repeater ID="rptTruckList" runat="server">

                   <HeaderTemplate>
                      <table width="100%">
                       <tr>
                          <td>车辆编号</td>
                          <td>车牌号码</td>
                          <td>购车日期</td>
                          <td>购车类型</td>
                          <td>车身长度</td>
                          <td>顿位/吨</td>
                          <td>车队</td>
                          <td>工作状态</td>
                          <td>创建时间</td>
                          <td>修改时间</td>
                          <td>车辆绑定</td>
                      
                        </tr>
                   </HeaderTemplate>
                   <ItemTemplate>
                      <tr>
                          <td><%# Eval("TruckID")%></td>
                          <td><%# Eval("Number")%></td>
                          <td><%# Eval("BuyDate")%></td>
                          <td><%# Eval("Type")%></td>
                          <td><%# Eval("Length")%></td>
                          <td><%# Eval("Tonnage")%></td>
                          <td><%# Eval("FK_TeamID")%></td>
                          <td><%# Eval("State").ToString()=="1"?"承运中":"空闲中"%></td>
                          <td><%# Eval("CheackInTime")%></td>
                          <td><%# Eval("CheackInTime")%></td>
                           <td> 
                             <asp:LinkButton ID="lbbindTruck" runat="server"   OnClick="lbbindTruck_Click" CommandArgument='<%# Eval("TruckID") %>'   Visible='<%# bindstats( Eval("TruckID"), Eval("State"))%>'>绑定车辆</asp:LinkButton>
                         <%--   <asp:LinkButton ID="lbbundTruck" runat="server"  CommandArgument='<%# Eval("TruckID") %>'  OnClick="lbbundTruck_Click"  OnClientClick="return  confirm('你确定要解绑？')"  Visible='<%# bindstats( Eval("TruckID"), Eval("State"),"unbound")%>'>解绑车辆</asp:LinkButton>--%>
                           </td>
                      </tr>
                   </ItemTemplate>

                   <FooterTemplate></table></FooterTemplate>
               </asp:Repeater>
            
    </fieldset> </div>
    </form>
</body>
</html>
