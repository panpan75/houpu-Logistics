<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CarriersQuery.aspx.cs" Inherits="Logistics.Capacity.CarriersQuery" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>查询历史承运单</title>
    <link href="../CSS/niceforms-default.css"  type="text/css" rel="stylesheet"/>

    <style type="text/css">
        .auto-style1 {
            width: 62px;
            height: 24px;
        }
        .auto-style3 {
            width: 81px;
        }
        .auto-style4 {
            width: 81px;
            height: 24px;
        }
        .auto-style5 {
            width: 3px;
            height: 24px;
        }
        .auto-style7 {
            width: 149px;
            height: 24px;
        }
        .auto-style9 {
            width: 3px;
        }
        .auto-style10 {
            width: 149px;
        }
        .auto-style11 {
            height: 24px;
        }
    </style>

</head>
<body>
    <form id="form1" runat="server">
    <div style="width: 856px">
        
        <fieldset style="margin-left: auto; margin-right: auto; text-align: left; width: 820px">
        <div class="title">
            查询历史承运单
        </div>
        <hr />
        <table width="100%">
            <tr>
                <td class="auto-style4">
                    承运单编号：</td>
                <td class="auto-style1">
                    <asp:TextBox ID="txtCarriersID" runat="server" MaxLength="20"></asp:TextBox>
                </td>
                <td class="auto-style1">
                    承运日期：</td>
                <td class="auto-style7">
                    <asp:TextBox ID="txtLeaverDateBegin" runat="server" MaxLength="20" Width="160px"></asp:TextBox>
                </td>
                <td class="auto-style5">
                    至</td>
                <td class="auto-style1">
                    <asp:TextBox ID="txtLeaverDateEnd" runat="server"></asp:TextBox>                    
                </td>
              
            </tr>
            <tr>
                <td class="auto-style4">
                    收货人：</td>
                <td class="auto-style11">
                    <asp:TextBox ID="txtReceiveLinkman" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style11">
                    收货日期：</td>
                <td class="auto-style7">
                    <asp:TextBox ID="txtReceiveDateBegin" runat="server" Width="160px"></asp:TextBox>
                </td>
            
                <td class="auto-style5">至</td>
                <td class="auto-style11">
                    <asp:TextBox ID="ReceiveDateEnd" runat="server"></asp:TextBox></td>
            
            </tr>
            <tr>
                <td class="auto-style3">
                    发货人：</td>
                <td>
                    <asp:TextBox ID="txtAccount" runat="server" MaxLength="20"></asp:TextBox>
                </td>
                <td>
                    业务员：</td>
                <td class="auto-style10">
                    <asp:TextBox ID="txtFK_UserID" runat="server" MaxLength="50" Width="160px"></asp:TextBox>
                </td>
                <td class="auto-style9" >
                   </td>
                <td >
                    <asp:Button ID="btinquiry" runat="server" Text="查询" OnClick="btinquiry_Click" />
                </td>
             
              
            </tr>
        </table>
        <hr />

         
             
           
         <asp:Repeater ID="rpCarriers" runat="server">
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
                   <td><a href="CarriersInfo.aspx?Carriersid=<%#Eval("CarriersID") %>">详情</a></td>
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
