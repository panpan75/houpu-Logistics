<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CostMaintenance.aspx.cs" Inherits="Logistics.Cost.CostMaintenance" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>成本维护</title>
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
            <fieldset style="margin-left: auto; margin-right: auto; text-align: left; width: 820px">
                <div class="title">
                    成本维护
                </div>
                <hr />
                <div class="costing">

                    <table>

                        <tr>
                            <td>结算状态</td>
                            <td>
                                <asp:RadioButtonList ID="rbCostMaintenance" runat="server" RepeatDirection="Horizontal" Height="22px" Width="192px">
                                    <asp:ListItem Value="0" Selected="True">不限</asp:ListItem>
                                    <asp:ListItem Value="1">未结算</asp:ListItem>
                                    <asp:ListItem Value="2">已结算</asp:ListItem>
                                </asp:RadioButtonList>
                            </td>
                            <td>接收时间：</td>
                            <td>
                                <asp:TextBox ID="txtReceiveDateBegin" runat="server"></asp:TextBox>至<asp:TextBox ID="txtReceiveDateEnd" runat="server"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td>
                                <asp:Button ID="Button1" runat="server" Text="检索" OnClick="btnSelCost_Click" />
                                <input id="btnReset" onclick="reset();" type="button" value="重置" />
                            </td>
                        </tr>
                    </table>


                </div>




                <asp:Repeater ID="rpCostMaintenance" runat="server">

                    <HeaderTemplate>
                        <hr />
                        <table>

                            <tr>

                                <td>编号</td>
                                <td>业务员</td>
                                <td>发货单位</td>
                                <td>接收时间</td>
                                <td>运费合计</td>
                                <td>运费成本</td>
                                <td>成本结算</td>
                            </tr>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr>
                            <td><%# Eval("CarriersID") %></td>
                            <td><%# Eval("FK_UserID") %></td>
                            <td><%# Eval("SendCompany") %></td>
                            <td><%# Eval("ReceiveDate") %></td>
                            <td><%# Eval("CarriersCost") %></td>
                            <%--运费合计     承运单--%>
                            <td><%# Eval("SchedulingCost") %></td>
                            <%--运输成本    调度任务信息--%>
                            <td>
                                <asp:LinkButton ID="LinkButton1" runat="server" Visible='<%#bingFinishedState(Eval("FinishedState"),"paying")%>'>结算成本</asp:LinkButton>
                                <asp:LinkButton ID="LinkButton2" runat="server" OnClick="LinkButton1_Click" CommandArgument='<%#Eval("SchedulingID") %>' Visible='<%#bingFinishedState(Eval("FinishedState"),"modification") %>'>成本修改</asp:LinkButton>
                                <%-- <a href='AlterCost.aspx?SchedulingID=<%#Eval("SchedulingID") %>'>成本修改</a>--%>
                            </td>
                        </tr>
                    </ItemTemplate>
                    <FooterTemplate>
                        </table>   
                    </FooterTemplate>
                </asp:Repeater>
            </fieldset>
        </div>
    </form>
</body>
</html>
