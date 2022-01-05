<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" Title="Untitled Page" %>
<%@import Namespace="System.Data" %>
<%@import Namespace="System.Data.SqlClient" %>
<script runat="server">

    protected void btnadd_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(DBUtil.ConnectionString);
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("select isnull(max(mid),0)+1 from members",con);
            int mid=(int)cmd.ExecuteScalar();
            cmd.CommandText="insert into members values(@mid,@name,@depositeamt,@dj,@email,@occupation)";
            cmd.Parameters.Add("@mid",SqlDbType.BigInt).Value = mid;
            cmd.Parameters.Add("@name",SqlDbType.VarChar,30).Value=txtname.Text;
            cmd.Parameters.Add("@depositeamt",SqlDbType.Int).Value=txtdepositamt.Text;
            cmd.Parameters.Add("@dj",SqlDbType.DateTime).Value=txtdj.Text;
            cmd.Parameters.Add("@email",SqlDbType.VarChar,40).Value=txtemail.Text;
            cmd.Parameters.Add("@occupation",SqlDbType.VarChar,30).Value=txtoccupation.Text;
            cmd.ExecuteNonQuery();
            lblmsg.Text="Member has been added successfully with ID = " +mid;
        }
        catch (Exception ex)
        {
           lblmsg.Text = "error" +ex.Message;
        }
        finally
        {
            con.Close();
        }
    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   <h2>Add New Member</h2>
    <table>
        <tr>
            <td>
                Member Name</td>
            <td>
                <asp:TextBox ID="txtname" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td>
               Deposit Amount</td>
            <td>
                <asp:TextBox ID="txtdepositamt" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td>
                Date of Joining</td>
            <td >
                <asp:TextBox ID="txtdj" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td>Email Address</td>
            <td>
                <asp:TextBox ID="txtemail" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td>
                Occupation</td>
            <td>
                <asp:TextBox ID="txtoccupation" runat="server"></asp:TextBox></td>
        </tr>
    </table>
    <asp:Button ID="btnadd" runat="server" Text="Add Member" OnClick="btnadd_Click" /><br />
    <asp:Label ID="lblmsg" runat="server"></asp:Label><br />
</asp:Content>

