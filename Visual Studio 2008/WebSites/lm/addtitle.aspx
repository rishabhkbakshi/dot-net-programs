<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" Title="Untitled Page" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Data" %>
<script runat="server">

    protected void btnAdd_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(DBUtil.ConnectionString);
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand(" select isnull(max(tid),0) + 1 from titles", con);
            int tid = (int) cmd.ExecuteScalar();

            cmd.CommandText = "insert into titles values(@tid,@title,@subcode,@authors,@price,@dp,@publisher,'a')";
            cmd.Parameters.Add("@tid", SqlDbType.BigInt).Value = tid;
            cmd.Parameters.Add("@title", SqlDbType.VarChar, 30).Value = txtTitle.Text;
            cmd.Parameters.Add("@subcode", SqlDbType.VarChar, 10).Value = ddlSubject.SelectedValue;
            cmd.Parameters.Add("@authors", SqlDbType.VarChar, 50).Value = txtAuthors.Text;
            cmd.Parameters.Add("@publisher", SqlDbType.VarChar, 50).Value = txtPublisher.Text;
            cmd.Parameters.Add("@price", SqlDbType.Int).Value = Int32.Parse(txtPrice.Text);
            cmd.Parameters.Add("@dp", SqlDbType.DateTime).Value = txtDp.Text;
            cmd.ExecuteNonQuery();  
            lblMsg.Text = "New title added successfully!  Id = " + tid;
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
        Add Title</h2>
    <p>
        <table>
            <tr>
                <td >
                    Title</td>
                <td >
                    <asp:TextBox ID="txtTitle" runat="server" Width="201px"></asp:TextBox></td>
            </tr>
            <tr>
                <td >
                    Authors</td>
                <td >
                    <asp:TextBox ID="txtAuthors" runat="server" Width="198px"></asp:TextBox></td>
            </tr>
            <tr>
                <td >
                    Publisher</td>
                <td >
                    <asp:TextBox ID="txtPublisher" runat="server" Width="196px"></asp:TextBox></td>
            </tr>
            <tr>
                <td >
                    Subject</td>
                <td >
                    <asp:DropDownList ID="ddlSubject" runat="server" DataSourceID="SqlDataSource1" DataTextField="subname"
                        DataValueField="subcode" Width="149px">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DatabaseConnectionString %>"
                        SelectCommand="SELECT [subcode], [subname] FROM [subjects]"></asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td >
                    Date Of Purchase</td>
                <td >
                    <asp:TextBox ID="txtDp" runat="server" Width="91px"></asp:TextBox>
                    (mm/dd/yy)</td>
            </tr>
            <tr>
                <td >
                    Price</td>
                <td >
                    <asp:TextBox ID="txtPrice" runat="server" Width="88px"></asp:TextBox></td>
            </tr>
        </table>
    </p>
    <p>
        <asp:Button ID="btnAdd" runat="server" Text="Add Title" OnClick="btnAdd_Click" />&nbsp;</p>
    <p>
        <asp:Label ID="lblMsg" runat="server" Font-Bold="True"></asp:Label>&nbsp;</p>
    <p>
        &nbsp;</p>
</asp:Content>

