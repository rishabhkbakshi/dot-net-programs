<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ApproveByManager.aspx.cs"
    Inherits="ApproveByManager"  EnableEventValidation="false"  %>



<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table style="width: 50%">
            <tr>
                <td>
                    <asp:Label ID="lblResponseType" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblManager" runat="server" Text="Manager" Font-Size="X-Large"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblManagerRequestId" runat="server"></asp:Label>
                </td>
                <td>
                    <asp:LinkButton ID="lnkbtnLogOut" runat="server" Text="Log Out" OnClick="lnkbtnLogOut_Click"></asp:LinkButton>
                </td>
            </tr>
        </table>
        <table style="width: 50%">
            <tr>
                <td>
                    <asp:GridView ID="LeaveManagerGrid" runat="server" AutoGenerateColumns="false" DataKeyNames="Id">
                        <Columns>
                            <asp:BoundField DataField="Id" HeaderText="Id" />
                            <asp:BoundField DataField="LeaveFrom" HeaderText="Leave From" />
                            <asp:BoundField DataField="LeaveTo" HeaderText="Leave To" />
                            <asp:BoundField DataField="LeaveType" HeaderText="Leave Type" />
                            <asp:BoundField DataField="Reason" HeaderText="Reason" />
                            <asp:BoundField DataField="Status" HeaderText="Status" />
                            <asp:TemplateField HeaderText="Approve">
                                <ItemTemplate>
                                    <asp:Button ID="btnManagerApprove" runat="server" Text="Approve" OnClick="btnManagerApprove_Click" />
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
