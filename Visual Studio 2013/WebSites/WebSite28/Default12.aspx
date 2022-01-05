<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default12.aspx.cs" Inherits="Default12" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:GridView ID="grdViewData" runat="server"></asp:GridView>
        <asp:GridView ID="drgViewData2" runat="server"></asp:GridView>
        <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
    </div>
    </form>
</body>
</html>
