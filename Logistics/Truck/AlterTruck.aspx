<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AlterTruck.aspx.cs" Inherits="Logistics.Truck.AlterTruck" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>修改车辆信息</title>
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
       
                 <table>

                     <tr>
                         <td>车牌号码：</td><td><asp:TextBox ID="txtnumber" runat="server" Width="150px"></asp:TextBox></td>
                         <td class="auto-style3">车队名称</td>  <td>
                         <asp:TextBox ID="txtTeamID" runat="server" Width="150px"></asp:TextBox>
                         </td>
                     </tr>
                     <tr>
                         <td>车辆类型</td> <td>
                         <asp:TextBox ID="txttype" runat="server" Width="150px"></asp:TextBox>
                         </td>
                         <td class="auto-style3">购车时间</td> <td> <asp:TextBox ID="texCheackInTime" runat="server" Width="150px"></asp:TextBox></td>
                     </tr>
                     <tr>
                         <td>车身长度(米)</td> <td><asp:TextBox ID="texlength" runat="server" Width="150px"></asp:TextBox></td>
                          <td  colspan="2" rowspan="2">
                              备份：
                          <asp:TextBox ID="txtramrk" runat="server" Height="44px" TextMode="MultiLine"></asp:TextBox>
                          </td>    
                     </tr>  
                     <tr>
                    
                         <td class="auto-style2">车辆吨位(顿)</td> <td class="auto-style2"> <asp:TextBox ID="textonnage" runat="server" Width="150px"></asp:TextBox></td>
                     </tr>  
                     <tr>
                    
                         <td class="auto-style1"></td> <td class="auto-style1"> 
                         <asp:Button ID="updeTruck" runat="server" Text="修改"  OnClick="updeTruck_Click" Height="30px"/>
                         </td>
                          <td class="auto-style3" colspan="2">
                           
                              <asp:RadioButtonList ID="rblStae" runat="server" Width="141px">
                                     <asp:ListItem Value="1">承运中</asp:ListItem>
                                  <asp:ListItem Value="2">空闲</asp:ListItem>
                              </asp:RadioButtonList>
                              </td> <td class="auto-style1"> 
                         
                         </td>
                     </tr>
                 </table>
                  

                
                    
            </fieldset>
    </div>
    </form>
</body>
</html>
