<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default6.aspx.cs" Inherits="Default6" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>jQuery Keyup Keydown and keypress events Examples </title>
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.8.2.js"></script>
    <script type="text/javascript">
        $(function () {
            $('#txtname').keydown(function () {
                var name = $('#txtname').val();
                alert(name);
            });
            $('#txtname').keypress(function () {
                var name = $('#txtname').val();
                alert(name);
            });
            $('txtdetails').keyup(function () {
                var details = $('txtdetails').val();
                alert(details);
            });
        });
    </script>
</head>
<body>
    <p><b>Keydown or Keypress Events Example</b></p>
    <input type="text" id="txtname" />
    <p><b>Keyup Event Example</b></p>
    <input type="text" id="txtdetails" />
</body>
</html>
