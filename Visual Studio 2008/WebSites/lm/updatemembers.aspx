<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h2>
        Update Members</h2>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="mid"
        DataSourceID="SqlDataSource1">
        <Columns>
            <asp:CommandField ShowEditButton="True" />
            <asp:BoundField DataField="mid" HeaderText="mid" ReadOnly="True" SortExpression="mid" />
            <asp:BoundField DataField="mname" HeaderText="mname" ReadOnly="True" SortExpression="mname" />
            <asp:BoundField DataField="djoin" HeaderText="djoin" ReadOnly="True" SortExpression="djoin" />
            <asp:BoundField DataField="depositamt" HeaderText="depositamt" SortExpression="depositamt" />
            <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
            <asp:BoundField DataField="occupation" HeaderText="occupation" SortExpression="occupation" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DatabaseConnectionString %>"
        DeleteCommand="DELETE FROM [members] WHERE [mid] = @mid" InsertCommand="INSERT INTO [members] ([mid], [mname], [depositamt], [djoin], [email], [occupation]) VALUES (@mid, @mname, @depositamt, @djoin, @email, @occupation)"
        SelectCommand="SELECT * FROM [members]" UpdateCommand="UPDATE [members] SET [depositamt] = @depositamt, [email] = @email, [occupation] = @occupation WHERE [mid] = @mid">
        <DeleteParameters>
            <asp:Parameter Name="mid" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="mname" Type="String" />
            <asp:Parameter Name="depositamt" Type="Int32" />
            <asp:Parameter Name="djoin" Type="DateTime" />
            <asp:Parameter Name="email" Type="String" />
            <asp:Parameter Name="occupation" Type="String" />
            <asp:Parameter Name="mid" Type="Int32" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="mid" Type="Int32" />
            <asp:Parameter Name="mname" Type="String" />
            <asp:Parameter Name="depositamt" Type="Int32" />
            <asp:Parameter Name="djoin" Type="DateTime" />
            <asp:Parameter Name="email" Type="String" />
            <asp:Parameter Name="occupation" Type="String" />
        </InsertParameters>
    </asp:SqlDataSource>
</asp:Content>

