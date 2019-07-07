<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AlterCost.aspx.cs" Inherits="Logistics.Cost.AlterCost" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>成本修改信息</title>
     <link href="../CSS/niceforms-default.css"  type="text/css" rel="stylesheet"/>
    <style type="text/css">
        .auto-style1 {
            height: 24px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
 
    <fieldset style="margin-left: auto; margin-right: auto; text-align: left; width: 820px">
        <div class="title">
            成本修改信息
        </div>
        <hr />           
        
      <div>
          <table>

              <tr>
                  <%--Text='<%=SchedulingModel.Schedulingid %>'--%>

                    <td class="auto-style1">邮费：<asp:TextBox ID="txtOilCost" runat="server" ></asp:TextBox></td>
                    <td class="auto-style1">过桥费:<asp:TextBox ID="txtToll" runat="server"></asp:TextBox></td>
                    <td class="auto-style1">罚款:<asp:TextBox ID="txtFine" runat="server"></asp:TextBox></td>
                    <td class="auto-style1">其他费用:<asp:TextBox ID="txtOtherCost" runat="server"></asp:TextBox></td>
                  
              </tr>

              
              <tr>

                    <td></td>
                    <td></td>
                    <td>
                        <asp:Button ID="btnUpdeCost" runat="server" Text="修改成本" OnClick="btnUpdeCost_Click" />
                  </td>
              </tr>
          </table>
      </div>
                                                         
     </fieldset>
  
    </form>
</body>
</html>
