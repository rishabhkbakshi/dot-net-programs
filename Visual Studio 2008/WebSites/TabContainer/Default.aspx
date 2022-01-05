<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

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
                    <cc1:TabContainer ID="TabContainer1" runat="server">
                        <cc1:TabPanel ID="Tab1" runat="server" HeaderText="Travel">
                            <ContentTemplate>
                                <table>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lblOrigin" Text="Origin" runat="server"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtOrigin" runat="server"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:RequiredFieldValidator ID="rfvOrigin" runat="server" ErrorMessage="*" ControlToValidate="txtOrigin"
                                                ValidationGroup="Travel"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lblDestination" runat="server" Text="Destination"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtDestination" runat="server"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:RequiredFieldValidator ID="rfvDestination" runat="server" ErrorMessage="*" ControlToValidate="txtDestination"
                                                ValidationGroup="Travel"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lblDate" Text="Date" runat="server"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtDate" runat="server"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:RequiredFieldValidator ID="rfvDate" runat="server" ErrorMessage="*" ControlToValidate="txtDate"
                                                ValidationGroup="Travel"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lblMode" Text="Mode" runat="server"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="drpMode" runat="server">
                                                <asp:ListItem Value="0">--Select--</asp:ListItem>
                                                <asp:ListItem Value="1">Air</asp:ListItem>
                                                <asp:ListItem Value="2">Train</asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            <asp:RequiredFieldValidator ID="rfvMode" runat="server" ErrorMessage="*" ControlToValidate="drpMode"
                                                InitialValue="0" ValidationGroup="Travel"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lblClass" Text="Class" runat="server"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="drpClass" runat="server">
                                                <asp:ListItem Value="0">--Select--</asp:ListItem>
                                                <asp:ListItem Value="1">Economy</asp:ListItem>
                                                <asp:ListItem Value="2">Business</asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            <asp:RequiredFieldValidator ID="rfvClass" runat="server" ErrorMessage="*" InitialValue="0"
                                                ControlToValidate="drpClass" ValidationGroup="Travel"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Button ID="btnNext" runat="server" Text="Next" CausesValidation="false" />
                                        </td>
                                    </tr>
                                </table>
                            </ContentTemplate>
                        </cc1:TabPanel>
                        <cc1:TabPanel ID="Tab2" runat="server" HeaderText="Accomodation">
                            <ContentTemplate>
                                <table>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lblLocationAcc" runat="server" Text="Location"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtLocationAcc" runat="server"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lblCheckInDate" runat="server" Text="Check In Date"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtChecKInDate" runat="server"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lblNoofNight" runat="server" Text="No. of Night"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtNoofNight" runat="server"></asp:TextBox>
                                        </td>
                                    </tr>
                                </table>
                                <table>
                                    <tr>
                                        <td>
                                            <asp:Button ID="btnPrevious" runat="server" Text="Prev" CausesValidation="false" />
                                        </td>
                                        <td style="text-align: right">
                                            <asp:Button ID="btnNext1" runat="server" Text="Next" CausesValidation="false" />
                                        </td>
                                    </tr>
                                </table>
                            </ContentTemplate>
                        </cc1:TabPanel>
                        <cc1:TabPanel ID="Tab3" runat="server" HeaderText="Cab">
                            <ContentTemplate>
                                <table>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lblCity" runat="server" Text="City"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtCity" runat="server"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lblService" Text="Service" runat="server"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="drpService" runat="server">
                                                <asp:ListItem Value="0">--Select--</asp:ListItem>
                                                <asp:ListItem Value="1">PickUp</asp:ListItem>
                                                <asp:ListItem Value="2">Fullday</asp:ListItem>
                                                <asp:ListItem Value="3">Halfday</asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lblCabOrigin" runat="server" Text="Origin"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtCabOrigin" runat="server"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lblCabDestination" runat="server" Text="Desination"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtCabDestination" runat="server"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lblCabDate" runat="server" Text="Date"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtCabDate" runat="server"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lblHours" runat="server" Text="Hours"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtHours" runat="server"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lblRemark" runat="server" Text="Remark"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtRemark" runat="server" TextMode="MultiLine"></asp:TextBox>
                                        </td>
                                    </tr>
                                </table>
                                <table>
                                    <tr>
                                        <td>
                                            <asp:Button ID="btnPrevious2" runat="server" Text="Prev" CausesValidation="false" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Button ID="btnSubmit" runat="server" Text="Submit" ValidationGroup="Travel" />
                                        </td>
                                        <td>
                                            <asp:Button ID="btnReset" runat="server" Text="Reset" CausesValidation="false" />
                                        </td>
                                    </tr>
                                </table>
                            </ContentTemplate>
                        </cc1:TabPanel>
                    </cc1:TabContainer>
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
