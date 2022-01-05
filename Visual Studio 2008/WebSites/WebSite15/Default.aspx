<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

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
                    <asp:GridView ID="grvEmployeeDetails" runat="server" AutoGenerateColumns="False" 
                        OnRowDeleting="grvStudentDetails_RowDeleting" BackColor="White" 
                        BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" 
                        GridLines="Vertical">
                        <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                        <Columns>
                            <asp:BoundField DataField="RowNumber" HeaderText="SNo" />
                            <asp:TemplateField HeaderText="EmployeeCode">
                                <ItemTemplate>
                                    <asp:TextBox ID="txt_Code" runat="server"></asp:TextBox>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="EmployeeName">
                                <ItemTemplate>
                                    <asp:TextBox ID="txt_Name" runat="server"></asp:TextBox>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="PhoneNo">
                                <ItemTemplate>
                                    <asp:TextBox ID="txt_Phone" runat="server"></asp:TextBox>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Email">
                                <ItemTemplate>
                                    <asp:TextBox ID="txt_Email" runat="server"></asp:TextBox>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="DateOfBirth">
                                <ItemTemplate>
                                    <asp:TextBox ID="txt_DOB" runat="server"></asp:TextBox>
                                </ItemTemplate>
                                <FooterStyle HorizontalAlign="Right" />
                            </asp:TemplateField>
                            <asp:CommandField ShowDeleteButton="True" />
                        </Columns>
                        <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                        <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                        <AlternatingRowStyle BackColor="#DCDCDC" />
                    </asp:GridView>
                </td>
            </tr>
        </table>
        <table>
            <tr>
                <td>
                    <asp:Button ID="bt1" runat="server" Text="Add new row" OnClick="bt1_Click" />
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
