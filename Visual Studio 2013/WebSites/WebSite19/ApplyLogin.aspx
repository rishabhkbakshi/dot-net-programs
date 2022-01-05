<%@ Page Title="" Language="C#" MasterPageFile="~/LeaveMaster.master" AutoEventWireup="true"
    CodeFile="ApplyLogin.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table width="100%">
        <tr>
            <td style="text-align: center">
                <asp:Label ID="lblLogin" runat="server" Text="Leave Approval" Font-Size="X-Large"></asp:Label>
            </td>
        </tr>
    </table>
    <table width="100%">
        <tr>
            <td>
                <asp:Label ID="lblDesignation" runat="server" Text="Designation"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="drpdownDesignation" runat="server" Width="128px">
                    <asp:ListItem Value="0" Text="User"></asp:ListItem>
                    <asp:ListItem Value="1" Text="Manager"></asp:ListItem>
                    <asp:ListItem Value="2" Text="HR"></asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblUsername" runat="server" Text="User Name"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtUsername" runat="server" Width="128px"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="rfvUsername" runat="server" ErrorMessage="*" ControlToValidate="txtUsername"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblPassword" runat="server" Text="Password"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtPassword" runat="server" Width="128px" TextMode="Password"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ErrorMessage="*" ControlToValidate="txtPassword"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td colspan="2" style="text-align: center">
                <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
            </td>
        </tr>
        <tr>
            <td colspan="2" style="text-align: center">
                <asp:Label ID="lblResponse" runat="server"></asp:Label>
            </td>
        </tr>
    </table>
</asp:Content>
