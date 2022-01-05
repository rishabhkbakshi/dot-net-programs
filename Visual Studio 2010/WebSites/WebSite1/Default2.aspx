<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default2.aspx.cs" Inherits="Default2" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
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
                    <asp:Label ID="lblDate" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:TextBox ID="txtDate" runat="server"></asp:TextBox>
                </td>
                <td>
                    <cc1:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtDate"
                        Animated="true" Format="dd/MMM/yyyy">
                    </cc1:CalendarExtender>
                </td>
                <td>
                    <asp:CustomValidator ID="cusDate" runat="server" ControlToValidate="txtDate" OnServerValidate="cusDate_ServerValidate"
                        ValidationGroup="Date"></asp:CustomValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="btnSumit" runat="server" Text="Submit" ValidationGroup="Date" />
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
