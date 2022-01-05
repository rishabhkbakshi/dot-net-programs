<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default4.aspx.cs" Inherits="Default4" %>

<!DOCTYPE html>


<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>JavaScript Convert AM/PM to 24 Hours Time</title>
    <script type="text/javascript">
        function Converttimeformat() {
            // var time = $("#starttime").val();
            var time = document.getElementById('txttime').value;
            var hrs = Number(time.match(/^(\d+)/)[1]);
            var mnts = Number(time.match(/:(\d+)/)[1]);
            var format = time.match(/\s(.*)$/)[1];
            if (format == "PM" && hrs < 12) hrs = hrs + 12;
            if (format == "AM" && hrs == 12) hrs = hrs - 12;
            var hours = hrs.toString();
            var minutes = mnts.toString();
            if (hrs < 10) hours = "0" + hours;
            if (mnts < 10) minutes = "0" + minutes;
            alert(hours + ":" + minutes);
        }
    </script>
</head>
<body>
    <div>
        <table>
            <tr>
                <td><b>Enter Time:</b></td>
                <td>
                    <input type="text" id="txttime" value="10:00 PM" />
                </td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <input type="button" id="btnConvert" value="Convert to AM/PM" onclick="Converttimeformat()" />
                </td>
            </tr>
        </table>
    </div>
</body>
</html>
