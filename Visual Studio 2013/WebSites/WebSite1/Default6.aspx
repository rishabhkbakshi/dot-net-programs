<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default6.aspx.cs" Inherits="Default6" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>

</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:DataList ID="dlEmployee" runat="server"
                OnCancelCommand="dlEmployee_CancelCommand"
                OnDeleteCommand="dlEmployee_DeleteCommand"
                OnEditCommand="dlEmployee_EditCommand"
                OnUpdateCommand="dlEmployee_UpdateCommand"
                OnItemCommand="dlEmployee_ItemCommand">
                <HeaderStyle BackColor="Maroon" ForeColor="White" />
                <AlternatingItemStyle BackColor="Yellow" />

                <HeaderTemplate>
                    <table>
                        <tr>
                            <th id="Th1" align="left" width="100px"></th>
                            <th id="Th2" align="left" width="20px">ID</th>
                            <th id="Th3" align="left" width="150px">Employee Name</th>
                            <th id="Th4" align="left" width="100px">Department</th>
                            <th id="Th5" align="left" width="100px">Address</th>
                            <th id="Th6" align="left" width="100px">City</th>
                            <th id="Th7" align="left" width="100px">State</th>
                            <th id="Th8" align="left" width="100px">Country</th>
                        </tr>
                    </table>
                </HeaderTemplate>
                <ItemTemplate>
                    <table>
                        <tr>
                            <td width="100px">
                                <asp:Button ID="DeleteButton" runat="server" CommandName="Delete"
                                    Text="Delete" OnClientClick="return confirm('Are You Sure to Delete?')" />
                                <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                            </td>
                            <td width="20px">
                                <asp:Label ID="EmpIDLabel" runat="server" Text='<%# Eval("EmployeeID") %>' />
                            </td>
                            <td width="150px">
                                <asp:Label ID="EmpNameLabel" runat="server" Text='<%# Eval("EmployeeName") %>' />
                            </td>
                            <td width="100px">
                                <asp:Label ID="DepartmentLabel" runat="server"
                                    Text='<%# Eval("Department") %>' />
                            </td>
                            <td width="100px">
                                <asp:Label ID="AgeLabel" runat="server" Text='<%# Eval("Address") %>' />
                            </td>
                            <td width="100px">
                                <asp:Label ID="AddressLabel" runat="server" Text='<%# Eval("City") %>' />
                            </td>
                            <td width="100px">
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("State") %>' />
                            </td>
                            <td width="100px">
                                <asp:Label ID="Label2" runat="server" Text='<%# Eval("Country") %>' />
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
                <EditItemTemplate>
                    <table>
                        <tr>
                            <td width="100px">
                                <asp:Button ID="UpdateButton" runat="server" CommandName="Update"
                                    Text="Update" />
                                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel"
                                    Text="Cancel" />
                            </td>
                            <td width="20px">
                                <asp:Label ID="EmpIDLabel1" runat="server" Text='<%# Eval("EmployeeID") %>' />
                            </td>
                            <td width="150px">
                                <asp:TextBox ID="EmpNameTextBox" Width="100px" runat="server" Text='<%# Bind("EmployeeName") %>' />
                            </td>
                            <td width="80px">
                                <asp:TextBox ID="txtDept" runat="server" Width="80px" Text='<%# Bind("Department") %>' />
                            </td>
                            <td width="100px">
                                <asp:TextBox ID="txtAddress" runat="server" Width="100px" Text='<%# Bind("Address") %>' />
                            </td>
                            <td width="100px">
                                <asp:TextBox ID="txtCity" runat="server" Width="100px" Text='<%# Bind("City") %>' />
                            </td>
                            <td width="100px">
                                <asp:TextBox ID="txtState" runat="server" Width="100px" Text='<%# Bind("State") %>' />
                            </td>
                            <td width="100px">
                                <asp:TextBox ID="txtCountry" runat="server" Width="100px" Text='<%# Bind("Country") %>' />
                            </td>
                        </tr>
                    </table>
                </EditItemTemplate>
                <FooterTemplate>
                    <table>
                        <tr>
                            <td width="100px">
                                <asp:Button ID="btnInsertButton" runat="server" CommandName="Insert"
                                    Text="Insert" />
                            </td>
                            <td width="20px">
                                <asp:Label ID="EmpIDLabel1" runat="server" />
                            </td>
                            <td width="150px">
                                <asp:TextBox ID="EmpNameTextBox" runat="server" Width="100px" />
                            </td>
                            <td width="80px">
                                <asp:TextBox ID="txtDept" runat="server" Width="80px" />
                            </td>
                            <td width="100px">
                                <asp:TextBox ID="txtAddress" runat="server" Width="100px" />
                            </td>
                            <td width="100px">
                                <asp:TextBox ID="txtCity" runat="server" Width="100px" />
                            </td>
                            <td width="100px">
                                <asp:TextBox ID="txtState" runat="server" Width="100px" />
                            </td>
                            <td width="100px">
                                <asp:TextBox ID="txtCountry" runat="server" Width="100px" />
                            </td>
                        </tr>
                    </table>
                </FooterTemplate>
            </asp:DataList>
        </div>
    </form>
</body>
</html>
