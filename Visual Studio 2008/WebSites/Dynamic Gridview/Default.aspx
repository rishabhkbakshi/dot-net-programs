<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <asp:GridView ID="grvStudentDetails" runat="server" ShowFooter="true" AutoGenerateColumns="false" CellPadding="4" ForeColor="#333333" GridLines="None">
    <Columns>
    <asp:BoundField DataField="RowNumber" HeaderText="SNo" />
    <asp:TemplateField HeaderText="StudentName">
    <ItemTemplate>
    <asp:TextBox runat="server" ID="txtName"></asp:TextBox>
    </ItemTemplate>
    </asp:TemplateField>
    <asp:TemplateField HeaderText="Student Age">
    <ItemTemplate>
    <asp:TextBox runat="server" ID="txtAge"></asp:TextBox>
    </ItemTemplate>
    </asp:TemplateField>
    <asp:TemplateField HeaderText="Student Address">
    <ItemTemplate>
    <asp:TextBox runat="server" ID="txtAddress"></asp:TextBox>
    </ItemTemplate>
    </asp:TemplateField>
    <asp:TemplateField HeaderText="Gender"> 
    <ItemTemplate>
    <asp:RadioButtonList ID="rblGender" runat="server" RepeatDirection="Horizontal">
    <asp:ListItem Value="M">Male</asp:ListItem>
    <asp:ListItem Value="F">Female</asp:ListItem>
    </asp:RadioButtonList>
    </ItemTemplate>
    </asp:TemplateField>
    <asp:TemplateField HeaderText="Qualification">
    <ItemTemplate>
    <asp:DropDownList ID="drpQualification" runat="server">
    <asp:ListItem Value="G">Graduate</asp:ListItem>
    <asp:ListItem Value="P">Post Graduate</asp:ListItem>
    </asp:DropDownList>
    </ItemTemplate>
    <FooterStyle HorizontalAlign="Right" />
    <FooterTemplate>
    <asp:Button ID="btnAdd" runat="server" Text="Add New Row" />
    </FooterTemplate>
    </asp:TemplateField>
    <asp:CommandField ShowDeleteButton="true" />
    </Columns>
    <FooterStyle BackColor="#507CD1" Font-Bold="true" ForeColor="White" />
    <RowStyle BackColor="#EFF3FB" />
    <EditRowStyle BackColor="#2461BF" />
    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="true" ForeColor="#333333" />
    <HeaderStyle BackColor="#507CD1" Font-Bold="true" ForeColor="White" />
    <AlternatingRowStyle BackColor="White" />
    </asp:GridView>
    </div>
    </form>
</body>
</html>
