<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TruckQuery.aspx.cs" Inherits="Logistics.Capacity.TruckQuery" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>查询承运车辆</title>
     <link href="../CSS/niceforms-default.css"  type="text/css" rel="stylesheet"/>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        
                 <fieldset style="margin-left: auto; margin-right: auto; text-align: left; width: 1000px">
                <div class="title">
                    车辆信息维护
                </div>
                    
                <hr />
           所属车队：<asp:DropDownList ID="ddlTruckTeamID" runat="server" Width="73px">
                    <asp:ListItem Value="-1">不限</asp:ListItem>
                </asp:DropDownList>
           车牌号码：<asp:TextBox ID="txtNumber" runat="server"></asp:TextBox>
           车辆类型：<asp:DropDownList ID="ddlTruckType" runat="server">
                    <asp:ListItem Value="-1">---全部---</asp:ListItem>
                </asp:DropDownList>
                <asp:Button ID="Button1" runat="server" Text="查询" OnClick="Button1_Click" />
               <asp:Repeater ID="rptTruckList" runat="server" >

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
                          <td>查看</td>
                 
                        </tr>
                   </HeaderTemplate>
                   <ItemTemplate>
                      <tr>
                          <td><%# Eval("TruckID")%></td>
                          <td><%# Eval("Number")%></td>
                          <td><%# Eval("BuyDate")%></td>
                          <td><%# Eval("Type")%></td>
                          <td><%# Eval("Length")%></td>
                          <%--<td><%# Eval("Tonnage")%></td>--%>
                          <td><%# Eval("FK_TeamID")%></td>
                          <td><%# Eval("State").ToString()=="1"?"承运中":"空闲中"%></td>
                          <td><%# Eval("CheackInTime")%></td>
                          <td><%# Eval("CheackInTime")%></td>
                          <td><a href="TruckInfo.aspx?truckid=<%# Eval("TruckID")%>" >详情</a></td>
                        
                      </tr>
                   </ItemTemplate>

                   <FooterTemplate></table></FooterTemplate>
               </asp:Repeater>



                
                   
            </fieldset>
    </div>
    </form>
</body>
</html>
