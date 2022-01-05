<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default5.aspx.cs" Inherits="Default5" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Run JavaScript function at specific intervals of time</title>
    <script type="text/javascript">
        var count = 0;
        function changeColor() {
            // Call function with 500 milliseconds gap
            setInterval(starttimer, 500);
        }
        function starttimer() {
            count += 1;
            var oElem = document.getElementById("divtxt");
            oElem.style.color = oElem.style.color == "red" ? "blue" : "red";
            document.getElementById("lbltxt").innerHTML = "Your Time Starts: " + count;
        }
    </script>
</head>
<body>
    <div id="divtxt">
        <label id="lbltxt" style="font: bold 24px verdana" />
    </div>
    <button onclick="changeColor();">Start Timer</button>
</body>
</html>
