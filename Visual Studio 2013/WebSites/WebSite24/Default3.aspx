<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default3.aspx.cs" Inherits="Default3" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Get files from folder & subfolder & display it in gridview in c#.net</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Button ID="btnGetFiles" Text="Get Files From Folder & Sub Folders" runat="server" OnClick="btnGetFiles_Click" />
            <asp:GridView ID="gvDetails" CellPadding="5" runat="server">
                <HeaderStyle BackColor="#df5015" Font-Bold="true" ForeColor="White" />
            </asp:GridView>
        </div>
    </form>
</body>
</html>
