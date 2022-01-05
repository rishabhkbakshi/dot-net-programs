<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Alert.aspx.cs" Inherits="Alert" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }

        .auto-style2 {
            height: 30px;
        }
    </style>
    <script type="text/javascript">
        function AlertHandle() {

        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div id="divDialog">

            <table class="auto-style1">
                <tr>
                    <td class="auto-style2">UserId</td>
                    <td class="auto-style2">
                        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Password</td>
                    <td>
                        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Button ID="btn" runat="server" OnClientClick="AlertHandle();" />
                    </td>
                </tr>
            </table>

        </div>
    </form>
</body>
</html>
