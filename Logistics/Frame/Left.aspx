<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Left.aspx.cs" Inherits="Logistics.Frame.Left" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>左侧导航栏</title>
    <style type="text/css">
        body {
            margin: 0px;
            padding: 0px;
            font-size: 12px;
        }

        #navigation {
            margin: 0px;
            padding: 0px;
            width: 147px;
        }

            #navigation a.head {
                cursor: pointer;
                background: url(../Images/main_34.gif) no-repeat scroll;
                display: block;
                font-weight: bold;
                margin: 0px;
                padding: 5px 0 5px;
                text-align: center;
                font-size: 12px;
                text-decoration: none;
            }

            #navigation ul {
                border-width: 0px;
                margin: 0px;
                padding: 0px;
                text-indent: 0px;
            }

            #navigation li {
                list-style: none;
                display: inline;
            }

                #navigation li li a {
                    display: block;
                    font-size: 12px;
                    text-decoration: none;
                    text-align: center;
                    padding: 3px;
                }

                    #navigation li li a:hover {
                        background: url(../Images/tab_bg.gif) repeat-x;
                        border: solid 1px #adb9c2;
                    }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div id="menu" style="display: marker;" onload="getHeight()">
            <ul id="navigation">
                <li id="liTransportManage" runat="server" visible="false"><a class="head">车辆管理</a> <%-- runat="server" 后台获取id--%>
                    <ul>
                        <li id="liTruckTeamManage" runat="server"><a href="/TruckTeam/TruckTeamManage.aspx" target="mainframe">车队维护</a></li>
                        <li id="liAddTruckTeam" runat="server"><a href="/TruckTeam/AddTruckTeam.aspx" target="mainframe">添加车队</a></li>
                        <li id="liTruckManage" runat="server"><a href="/Truck/TruckManage.aspx" target="mainframe">车辆维护</a></li>
                        <li id="liAddTruck" runat="server"><a href="/Truck/AddTruck.aspx" target="mainframe">添加车辆</a></li>
                    </ul>
                </li>
                <li id="liDriver" runat="server"  visible="false"><a class="head">驾驶员管理</a>
                    <ul>
                        <li id="liDriverManage" runat="server"><a href="/Driver/DriverManage.aspx" target="mainframe">驾驶员维护</a></li>
                        <li id="liAddDriver" runat="server"><a href="/Driver/AddDriver.aspx" target="mainframe">添加驾驶员</a></li>
                    </ul>
                </li>
                <li id="liCapacity" runat="server"  visible="false"><a class="head">运力查询</a>
                    <ul>
                        <li id="liTruckTeamQuery" runat="server"><a href="/Capacity/TruckTeamQuery.aspx" target="mainframe">查询承运车队</a></li>
                        <li id="liTruckQuery" runat="server"><a href="/Capacity/TruckQuery.aspx" target="mainframe">查询承运车辆</a></li>
                        <li id="liCarriersQuery" runat="server"><a href="/Capacity/CarriersQuery.aspx" target="mainframe">查询历史承运单</a></li>
                    </ul>
                </li>
                <li id="liCarriers" runat="server"  visible="false"><a class="head">承运单管理</a>
                    <ul>
                        <li id="liCarriersManager" runat="server"><a href="/Carriers/CarriersManage.aspx" target="mainframe">承运单维护</a></li>
                        <li id="liAddCarriers" runat="server"><a href="/Carriers/AddCarriers.aspx" target="mainframe">添加承运单</a></li>
                        <li id="liCarriersReceive" runat="server"><a href="/Carriers/CarriersReceive.aspx" target="mainframe">接收承运单</a></li>
                    </ul>
                </li>
                <li id="liCommand" runat="server"  visible="false"><a class="head">车辆调度</a>
                    <ul>
                        <li id="liCommandTask" runat="server"><a href="/Command/CommandTask.aspx" target="mainframe">分配承运任务</a></li>
                    </ul>
                </li>
                <li id="liCost" runat="server"  visible="false"><a class="head">成本核算</a>
                    <ul>
                        <li id="liCostMaintenance" runat="server"><a href="/Cost/CostMaintenance.aspx" target="mainframe">成本维护</a></li>
                        <li id="liCosting" runat="server"><a href="/Cost/Costing.aspx" target="mainframe">成本核算</a></li>
                    </ul>
                </li>

                <li id="liSystemManage" runat="server"  visible="false"><a class="head">系统维护</a>
                    <ul>
                        <li id="liStaffManage" runat="server"><a href="/SystemManage/StaffManage.aspx" target="mainframe">用户维护</a></li>
                        <li id="liAddStaff" runat="server"><a href="/SystemManage/AddStaff.aspx" target="mainframe">添加用户</a></li>
                        <li id="liSearchLog" runat="server"><a href="/SystemManage/SearchLog.aspx" target="mainframe">日志查询</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </form>
</body>
</html>
