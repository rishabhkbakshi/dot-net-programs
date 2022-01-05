<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default2.aspx.cs" Inherits="Default2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Get Checkbox Selected Row Values from Gridview in Asp.net</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:GridView ID="gvDetails" DataKeyNames="UserId" AutoGenerateColumns="false" CellPadding="5" runat="server">
                <Columns>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:CheckBox ID="chkSelect" runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField HeaderText="UserId" DataField="UserId" />
                    <asp:BoundField HeaderText="UserName" DataField="UserName" />
                    <asp:BoundField HeaderText="Education" DataField="Education" />
                    <asp:BoundField HeaderText="Location" DataField="Location" />
                </Columns>
                <HeaderStyle BackColor="#df5015" Font-Bold="true" ForeColor="White" />
            </asp:GridView>
            <asp:Button ID="btnProcess" Text="Get Selected Records" runat="server"
                Font-Bold="true" OnClick="btnProcess_Click" /><br />
            <asp:Label ID="lblmsg" runat="server" />
        </div>
    </form>
</body>
</html>
