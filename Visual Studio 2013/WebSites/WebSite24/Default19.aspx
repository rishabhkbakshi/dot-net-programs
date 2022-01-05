<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default19.aspx.cs" Inherits="Default19" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Captcha Image with Refresh Button</title>
    <script type="text/javascript">
        function RefreshCaptcha() {
            var img = document.getElementById("imgCaptcha");
            img.src = "Captcha.ashx?query=" + Math.random();
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <img src="Captcha.ashx" id="imgCaptcha" />
            <a href="#" onclick="javascript:RefreshCaptcha();">Refresh</a>
        </div>
    </form>
</body>
</html>
