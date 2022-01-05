<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ModelPopUpExtender</title>
    <style type="text/css">
        .model
        {
            border: Solid 3px #D55500;
            background-color: Aqua;
            width: 100%;
            height: 100%;
        }
        .modalBackground
        {
            background-color: Lime;
            filter: alpha(opacity=50);
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <div>
        <asp:GridView runat="server" ID="gvdetails" DataKeyNames="Id" AutoGenerateColumns="False"
            CellPadding="4" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:TemplateField HeaderText="Add">
                    <ItemTemplate>
                        <asp:ImageButton ID="imgbtnAdd" runat="server" ImageUrl="~/Add.JPG" Width="30" Height="20"
                            Text="Add" OnClick="imgbtnAdd_Click" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Edit">
                    <ItemTemplate>
                        <asp:ImageButton ID="imgbtn" ImageUrl="~/Update.JPG" runat="server" Width="40" Height="20"
                            OnClick="imgbtn_Click" Text="Edit" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Delete">
                    <ItemTemplate>
                        <asp:ImageButton ID="imgbtnDelete" runat="server" ImageUrl="~/Delete.JPG" Width="38"
                            Height="20" Text="Add" OnClick="imgbtnDelete_Click" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="UserName" HeaderText="UserName" />
                <asp:BoundField DataField="FirstName" HeaderText="FirstName" />
                <asp:BoundField DataField="LastName" HeaderText="LastName" />
                <asp:BoundField DataField="City" HeaderText="City" />
                <asp:BoundField DataField="Designation" HeaderText="Designation" />
            </Columns>
            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
            <SortedAscendingCellStyle BackColor="#FDF5AC" />
            <SortedAscendingHeaderStyle BackColor="#4D0000" />
            <SortedDescendingCellStyle BackColor="#FCF6C0" />
            <SortedDescendingHeaderStyle BackColor="#820000" />
        </asp:GridView>
        <asp:Label ID="lblresult" runat="server" />
        <asp:Button ID="btnShowPopup" runat="server" Style="display: none" />
        <cc1:ModalPopupExtender ID="ModalPopupExtender1" runat="server" TargetControlID="btnShowPopup"
            PopupControlID="pnlpopup" CancelControlID="btnCancel" BackgroundCssClass="modalBackground">
        </cc1:ModalPopupExtender>
        <asp:Panel ID="pnlpopup" runat="server" BackColor="White" Height="269px" Width="400px"
            Style="display: none">
            <table class="model">
                <tr>
                    <td colspan="2" align="center">
                        User Details
                    </td>
                </tr>
                <tr>
                    <td align="right" style="width: 45%">
                        UserId:
                    </td>
                    <td>
                        <asp:Label ID="lblID" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        UserName:
                    </td>
                    <td>
                        <asp:Label ID="lblusername" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        FirstName:
                    </td>
                    <td>
                        <asp:TextBox ID="txtfname" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        LastName:
                    </td>
                    <td>
                        <asp:TextBox ID="txtlname" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        City:
                    </td>
                    <td>
                        <asp:TextBox ID="txtCity" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        Designation:
                    </td>
                    <td>
                        <asp:TextBox ID="txtDesg" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>
                    </td>
                    <td>
                        <asp:Button ID="btnUpdate" CommandName="Update" runat="server" Text="Update" OnClick="btnUpdate_Click" />
                        <asp:Button ID="btnCancel" runat="server" Text="Cancel" />
                    </td>
                </tr>
            </table>
        </asp:Panel>
        <asp:Button ID="btnAdd" runat="server" Style="display: none" />
        <cc1:ModalPopupExtender ID="ModalPopupExtender2" runat="server" TargetControlID="btnAdd"
            PopupControlID="pnlAddPopup" CancelControlID="btnAddCancel" BackgroundCssClass="modalBackground">
        </cc1:ModalPopupExtender>
        <asp:Panel ID="pnlAddPopup" runat="server" BackColor="White" Height="269px" Width="400px"
            Style="display: none">
            <table class="model">
                <tr>
                    <td colspan="2" align="center">
                        User Details
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        UserName:
                    </td>
                    <td>
                        <asp:TextBox ID="txtUserADD" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        FirstName:
                    </td>
                    <td>
                        <asp:TextBox ID="txtFirstName" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        LastName:
                    </td>
                    <td>
                        <asp:TextBox ID="txtLastName" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        City:
                    </td>
                    <td>
                        <asp:TextBox ID="txtCityAdd" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        Designation:
                    </td>
                    <td>
                        <asp:TextBox ID="txtDesignation" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>
                    </td>
                    <td>
                        <asp:Button ID="btnInsert" CommandName="Update" runat="server" Text="Add" OnClick="btnInsert_Click" />
                        <asp:Button ID="btnAddCancel" runat="server" Text="Cancel" />
                    </td>
                </tr>
            </table>
        </asp:Panel>
    </div>
    </form>
</body>
</html>
