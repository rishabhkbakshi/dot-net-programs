<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="Login1.aspx.cs" Inherits="Default3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <%-- disable back button of the browser--%>
    
    <%--<script type="text/javascript">
        window.history.forward(1);
    </script>--%>
    
    <%--<script type="text/javascript">
        function preventBack() { window.history.forward(); }
        setTimeout("preventBack()", 0);
        window.onunload = function() { null };
    </script>--%>
    
    <div style="text-align: center; background-color: Silver" class="style1">
        <table>
            <tr>
                <td style="text-align: center">
                    <asp:Label ID="lbl" runat="server" Text="Login" Font-Size="XX-Large" Font-Underline="true"></asp:Label>
                </td>
            </tr>
        </table>
        <table align="center">
            <tr>
                <td>
                    <asp:Label ID="lblUser" runat="server" Text="Username" Font-Size="X-Large"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtUser" runat="server" CssClass="input_text"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="Rfv" runat="server" ErrorMessage="*" ControlToValidate="txtUser"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblPass" runat="server" Text="Password" Font-Size="X-Large"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtPass" runat="server" TextMode="Password" CssClass="input_text"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="Rfv2" runat="server" ErrorMessage="*" ControlToValidate="txtPass"></asp:RequiredFieldValidator>
                </td>
            </tr>
        </table>
        <table>
            <tr>
                <td>
                    <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click"
                        CssClass="input_button" />
                </td>
            </tr>
        </table>
        <table style="color: Red">
            <tr>
                <td>
                    <asp:Label ID="lbl1" runat="server"></asp:Label>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
