<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" Title="Untitled Page" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Data" %>

<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
            txtRdate.Text = DateTime.Today.ToShortDateString(); 
    }

    protected void btnReturn_Click(object sender, EventArgs e)
    {
        // connect to db
        SqlConnection con = new SqlConnection(DBUtil.ConnectionString);
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("ReturnBook", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.Add("@tid", SqlDbType.Int).Value = Int32.Parse(txtTid.Text);
            cmd.Parameters.Add("@dr", SqlDbType.DateTime).Value = txtRdate.Text;
            cmd.Parameters.Add("@user", SqlDbType.VarChar, 10).Value = (String)Session["uname"];
             
            cmd.ExecuteNonQuery();
             
            lblMsg.Text = "Return of books is successful!";
        }
        catch (Exception ex)
        {
            lblMsg.Text = "Error :" + ex.Message;
        }
        finally
        {
            con.Close();
        }
    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Response.Redirect("bookinfo.aspx?tid=" + txtTid.Text);
        
    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h2>Return Of Book</h2>
    <table>
    <tr>
    <td>Title Id : </td>
    <td><asp:TextBox ID="txtTid" runat="server" Width="69px"></asp:TextBox>
    <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">Get Details</asp:LinkButton><br />
    </td>
    </tr>
    <tr>
    <td colspan=2>
    <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" BackColor="PowderBlue"
        DataKeyNames="title" DataSourceID="SqlDataSource1">
        <Fields>
            <asp:BoundField DataField="title" HeaderText="Title" ReadOnly="True" SortExpression="title" />
            <asp:BoundField DataField="mname" HeaderText="Member Name" SortExpression="mname" />
            <asp:BoundField DataField="di" HeaderText="Date of Issue" SortExpression="di" />
            <asp:BoundField DataField="issuedby" HeaderText="Issued By" SortExpression="issuedby" />
            <asp:BoundField DataField="fine" HeaderText="Fine Amount" ReadOnly="True" SortExpression="fine" />
        </Fields>
    </asp:DetailsView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DatabaseConnectionString %>"
        SelectCommand="select  title, mname, di, issuedby,  fine=&#13;&#10;     case  &#13;&#10;      when   datediff(dd,di,getdate()) > 15 then   datediff(dd,di,getdate()) - 15 &#13;&#10;      else 0&#13;&#10;    end&#13;&#10;from   titles t, members m, issues i&#13;&#10;where  t.tid = i.tid and i.mid = m.mid  and i.tid = @tid">
        <SelectParameters>
            <asp:ControlParameter ControlID="txtTid" Name="tid" PropertyName="Text" />
        </SelectParameters>
    </asp:SqlDataSource>
    
    </td>
    </tr>
    <tr>
    <td>
    Return Date :
    </td>
    <td>
    <asp:TextBox ID="txtRdate" runat="server" Width="81px"></asp:TextBox>
    (mm/dd/yy)<br />
    </td>
    </tr>
    </table>
    <asp:Button ID="btnReturn" runat="server" Text="Return Book" OnClick="btnReturn_Click" /><br />
    <br />
    <asp:Label ID="lblMsg" runat="server" Font-Bold="True"></asp:Label><br />
</asp:Content>

