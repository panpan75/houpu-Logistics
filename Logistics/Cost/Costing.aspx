<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Costing.aspx.cs" Inherits="Logistics.Cost.Costing" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>成本核算</title>
    <link href="../CSS/niceforms-default.css"  type="text/css" rel="stylesheet"/>
    <script type="text/javascript">
         function remove() {
             var x = document.getElementByTagName("input").value;
             x.remove();

         }
    </script>

    <style type="text/css">
        .costing {
            height: 36px;
            width: 805px;
        }
        .auto-style1 {
            height: 24px;
        }
    </style>
    
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <fieldset style="margin-left: auto; margin-right: auto; text-align: left; width: 820px">
        <div class="title">
            成本核算
        </div>
      
                  <table>

                      <tr>

                          <td rowspan="2">
                                车队名称： <asp:ListBox ID="ListBox1" runat="server" Width="134px"></asp:ListBox>
                          </td>
                           <td class="auto-style1">
                               接收日期：
                               <asp:TextBox ID="txtReceiveDateBegin" runat="server"></asp:TextBox>
                             至<asp:TextBox ID="txtReceiveDateEnd" runat="server"></asp:TextBox>
                          </td>
                      </tr>
                        <tr>
                             <td>

                                 <asp:Button ID="Button1" runat="server" Text="核算并输出报表" />
                                 <input id="btnReset" onclick="reset();" type="button" value="重置" />


                          </td>
                          <td>

                          </td>
                      </tr>
                  </table>                                      
       
        </fieldset>
    </div>
    </form>
</body>
</html>
