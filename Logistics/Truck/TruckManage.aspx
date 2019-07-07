<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TruckManage.aspx.cs" Inherits="Logistics.Truck.TruckManage" %>
<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="Page" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>车辆信息维护</title>
    <link href="../CSS/niceforms-default.css" type="text/css" rel="stylesheet" />
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
                <asp:Repeater ID="rptTruckList" runat="server" OnItemCommand="rptTruckList_ItemCommand">

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
                                <td>用户操作</td>
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
                            <td><a href="TruckInfo.aspx?truckid=<%# Eval("TruckID")%>">详情</a></td>
                            <td><a href="AlterTruck.aspx?truckid=<%# Eval("TruckID")%>">修改</a>
                                <asp:Button ID="Button2" runat="server" Text="删除" CommandName="delete" CommandArgument='<%# Eval("TruckID")%>' />
                            </td>
                        </tr>
                    </ItemTemplate>

                    <FooterTemplate></table></FooterTemplate>
                </asp:Repeater>

                <page:aspnetpager id="AspNetPager1" runat="server"
                    custominfohtml="第%CurrentPageIndex%页，共%PageCount%页，每页%PageSize%条"
                    firstpagetext="首页" lastpagetext="尾页" layouttype="Table" nextpagetext="下一页"
                    onpagechanging="AspNetPager1_PageChanging" pageindexboxtype="DropDownList"
                    pagingbuttonlayouttype="Span" prevpagetext="上一页" showcustominfosection="Left"
                    showpageindexbox="Always" submitbuttontext="Go" pagesize="4" textafterpageindexbox="页"
                    textbeforepageindexbox="转到"> 
                </page:aspnetpager>





            </fieldset>
        </div>
    </form>
    <p>
        &nbsp;&nbsp;&nbsp;
    </p>
</body>
</html>
