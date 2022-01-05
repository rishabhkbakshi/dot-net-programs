<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default7.aspx.cs" Inherits="Default7" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>jQuery Preview Image before upload</title>
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.8.2.js"></script>
    <script type="text/javascript">
        function showimagepreview(input) {
            if (input.files && input.files[0]) {
                var filerdr = new FileReader();
                filerdr.onload = function (e) {
                    $('#imgprvw').attr('src', e.target.result);
                }
                filerdr.readAsDataURL(input.files[0]);
            }
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <input type="file" name="filUpload" id="filUpload" onchange="showimagepreview(this)" />
        </div>
        <img id="imgprvw" alt="uploaded image preview" />
    </form>
</body>
</html>
