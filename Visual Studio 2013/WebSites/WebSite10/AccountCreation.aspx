<%@ Page Title="" Language="C#" MasterPageFile="~/My Orkut.master" AutoEventWireup="true"
    CodeFile="AccountCreation.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table>
        <tr>
            <td>
                <asp:Label ID="lblAccountCreation" Text="Account Creation" runat="server" Font-Size="X-Large"
                    Font-Underline="true"></asp:Label>
            </td>
        </tr>
    </table>
    <table>
        <tr>
            <td>
                <asp:Label ID="lblUserName" runat="server" Text="UserName" Font-Size="Large"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtUserName" runat="server" Width="150px"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="rfvUserName" runat="server" ControlToValidate="txtUserName"
                    ErrorMessage="*"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblPassword" runat="server" Text="Password" Font-Size="Large"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtPassword" runat="server" Width="150px" TextMode="Password"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="rfvPass" runat="server" ControlToValidate="txtPassword"
                    ErrorMessage="*"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblConfirmPassword" runat="server" Text="Confirm Password" Font-Size="Large"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtCPassword" runat="server" Width="150px" TextMode="Password"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="rfvcpass" runat="server" ControlToValidate="txtCPassword"
                    ErrorMessage="*"></asp:RequiredFieldValidator>
            </td>
            <td>
                <asp:CompareValidator ID="comPass" runat="server" ErrorMessage="Not matched" ControlToCompare="txtPassword"
                    ControlToValidate="txtCPassword"></asp:CompareValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblEmail" runat="server" Text="Email" Font-Size="Large"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtEmail" runat="server" Width="150px"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail"
                    ErrorMessage="*"></asp:RequiredFieldValidator>
            </td>
            <td>
                <asp:RegularExpressionValidator ID="revemail" runat="server" ErrorMessage="Enter valid Form of Email"
                    ControlToValidate="txtEmail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblPhone" runat="server" Text="PhoneNo." Font-Size="Large"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtPhone" runat="server" Width="150px"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="rfvPhone" runat="server" ControlToValidate="txtPhone"
                    ErrorMessage="*"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblFUpload" runat="server" Text="Your Profile Pic" runat="server"
                    Font-Size="Large"></asp:Label>
            </td>
            <td>
                <asp:FileUpload ID="Fupload" runat="server" />
            </td>
            <td>
                <asp:RequiredFieldValidator ID="rfvimage" runat="server" ControlToValidate="Fupload"
                    ErrorMessage="*"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="linkbtn">
                <asp:HyperLink ID="hylnkUseraccount" runat="server" Text="Login Page" NavigateUrl="~/Login.aspx"></asp:HyperLink>
            </td>
        </tr>
        <tr>
            <td style="text-align: right">
                <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
            </td>
            <td>
                <asp:Button ID="btnClear" runat="server" Text="Clear" CausesValidation="false" OnClick="btnClear_Click" />
            </td>
        </tr>
    </table>
</asp:Content>
