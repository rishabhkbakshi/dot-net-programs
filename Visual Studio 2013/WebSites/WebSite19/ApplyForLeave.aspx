<%@ Page Title="" Language="C#" MasterPageFile="~/LeaveMaster.master" AutoEventWireup="true"
    CodeFile="ApplyForLeave.aspx.cs" Inherits="_Default" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ScriptManager ID="Script" runat="server">
    </asp:ScriptManager>
    <table width="100%">
        <tr>
            <td colspan="4">
                <marquee direction="left" style="height: 30px; width: 500px; text-align: center;">Note :- If Leave Request is Cancel by Manager or HR then These Leave Request will not show here</marquee>
            </td>
        </tr>
        <tr>
            <td colspan="4">
                <asp:Label ID="lblResponseType" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style1">
                <asp:Label ID="lblApply" runat="server" Text="Apply To Leave" Font-Size="X-Large"></asp:Label>
            </td>
            <td style="text-align: right" class="style1" colspan="2">
                <asp:LinkButton ID="lnkbtnLogOut" runat="server" Text="Log Out" OnClick="lnkbtnLogOut_Click"
                    CausesValidation="false"></asp:LinkButton>
            </td>
        </tr>
        <tr>
            <td colspan="4">
                <asp:Label ID="lblCancelRequest" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style1">
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
            <td class="style2">
                <asp:Label ID="lblToDate" runat="server" Text="To Date"></asp:Label>
            </td>
            <td class="style3">
                <asp:TextBox ID="txtToDate" runat="server" Width="181px"></asp:TextBox>
            </td>
            <td class="style3">
                <asp:RequiredFieldValidator ID="rfvToDate" runat="server" ControlToValidate="txtToDate"
                    ErrorMessage="*"></asp:RequiredFieldValidator>
            </td>
            <td class="style3">
                <cc1:CalendarExtender ID="CalToDate" runat="server" Animated="true" TargetControlID="txtToDate"
                    Format="dd/MMM/yyyy">
                </cc1:CalendarExtender>
            </td>
        </tr>
        <tr>
            <td class="style1">
                <asp:Label ID="lblLeaveType" runat="server" Text="Leave Type"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtLeaveType" runat="server" Width="181px"></asp:TextBox>
            </td>
            <td colspan="2">
                <asp:RequiredFieldValidator ID="rfvLeaveType" runat="server" ControlToValidate="txtLeaveType"
                    ErrorMessage="*"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style1">
                <asp:Label ID="lblLeaveReason" runat="server" Text="Leave Reason"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtLeaveReason" runat="server" TextMode="MultiLine" Width="181px"></asp:TextBox>
            </td>
            <td colspan="2">
                <asp:RequiredFieldValidator ID="rfvLeaveReason" runat="server" ControlToValidate="txtLeaveReason"
                    ErrorMessage="*"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td colspan="4" style="text-align: center">
                <asp:Button ID="btnApply" runat="server" Text="Apply" OnClick="btnApply_Click" />
            </td>
        </tr>
    </table>
    <table width="100%">
        <tr>
            <td>
                <asp:GridView ID="LeaveGrid" runat="server" AutoGenerateColumns="false" DataKeyNames="Id"
                    OnRowDeleting="LeaveGrid_RowDeleting">
                    <Columns>
                        <asp:BoundField DataField="Id" HeaderText="Id" />
                        <asp:BoundField DataField="From Date" HeaderText="Leave From" />
                        <asp:BoundField DataField="To Date" HeaderText="Leave To" />
                        <asp:BoundField DataField="Leave Type" HeaderText="Leave Type" />
                        <asp:BoundField DataField="Leave Reason" HeaderText="Reason" />
                        <asp:BoundField DataField="RequestStatus" HeaderText="Status" />
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
</asp:Content>
