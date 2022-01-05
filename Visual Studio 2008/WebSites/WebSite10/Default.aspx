<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:ScriptManager ID="SM" runat="server" />
        <asp:Timer ID="time" runat="server" Interval="10000" OnTick="Time"></asp:Timer>
        <asp:UpdatePanel runat="server" id="UpdatePanel1" updatemode="Conditional">
            <Triggers>
                <asp:AsyncPostBackTrigger EventName="Click"/>
            </Triggers>
            <ContentTemplate>
                <asp:Label runat="server" id="DateTimeLabel1" />
                <asp:Button runat="server" id="UpdateButton1" onclick="UpdateButtonClick" text="Update" />               
            </ContentTemplate>
        </asp:UpdatePanel>
        <asp:UpdatePanel runat="server" id="UpdatePanel" updatemode="Conditional">
            <ContentTemplate>
                <asp:Label runat="server" id="DateTimeLabel2" />
                <asp:Button runat="server" id="UpdateButton2" onclick="UpdateButton_Click" text="Update" />
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
    <div>
        <table>
            <tr>
                <td>
                    <asp:TextBox ID="tb1" runat="server" ></asp:TextBox>
                    <cc1:FilteredTextBoxExtender ID="ftbe" runat="server"
                    TargetControlID="tb1"         
                    FilterType="Custom, Numbers"
                    ValidChars="+-=/*()." >
                    </cc1:FilteredTextBoxExtender>
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
