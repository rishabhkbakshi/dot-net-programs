<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Move Gridview Rows up and down button clicks in asp.net</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:GridView ID="gvUserInfo" runat="server" AutoGenerateColumns="false" DataKeyNames="Priority" OnRowCommand="gvUserInfo_RowDataCommand">
                <HeaderStyle BackColor="#df5015" Font-Bold="true" ForeColor="White" />
                <Columns>
                    <asp:BoundField DataField="MobileId" HeaderText="MobileId" />
                    <asp:BoundField DataField="MobileName" HeaderText="MobileName" />
                    <asp:TemplateField HeaderText="Location">
                        <ItemTemplate>
                            <asp:Button ID="btnUp" CommandName="Up" ToolTip="UP" Text="&uArr;" ForeColor="White" Height="20px" Font-Bold="true" BackColor="#E07200" runat="server" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" />
                            <asp:Button ID="btnDown" CommandName="Down" ToolTip="Down" Text="&dArr;" ForeColor="White" Height="20px" Font-Bold="true" BackColor="#E07200" runat="server" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>
