<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ImageUpload.aspx.cs" Inherits="ImageUpload" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" />
    <div>
        <asp:Image ID="Image1" runat="server" Width="142px" Height="193px" />
        <br />
        <asp:Button runat="server" ID="btnEdit" Text="EditImage" />  
        <cc1:PopupControlExtender ID="btnEdit_PopupControlExtender" runat="server" 
            DynamicServicePath="" Enabled="True" ExtenderControlID="" 
            TargetControlID="btnEdit" PopupControlID="Panel1">
        </cc1:PopupControlExtender>
        
        <asp:Panel ID="Panel1" runat="server" BorderStyle="Solid" BorderWidth="1px" BackColor="Gray" Height="120px" Width="227px"><br />
        <asp:FileUpload ID="FileUpload1" runat="server" />
        <br />
        <asp:Button ID="Button1" runat="server" Text="Upload" onclick="Button1_Click" />
        </asp:Panel>
    </div>
    </form>
</body>
</html>
