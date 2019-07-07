<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DriverManage.aspx.cs" Inherits="Logistics.Driver.DriverManage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link href="../CSS/niceforms-default.css" type="text/css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            &nbsp;&nbsp;
         
        <fieldset style="margin-left: auto; margin-right: auto; text-align: left; width: 820px">
            <div class="title">
                司机信息维护
            </div>
            <hr style="height: -12px; width: 1083px" />
            所属车队：
                <asp:DropDownList ID="ddlDriverTeamID" runat="server" Style="margin-left: 0px" Width="113px">
                    <asp:ListItem Value="-1">全部</asp:ListItem>
                </asp:DropDownList>
            司机姓名：<asp:TextBox ID="txtname" runat="server"></asp:TextBox>
            手机号码：<asp:TextBox ID="txtphone" runat="server"></asp:TextBox>
            公司状态
                <asp:DropDownList ID="ddlDriverState" runat="server" Height="17px" Width="70px">
                    <asp:ListItem Width="100px" Value="-1">全部</asp:ListItem>
                </asp:DropDownList>
            <asp:Button ID="Button1" runat="server" Text="查询" OnClick="Button1_Click" />

            <br />


            <asp:Repeater ID="rpDrverList" runat="server" OnItemCommand="rpDrverList_ItemCommand">


                <HeaderTemplate>
                    <table>
                        <tr>

                            <td>司机编号</td>
                            <td>司机姓名</td>
                            <td>性别</td>
                            <td>出生日期</td>
                            <td>联系电话</td>
                            <td>身份证号码</td>
                            <td>车队名称</td>
                            <td>工作状态</td>
                            <td>备注</td>
                            <td>加入时间</td>
                            <td>修改时间</td>
                            <td>车辆绑定</td>
                            <td>用户操作</td>
                        </tr>
                </HeaderTemplate>
                <ItemTemplate>

                    <tr>

                        <td><%# Eval("DriverID") %></td>
                        <td><%# Eval("Name") %></td>
                        <td><%# Eval("Sex").ToString()=="0"?"男":"女" %></td>
                        <td><%# Eval("Birth") %></td>
                        <td><%# Eval("Phone")%></td>
                        <td><%# Eval("IDCard")%></td>
                        <td><%# Eval("FK_TeamID")%></td>
                        <td><%# Eval("State").ToString()=="1"?"承运中":"空闲"%></td>
                        <td><%# Eval("Remark")%></td>
                        <td><%# Eval("CheckInTime")%></td>
                        </td>
                         <td><%# Eval("AlterTime")%></td>
                        <td>
                            <%-- CommandArgument='<%# Eval("DriverID")  绑定 解绑 传id中--%>
                            <asp:LinkButton ID="lbbindTruck" runat="server" CommandArgument='<%# Eval("DriverID") %>' OnClick="lbbindTruck_Click" Visible='<%# bindstats( Eval("DriverID"), Eval("State"),"binding")%>'>绑定车辆</asp:LinkButton>
                            <asp:LinkButton ID="lbbundTruck" runat="server" CommandArgument='<%# Eval("DriverID") %>' OnClick="lbbundTruck_Click" OnClientClick="return  confirm('你确定要解绑？')" Visible='<%# bindstats( Eval("DriverID"), Eval("State"),"unbound")%>'>解绑车辆</asp:LinkButton>
                        </td>
                        <td><a href="AddDriver.aspx">新增</a>
                            <a href="AlterDriver.aspx?id=<%# Eval("DriverID") %>">修改</a>
                            <asp:LinkButton ID="LinkButton1" runat="server" CommandName="delete" CommandArgument='<%# Eval("DriverID")%>'>删除</asp:LinkButton>

                            <a href="DriverInfo.aspx?id=<%# Eval("DriverID") %>">详情</a>
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
