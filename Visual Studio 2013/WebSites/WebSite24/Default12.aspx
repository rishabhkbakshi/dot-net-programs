<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default12.aspx.cs" Inherits="Default12" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Group Gridview Columns in asp.net</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:GridView ID="gvDetails" AutoGenerateColumns="false" CellPadding="5" runat="server" OnRowDataBound="gvDetails_RowDataBound">
                <Columns>
                    <asp:BoundField HeaderText="UserId" DataField="UserId" />
                    <asp:BoundField HeaderText="UserName" DataField="UserName" />
                    <asp:BoundField HeaderText="Education" DataField="Education" />
                    <asp:BoundField HeaderText="Location" DataField="Location" />
                </Columns>
                <HeaderStyle BackColor="#df5015" Font-Bold="true" ForeColor="White" />
            </asp:GridView>
        </div>
    </form>
</body>
</html>
