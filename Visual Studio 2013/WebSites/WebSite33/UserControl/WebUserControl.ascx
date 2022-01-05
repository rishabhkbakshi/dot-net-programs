<%@ Control Language="C#" AutoEventWireup="true" CodeFile="WebUserControl.ascx.cs" Inherits="WebUserControl" %>
<table>
    <tr>
        <td>
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        </td>
        <td>
            <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/Application.ico" Height="16px" Width="16px" OnClick="ImageButton1_Click" />
        </td>
    </tr>
    <tr>
        <td>
            <asp:Calendar ID="Calendar1" runat="server" OnSelectionChanged="Calendar1_SelectionChanged"></asp:Calendar>
        </td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="lblLogic" runat="server" ></asp:Label>
        </td>
        <td>
            <asp:DropDownList ID="ddlLogic" runat="server" OnSelectedIndexChanged="ddlLogic_SelectedIndexChanged" AutoPostBack="true">
                <asp:ListItem Value="0" Text="--Select---"></asp:ListItem>
                <asp:ListItem Value="1" Text="Red"></asp:ListItem>
                <asp:ListItem Value="2" Text="Amber"> </asp:ListItem>
                <asp:ListItem Value="3" Text="Green"></asp:ListItem>
            </asp:DropDownList>
        </td>
    </tr>
</table>
