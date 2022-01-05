<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" Title="Untitled Page" %>

<script runat="server">

    protected void lbDetails_Click(object sender, EventArgs e)
    {
        Response.Redirect("memberinfo.aspx?mid=" + txtMid.Text);
        
    }

    protected void btnDelete_Click(object sender, EventArgs e)
    {

    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h2>
        Delete Member</h2>
    <p>
        Enter member id :
        <asp:TextBox ID="txtMid" runat="server" Width="72px"></asp:TextBox>
        <asp:LinkButton ID="lbDetails" runat="server" OnClick="lbDetails_Click">Get Details</asp:LinkButton></p>
    <p>
        <asp:Button ID="btnDelete" runat="server" Text="Delete Member" OnClick="btnDelete_Click" />&nbsp;</p>
</asp:Content>

