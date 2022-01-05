<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script type="text/javascript">
        function displayDate() {
            document.getElementById("demo").innerHTML = Date();
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="demo" runat="server"></asp:Label><br />

            Date of Birth:
            <uc1:WebUserControl ID="WebUserControl1" runat="server" />
            <table>
                <tr>
                    <td>
                        <asp:Button ID="btnSubmit" runat="server" Text="Submit"  OnClientClick="displayDate();"/>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
