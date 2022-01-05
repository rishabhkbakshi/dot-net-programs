<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register Assembly="ServerControl1"
    Namespace="ServerControl1"
    TagPrefix="ccs" %>
<%@ Register Src="~/WebUserControl.ascx" TagPrefix="uc1" TagName="WebUserControl" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Enter a word:
   <br />
            <asp:TextBox ID="TextBox1" runat="server" Style="width: 198px">
            </asp:TextBox>
            <br />
            <br />
            <asp:Button ID="Button1" runat="server"
                OnClick="Button1_Click"
                Text="Check Palindrome" Style="width: 132px" />
            <br />
            <ccs:ServerControl1 ID="ServerControl11"
                runat="server" Text="" />
        </div>


        <div>
            <asp:Label ID="Label1" runat="server"
                Text="Welcome to ASP.Net Tutorials "></asp:Label>
            <br />
            <br />
            <asp:Button ID="Button2" runat="server"
                OnClick="Button1_Click" Text="Copyright Info" />
            <uc1:WebUserControl runat="server" ID="WebUserControl" />
        </div>
    </form>
</body>
</html>
