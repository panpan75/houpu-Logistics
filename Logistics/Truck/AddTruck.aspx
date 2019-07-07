<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddTruck.aspx.cs" Inherits="Logistics.Truck.AddTruck" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>添加车辆信息</title>
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
                         <td class="auto-style1">车队名称</td>  <td><asp:DropDownList ID="ddlTruckTeamID" runat="server"></asp:DropDownList></td>
                     </tr>
                     <tr>
                         <td>车辆类型</td>
                         <td><asp:DropDownList ID="ddlTruckType" runat="server" Width="82px">
              
                         <asp:ListItem Value="0">公司车辆</asp:ListItem>
                         <asp:ListItem Value="1">私家车辆</asp:ListItem>
                         </asp:DropDownList></td>
                         <td class="auto-style1">购车时间</td> <td> <asp:TextBox ID="texCheackInTime" runat="server" Width="150px"></asp:TextBox></td>
                     </tr>
                     <tr>
                         <td>车身长度(米)</td> <td><asp:TextBox ID="texlength" runat="server" Width="150px"></asp:TextBox></td>
                          <td  colspan="2" rowspan="2">
                              备份：
                          <asp:TextBox ID="txtramrk" runat="server" Height="44px" TextMode="MultiLine"></asp:TextBox>
                          </td>    
                     </tr>  
                     <tr>
                    
                         <td>车辆吨位(顿)</td> <td> <asp:TextBox ID="textonnage" runat="server" Width="150px"></asp:TextBox></td>
                     </tr>  
                     <tr>
                    
                         <td>&nbsp;</td> <td> 
                         <asp:Button ID="Button1" runat="server" Text="添加" OnClick="Button1_Click" />
                         </td>
                          <td class="auto-style1">
                             <input id="btnReset" onclick="reset();" type="button" value="重置" />
                         </td> <td> 
                         
                         </td>
                     </tr>
                 </table>
                  

                
                   
            </fieldset>
    </div>
    </form>
</body>
</html>
