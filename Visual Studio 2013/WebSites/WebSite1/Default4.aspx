<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default4.aspx.cs" Inherits="Default4" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:TextBox ID="txt" runat="server"></asp:TextBox>
        <asp:CustomValidator ID="CustomValidator1" runat="server" ErrorMessage="*" SetFocusOnError="true"
            Display="Dynamic" ValidateEmptyText="true" ControlToValidate="txt" OnServerValidate="CustomValidator1_ServerValidate"></asp:CustomValidator>
        <asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click"   />
    </div>
    </form>
</body>
</html>
