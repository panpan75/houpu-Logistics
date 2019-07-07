<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SearchLog.aspx.cs" Inherits="Logistics.SystemManage.SearchLog" %>
<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="Page" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>日志查询</title>

    <link href="../CSS/niceforms-default.css"  type="text/css" rel="stylesheet"/>


    <script type="text/javascript">
         function remove() {
             var x = document.getElementByTagName("input").value;
             x.remove();

         }
    </script>



    <style type="text/css">
        .auto-style1 {
            height: 82px;
            width: 700px;
        }
    </style>



</head>

<body>
    <form id="form1" runat="server">

         <fieldset>
          <div class="title">
           日志查询
          </div>
        <hr style="height: -12px; width: 1083px" />
                     

             <table class="auto-style1">

                 <tr>

                     <td class="auto-style1" >操作类型</td>
                     <td class="auto-style1" >
                         <asp:DropDownList ID="ddlFk_TypeID" runat="server" Height="21px" Width="101px">
                     <asp:ListItem Value="-1">不限</asp:ListItem>
                     </asp:DropDownList></td>
                     <td class="auto-style1" >操作人员账号
                        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox></td>
                     <td class="auto-style1"  > 操作时间<asp:TextBox ID="TextBox2" runat="server"></asp:TextBox> - </td>
                     <td class="auto-style1" > <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox></td>
                 </tr>

                   <tr>

                     <td>是否异向</td>
                     <td >     
                     <asp:RadioButtonList ID="RadioButtonList1" runat="server" Height="28px" RepeatDirection="Horizontal" Width="148px">
                     <asp:ListItem Value="0">是</asp:ListItem>
                     <asp:ListItem Value="1">否</asp:ListItem>
                     <asp:ListItem Value="2">不限</asp:ListItem>
                    </asp:RadioButtonList></td>
                     <td>
                          存储过程名：<asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                     </td>
                       <td ></td>
                       <td><asp:Button ID="Button1" runat="server" Text="检测" OnClick="Button1_Click" />
                          <input id="btnReset" onclick="reset();" type="button" value="重置" />
</td>
                 </tr>
             </table>
             <hr style="height: -12px; width: 1083px" />
             <asp:Repeater ID="rpSysLog" runat="server">
                   <HeaderTemplate>
                     <table> 
                         <tr>
                                
                         <td>日志编号</td>
                         <td>操作行为</td>
                       
                         <td>行为类型</td>
                         <td>操作人员</td>
                         <td>参数</td>
                         <td>存储过程</td> 
                         <td>操作人员IP</td>
                         <td>操作时间</td>
                         <td>异常时间详情</td>                  
                         <td>异常</td>
                        
                         </tr>
                </HeaderTemplate>
                <ItemTemplate>
                    
                    <tr>                                
                         <td><%# Eval("LogID") %></td>
                         <td><%# Eval("Behavior") %></td>
                         <td><%# Eval("Fk_TypeID" )%></td>
                         <td><%# Eval("FK_UserID") %></td>
                         <td><%# Eval("Parameters")%></td>
                         <td><%# Eval("ProcName")%></td>                      
                         <td><%# Eval("IP")%></td>
                         <td><%# Eval("CheckInTime")%></td>
                         <td><%# Eval("Exception")%></td>                
                         <td><%# Eval("IsException").ToString()=="0"?"正常":"异常"%></td>                                                                  
                   </tr>
           
                </ItemTemplate>
                <FooterTemplate>
                     </table>

                </FooterTemplate>

             </asp:Repeater>
               <Page:AspNetPager ID="AspNetPager1" runat="server" CustomInfoHTML="第%CurrentPageIndex%页，共%PageCount%页，每页%PageSize%条"
                FirstPageText="首页" LastPageText="尾页" LayoutType="Table" NextPageText="下一页" OnPageChanging="AspNetPager1_PageChanging"
                PageIndexBoxType="DropDownList" PagingButtonLayoutType="Span" PrevPageText="上一页"
                ShowCustomInfoSection="Left" ShowPageIndexBox="Always" SubmitButtonText="Go"
                PageSize="6" TextAfterPageIndexBox="页" TextBeforePageIndexBox="转到">
            </Page:AspNetPager>


          </fieldset>

    </form>
</body>
</html>
