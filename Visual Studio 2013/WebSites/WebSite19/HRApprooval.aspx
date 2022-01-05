<%@ Page Title="" Language="C#" MasterPageFile="~/LeaveMaster.master" AutoEventWireup="true"
    CodeFile="HRApprooval.aspx.cs" Inherits="_Default" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table width="100%">
        <tr>
            <td colspan="2">
                <asp:Label ID="lblResponseType" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="2" style="text-align: center">
                <asp:Label ID="lblHR" runat="server" Text="HR" Font-Size="X-Large"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblHRRequestId" runat="server"></asp:Label>
            </td>
            <td style="text-align: right">
                <asp:LinkButton ID="lnkbtnLogOut" runat="server" Text="Log Out" OnClick="lnkbtnLogOut_Click"></asp:LinkButton>
            </td>
        </tr>
    </table>
    <table width="100%">
        <tr>
            <td>
                <asp:GridView ID="LeaveHRGrid" runat="server" AutoGenerateColumns="false" DataKeyNames="Id"
                    OnRowDeleting="LeaveHRGrid_RowDeleting">
                    <Columns>
                        <asp:BoundField DataField="Id" HeaderText="Id" />
                        <asp:BoundField DataField="From Date" HeaderText="Leave From" />
                        <asp:BoundField DataField="To Date" HeaderText="Leave To" />
                        <asp:BoundField DataField="Leave Type" HeaderText="Leave Type" />
                        <asp:BoundField DataField="Leave Reason" HeaderText="Reason" />
                        <asp:BoundField DataField="RequestStatus" HeaderText="Status" />
                        <asp:TemplateField HeaderText="Cancel Request">
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkbtnRequestCancelByHR" runat="server" Text="Cancel Request"
                                    CommandName="Delete" CausesValidation="false"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Approve">
                            <ItemTemplate>
                                <asp:Button ID="btnManagerApprove" runat="server" Text="Approve" OnClick="btnHRApprove_Click" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </td>
        </tr>
    </table>
</asp:Content>
