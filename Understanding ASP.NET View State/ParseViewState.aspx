<%@ Page language="c#" Codebehind="ParseViewState.aspx.cs" AutoEventWireup="false" Inherits="ViewStateArticle.ParseViewState" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>ParseViewState</title>
		<meta name="GENERATOR" Content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" Content="C#">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
	</HEAD>
	<body MS_POSITIONING="FlowLayout">
		<form id="Form1" method="post" runat="server">
			<h1>View State Parsing Demo</h1>
			<p>This demo allows you to enter a base-64 encoded view state string from an 
				ASP.NET Web page into the textbox below. Submitting the form will cause the 
				view state to be parsed and displayed.</p>
			<P>Enter the ViewState to parse:<BR>
				<asp:TextBox id="txtViewState" runat="server" TextMode="MultiLine" Rows="10" Columns="60"></asp:TextBox><BR>
				<asp:Button id="btnParse" runat="server" Text="Parse ViewState"></asp:Button></P>
			<P><hr>
			<P></P>
			<pre>
<asp:Literal Runat="server" ID="ltlViewState"></asp:Literal>
			</pre>
		</form>
	</body>
</HTML>
