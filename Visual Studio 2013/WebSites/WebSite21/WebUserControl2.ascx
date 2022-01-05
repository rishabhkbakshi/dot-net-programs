<%@ Control Language="C#" AutoEventWireup="true" CodeFile="WebUserControl2.ascx.cs"
    Inherits="WebUserControl2" %>
<table>
    <tr>
        <td>
            <asp:DropDownList ID="DrpStudent" runat="server" OnSelectedIndexChanged="DrpStudent_SelectedIndexChanged" DataValueField="StudentId"
                AutoPostBack="true">
            </asp:DropDownList>
        </td>
    </tr>
</table>
