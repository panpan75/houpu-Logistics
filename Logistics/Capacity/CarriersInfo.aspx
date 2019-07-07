<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CarriersInfo.aspx.cs" Inherits="Logistics.Capacity.CarriersInfo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>承运单详情</title>
      <link href="../CSS/niceforms-default.css"  type="text/css" rel="stylesheet"/>
    <style type="text/css">
        .auto-style1 {
            width: 10px;
        }
        .auto-style2 {
            height: 24px;
        }
        .auto-style3 {
            width: 10px;
            height: 24px;
        }
        .auto-style4 {
            height: 25px;
        }
        .auto-style5 {
            width: 10px;
            height: 25px;
        }
        .auto-style6 {
            width: 268435456px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
       <fieldset style="margin-left: auto; margin-right: auto; text-align: left; width: 1000px">
        承运单详情<hr />
        <table>

            <tr>

                <td class="auto-style2">发货单位：</td><td class="auto-style2"><%=CarriersModel.SendCompany %></td>
                <td class="auto-style2">单位地址：</td><td class="auto-style2"><%=CarriersModel.SendAddress %></td>       
                <td class="auto-style2">发货电话</td><td class="auto-style3"><%=CarriersModel.SendPhone %></td>
             
            </tr>
            <tr>

                <td class="auto-style2">收货人：</td><td class="auto-style2"><%=CarriersModel.ReceiveLinkman %></td>
                <td class="auto-style2">单位地址：</td><td class="auto-style2"><%=CarriersModel.FK_ReceiveAddress %></td>       
                <td class="auto-style2">收货人电话：</td><td class="auto-style3"><%=CarriersModel.ReceivePhone %></td>
               
            </tr> 
            <tr>

                <td class="auto-style4">发货时间：</td><td class="auto-style4"><%=CarriersModel.CheckInTime %></td>
                <td class="auto-style4">收货时间：</td><td class="auto-style4"><%=CarriersModel.ReceiveDate %></td>       
                <td class="auto-style4">费用</td><td class="auto-style5"><%=CarriersModel.OtherCost %></td>
            </tr>
             <tr>

                <td>保险费：</td><td><%=CarriersModel.InsuranceCost %></td>
                 <td>其他费用：</td><td><%=CarriersModel.OtherCost %></td>       
                 <td>合集费用</td><td class="auto-style1"><%=CarriersModel.TotalCOst %></td>
            </tr> <tr>

                <td class="auto-style2">承运时间：</td><td class="auto-style2"><%=CarriersModel.LeaverDate %></td>
                <td class="auto-style2">发货人：</td><td class="auto-style2"><%=CarriersModel.SendLinkman %></td>       
                <td class="auto-style2">业务员：</td><td class="auto-style3"><%=CarriersModel.FK_UserID %></td>
             
            </tr> 
            <tr>

                <td>承运情况：</td><td><%=CarriersModel.FinishedState %></td>
                <td></td><td></td>       
                <td></td><td class="auto-style1"></td>
            </tr> 
            <tr>

                <td>备注：</td><td colspan="2">
                <asp:TextBox ID="txtRemark" runat="server" Height="142px" Width="214px"></asp:TextBox>
                </td>
                <td colspan="3">
                    <asp:GridView ID="gvGoods" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:BoundField DataField="GoodsID" HeaderText="编号" />
                            <asp:BoundField DataField="GoodsName" HeaderText="名称" />
                            <asp:BoundField DataField="Amount" HeaderText="数量" />
                            <asp:BoundField DataField="Weight" HeaderText="重量" />
                            <asp:BoundField DataField="Volume" HeaderText="体积" />
                            <asp:BoundField DataField="FK_CarriersID" HeaderText="承运单编号" />
                            <asp:BoundField DataField="IsDelete" HeaderText="数据记录状态" />
                        </Columns>
                        <EditRowStyle BackColor="#2461BF" />
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#EFF3FB" />
                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#F5F7FB" />
                        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                        <SortedDescendingCellStyle BackColor="#E9EBEF" />
                        <SortedDescendingHeaderStyle BackColor="#4870BE" />
                    </asp:GridView>
                </td>       
             
            </tr> 
           
        </table>
        </fieldset>
    </div>
    </form>
</body>
</html>
