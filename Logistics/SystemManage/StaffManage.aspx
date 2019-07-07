<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StaffManage.aspx.cs" Inherits="Logistics.SystemManage.StaffManage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>用户信息维护</title>
    <link href="../CSS/niceforms-default.css"  type="text/css" rel="stylesheet"/>
    <script type="text/javascript">
         function remove() {
             var x = document.getElementByTagName("input").value;
             x.remove();

         }
    </script>

</head>
<%--    <frameset rows="134,*">
    <frame scrolling="0" frameborder="0" border="0" src="Frame/Top.aspx"></frame>
    <frameset  cols="175,*">
        <frame frameborder="0" src="Frame/Left.aspx"></frame>
         <frame  frameborder="0" src="UserHome.aspx" name="mainframe"></frame>
    </frameset>
</frameset>--%>

<body>

    <form id="form1" runat="server">
    <div style="width: 856px">
        
        <fieldset style="margin-left: auto; margin-right: auto; text-align: left; width: 820px">
        <div class="title">
            用户信息维护</div>
        <hr />
        <table width="100%">
            <tr>
                <td>
                    姓名:
                </td>
                <td>
                    <asp:TextBox ID="txtUserName" runat="server" MaxLength="20"></asp:TextBox>
                </td>
                <td>
                    电话:
                </td>
                <td>
                    <asp:TextBox ID="txtPhone" runat="server" MaxLength="20"></asp:TextBox>
                </td>
                <td>
                    添加时间
                </td>
                <td>
                    <asp:TextBox ID="txtSInTime" runat="server"></asp:TextBox>                    
                </td>
                <td>
                    至
                </td>
                <td>
                    <asp:TextBox ID="txtEInTime" runat="server"></asp:TextBox>                 
                </td>
            </tr>
            <tr>
                <td>
                    性别:
                </td>
                <td>
                    <asp:RadioButtonList ID="rblSex" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem Value="0">男</asp:ListItem>
                        <asp:ListItem Value="1">女</asp:ListItem>
                        <asp:ListItem Selected="True" Value="%">不限</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
                <td>
                    已删除
                </td>
                <td>
                    <asp:RadioButtonList ID="rblIsDelete" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem Value="1">是</asp:ListItem>
                        <asp:ListItem Value="0" >否</asp:ListItem>
                        <asp:ListItem Value="%" Selected="True">不限</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
                <td>
                    修改时间
                </td>
                <td>
                    <asp:TextBox ID="txtSAlterTime" runat="server"></asp:TextBox>
                </td>
                <td>
                    至
                </td>
                <td>
                    <asp:TextBox ID="txtEAlterTime" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    账号:
                </td>
                <td>
                    <asp:TextBox ID="txtAccount" runat="server" MaxLength="20"></asp:TextBox>
                </td>
                <td>
                    E-mail:
                </td>
                <td>
                    <asp:TextBox ID="txtEmail" runat="server" MaxLength="50"></asp:TextBox>
                </td>
                <td>
                    角色:
                </td>
                <td>
                    <asp:DropDownList ID="dropRoleID" runat="server" Width="75px">
                        <asp:ListItem Value="-1">不限</asp:ListItem>

                    </asp:DropDownList>
                </td>
                <td>
                </td>
                <td>
                    <asp:Button ID="btnSearch" runat="server" Text="检索" OnClick="btnSearch_Click" />
                    <input id="btnReset" onclick="reset();" type="button" value="重置" />
                </td>
            </tr>
        </table>
        <hr />
            <asp:GridView ID="gvUser" runat="server"  CellPadding="4" ForeColor="#333333" GridLines="None"   DataKeyNames="UserID"
AutoGenerateColumns="False" OnRowDeleting="gvUser_RowDeleting" style="margin-top: 0px" OnRowEditing="gvUser_RowEditing" OnRowUpdating="gvUser_RowUpdating" OnRowCancelingEdit="gvUser_RowCancelingEdit">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="UserName" HeaderText="用户姓名" />
              
                <asp:BoundField DataField="Sex" HeaderText="性别" />
              
                <asp:BoundField DataField="Account" HeaderText="账号" />
                <asp:BoundField DataField="Phone" HeaderText="电话" />
                <asp:BoundField DataField="Email" HeaderText="E-mail" />
                <asp:BoundField DataField="FK_RoleID" HeaderText="角色" />
                <asp:BoundField DataField="AlterTime" HeaderText="添加时间" />
                <asp:BoundField DataField="IsDelete" HeaderText="删除" />
              
                <asp:BoundField DataField="AlterTime" HeaderText="修改时间" />
              
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" HeaderText="操作" />
             
 
              
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
            
    </fieldset>
       
        
    </div>
   
    </form>
</body>
</html>
