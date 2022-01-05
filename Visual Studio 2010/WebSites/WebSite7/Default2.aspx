<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default2.aspx.cs" Inherits="Default2" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:ScriptManager ID="Script" runat="server">
        </asp:ScriptManager>
        <asp:TextBox ID="txtFirstName" runat="server"></asp:TextBox>
        <cc1:autocompleteextender id="autoComplete" runat="server" targetcontrolid="txtFirstName"
            minimumprefixlength="1" enablecaching="true" completionsetcount="10" servicemethod="GetFirstNameList">
        </cc1:autocompleteextender>
    </div>
    </form>
</body>
</html>
