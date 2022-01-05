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
            cmd.Parameters.Add("@mid",SqlDbType.Int).Value = mid;
            cmd.Parameters.Add("@name",SqlDbType.VarChar,30).Value=txtname.Text;
            cmd.Parameters.Add("@depositeamt",SqlDbType.Int).Value=txtdepositamt.Text;
            cmd.Parameters.Add("@dj",SqlDbType.VarChar,10).Value=txtdj.Text;
            cmd.Parameters.Add("@email",SqlDbType.VarChar,40).Value=txtemail.Text;
            cmd.Parameters.Add("@occupation",SqlDbType.VarChar,40).Value=txtoccupation.Text;
            cmd.ExecuteNonQuery();
          lblmsg.Text="add members successfully id=" +mid;
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
    <table>
        <tr>
            <td style="width: 100px">
                <span style="font-size: 10pt">mname</span></td>
            <td style="width: 100px">
                <asp:TextBox ID="txtname" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td style="width: 100px">
                <span style="font-size: 10pt">depositamt</span></td>
            <td style="width: 100px">
                <asp:TextBox ID="txtdepositamt" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td style="width: 100px">
                <span style="font-size: 10pt">dj</span></td>
            <td style="width: 100px">
                <asp:TextBox ID="txtdj" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td style="width: 100px">
                <span style="font-size: 10pt">email</span></td>
            <td style="width: 100px">
                <asp:TextBox ID="txtemail" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td style="width: 100px; height: 20px">
                <span style="font-size: 10pt">occupation</span></td>
            <td style="width: 100px; height: 20px">
                <asp:TextBox ID="txtoccupation" runat="server"></asp:TextBox></td>
        </tr>
    </table>
    <asp:Button ID="btnadd" runat="server" Text="add" OnClick="btnadd_Click" /><br />
    <asp:Label ID="lblmsg" runat="server"></asp:Label><br />
</asp:Content>

