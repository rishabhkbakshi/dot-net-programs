<%@ Page language="c#" Codebehind="HeavyDataGrid.aspx.cs" AutoEventWireup="false" Inherits="ViewStateArticle.HeavyDataGrid" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" > 

<html>
  <head>
    <title>HeavyDataGrid</title>
    <meta name="GENERATOR" Content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" Content="C#">
    <meta name=vs_defaultClientScript content="JavaScript">
    <meta name=vs_targetSchema content="http://schemas.microsoft.com/intellisense/ie5">
  </head>
  <body MS_POSITIONING="FlowLayout">
	
    <form id="Form1" method="post" runat="server">
			<h1>A Standard DataGrid (<code>EnableViewState="True"</code>)</h1>
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

     </form>
	
  </body>
</html>
