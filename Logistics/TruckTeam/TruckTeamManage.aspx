<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TruckTeamManage.aspx.cs" Inherits="Logistics.TruckTeam.TruckTeamManage1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>车队信息维护</title>
    <link href="../CSS/niceforms-default.css" type="text/css" rel="stylesheet" />
    <style type="text/css">
        .auto-style1 {
            width: 574px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <fieldset style="margin-left: auto; margin-right: auto; text-align: left;">
            <div class="title">车队信息维护</div>
            <hr />
            
                <div class="auto-style1">
                    <span>车队名称</span>  <span>
                        <asp:DropDownList ID="dropTeamName" runat="server" Width="106px" Height="18px">
                            <asp:ListItem Value="-1">请选择</asp:ListItem>
                        </asp:DropDownList></span>
                    <span>车队负责人</span>      <span>
                        <asp:TextBox ID="tetLeader" runat="server"></asp:TextBox></span>
                    <span>
                        <asp:Button ID="Button1" runat="server" Text="查询" OnClick="Button1_Click" /></span>
                </div>
                <hr />
                <asp:GridView ID="gvTruckMange" DataKeyNames="TeamID" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellPadding="3"
                    CellSpacing="1" GridLines="None" Style="margin-right: 1px" OnRowDeleting="Unnamed1_RowDeleting" OnRowEditing="Unnamed1_RowEditing" OnRowUpdating="gvTruckMange_RowUpdating" OnRowCancelingEdit="gvTruckMange_RowCancelingEdit">

                    <Columns>
                        <asp:BoundField DataField="TeamID" HeaderText="车队ID" />
                        <asp:BoundField DataField="TeamName" HeaderText="车队名称" />
                        <asp:BoundField DataField="Leader" HeaderText="车队领导人" />
                        <asp:BoundField DataField="Remark" HeaderText="备注" />
                        <asp:BoundField DataField="CheckInTime" HeaderText="创队时间" />
                        <asp:BoundField DataField="AlterTime" HeaderText="更新时间" />
                        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                    </Columns>
                    <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
                    <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
                    <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
                    <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
                    <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#594B9C" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#33276A" />
                </asp:GridView>

       
        </fieldset>
    </form>
</body>
</html>
