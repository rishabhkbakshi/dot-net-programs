<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table>
            <tr>
                <td>
                    <asp:GridView ID="gvDetails" runat="server" BackColor="#DEBA84" 
                        BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" 
                        CellSpacing="2" onrowcreated="Grid_RowCreated" 
                        onselectedindexchanged="Grid_SelectedIndexChanged" 
                        onrowediting="Grid_RowEditing" onrowupdating="Grid_RowUpdating">
                        <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" /> 
                        <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                        <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                        <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                        <Columns>
                            <asp:BoundField HeaderText="S.No." />
                            <asp:TemplateField HeaderText="Employee Code">
                                <ItemTemplate>
                                    <asp:TextBox ID="txt_Code" runat="server" ></asp:TextBox>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Employee Name">
                                <ItemTemplate>
                                    <asp:TextBox ID="txt_Name" runat="server" ></asp:TextBox>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Phone No.">
                                <ItemTemplate>
                                    <asp:TextBox ID="txt_Phone" runat="server" ></asp:TextBox>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Email">
                                <ItemTemplate>
                                    <asp:TextBox ID="txt_Email" runat="server" ></asp:TextBox>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Date of Birth">
                                <ItemTemplate>
                                    <asp:TextBox ID="txt_DOB" runat="server"></asp:TextBox>
                                </ItemTemplate>
                                <FooterStyle HorizontalAlign="Right" />
                                <FooterTemplate>
                                    <asp:Button ID="ButtonAdd" runat="server" Text="Add New Row" onclick="ButtonAdd_Click" />
                                </FooterTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Remove Items">
                                <ItemTemplate>
                                    <asp:Button id="RemoveBtn"  runat="server" Text="Remove" OnClick="RemoveBtn_OnClick"/>
                                </ItemTemplate>
                            </asp:TemplateField>

                        </Columns>
                    </asp:GridView>
                    
                </td>
            </tr>
            <tr>
                <td style="text-align: center">
                    <asp:Button ID="bt1" Text="Submit" OnClick="submit" runat="server" />
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
