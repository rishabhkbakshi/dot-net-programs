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
                    FirstName:
                </td>
                <td>
                    <asp:TextBox runat="server" ID="txtFirstName" />
                </td>
                <td>
                    MiddleName:
                </td>
                <td>
                    <asp:TextBox runat="server" ID="txtMiddleName" />
                </td>
            </tr>
            <tr>
                <td>
                    LastName:
                </td>
                <td>
                    <asp:TextBox runat="server" ID="txtLastName" />
                </td>
                <td>
                    Age:
                </td>
                <td>
                    <asp:TextBox runat="server" ID="txtAge" />
                </td>
            </tr>
            <tr>
                <td>
                    MaritalStatus:
                </td>
                <td>
                    <asp:TextBox runat="server" ID="txtMaritalStatus" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button runat="server" ID="btnSubmit" Text="Submit" OnClick="btnSubmit_Click" />
                    <asp:Button runat="server" ID="btnUpdate" Text="Update" 
                        onclick="btnUpdate_Click" />
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:GridView runat="server" ID="gvUserDetails" AllowPaging="true" AutoGenerateColumns="false"
                        OnRowUpdating="gvUserDetails_RowUpdating" 
                        OnRowDeleting="gvUserDetails_RowDeleting" 
                        onpageindexchanging="gvUserDetails_PageIndexChanging">
                        <Columns>
                            <asp:BoundField DataField="FirstName" HeaderText="FirstName" />
                            <asp:BoundField DataField="MiddleName" HeaderText="MiddleName" />
                            <asp:BoundField DataField="LastName" HeaderText="LastName" />
                            <asp:BoundField DataField="Age" HeaderText="Age" />
                        </Columns>
                        <Columns>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:LinkButton runat="server" ID="lnkUpdate" CommandName="Update" Text="Update"></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <Columns>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:LinkButton runat="server" ID="lnkDelete" 
                                        Text="Delete" OnClientClick="return Confirm('Are you sure you want to delete the record?')" CommandName="Delete"></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
