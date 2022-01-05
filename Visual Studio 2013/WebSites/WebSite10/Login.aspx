<%@ Page Title="" Language="C#" MasterPageFile="~/My Orkut.master" AutoEventWireup="true"
    CodeFile="Login.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table>
        <tr>
            <td>
                <asp:Label ID="lblLogin" runat="server" Text="Login" Font-Size="X-Large" Font-Underline="true"></asp:Label>
            </td>
        </tr>
    </table>
    <table>
        <tr>
            <td>
                <asp:Label ID="lblUserName" runat="server" Text="UserName" Font-Size="Large"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtUserName" runat="server"  Width="150px"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="rfvuser" runat="server" ControlToValidate="txtUserName"
                    ErrorMessage="*"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblPassword" runat="server" Text="Password" Font-Size="Large"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"  Width="150px"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="rfvpass" runat="server" ControlToValidate="txtPassword"
                    ErrorMessage="*"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="text-align: right">
                <asp:Button ID="btnLogin" runat="server" Text="Sign In" OnClick="btnLogin_Click" />
            </td>
            <td>
                <asp:Button ID="btnCreate" runat="server" Text="Sign Up" OnClick="btnCreate_Click" CausesValidation="false" />
            </td>
        </tr>
    </table>
</asp:Content>
