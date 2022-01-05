<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default7.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>jQuery Show htmle page content in popup</title>
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.8.2.js"></script>
    <link href="src/facebox.css" media="screen" rel="stylesheet" type="text/css" />
    <script src="src/facebox.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(function () {
            $('a[rel*=facebox]').facebox({
                loadingImage: 'src/loading.gif',
                closeImage: 'src/closelabel.png'
            })
        })
    </script>
</head>
<body>
    <div style="padding: 40px;" align="center">
        <h2>Show Html Page in Popup</h2>
        <p><a href="sample.html" rel="facebox">Show Sample.html in popup</a> </p>
    </div>
</body>
</html>
