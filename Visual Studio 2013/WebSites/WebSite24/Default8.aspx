<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default8.aspx.cs" Inherits="Default8" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>jQuery Check Particular word in string in JavaScript</title>
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.8.2.js"></script>
    <script type="text/javascript">
        $(function () {
            $('#btnCheck').click(function () {
                var str = 'how are you';
                var txt = $('#txtword').val();
                if (str.indexOf(txt) > -1) {
                    alert('String Contains Word');
                    return true;
                } else {
                    alert('String Does not contains word');
                    return false;
                }
            });
        })
    </script>
</head>
<body>
    <div>
        Check word in this String: <b>How are You</b><br />
        Enter Text to Search:
        <input type="text" id="txtword" value="how" />
        <input type="button" id="btnCheck" value="Check" />
    </div>
</body>
</html>
