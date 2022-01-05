<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>jQuery plugin to show wikipedia description in tooltips</title>
    <link href="wikiUp.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.8.2.js"></script>
    <script src="wikiUp.js" type="text/javascript"></script>
</head>
<body>
    <data data-wiki="Apple Inc."><b>Apple</b></data>
    was founded by
    <data data-wiki="Steve Jobs"><b>Steve Jobs</b></data>
    .
   <data data-wiki="Madrid" data-lang="es"><b>Madrid</b></data>
    es la capital de España.
</body>
</html>
