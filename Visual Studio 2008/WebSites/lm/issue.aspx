<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" Title="Untitled Page" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Data" %>

<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            String tid;
            tid = Request.QueryString["tid"];
            if (tid != null)
            {
                txtTid.Text = tid;
                txtTid.Enabled = false;
            }

            txtDi.Text = DateTime.Today.ToShortDateString();  
        } 
                
    }

    protected void btnIssue_Click(object sender, EventArgs e)
    {
        // connect to db
        SqlConnection con = new SqlConnection(DBUtil.ConnectionString);
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("IssueBook", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.Add("@tid", SqlDbType.Int).Value = Int32.Parse(txtTid.Text);
            cmd.Parameters.Add("@mid", SqlDbType.Int).Value = Int32.Parse(txtMid.Text);
            cmd.Parameters.Add("@di", SqlDbType.VarChar, 10).Value = txtDi.Text;
            cmd.Parameters.Add("@issuedby", SqlDbType.VarChar, 10).Value = (String)Session["uname"];
            cmd.ExecuteNonQuery();
            lblMsg.Text = "Issue of books is successful!";
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
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h2>
        Issue Of Title</h2>
    <table>
        <tr>
            <td style="width: 100px">
                Title ID</td>
            <td style="width: 100px">
                <asp:TextBox ID="txtTid" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td style="width: 100px">
                Member ID</td>
            <td style="width: 100px">
                <asp:TextBox ID="txtMid" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td style="width: 100px">
                Date of Isssue</td>
            <td style="width: 100px">
                <asp:TextBox ID="txtDi" runat="server"></asp:TextBox></td>
        </tr>
    </table>
    <br />
    <asp:Button ID="btnIssue" runat="server" Text="Issue Title" OnClick="btnIssue_Click" /><br />
    <br />
    <asp:Label ID="lblMsg" runat="server"></asp:Label><br />
</asp:Content>

