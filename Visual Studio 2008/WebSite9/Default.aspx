<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table>
            <tr>
                <td>
                    <asp:CheckBoxList ID="checkboxlist" runat="server" RepeatDirection="Horizontal" RepeatLayout="Table"
                        RepeatColumns="3" AutoPostBack="true">
                        <asp:ListItem Value="1" Text="a"></asp:ListItem>
                        <asp:ListItem Value="2" Text="b"></asp:ListItem>
                        <asp:ListItem Value="3" Text="c"></asp:ListItem>
                        <asp:ListItem Value="4" Text="d"></asp:ListItem>
                        <asp:ListItem Value="5" Text="E"></asp:ListItem>
                        <asp:ListItem Value="6" Text="F"></asp:ListItem>
                        <asp:ListItem Value="7" Text="G"></asp:ListItem>
                        <asp:ListItem Value="8" Text="H"></asp:ListItem>
                        <asp:ListItem Value="9" Text="I"></asp:ListItem>
                        <asp:ListItem Value="10" Text="J"></asp:ListItem>
                        <asp:ListItem Value="11" Text="K"></asp:ListItem>
                        <asp:ListItem Value="12" Text="L"></asp:ListItem>
                    </asp:CheckBoxList>
                </td>
            </tr>
        </table>
        <table>
            <tr>
                <td>
                    <asp:LinkButton ID="lball" Text="lball" runat="server" OnClick="lball_Click"></asp:LinkButton>
                </td>
                <td>
                    <asp:LinkButton ID="lbnone" Text="lbnone" runat="server" OnClick="lbnone_Click"></asp:LinkButton>
                </td>
            </tr>
        </table>
        <table>
            <tr>
                <td>
                    <asp:Label ID="Lbl" Text="Selected Items:" runat="server"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="Lbl2" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:DropDownList ID="DropDown1" runat="server" 
                        onselectedindexchanged="DropDown1_SelectedIndexChanged" AutoPostBack="true">
                        <asp:ListItem >Select Items</asp:ListItem>
                        <asp:ListItem >Car</asp:ListItem>
                        <asp:ListItem >Bikes</asp:ListItem>
                        <asp:ListItem >Aeroplane</asp:ListItem>
                    </asp:DropDownList> 
                </td>
                <td>
                    <asp:DropDownList ID="DropDown2" runat="server" Visible="false"></asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="btnSubmit" runat="server" Text="Submit" 
                        onclick="btnSubmit_Click" />
                </td>
            </tr>
        </table>
        <asp:ScriptManager ID="sm" runat="server" EnablePartialRendering="false">
        </asp:ScriptManager>
        <asp:UpdatePanel ID="pnlHelloWorld" runat="server">
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="btnHelloWorld" EventName="Click" />
            </Triggers>
            <ContentTemplate>
                <asp:Label runat="server" ID="lblHelloWorld" Text="Click the button!" />
                <br />
                <br />
                <asp:Button runat="server" ID="btnHelloWorld" OnClick="btnHelloWorld_Click" Text="Update label!" />
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
    </form>
</body>
</html>
