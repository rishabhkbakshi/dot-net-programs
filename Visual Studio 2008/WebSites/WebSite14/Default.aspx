<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="Default.aspx.cs" Inherits="_Default" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptM" runat="server" EnablePageMethods="true"></asp:ScriptManager>
    <div>
        <asp:Label ID="lbl_FirstName" runat="server" Text="FirstName"></asp:Label>
        <asp:TextBox ID="txt_FirstName" runat="server" ></asp:TextBox>
        <cc1:AutoCompleteExtender ID="AutoCompleteExtender1" 
        TargetControlID="txt_FirstName" MinimumPrefixLength="1" EnableCaching="true"
        CompletionSetCount="10" UseContextKey="True" 
        ServiceMethod="GetFirstNameList" runat="server">
        </cc1:AutoCompleteExtender>
    </div>
    </form>
</body>
</html>
