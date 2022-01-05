<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" Title="Untitled Page" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Data" %>

<script runat="server">

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        String cond = " 1 = 1 ";

        if (txtTitle.Text.Length > 0)
            cond += "  and  title like '%" + txtTitle.Text + "%'";

        if (txtAuthor.Text.Length > 0)
            cond += "  and  authors like '%" + txtAuthor.Text + "%'";

        if (txtSubject.Text.Length > 0)
            cond += "  and  subcode like '%" + txtSubject.Text + "%'";

        if (txtFrom.Text.Length > 0)
            cond += "  and  dp >= '" + txtFrom.Text + "'";

        if (txtTo.Text.Length > 0)
            cond += "  and  dp <= '" + txtTo.Text + "'";

        if (chkAvailable.Checked)
            cond += "  and  status = 'a' ";
                 
        // get data from titles table
        SqlConnection con = new SqlConnection(DBUtil.ConnectionString);
        try
        {
            SqlDataAdapter da = new SqlDataAdapter("select tid,title,subcode,authors,publisher,price, convert(varchar(10),dp,1) dp,status  from titles where " + cond, con);
            DataSet ds = new DataSet();
            da.Fill(ds, "titles");
            GridView1.DataSource = ds.Tables[0];
            GridView1.DataBind();  
        }
        catch (Exception ex)
        {
            Response.Write(ex.Message);
        }
       
    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h2>
    Search Titles</h2>
    <table>
        <tr>
            <td>
                Title :</td>
            <td >
                <asp:TextBox ID="txtTitle" runat="server"></asp:TextBox>&nbsp; Author :
                <asp:TextBox ID="txtAuthor" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td>
                Subject :</td>
            <td >
                <asp:TextBox ID="txtSubject" runat="server" Width="84px"></asp:TextBox>
                Purchased From :
                <asp:TextBox ID="txtFrom" runat="server" Width="59px"></asp:TextBox>&nbsp; To
                <asp:TextBox ID="txtTo" runat="server" Width="59px"></asp:TextBox></td>
        </tr>
    </table>
    <asp:CheckBox ID="chkAvailable" runat="server" Checked="True" Text="Only Available Books" />
    &nbsp;
    <asp:Button ID="btnSearch" runat="server" OnClick="btnSearch_Click" Text="Search" /><br />
    <br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False">
        <Columns>
            <asp:HyperLinkField DataNavigateUrlFields="tid" DataNavigateUrlFormatString="issue.aspx?tid={0}"
                DataTextField="tid" HeaderText="TID" />
            <asp:BoundField DataField="title" HeaderText="Title" />
            <asp:BoundField DataField="subcode" HeaderText="Subject" />
            <asp:BoundField DataField="authors" HeaderText="Authors" />
            <asp:BoundField DataField="publisher" HeaderText="Publisher" />
            <asp:BoundField DataField="price" HeaderText="Price" />
            <asp:BoundField DataField="dp" HeaderText="Purchased On" />
            <asp:BoundField DataField="status" HeaderText="Status" />
        </Columns>
        <HeaderStyle BackColor="#8080FF" />
    </asp:GridView>
</asp:Content>

