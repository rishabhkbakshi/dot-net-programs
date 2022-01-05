<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default7.aspx.cs" Inherits="Default7" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>jQuery Merge Multiple Tables into single table in webpage</title>
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.8.2.js"></script>
    <script type="text/javascript">
        $(function () {
            $('#btnMerge').click(function () {
                $('#tbl1 > tbody:last').append($('#tbl2 > tbody').html());
                $('#tbl2').remove();
            })
        })
    </script>
</head>
<body>
    <div>
        <table id="tbl1" border="1" cellspacing="1">
            <tr>
                <td><b>UserName</b></td>
                <td><b>Education</b></td>
                <td><b>Location</b></td>
            </tr>
            <tr>
                <td>Suresh</td>
                <td>B.Tech</td>
                <td>Chennai</td>
            </tr>
            <tr>
                <td>Rohini</td>
                <td>M.Sc</td>
                <td>Chennai</td>
            </tr>
            <tr>
                <td>Mahesh</td>
                <td>Phd</td>
                <td>Delhi</td>
            </tr>
            <tr>
                <td>Madhav</td>
                <td>MBBS</td>
                <td>Nagpur</td>
            </tr>
        </table>
        <table id="tbl2" border="1" cellspacing="1">
            <tr>
                <td>Suresh</td>
                <td>B.Tech</td>
                <td>Chennai</td>
            </tr>
            <tr>
                <td>Rohini</td>
                <td>M.Sc</td>
                <td>Chennai</td>
            </tr>
            <tr>
                <td>Mahesh</td>
                <td>Phd</td>
                <td>Delhi</td>
            </tr>
            <tr>
                <td>Madhav</td>
                <td>MBBS</td>
                <td>Nagpur</td>
            </tr>
        </table>
        <input type="button" id="btnMerge" value="Merge Tables" />
    </div>
</body>
</html>
