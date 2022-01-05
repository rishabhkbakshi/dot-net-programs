<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default4.aspx.cs" Inherits="Default4" %>

<!DOCTYPE html>

<html>
<head>
    <title>jQuery Move DIV FROM Left to Right & Right to Left</title>
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.7.1.js"></script>
    <script type="text/javascript" src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>

    <script type="text/javascript">
        $(function () {
            $("#btnright").click(function () {
                $('#slidediv').toggle('slide', { direction: 'right' }, 700);
            });
            $("#btnleft").click(function () {
                $('#slidediv').toggle('slide', { direction: 'left' }, 700);
            });
        });
    </script>
    <style type="text/css">
        body {
            font: 12px Tahoma, Arial, Helvetica, Sans-Serif;
        }

        #slidediv {
            color: #F25022;
            background-color: #EFEFEF;
            border: 2px solid #00A4EF;
            display: none;
            text-align: justify;
        }

            #slidediv p {
                margin: 15px;
                font-size: 0.917em;
            }

        #contentdiv {
            clear: both;
            margin: 0 auto;
            max-width: 534px;
        }
    </style>
</head>
<body>
    <div id="contentdiv">

        <h2>Slide DIV from right to left or left to right.</h2>
        <p>
            <input type="button" id="btnleft" value="Left to Right" />
            <input type="button" id="btnright" value="Right to Left" />
        </p>
        <div id="slidediv">
            <p>Welcome to Aspdotnet-Suresh.com. Welcome to Aspdotnet-Suresh.com. Welcome to Aspdotnet-Suresh.com. Welcome to Aspdotnet-Suresh.com. Welcome to Aspdotnet-Suresh.com. Welcome to Aspdotnet-Suresh.com. Welcome to Aspdotnet-Suresh.com. Welcome to Aspdotnet-Suresh.com. Welcome to Aspdotnet-Suresh.com. Welcome to Aspdotnet-Suresh.com. Welcome to Aspdotnet-Suresh.com. Welcome to Aspdotnet-Suresh.com. Welcome to Aspdotnet-Suresh.com. Welcome to Aspdotnet-Suresh.com. Welcome to Aspdotnet-Suresh.com. Welcome to Aspdotnet-Suresh.com. Welcome to Aspdotnet-Suresh.com. Welcome to Aspdotnet-Suresh.com. Welcome to Aspdotnet-Suresh.com </p>
        </div>
    </div>

</body>
</html>
