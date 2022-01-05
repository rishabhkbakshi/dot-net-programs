<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default5.aspx.cs" Inherits="Default5" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:DataGrid ID="Grid" runat="server" PageSize="5" AllowPaging="True" DataKeyField="EmpId"
                AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" OnPageIndexChanged="Grid_PageIndexChanged" OnCancelCommand="Grid_CancelCommand"
                OnDeleteCommand="Grid_DeleteCommand" OnEditCommand="Grid_EditCommand" OnUpdateCommand="Grid_UpdateCommand">
                <Columns>
                    <asp:BoundColumn HeaderText="EmpId" DataField="EmpId" ReadOnly="true"></asp:BoundColumn>
                    <asp:BoundColumn HeaderText="F_Name" DataField="F_Name"></asp:BoundColumn>
                    <asp:BoundColumn HeaderText="L_Name" DataField="L_Name"></asp:BoundColumn>
                    <asp:BoundColumn DataField="City" HeaderText="City"></asp:BoundColumn>
                    <asp:BoundColumn DataField="EmailId" HeaderText="EmailId"></asp:BoundColumn>
                    <asp:BoundColumn DataField="EmpJoining" HeaderText="EmpJoining"></asp:BoundColumn>
                    <asp:EditCommandColumn EditText="Edit" CancelText="Cancel" UpdateText="Update" HeaderText="Edit"></asp:EditCommandColumn>
                    <asp:ButtonColumn CommandName="Delete" HeaderText="Delete" Text="Delete"></asp:ButtonColumn>
                </Columns>
                <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                <SelectedItemStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" Mode="NumericPages" />
                <AlternatingItemStyle BackColor="White" />
                <ItemStyle BackColor="#FFFBD6" ForeColor="#333333" />
                <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            </asp:DataGrid>
            <br />
            <br />
            <table>
                <tr>
                    <td>
                        <asp:Label ID="lblfname" runat="server" Text="F_Name"></asp:Label>

                    </td>
                    <td>
                        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblLname" runat="server" Text="L_Name"></asp:Label>

                    </td>
                    <td>
                        <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblCity" runat="server" Text="City"></asp:Label>

                    </td>
                    <td>
                        <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblEmailId" runat="server" Text="EmailId"></asp:Label>

                    </td>
                    <td>
                        <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblEmpJoining" runat="server" Text="EmpJoining"></asp:Label>

                    </td>
                    <td>
                        <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
                    </td>
                </tr>
            </table>
            <asp:Button ID="btnsubmit" runat="server" Text="Submit" OnClick="btnsubmit_Click" /><br />
            <asp:Button ID="btnReset" runat="server" Text="Reset" OnClick="btnReset_Click" /><br />
            <asp:Button ID="btnOk" runat="server" Text="OK" OnClick="btnOk_Click" />
        </div>
        <div>
            <asp:DataGrid ID="Grid1" runat="server" PageSize="5" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None">
                <Columns>
                    <asp:BoundColumn HeaderText="EmpId" DataField="EmpId"></asp:BoundColumn>
                    <asp:BoundColumn HeaderText="F_Name" DataField="F_Name"></asp:BoundColumn>
                    <asp:BoundColumn HeaderText="L_Name" DataField="L_Name"></asp:BoundColumn>
                    <asp:BoundColumn DataField="City" HeaderText="City"></asp:BoundColumn>
                    <asp:BoundColumn DataField="EmailId" HeaderText="EmailId"></asp:BoundColumn>
                    <asp:BoundColumn DataField="EmpJoining" HeaderText="EmpJoining"></asp:BoundColumn>
                </Columns>
                <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                <SelectedItemStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" Mode="NumericPages" />
                <AlternatingItemStyle BackColor="White" />
                <ItemStyle BackColor="#FFFBD6" ForeColor="#333333" />
                <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            </asp:DataGrid>
        </div>
        <div>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" DataKeyNames="EmpId"
                OnPageIndexChanging="GridView1_PageIndexChanging" OnRowCancelingEdit="GridView1_RowCancelingEdit"
                OnRowDeleting="GridView1_RowDeleting" OnRowEditing="GridView1_RowEditing"
                OnRowUpdating="GridView1_RowUpdating">
                <Columns>
                    <asp:BoundField HeaderText="EmpId" DataField="EmpId" ReadOnly="true"></asp:BoundField>
                    <asp:BoundField HeaderText="F_Name" DataField="F_Name"></asp:BoundField>
                    <asp:BoundField HeaderText="L_Name" DataField="L_Name"></asp:BoundField>
                    <asp:BoundField DataField="City" HeaderText="City"></asp:BoundField>
                    <asp:BoundField DataField="EmailId" HeaderText="EmailId"></asp:BoundField>
                    <asp:BoundField DataField="EmpJoining" HeaderText="EmpJoining"></asp:BoundField>
                    <%--  <asp:CommandField ShowEditButton="true" HeaderText="Edit" />
                    <asp:CommandField ShowDeleteButton="true" HeaderText="Delete"/>--%>
                    <asp:TemplateField HeaderText="Edit">
                        <ItemTemplate>
                            <asp:LinkButton ID="btnEdit" Text="Edit" runat="server" CommandName="Edit" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:LinkButton ID="btnUpdate" Text="Update" runat="server" CommandName="Update" />
                            <asp:LinkButton ID="btnCancel" Text="Cancel" runat="server" CommandName="Cancel" />
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:ButtonField ButtonType="Link" CommandName="Delete" HeaderText="Delete" Text="Delete" />
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>
