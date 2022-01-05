<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default26.aspx.cs" Inherits="Default26" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>jQuery show progress bar on button click asp.net</title>
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.8.2.js"></script>
    <style type="text/css">
        .sample {
            background-color: #DC5807;
            border: 1px solid black;
            border-collapse: collapse;
            color: White;
        }

        #form1 {
            text-align: left;
        }
    </style>
</head>
<body style="text-align: left">
    <form id="form1" runat="server">
        <div id="DisableDiv"></div>
        <input type="button" id="btnClick" value="Get Data" />
        <div id="testdiv"></div>
        <div>
            UserName:<asp:TextBox ID="txtUserName" runat="server" /><br />
            Amount:<asp:Label ID="lblAmount" runat="server" Text="10000" /><br />
            <asp:Button ID="btnValidate" runat="server" Text="Get Values" OnClientClick="javascript:getvalues();" />
        </div>
    </form>
    <script type="text/javascript">
        $(function () {
            $('#btnClick').click(function () {
                $('#DisableDiv').fadeTo('slow', .6);
                $('#DisableDiv').append('<div style="background-color:#E6E6E6;position: absolute;top:0;left:0;width: 100%;height:300%;z-index:1001;-moz-opacity: 0.8;opacity:.80;filter: alpha(opacity=80);"><img src="loading.gif" style="background-color:Aqua;position:fixed; top:40%; left:46%;"/></div>');
                setTimeout(function () { GetData() }, 1000)
            })
        });
        function GetData() {
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "Default26.aspx/BindDatatable",
                data: "{}",
                dataType: "json",
                success: function (data) {
                    var theHtml = data.d;
                    $('#testdiv').html(theHtml)
                    $('#DisableDiv').html("");
                },
                error: function (result) {
                    alert("Error");
                }
            });
        }
        function getvalues() {
            var name = document.getElementById("<%=txtUserName.ClientID %>").value;
            var amount = document.getElementById("<%=lblAmount.ClientID %>").innerHTML;
            alert("Textbox Value: " + name + "\n" + "Label Value: " + amount);
            return false
        }
    </script>
</body>
</html>
