<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CarriersReceive.aspx.cs" Inherits="Logistics.Carriers.CarriersReceive" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>接收承运单</title>
    <link href="../CSS/niceforms-default.css" type="text/css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">

        <fieldset style="margin-left: auto; margin-right: auto; text-align: left; width: 820px">
            <div class="title">
                承运单维护
            </div>
            <hr style="height: -12px; width: 1083px" />

            <table width="100%">
                <tr>
                    <td class="auto-style4">承运单编号：</td>
                    <td class="auto-style1">
                        <asp:TextBox ID="txtCarriersID" runat="server" MaxLength="20"></asp:TextBox>
                    </td>
                    <td class="auto-style1">承运日期：</td>
                    <td class="auto-style7">
                        <asp:TextBox ID="txtLeaverDateBegin" runat="server" MaxLength="20" Width="181px"></asp:TextBox>
                    </td>
                    <td class="auto-style5">至</td>
                    <td class="auto-style1">
                        <asp:TextBox ID="txtLeaverDateEnd" runat="server" Width="181px"></asp:TextBox>
                    </td>

                </tr>
                <tr>
                    <td class="auto-style3">收货人：</td>
                    <td>
                        <asp:TextBox ID="txtReceiveLinkman" runat="server"></asp:TextBox>
                    </td>
                    <td class="auto-style1">发货人：</td>
                    <td class="auto-style10">
                        <asp:TextBox ID="txtSendLinkman" runat="server" MaxLength="20" Width="181px"></asp:TextBox>
                    </td>

                    <td class="auto-style9"></td>
                    <td></td>

                </tr>
                <tr>
                    <td class="auto-style3"></td>
                    <td></td>
                    <td class="auto-style1"></td>
                    <td class="auto-style10"></td>
                    <td class="auto-style9"></td>
                    <td>
                        <asp:Button ID="btinquiry" runat="server" Text="查询" OnClick="btinquiry_Click" />
                    </td>


                </tr>
            </table>
            <hr />

            <asp:Repeater ID="rpCarriers" runat="server" OnItemCommand="rpCarriers_ItemCommand">
                <HeaderTemplate>
                    <table>

                        <tr>

                            <td>承运单号</td>
                            <td>发货人</td>
                            <td>发货单位</td>

                            <td>收货人</td>
                            <td>收货单位</td>

                            <td>承运日期</td>
                            <td>合计费用</td>
                            <td>承运状态</td>
                            <td>查看</td>
                            <td>用户操作</td>
                        </tr>
                </HeaderTemplate>
                <ItemTemplate>
                    <tr>

                        <td><%#Eval("CarriersID") %></td>

                        <td><%#Eval("SendLinkman") %></td>
                        <td><%#Eval("SendCompany") %></td>

                        <td><%#Eval("ReceiveLinkman") %></td>
                        <td><%#Eval("FK_ReceiveAddress") %></td>

                        <td><%#Eval("LeaverDate") %></td>
                        <td><%#Eval("TotalCOst") %></td>
                        <td><%#Eval("IsDelete") %></td>
                        <td><a  href="../Capacity/CarriersInfo.aspx?Carriersid=<%#Eval("CarriersID") %>">详情</a></td>
                        <td>

                            <a href="AddCarriers.aspx?Carriersid=<%#Eval("CarriersID") %>">修改</a>
                            <asp:Button ID="btdelete" runat="server" Text="删除" CommandName="delete" CommandArgument='<%#Eval("CarriersID") %>'    />
                            <a href="AddCarriers.aspx">添加</a>

                        </td>
                    </tr>

                </ItemTemplate>
                <FooterTemplate>
                    </table>
                </FooterTemplate>
            </asp:Repeater>


        </fieldset>
    </form>
</body>
</html>
