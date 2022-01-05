<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AutocompleteExtender.aspx.cs" Inherits="AutocompleteExtender" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <asp:TextBox runat="server" ID="txtCountry" />
        <cc1:AutoCompleteExtender ID="AutoCompleteExtender1" runat="server" MinimumPrefixLength="1" ServiceMethod="WebMethod" TargetControlID="txtCountry" >
        </cc1:AutoCompleteExtender>
    </div>
    </form>
</body>
</html>
