<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddCarriers.aspx.cs" Inherits="Logistics.Carriers.AddCarriers" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>添加承运单</title>
    <link href="../CSS/niceforms-default.css" type="text/css" rel="stylesheet" />
    <style type="text/css">
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
                    <asp:Label ID="lbCarriers" runat="server"></asp:Label>
                </div>
                <hr />
                <table id="Carriers" runat="server">
                    <tr>
                        <td>发货单位：</td>
                        <td>
                            <asp:TextBox ID="txtSendCompany" runat="server"></asp:TextBox></td>

                        <td>收货单位：</td>
                        <td>
                            <asp:TextBox ID="txtReceiveCompany" runat="server"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td>发货单位地址：</td>
                        <td>
                            <asp:TextBox ID="txtSendAddress" runat="server"></asp:TextBox>
                        </td>
                        <td>收货单位地址：</td>
                        <td>
                            <asp:TextBox ID="txtFK_ReceiveAddress" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>发货人：</td>
                        <td>
                            <asp:TextBox ID="txtSendLinkman" runat="server"></asp:TextBox>
                        </td>
                        <td>收货人：</td>
                        <td>
                            <asp:TextBox ID="txtReceiveLinkman" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style1">发货电话：</td>
                        <td class="auto-style1">
                            <asp:TextBox ID="txtSendPhone" runat="server"></asp:TextBox>
                        </td>
                        <td class="auto-style1">收货电话：</td>
                        <td class="auto-style1">
                            <asp:TextBox ID="txtReceivePhone" runat="server"></asp:TextBox>
                        </td>
                    </tr>


                    <tr>
                        <td>保修费用：</td>
                        <td>
                            <asp:TextBox ID="txtInsuranceCost" runat="server" Width="85px"></asp:TextBox>
                        </td>
                        <td>运费：</td>
                        <td>
                            <asp:TextBox ID="txtTransportCost" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>其他费用：</td>
                        <td>
                            <asp:TextBox ID="txtOtherCost" runat="server" Width="132px"></asp:TextBox>
                        </td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>

                    <tr>
                        <td class="auto-style1"></td>
                        <td class="auto-style1"></td>
                        <td class="auto-style1">
                            &nbsp;</td>
                        <td class="auto-style1">
                            <asp:Button ID="btnAddCarriers" runat="server" Text="添加承运单" Width="93px" Visible="false" OnClick="btnAddCarriers_Click" />
                            <asp:Button ID="btnupdeCarriers" runat="server" Text="修改承运单" Width="93px" Visible="false" OnClick="btnupdeCarriers_Click" />
                        </td>
                    </tr>

                </table>

                <table id="goods" runat="server"  >

                    <tr>
                        <td class="auto-style1">承运单号：</td>
                        <td class="auto-style1">
                            <asp:TextBox ID="carrnum" runat="server" ReadOnly="True"></asp:TextBox></td>

                        <td class="auto-style1">货物名称：</td>
                        <td class="auto-style1">
                            <asp:TextBox ID="goodsname" runat="server"></asp:TextBox></td>

                    </tr>

                    <tr>
                        <td class="auto-style1">货物数量：</td>
                        <td class="auto-style1">
                            <asp:TextBox ID="goodscount" runat="server"></asp:TextBox></td>
                        <td class="auto-style1">货物重量：</td>
                        <td class="auto-style1">
                            <asp:TextBox ID="goodsweight" runat="server"></asp:TextBox></td>
                        <td class="auto-style1">货物体积：</td>
                        <td class="auto-style1">
                            <asp:TextBox ID="goodsti" runat="server"></asp:TextBox></td>

                    </tr>
                    <tr>
                        <td class="auto-style1">是否删除：</td>
                        <td class="auto-style1">
                            <asp:TextBox ID="del" runat="server"></asp:TextBox></td>
                        <td class="auto-style1">
                            <asp:Button ID="ADDgoods" runat="server" Text="添加货物" OnClick="ADDgoods_Click" /></td>
                    </tr>

                </table>



            </fieldset>
        </div>
    </form>
</body>
</html>
