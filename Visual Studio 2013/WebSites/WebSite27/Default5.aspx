<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default5.aspx.cs" Inherits="Default5" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script type="text/javascript">
        function OpenPopup() {

            window.open("Default4.aspx", "List", "toolbar=no, location=no,status=yes,menubar=no,scrollbars=yes,resizable=no, width=900,height=500,left=430,top=100");
            return false;
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Button ID="btn" runat="server" Text="Click here"  OnClientClick="OpenPopup() "/>
        </div>
    </form>
</body>
</html>
