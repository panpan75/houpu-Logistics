<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DriverInfo.aspx.cs" Inherits="Logistics.Driver.DriverInfo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>详情页</title>
    <link href="../CSS/niceforms-default.css"  type="text/css" rel="stylesheet"/>
</head>
<body>
    <form id="form1" runat="server">
      <fieldset>
          <div class="title">
            驾驶员详情页
          </div>
        <table>
            <tr>
                <td>司机姓名：</td>
                <td><%=DriverModel.Name%></td>
                <td>所属车队：</td>
                <td><%=DriverModel.FK_TeamID%></td>
             </tr>
            <tr>
                <td>司机性别：</td>
                <td><%=DriverModel.Sex%></td>
                <td>出生日期：</td>
                <td><%=DriverModel.Birth%></td>
            </tr>
            <tr>
                <td>联系电话：</td>
                <td><%=DriverModel.Phone%></td>
                <td></td>
                <td  rowspan="2"><%=DriverModel.Remark%></td>
            </tr>
            <tr>
                <td>身份证号码：</td>
                <td><%=DriverModel.IDCard%></td>
                <td>备注：</td>
            </tr>
            <tr>
                <td>司机状态：</td>
                <td><%=DriverModel.State%></td>
                <td></td>
                <%--<td>
                    <asp:Button ID="btnAlter" runat="server" Text="修改"  />
                    <asp:Button ID="btnReset" runat="server" Text="重置" /></td>--%>
            </tr>
        </table>                                 
       
        </fieldset>
    </form>
</body>
</html>
