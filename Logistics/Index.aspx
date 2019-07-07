<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="Logistics.Index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>默认页面</title>
</head>
<frameset rows="134,*">
    <frame scrolling="0" frameborder="0" border="0" src="Frame/Top.aspx"></frame>
    <frameset  cols="175,*">
        <frame frameborder="0" src="Frame/Left.aspx"></frame>
         <frame  frameborder="0" src="UserHome.aspx" name="mainframe"></frame>
    </frameset>
</frameset>

<body>
    <form id="form1" runat="server">
    <div>    
    </div>
    </form>
</body>
</html>
