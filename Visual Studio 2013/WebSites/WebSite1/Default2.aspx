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
                        <asp:Button ID="btnSumit" runat="server" Text="Submit" ValidationGroup="Date" /></td>
                </tr>
            </table>
            <asp:DataGrid ID="chu1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4">
                <Columns>
                    <asp:BoundColumn HeaderText="Id" DataField="Id"></asp:BoundColumn>
                    <asp:BoundColumn HeaderText="FirstName" DataField="FirstName"></asp:BoundColumn>
                    <asp:BoundColumn HeaderText="LastName" DataField="LastName"></asp:BoundColumn>
                </Columns>
                <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
                <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
                <ItemStyle BackColor="White" ForeColor="#330099" />
                <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
                <SelectedItemStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
            </asp:DataGrid>
            <asp:Repeater ID="chu" runat="server">
                <HeaderTemplate>
                    <table>
                        <tr>
                            <td>ID
                            </td>
                            <td>FirstName
                            </td>
                            <td>LastName
                            </td>
                        </tr>
                    </table>
                </HeaderTemplate>
                <SeparatorTemplate>
                    <hr />
                </SeparatorTemplate>
                <ItemTemplate>

                    <table>

                        <tr>
                            <td>
                                <asp:Label ID="lblId" Text='<%# Eval("Id") %>' runat="server">

                                </asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="lblFirstName" Text='<%# Eval("FirstName") %>' runat="server">

                                </asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="lblLastName" Text='<%# Eval("LastName") %>' runat="server">

                                </asp:Label>
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
            </asp:Repeater>
            
        </div>
    </form>
</body>
</html>
