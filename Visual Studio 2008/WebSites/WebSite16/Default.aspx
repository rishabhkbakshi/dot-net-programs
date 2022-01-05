<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <table style="width:100%">
        <tr>
            <td>
                <asp:GridView ID="grid_Show" runat="server" CellPadding="4" ForeColor="#333333" 
                    GridLines="None" Width="100%" AutoGenerateColumns="false">
                    <RowStyle BackColor="#FFFBD6" ForeColor="#333333"/>
                    <Columns>
                        <asp:BoundField DataField="Id" HeaderText="Id"/>
                        <asp:BoundField DataField="EmployeeCode" HeaderText="EmployeeCode"/>
                        <asp:BoundField DataField="EmployeeName" HeaderText="EmployeeName"/>
                        <asp:BoundField DataField="PhoneNo" HeaderText="PhoneNo"/>
                        <asp:BoundField DataField="Email" HeaderText="Email"/>
                        <asp:BoundField DataField="DOB" HeaderText="DateOfBirth"/>
                    </Columns>
                    <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                    <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <AlternatingRowStyle BackColor="White" />
                </asp:GridView>
            </td>
        </tr>
    </table>
        <table style="width:100%">
            <tr>
                <td>
                    <asp:GridView ID="grid_Employee" runat="server" AutoGenerateColumns="False" 
                        OnRowCommand="grid_Employee_RowCommand" CellPadding="4" ForeColor="#333333" 
                        GridLines="None" Width="100%" >
                        <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                        <Columns>
                            <asp:TemplateField HeaderText="EmployeeCode">
                                <ItemTemplate>
                                    <asp:TextBox ID="txt_Code" runat="server" Text='<%#Bind("EmployeeCode") %>'></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="Rfv" runat="server" ControlToValidate="txt_Code"
                                        ErrorMessage="*"></asp:RequiredFieldValidator>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="EmployeeName">
                                <ItemTemplate>
                                    <asp:TextBox ID="txt_Name" runat="server" Text='<%#Bind("EmployeeName") %>'></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="Rfv1" runat="server" ControlToValidate="txt_Name"
                                        ErrorMessage="*"></asp:RequiredFieldValidator>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="PhoneNo">
                                <ItemTemplate>
                                    <asp:TextBox ID="txt_Phone" runat="server" Text='<%#Bind("PhoneNo") %>'></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="Rfv2" runat="server" ControlToValidate="txt_Phone"
                                        ErrorMessage="*"></asp:RequiredFieldValidator>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Email">
                                <ItemTemplate>
                                    <asp:TextBox ID="txt_Email" runat="server" Text='<%#Bind("Email") %>'></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="Rfv3" runat="server" ControlToValidate="txt_Email"
                                        ErrorMessage="*"></asp:RequiredFieldValidator>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="DateOfBirth">
                                <ItemTemplate>
                                    <asp:TextBox ID="txt_DOB" runat="server" Text='<%#Bind("DateOfBirth") %>'></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="Rfv4" runat="server" ControlToValidate="txt_DOB"
                                        ErrorMessage="*"></asp:RequiredFieldValidator>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:LinkButton ID="lbtnDelete" runat="server" Text="Delete" CommandName="Remove" CausesValidation="false"></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                        <AlternatingRowStyle BackColor="White" />
                    </asp:GridView>
                </td>
            </tr>
        </table>
        <table>
            <tr>
                <td>
                    <asp:Button ID="Btn_Add" Text="AddNewRow" runat="server" OnClick="Btn_Add_Click" CausesValidation="false"/>
                </td>
                <td>
                    <asp:Button ID="Btn_Insert" Text="Submit" runat="server" OnClick="Btn_Insert_Click" />
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
