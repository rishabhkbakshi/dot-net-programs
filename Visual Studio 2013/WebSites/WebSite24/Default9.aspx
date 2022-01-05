﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default9.aspx.cs" Inherits="Default9" %>

<!DOCTYPE html>


<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>jQuery hover dropdown menu with css example</title>
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.8.2.js"></script>
    <script type="text/javascript">
        $(function () {
            $(".menu").hover(
            function () { $(".sub").slideToggle(400); },
            function () { $(".sub").hide(); }
            );
        });
    </script>
    <style type="text/css">
        a {
            text-decoration: none;
        }

        .menu {
            font-family: Arial;
            color: #515151;
            width: 200px;
            position: relative;
            height: 40px;
            text-align: left;
            width: 202px;
            margin: 0 auto;
        }

            .menu li a {
                color: #515151;
                display: block;
                padding: 6px 15px;
                cursor: pointer;
                font-size: 14px;
            }

                .menu li a:hover {
                    background: #f44141;
                    color: #fff;
                }

        .sub {
            background: #fff;
            position: absolute;
            z-index: 2;
            width: 200px;
            padding: 40px 0 3px;
            border-radius: 3px;
            box-shadow: 0 2px 4px #ddd;
            border: 1px solid #ddd;
            display: none;
        }

        a.hover-link {
            width: 190px;
            background: #fff;
            font-size: 14px;
            color: #515151;
            position: absolute;
            z-index: 110;
            display: block;
            padding: 10px 0 1px 10px;
            height: 28px;
            cursor: pointer;
            border-radius: 5px 5px 0 0;
            font-weight: bold;
            border: 1px solid #ddd;
        }

        .sub-options {
            list-style: none;
            margin: 0px;
            padding: 0px;
            font-size: 11px;
        }
    </style>
</head>
<body>
    <div class='menu'>
        <a class='hover-link'>Hover on Menu</a>
        <div class='sub'>
            <ul class='sub-options'>
                <li><a href='#'>Home</a></li>
                <li><a href='#'>About</a></li>
                <li><a href='#'>Services</a></li>
                <li><a href='#'>Contact</a></li>
            </ul>
        </div>
    </div>
</body>
</html>
