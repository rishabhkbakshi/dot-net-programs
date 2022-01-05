<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Customized Style of Confirmation Box</title>
    <style type="text/css">
        .modalBackground {
            background-color: Maroon;
            opacity: 0.4;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="script" runat="server">
        </asp:ScriptManager>
        <asp:UpdatePanel ID="updatepnl1" runat="server">
            <ContentTemplate>
                <asp:GridView runat="server" ID="gvDetails" CssClass="Gridview" DataKeyNames="Id"
                    BorderWidth="3px" BorderStyle="Solid" BorderColor="#D55500" AutoGenerateColumns="false">
                    <Columns>
                        <asp:BoundField DataField="Id" HeaderText="Id" />
                        <asp:BoundField DataField="Fname" HeaderText="Fname" />
                        <asp:BoundField DataField="Lname" HeaderText="Lname" />
                        <asp:BoundField DataField="Email" HeaderText="Email" />
                        <asp:BoundField DataField="Branch" HeaderText="Branch" />
                        <asp:BoundField DataField="PhoneNo" HeaderText="PhoneNo" />
                        <asp:TemplateField HeaderText="Delete">
                            <ItemTemplate>
                                <asp:ImageButton ID="btnDelete" ImageUrl="~/Delete.JPG" runat="server"
                                    Height="20" Width="40" OnClick="btnDelete_Click" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                <asp:Label ID="lblresult" runat="server" />
                <asp:Button ID="btnShowPopup" runat="server" Style="display: none" />
                <cc1:ModalPopupExtender ID="ModalPopupExtender1" runat="server" TargetControlID="btnShowPopup"
                    PopupControlID="pnlpopup" CancelControlID="imgbtnCancel" BackgroundCssClass="modalBackground">
                </cc1:ModalPopupExtender>
                <asp:Panel ID="pnlpopup" runat="server" BackColor="White" Height="100px" Width="400px"
                    BorderWidth="3px" BorderStyle="Solid" BorderColor="#D55500" Style="display: none">
                    <table width="100%">
                        <tr>
                            <td align="left" style="color: Red; font-weight: bold">Confirm Box
                            </td>
                            <td align="right">
                                <asp:Image ID="imgbtnCancel" runat="server" ImageUrl="~/Cros.JPG" Height="20"
                                    Width="20" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" align="left" style="padding: 5px; font-family: Calibri">
                                <asp:Label ID="lblUser" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2"></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td align="right" style="padding-right: 15px">
                                <asp:ImageButton ID="btnYes" OnClick="btnYes_Click" runat="server" ImageUrl="~/Yes.JPG"
                                    Height="20" Width="20" />
                                <asp:ImageButton ID="btnNo" runat="server" ImageUrl="~/No.JPG" Height="20" Width="20" />
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
</body>
</html>
