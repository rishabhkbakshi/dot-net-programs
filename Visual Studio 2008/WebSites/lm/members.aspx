<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h2>
        Members List</h2>
    <p>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True"
            AutoGenerateColumns="False" DataKeyNames="mid" DataSourceID="SqlDataSource1"  Width="100%" CellPadding="3"
            PageSize="5">
            <Columns>
                <asp:BoundField DataField="mid" HeaderText="mid" ReadOnly="True" SortExpression="mid" />
                <asp:BoundField DataField="mname" HeaderText="mname" SortExpression="mname" />
                <asp:BoundField DataField="depositamt" HeaderText="depositamt" SortExpression="depositamt" />
                <asp:BoundField DataField="djoin" HeaderText="djoin" SortExpression="djoin" />
                <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
                <asp:BoundField DataField="occupation" HeaderText="occupation" SortExpression="occupation" />
            </Columns>
            <HeaderStyle BackColor="#C0C0FF" />
        </asp:GridView>
        &nbsp;</p>
    <p>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DatabaseConnectionString %>"
            SelectCommand="SELECT * FROM [members]"></asp:SqlDataSource>
        &nbsp;</p>
</asp:Content>

