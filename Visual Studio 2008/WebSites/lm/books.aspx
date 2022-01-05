<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h2>
        Subject-wise Books</h2>
    <p>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="subcode"
            DataSourceID="SqlDataSource1">
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="subcode" HeaderText="subcode" ReadOnly="True" SortExpression="subcode" />
                <asp:BoundField DataField="subname" HeaderText="subname" SortExpression="subname" />
                <asp:BoundField DataField="di" HeaderText="di" SortExpression="di" />
            </Columns>
        </asp:GridView>
        &nbsp;</p>
    <p>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DatabaseConnectionString %>"
            SelectCommand="SELECT * FROM [subjects]"></asp:SqlDataSource>
        &nbsp;</p>
    <p>
        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="title" Width="100%"
            DataSourceID="SqlDataSource2">
            <Columns>
                <asp:BoundField DataField="tid" HeaderText="tid" SortExpression="tid" />
                <asp:BoundField DataField="title" HeaderText="title" ReadOnly="True" SortExpression="title" />
                <asp:BoundField DataField="authors" HeaderText="authors" SortExpression="authors" />
                <asp:BoundField DataField="publisher" HeaderText="publisher" SortExpression="publisher" />
                <asp:BoundField DataField="price" HeaderText="price" SortExpression="price" />
                <asp:BoundField DataField="dp" HeaderText="dp" ReadOnly="True" SortExpression="dp" />
                <asp:BoundField DataField="status" HeaderText="status" SortExpression="status" />
            </Columns>
        </asp:GridView>
        &nbsp;</p>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DatabaseConnectionString %>"
        SelectCommand="SELECT  tid,title, authors,publisher, price, convert(varchar(10),dp,3) dp, status&#13;&#10; FROM [titles] WHERE ([subcode] = @subcode)">
        <SelectParameters>
            <asp:ControlParameter ControlID="GridView1" Name="subcode" PropertyName="SelectedValue"
                Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
</asp:Content>

