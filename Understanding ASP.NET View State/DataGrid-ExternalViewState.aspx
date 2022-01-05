<%@ Page language="c#" Codebehind="DataGrid-ExternalViewState.aspx.cs" AutoEventWireup="false" Inherits="ViewStateArticle.DataGrid_ExternalViewState" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>DataGrid-ExternalViewState</title>
		<meta name="GENERATOR" Content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" Content="C#">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
	</HEAD>
	<body MS_POSITIONING="FlowLayout">
		<form id="Form1" method="post" runat="server">
			<h1>Demo of Persisting View State to the Web Server's File System</h1>
			<p>This page has 0 bytes in view state; instead, it's persisted to the <code>PersistedViewState</code>
			folder.  The code-behind class is derived from the <code>PersistViewStateToFileSystem</code> class....</p>
			<asp:DataGrid id="dgFiles" runat="server" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px"
				BackColor="White" CellPadding="3" GridLines="Horizontal" AutoGenerateColumns="False">
				<SelectedItemStyle Font-Bold="True" ForeColor="#F7F7F7" BackColor="#738A9C"></SelectedItemStyle>
				<AlternatingItemStyle BackColor="#F7F7F7"></AlternatingItemStyle>
				<ItemStyle ForeColor="#4A3C8C" BackColor="#E7E7FF"></ItemStyle>
				<HeaderStyle Font-Bold="True" ForeColor="#F7F7F7" BackColor="#4A3C8C"></HeaderStyle>
				<FooterStyle ForeColor="#4A3C8C" BackColor="#B5C7DE"></FooterStyle>
				<Columns>
					<asp:BoundColumn DataField="Name" HeaderText="File Name"></asp:BoundColumn>
					<asp:BoundColumn DataField="Length" HeaderText="File Size"></asp:BoundColumn>
				</Columns>
				<PagerStyle HorizontalAlign="Right" ForeColor="#4A3C8C" BackColor="#E7E7FF" Mode="NumericPages"></PagerStyle>
			</asp:DataGrid>
			<P>
				<asp:Button id="Button1" runat="server" Text="Cause Postback"></asp:Button></P>
		</form>
	</body>
</HTML>
