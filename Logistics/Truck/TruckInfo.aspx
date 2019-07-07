<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TruckInfo.aspx.cs" Inherits="Logistics.Truck.TruckInfo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>车辆详细信息</title>
    <link href="../CSS/niceforms-default.css"  type="text/css" rel="stylesheet"/>
    <style type="text/css">
        .auto-style1 {
            height: 24px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <fieldset style="margin-left: auto; margin-right: auto; text-align: left; width: 1000px">
       车辆详情<hr />
           <table>
            <tr>
                <td class="auto-style1">车辆编号</td>
                <td class="auto-style1">车牌号码</td>
                <td class="auto-style1">购车日期</td>
                <td class="auto-style1">车辆类型</td>
                <td class="auto-style1">车身长度</td>
                <td class="auto-style1">吨位</td>
                <td class="auto-style1">车队ID</td>
                <td class="auto-style1">工作状态</td>
                <td class="auto-style1">加入时间</td>
              
            </tr>
            <tr>
    
            <td><%=TruckModel.TruckID %></td>
            <td><%=TruckModel.Number%></td>
            <td><%=TruckModel.BuyDate%></td>
            <td><%=TruckModel.Type%></td>
            <td><%=TruckModel.Length%></td>
            <td><%=TruckModel.Tonnage%></td>
            <td><%=TruckModel.FK_TeamID%></td>
            <td><%=TruckModel.State%></td>
            <td><%=TruckModel.CheackInTime%></td>
   
            </tr>
    
           </table>

        </fieldset>
    </div>
    </form>
</body>
</html>
