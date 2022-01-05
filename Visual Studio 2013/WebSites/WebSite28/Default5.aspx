<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default5.aspx.cs" Inherits="Default5" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Send Mail using with gmail crendentials in asp.net</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table style="border: 1px solid" align="center">
                <tr>
                    <td colspan="2" align="center">
                        <b>Send Mail using gmail credentials in asp.net</b>
                    </td>
                </tr>
                <tr>
                    <td>Gmail Username:
                    </td>
                    <td>
                        <asp:TextBox ID="txtUsername" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Gmail Password:
                    </td>
                    <td>
                        <asp:TextBox ID="txtpwd" runat="server" TextMode="Password"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Subject:
                    </td>
                    <td>
                        <asp:TextBox ID="txtSubject" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>To:
                    </td>
                    <td>
                        <asp:TextBox ID="txtTo" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Attach a file:
                    </td>
                    <td>
                        <asp:FileUpload ID="fileUpload1" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td valign="top">Body:
                    </td>
                    <td>
                        <asp:TextBox ID="txtBody" runat="server" TextMode="MultiLine" Columns="30" Rows="10"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <asp:Button ID="btnSubmit" Text="Send" runat="server" OnClick="btnSubmit_Click" style="height: 26px" />
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
