<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default2.aspx.cs" Inherits="Default2" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:ScriptManager ID="Script" runat="server">
        </asp:ScriptManager>
        <table>
            <tr>
                <td>
                    <asp:TextBox ID="txtPassword" runat="server"></asp:TextBox>
                    <cc1:PasswordStrength ID="Pass" runat="server" TargetControlID="txtPassword">
                    </cc1:PasswordStrength>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:TextBox ID="txtMask" runat="server"></asp:TextBox>
                    <cc1:MaskedEditExtender ID="MaskedEditExtender1" runat="server" TargetControlID="txtMask"
                        MaskType="Number" Mask="99999-99999" MessageValidatorTip="true">
                    </cc1:MaskedEditExtender>
                </td>
            </tr>
        </table>
        <table>
            <tr>
                <td>
                    <asp:UpdatePanel ID="Panel" runat="server">
                        <ContentTemplate>
                            <asp:Button ID="btnUpdate" runat="server" Text="Update" OnClick="btnUpdate_Click" />
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    <asp:UpdateProgress ID="UpdateProgress1" runat="server">
                        <ProgressTemplate>
                            Loading...
                        </ProgressTemplate>
                    </asp:UpdateProgress>
                </td>
            </tr>
        </table>
        <table>
            <tr>
                <td>
                    <asp:Label ID="Label1" runat="server" Text="Click this button to open AJAX Confirm box:"
                        Font-Bold="true" Font-Size="16px"></asp:Label>
                </td>
            </tr>
            <tr>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <asp:Button ID="btnConfirm" runat="server" Text="Confirm" OnClick="btnConfirm_Click" />
                        <cc1:ConfirmButtonExtender ID="ConfirmButtonExtender1" runat="server" TargetControlID="btnConfirm"
                            ConfirmText="Are you sure?&#10;You want to run the server code." OnClientCancel="onCancel"
                            ConfirmOnFormSubmit="false">
                        </cc1:ConfirmButtonExtender>
                        <asp:Label ID="lblMessage" runat="server"></asp:Label><br />
                    </ContentTemplate>
                </asp:UpdatePanel>
            </tr>
        </table>
        <br />
        <table>
            <tr>
                <td>
                    <asp:TextBox ID="txtDigit1" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="rfvDigit1" runat="server" ErrorMessage="Please Enter Digit1"
                        ControlToValidate="txtDigit1" ValidationGroup="Valid" Display="None"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <cc1:ValidatorCalloutExtender ID="rfvDigit1Ext" runat="server" TargetControlID="rfvDigit1">
                    </cc1:ValidatorCalloutExtender>
                    <asp:RegularExpressionValidator ID="revDigit1" runat="server" ErrorMessage="Please enter &lt;b>valid Numeric value</b> "
                        ControlToValidate="txtDigit1" ValidationExpression="\d{0,15}" ValidationGroup="Valid"
                        Display="None"></asp:RegularExpressionValidator>
                    <cc1:ValidatorCalloutExtender ID="revDigit1Ext" runat="server" TargetControlID="revDigit1">
                    </cc1:ValidatorCalloutExtender>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="btnValid" runat="server" ValidationGroup="Valid" Text="Submit" />
            </tr>
        </table>
        <table>
            <tr>
                <td>
                    <asp:CheckBox ID="chkColor" runat="server" Text="Color" AutoPostBack="true" OnCheckedChanged="chkColor_CheckedChanged" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:CheckBoxList ID="chklist" runat="server" AutoPostBack="true" OnSelectedIndexChanged="chklist_SelectedIndexChanged">
                        <asp:ListItem>Red</asp:ListItem>
                        <asp:ListItem>Blue</asp:ListItem>
                        <asp:ListItem>Green</asp:ListItem>
                    </asp:CheckBoxList>
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
