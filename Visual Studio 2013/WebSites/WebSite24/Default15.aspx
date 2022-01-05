<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default15.aspx.cs" Inherits="Default15" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>jQuery Select Deselect all Checkboxes</title>
    <script src="http://code.jquery.com/jquery-1.8.2.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(function () {
            $('input[name="chkUser"]').click(function () {
                if ($('input[name="chkUser"]').length == $('input[name="chkUser"]:checked').length) {
                    $('input:checkbox[name="chkAll"]').attr("checked", "checked");
                }
                else {
                    $('input:checkbox[name="chkAll"]').removeAttr("checked");
                }
            });
            $('input:checkbox[name="chkAll"]').click(function () {
                var slvals = []
                if ($(this).is(':checked')) {
                    $('input[name="chkUser"]').attr("checked", true);
                }
                else {
                    $('input[name="chkUser"]').attr("checked", false);
                    slvals = null;
                }
            });
        })
    </script>
    <style type="text/css">
        li {
            list-style-type: none;
        }
    </style>
</head>
<body>
    <ul>
        <li>
            <label>
                <input type="checkbox" name="chkAll" value="All" />
                Select All
            </label>
        </li>
        <li>
            <label>
                <input type="checkbox" name="chkUser" value="3930" />Suresh</label></li>
        <li>
            <label>
                <input type="checkbox" name="chkUser" value="4049" />Rhoini</label></li>
        <li>
            <label>
                <input type="checkbox" name="chkUser" value="4076" />Mahesh</label></li>
        <li>
            <label>
                <input type="checkbox" name="chkUser" value="4086" />Mahendra</label></li>
        <li>
            <label>
                <input type="checkbox" name="chkUser" value="4087" />Madhav</label></li>
        <li>
            <label>
                <input type="checkbox" name="chkUser" value="4116" />Honey</label></li>
        <li>
            <label>
                <input type="checkbox" name="chkUser" value="4143" />Sateesh</label></li>
        <li>
            <label>
                <input type="checkbox" name="chkUser" value="4296" />Praveen</label></li>
    </ul>
</body>
</html>
