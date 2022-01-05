<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h2>
        Member Information</h2>
    <br />
    <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataKeyNames="mid"
        DataSourceID="SqlDataSource1">
        <Fields>
            <asp:BoundField DataField="mid" HeaderText="Member ID" ReadOnly="True" SortExpression="mid" />
            <asp:BoundField DataField="mname" HeaderText="Member Name" SortExpression="mname" />
            <asp:BoundField DataField="depositamt" HeaderText="Deposit Amt" SortExpression="depositamt" />
            <asp:BoundField DataField="djoin" HeaderText="Date Of Joining" SortExpression="djoin" />
            <asp:BoundField DataField="email" HeaderText="Email" SortExpression="email" />
            <asp:BoundField DataField="occupation" HeaderText="Occupation" SortExpression="occupation" />
        </Fields>
    </asp:DetailsView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DatabaseConnectionString %>"
        SelectCommand="SELECT * FROM [members] WHERE ([mid] = @mid)">
        <SelectParameters>
            <asp:QueryStringParameter Name="mid" QueryStringField="mid" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
    <h3>
        Current Issues</h3>
    <br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="title"
        DataSourceID="SqlDataSource2">
        <Columns>
            <asp:BoundField DataField="title" HeaderText="Title" ReadOnly="True" SortExpression="title" />
            <asp:BoundField DataField="di" HeaderText="Issued On" SortExpression="di" />
            <asp:BoundField DataField="issuedby" HeaderText="Issued By" SortExpression="issuedby" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DatabaseConnectionString %>"
        SelectCommand="select  title, di, issuedby&#13;&#10;from  titles t, issues i&#13;&#10;where   t.tid = i.tid and  mid = @mid">
        <SelectParameters>
            <asp:QueryStringParameter Name="mid" QueryStringField="mid" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
    <br />
    <h3>
        Old Issues<br />
    </h3>
    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource3">
        <Columns>
            <asp:BoundField DataField="title" HeaderText="Title" SortExpression="title" />
            <asp:BoundField DataField="di" HeaderText="Issued On" SortExpression="di" />
            <asp:BoundField DataField="issuedby" HeaderText="Issued By" SortExpression="issuedby" />
            <asp:BoundField DataField="dr" HeaderText="Returned On" SortExpression="dr" />
            <asp:BoundField DataField="returnedto" HeaderText="Returned To" SortExpression="returnedto" />
            <asp:BoundField DataField="fineamt" HeaderText="Fine Amt" SortExpression="fineamt" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:DatabaseConnectionString %>"
        SelectCommand="select title, di, issuedby,  dr, returnedto,fineamt&#13;&#10;from  returns  r, titles t&#13;&#10;where r.tid = t.tid and  mid = @mid">
        <SelectParameters>
            <asp:QueryStringParameter Name="mid" QueryStringField="mid" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
</asp:Content>

