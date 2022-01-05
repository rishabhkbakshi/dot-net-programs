<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h3>
        Recent Issues</h3>
    <p>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" Width="100%">
            <Columns>
                <asp:HyperLinkField DataNavigateUrlFields="tid" DataNavigateUrlFormatString="titleinfo.aspx?tid={0}"
                    DataTextField="title" HeaderText="Title" />
                <asp:HyperLinkField DataNavigateUrlFields="mid" DataNavigateUrlFormatString="memberinfo.aspx?mid={0}"
                    DataTextField="mname" HeaderText="Member" />
                <asp:BoundField DataField="di" HeaderText="Issued On" SortExpression="di" />
                <asp:BoundField DataField="fullname" HeaderText="Issued By" SortExpression="fullname" />
            </Columns>
        </asp:GridView>
        &nbsp;</p>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DatabaseConnectionString %>"
        SelectCommand="select top 10 i.tid, i.mid,title, mname, convert(varchar(10),di,1)  di, fullname&#13;&#10;from users u, issues i, titles t, members m&#13;&#10;where u.uname = i.issuedby  and  i.tid = t.tid and i.mid = m.mid&#13;&#10;order by  di  desc">
    </asp:SqlDataSource>
</asp:Content>

