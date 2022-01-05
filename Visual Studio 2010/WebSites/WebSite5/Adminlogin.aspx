<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Adminlogin.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<div style="text-align: center; background-color: Silver" class="style1">
        <table align="center">
            <tr>
                <td>
                    <asp:Label ID="lblLogin" runat="server" Text="Admin Login" Font-Size="XX-Large" Font-Underline="true"></asp:Label>
                </td>
            </tr>
        </table>
        <table align="center">
            <tr>
                <td>
                    <asp:Label ID="lblAdminUser" runat="server" Text="Username" Font-Size="X-Large"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtAdminUser" runat="server" CssClass="input_text"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="Rfv" runat="server" ErrorMessage="*" ControlToValidate="txtAdminUser"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblAdminPass" runat="server" Text="Password" Font-Size="X-Large"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtAdminPass" runat="server" TextMode="Password" CssClass="input_text"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="Rfv2" runat="server" ErrorMessage="*" ControlToValidate="txtAdminPass"></asp:RequiredFieldValidator>
                </td>
            </tr>
        </table>
        <table align="center">
            <tr>
                <td>
                    <asp:Button ID="btnadminlogin" runat="server" Text="Submit" OnClick="btnadminlogin_Click" CssClass="input_button" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblValidation" runat="server"></asp:Label>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>

