<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ApplyToLeave.aspx.cs" Inherits="ApplyToLeave" %>

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
        <table style="width: 50%">
            <tr>
                <td>
                    <asp:Label ID="lblResponseType" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblApply" runat="server" Text="Apply To Leave" Font-Size="X-Large"></asp:Label>
                </td>
                <td style="text-align: right">
                    <asp:LinkButton ID="lnkbtnLogOut" runat="server" Text="Log Out" OnClick="lnkbtnLogOut_Click"
                        CausesValidation="false"></asp:LinkButton>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblCancelRequest" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblFromDate" runat="server" Text="From Date"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtFromDate" runat="server" Width="181px"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="rfvFromDate" runat="server" ControlToValidate="txtFromDate"
                        ErrorMessage="*"></asp:RequiredFieldValidator>
                </td>
                <td>
                    <cc1:CalendarExtender ID="CalFromDate" runat="server" Animated="true" TargetControlID="txtFromDate"
                        Format="dd/MMM/yyyy">
                    </cc1:CalendarExtender>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblToDate" runat="server" Text="To Date"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtToDate" runat="server" Width="181px"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="rfvToDate" runat="server" ControlToValidate="txtToDate"
                        ErrorMessage="*"></asp:RequiredFieldValidator>
                </td>
                <td>
                    <cc1:CalendarExtender ID="CalToDate" runat="server" Animated="true" TargetControlID="txtToDate"
                        Format="dd/MMM/yyyy">
                    </cc1:CalendarExtender>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblLeaveType" runat="server" Text="Leave Type"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtLeaveType" runat="server" Width="181px"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="rfvLeaveType" runat="server" ControlToValidate="txtLeaveType"
                        ErrorMessage="*"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblLeaveReason" runat="server" Text="Leave Reason"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtLeaveReason" runat="server" TextMode="MultiLine" Width="181px"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="rfvLeaveReason" runat="server" ControlToValidate="txtLeaveReason"
                        ErrorMessage="*"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="btnApply" runat="server" Text="Apply" OnClick="btnApply_Click" />
                </td>
            </tr>
        </table>
        <table style="width: 50%">
            <tr>
                <td>
                    <asp:GridView ID="LeaveGrid" runat="server" AutoGenerateColumns="false" 
                        DataKeyNames="Id" onrowdeleting="LeaveGrid_RowDeleting" >
                        <Columns>
                            <asp:BoundField DataField="Id" HeaderText="Id" />
                            <asp:BoundField DataField="LeaveFrom" HeaderText="Leave From" />
                            <asp:BoundField DataField="LeaveTo" HeaderText="Leave To" />
                            <asp:BoundField DataField="LeaveType" HeaderText="Leave Type" />
                            <asp:BoundField DataField="Reason" HeaderText="Reason" />
                            <asp:BoundField DataField="Status" HeaderText="Status" />
                            <asp:TemplateField HeaderText="Cancel Request">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnkbtnRequestCancel" runat="server" Text="Cancel Request" CommandName="Delete"
                                        CausesValidation="false"></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
