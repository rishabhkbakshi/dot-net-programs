<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <asp:Label runat="server" ID="lblMessage1" Text="hello" />
    <asp:Label runat="server" ID="lblMessage" />
    <asp:DropDownList runat="server" ID="ddlMessage" 
            onselectedindexchanged="ddlMessage_SelectedIndexChanged" AutoPostBack="true">
    <asp:ListItem Text="World" Value="World"></asp:ListItem>
    <asp:ListItem Text="Universe" Value="Universe"></asp:ListItem>
    </asp:DropDownList>
    <asp:Button runat="server" ID="btnSubmit" Text="Submit" onclick="btnSubmit_Click" />
    </div>
    </form>
</body>
</html>
