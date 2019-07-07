<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CarriersManage.aspx.cs" Inherits="Logistics.Carriers.CarriersManage" %>
<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="Page" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>承运单维护</title>
    <link href="../CSS/niceforms-default.css" type="text/css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <fieldset style="margin-left: auto; margin-right: auto; text-align: left; width: 820px">
                <div class="title">
                    查询历史承运单
                </div>
                <hr />
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
                            <asp:TextBox ID="txtAccount" runat="server" MaxLength="20" Width="181px"></asp:TextBox>
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

                                <td>承运单编号</td>
                                <td>业务员</td>
                                <td>发货人</td>
                                <td>发货单位</td>
                                <td>收货人</td>
                                <td>收货单位</td>
                                <td>承运日期</td>
                                <td>合计费用</td>
                                <td>查看</td>
                                <td>用户操作</td>
                            </tr>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr>

                            <td><%#Eval("CarriersID") %></td>
                            <td><%#Eval("FK_UserID") %></td>
                            <td><%#Eval("SendLinkman") %></td>
                            <td><%#Eval("SendCompany") %></td>
                            <td><%#Eval("ReceiveLinkman") %></td>
                            <td><%#Eval("ReceiveCompany") %></td>
                            <td><%#Eval("LeaverDate") %></td>
                            <td><%#Eval("TotalCOst") %></td>
                            <td><a href="../Capacity/TruckInfo.aspx?Carriersid=<%#Eval("CarriersID") %>">详情</a></td>
                            <td>

                                <a href="AddCarriers.aspx?Carriersid=<%#Eval("CarriersID") %>">修改</a>
                                <a href="AddCarriers.aspx">添加</a>
                                <asp:Button ID="btdelete" runat="server" Text="删除" CommandName="delete" CommandArgument='<%#Eval("CarriersID") %>' />
                            </td>
                        </tr>

                    </ItemTemplate>
                    <FooterTemplate>
                        </table>
                    </FooterTemplate>
                </asp:Repeater>

                <Page:aspnetpager id="AspNetPager1" runat="server"
                    custominfohtml="第%CurrentPageIndex%页，共%PageCount%页，每页%PageSize%条"
                    firstpagetext="首页" lastpagetext="尾页" layouttype="Table" nextpagetext="下一页"
                    onpagechanging="AspNetPager1_PageChanging" pageindexboxtype="DropDownList"
                    pagingbuttonlayouttype="Span" prevpagetext="上一页" showcustominfosection="Left"
                    showpageindexbox="Always" submitbuttontext="Go" pagesize="1" textafterpageindexbox="页"
                    textbeforepageindexbox="转到">
                </Page:aspnetpager>
            </fieldset>
        </div>
    </form>
</body>
</html>
