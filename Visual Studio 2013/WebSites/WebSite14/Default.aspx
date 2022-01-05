<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:ScriptManager ID="Script" runat="server">
        </asp:ScriptManager>
        <cc1:TabContainer ID="TabContainer1" runat="server" ActiveTabIndex="0">
            <cc1:TabPanel ID="Tab1" runat="server" HeaderText="Travel">
                <ContentTemplate>
                    <table>
                        <tr>
                            <td>
                                <asp:GridView ID="TravelGrid" runat="server" AutoGenerateColumns="False" CellPadding="4"
                                    ForeColor="#333333" GridLines="None" OnRowCommand="TravelGrid_RowCommand">
                                    <Columns>
                                        <asp:TemplateField HeaderText="Origin">
                                            <ItemTemplate>
                                                <asp:TextBox ID="txtOrigin" runat="server" Text='<%# Bind("Origin") %>'></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="rfvOrigin" runat="server" ControlToValidate="txtOrigin"
                                                    ErrorMessage="*" ValidationGroup="Travel"></asp:RequiredFieldValidator>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Destination">
                                            <ItemTemplate>
                                                <asp:TextBox ID="txtDestination" runat="server" Text='<%# Bind("Destination") %>'></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="rfvDestination" runat="server" ErrorMessage="*" ControlToValidate="txtDestination"
                                                    ValidationGroup="Travel"></asp:RequiredFieldValidator>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Date">
                                            <ItemTemplate>
                                                <asp:TextBox ID="txtDate" runat="server" Text='<%# Bind("Date") %>'></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="rfvDate" runat="server" ErrorMessage="*" ControlToValidate="txtDate"
                                                    ValidationGroup="Travel"></asp:RequiredFieldValidator>
                                                <cc1:CalendarExtender ID="TravelCaleder" runat="server" TargetControlID="txtDate"
                                                    Enabled="True" Format="dd/MM/yyyy">
                                                </cc1:CalendarExtender>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Mode">
                                            <ItemTemplate>
                                                <asp:DropDownList ID="drpMode" runat="server">
                                                    <asp:ListItem Value="0">--Select--</asp:ListItem>
                                                    <asp:ListItem Value="1">Air</asp:ListItem>
                                                    <asp:ListItem Value="2">Train</asp:ListItem>
                                                </asp:DropDownList>
                                                <asp:RequiredFieldValidator ID="rfvMode" runat="server" ErrorMessage="*" ControlToValidate="drpMode"
                                                    InitialValue="0" ValidationGroup="Travel"></asp:RequiredFieldValidator>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Class">
                                            <ItemTemplate>
                                                <asp:DropDownList ID="drpClass" runat="server">
                                                    <asp:ListItem Value="0">--Select--</asp:ListItem>
                                                    <asp:ListItem Value="1">Economy</asp:ListItem>
                                                    <asp:ListItem Value="2">Business</asp:ListItem>
                                                </asp:DropDownList>
                                                <asp:RequiredFieldValidator ID="rfvClass" runat="server" ErrorMessage="*" InitialValue="0"
                                                    ControlToValidate="drpClass" ValidationGroup="Travel"></asp:RequiredFieldValidator>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Delete">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lnkbtnTravelDelete" runat="server" CommandName="Remove" Text="Delete"
                                                    CausesValidation="false"></asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField>
                                            <HeaderTemplate>
                                                <asp:Button ID="btnTravelAddNew" runat="server" CausesValidation="false" OnClick="TravelAddNew"
                                                    Text="[ + ]" />
                                            </HeaderTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                    <HeaderStyle BackColor="Aqua" Font-Bold="True" ForeColor="Black" />
                                    <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                                </asp:GridView>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <table>
                                    <tr>
                                        <td>
                                            <asp:ImageButton ID="imgbtnTravelNext" runat="server" ImageUrl="~/button_fastforward_red.ico"
                                                OnClick="TravelNext" />
                                        </td>
                                    </tr>
                                </table>
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
                                <asp:GridView ID="GridAccomodation" runat="server" AutoGenerateColumns="False" CellPadding="4"
                                    ForeColor="#333333" GridLines="None" OnRowCommand="GridAccomodation_RowCommand">
                                    <Columns>
                                        <asp:TemplateField HeaderText="Location">
                                            <ItemTemplate>
                                                <asp:TextBox ID="txtLocationAcc" runat="server" Text='<%# Bind("Location") %>'></asp:TextBox>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Check In Date">
                                            <ItemTemplate>
                                                <asp:TextBox ID="txtChecKInDate" runat="server"></asp:TextBox>
                                                <cc1:CalendarExtender ID="AccomodationCalender" runat="server" TargetControlID="txtChecKInDate"
                                                    Enabled="True" Format="dd/MM/yyyy">
                                                </cc1:CalendarExtender>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="No. of Night">
                                            <ItemTemplate>
                                                <asp:TextBox ID="txtNoofNight" runat="server"></asp:TextBox>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Delete">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lnkbtnAccomodationDelete" runat="server" CommandName="Remove"
                                                    Text="Delete"></asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField>
                                            <HeaderTemplate>
                                                <asp:Button ID="btnAccomodationAddNew" runat="server" OnClick="AccomodationAddNew"
                                                    Text="[ + ]" />
                                            </HeaderTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                    <HeaderStyle BackColor="Aqua" Font-Bold="True" ForeColor="Black" />
                                    <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                                </asp:GridView>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <table class="style1">
                                    <tr>
                                        <td>
                                            <asp:ImageButton ID="imgbtnTravelPrev" runat="server" OnClick="TravelPrev" ImageUrl="~/button_rewind_red.ico" />
                                        </td>
                                        <td align="right">
                                            <asp:ImageButton ID="imgbtnAccomodationNext" runat="server" OnClick="AccomodationNext"
                                                ImageUrl="~/button_fastforward_red.ico" />
                                        </td>
                                    </tr>
                                </table>
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
                                <asp:GridView ID="GridCab" runat="server" AutoGenerateColumns="False" CellPadding="4"
                                    ForeColor="#333333" GridLines="None" OnRowCommand="GridCab_RowCommand">
                                    <Columns>
                                        <asp:TemplateField HeaderText="City">
                                            <ItemTemplate>
                                                <asp:TextBox ID="txtCity" runat="server" Text='<%# Bind("City") %>'></asp:TextBox>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Service">
                                            <ItemTemplate>
                                                <asp:DropDownList ID="drpService" runat="server">
                                                    <asp:ListItem Value="0">--Select--</asp:ListItem>
                                                    <asp:ListItem Value="1">PickUp</asp:ListItem>
                                                    <asp:ListItem Value="2">Fullday</asp:ListItem>
                                                    <asp:ListItem Value="3">Halfday</asp:ListItem>
                                                </asp:DropDownList>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Origin">
                                            <ItemTemplate>
                                                <asp:TextBox ID="txtCabOrigin" runat="server" Text='<%# Bind("Origin") %>'></asp:TextBox>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Desination">
                                            <ItemTemplate>
                                                <asp:TextBox ID="txtCabDestination" runat="server" Text='<%# Bind("Desination") %>'></asp:TextBox>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Date">
                                            <ItemTemplate>
                                                <asp:TextBox ID="txtCabDate" runat="server" Text='<%# Bind("Date") %>'></asp:TextBox>
                                                <cc1:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtCabDate"
                                                    Enabled="True" Format="dd/MM/yyyy">
                                                </cc1:CalendarExtender>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Hours">
                                            <ItemTemplate>
                                                <asp:TextBox ID="txtHours" runat="server" Text='<%# Bind("Hours") %>'></asp:TextBox>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Remark">
                                            <ItemTemplate>
                                                <asp:TextBox ID="txtRemark" runat="server" TextMode="MultiLine" Text='<%# Bind("Remark") %>'></asp:TextBox>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Delete">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lnkbtnCabDelete" runat="server" CommandName="Remove" Text="Delete"></asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField>
                                            <HeaderTemplate>
                                                <asp:Button ID="btnCabAddNew" runat="server" OnClick="CabAddNew" Text="[ + ]" />
                                            </HeaderTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                    <HeaderStyle BackColor="Aqua" Font-Bold="True" ForeColor="Black" />
                                    <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                                </asp:GridView>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <table class="style1">
                                    <tr>
                                        <td align="right" style="text-align: left">
                                            <asp:ImageButton ID="imgbtnCabPrev" runat="server" OnClick="CabPrev" ImageUrl="~/button_rewind_red.ico" />
                                        </td>
                                        <td style="text-align: right">
                                            <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="Submit" ValidationGroup="Travel" />
                                            <asp:Button ID="btnReset" runat="server" Text="Reset" OnClick="Reset" />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </ContentTemplate>
            </cc1:TabPanel>
        </cc1:TabContainer>
    </div>
    </form>
</body>
</html>
