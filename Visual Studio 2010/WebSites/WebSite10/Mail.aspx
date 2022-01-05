<%@ Page Title="" Language="C#" MasterPageFile="~/My Orkut.master" AutoEventWireup="true"
    CodeFile="Mail.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table>
        <tr>
            <td>
                <asp:Label ID="lblUseraccount" runat="server" Text="Your Orkut Account" Font-Size="X-Large"
                    Font-Underline="true"></asp:Label>
            </td>
        </tr>
    </table>
    <table>
        <tr>
            <td>
                <asp:Label ID="lblTo" runat="server" Text="To" Font-Size="Large"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtTo" runat="server"  Width="150px"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="rfvTo" runat="server" ControlToValidate="txtTo"
                    ErrorMessage="*"></asp:RequiredFieldValidator>
            </td>
            <td>
                <asp:RegularExpressionValidator ID="revTo" runat="server" ErrorMessage="Enter valid Form of Email"
                    ControlToValidate="txtTo" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblSubject" runat="server" Text="Subject" Font-Size="Large"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtSubject" runat="server"  Width="150px"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="rfvsubject" runat="server" ControlToValidate="txtSubject"
                    ErrorMessage="*"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblMessage" runat="server" Text="Message" Font-Size="Large"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtMessage" runat="server" TextMode="MultiLine"  Width="150px"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="rfvmessage" runat="server" ControlToValidate="txtMessage"
                    ErrorMessage="*"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="linkbtn">
                <asp:HyperLink ID="hylnkUseraccount" runat="server" Text="Your Account" NavigateUrl="~/AfterLogin.aspx"></asp:HyperLink>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="btnSend" runat="server" Text="Send" OnClick="btnSend_Click" />
            </td>
        </tr>
    </table>
</asp:Content>
