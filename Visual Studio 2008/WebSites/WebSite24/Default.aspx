<%@ Page Title="" Language="C#" MasterPageFile="~/Login.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Label ID="lblLog" runat="server"></asp:Label> 
        <table>
            <tr>
                <td>
                    <asp:Label ID="lblL" runat="server" Text="Login" Font-Size="X-Large"></asp:Label>
                </td>
            </tr>
        </table>
        <table >
            <tr>
                <td>
                    <asp:Label ID="lblU" runat="server" Text="Username"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtU" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="rfvU" runat="server" ErrorMessage="*" ControlToValidate="txtU" ValidationGroup="user & Pass"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblP" runat="server" Text="Password"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtP" runat="server" TextMode="Password"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="rfvP" runat="server" ErrorMessage="*" ControlToValidate="txtP" ValidationGroup="user & Pass"></asp:RequiredFieldValidator>
                </td>
            </tr>
        </table>
        <table>
            <tr>
                <td>
                    <asp:Button ID="btnL" runat="server" Text="Login" onclick="btnL_Click" ValidationGroup="user & Pass"/>
                </td>
                <td>
                    <asp:Button ID="btnC" runat="server" Text="Create" onclick="btnC_Click" />
                </td>
            </tr>
        </table>
        <table>
            <tr>
                <td>
                    <asp:Label ID="lblMes" runat="server"></asp:Label>
                </td>
            </tr>
        </table>
</asp:Content>

