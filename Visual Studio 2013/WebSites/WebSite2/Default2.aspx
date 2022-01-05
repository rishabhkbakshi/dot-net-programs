<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default2.aspx.cs" Inherits="Default2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div style="font-family: Calibri">
        <asp:GridView ID="grdPassword" runat="server" AutoGenerateColumns="False">
            <Columns>
                <asp:BoundField DataField="Site" HeaderText="Site" />
                <asp:BoundField DataField="UserName/ID" HeaderText="UserName/ID" />
                <asp:BoundField DataField="Password" HeaderText="Password" />
                <asp:BoundField DataField="Used" HeaderText="Used" />
            </Columns>
        </asp:GridView>
    </div>
    </form>
</body>
</html>
