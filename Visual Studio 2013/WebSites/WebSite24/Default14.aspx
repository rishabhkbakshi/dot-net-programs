<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default14.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>jQuery Shake or Vibrate or Rotate Images</title>
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.8.2.js"></script>
    <script src="jquery.jrumble.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(function () {
            $('#demo2').jrumble({
                x: 4,
                y: 4,
                rotation: 4,
                speed: 30,
                opacity: 10
            });
            $('#demo2').hover(function () {
                $(this).trigger('startRumble');
            }, function () {
                $(this).trigger('stopRumble');
            });
        })


    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <img id="demo2" src="https://lh5.googleusercontent.com/_B28NJpJ61hA/TdgnS7lh7mI/AAAAAAAAAi4/oLTicIRgEIw/FinalLogo.png" />
        </div>
    </form>
</body>
</html>
