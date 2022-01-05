<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default6.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
<style type="text/css">
    .rounded_corners
    {
        border: 1px solid #A1DCF2;
        -webkit-border-radius: 8px;
        -moz-border-radius: 8px;
        border-radius: 8px;
        overflow: hidden;
    }
    .rounded_corners td, .rounded_corners th
    {
        border: 1px solid #A1DCF2;
        font-family: Arial;
        font-size: 10pt;
        text-align: center;
    }
    .rounded_corners table table td
    {
        border-style: none;
    }
</style>
</head>
<body>
    <form id="form1" runat="server">
    <div class="rounded_corners" style="width: 300px">
        <asp:GridView ID="GridView1" runat="server" Width="300" HeaderStyle-BackColor="#3AC0F2"
            HeaderStyle-ForeColor="White" RowStyle-BackColor="#A1DCF2" AlternatingRowStyle-BackColor="White"
            RowStyle-ForeColor="#3A3A3A" AutoGenerateColumns="false" PageSize="10">
            <Columns>
                <asp:BoundField DataField="Name" HeaderText="Name" />
                <asp:BoundField DataField="City" HeaderText="City" />
                <asp:BoundField DataField="Country" HeaderText="Country" />
            </Columns>
        </asp:GridView>
    </div>
    <hr />
    <div class="rounded_corners" style="width: 300px">
        <asp:GridView ID="GridView2" runat="server" Width="300" HeaderStyle-BackColor="#3AC0F2"
            HeaderStyle-ForeColor="White" RowStyle-BackColor="#A1DCF2" AlternatingRowStyle-BackColor="White"
            RowStyle-ForeColor="#3A3A3A" AutoGenerateColumns="false" AllowPaging="true" PageSize="10"
            OnPageIndexChanging="OnPageIndexChanging">
            <Columns>
                <asp:BoundField DataField="Name" HeaderText="Name"   />
                <asp:BoundField DataField="City" HeaderText="City" />
                <asp:BoundField DataField="Country" HeaderText="Country" />
            </Columns>
        </asp:GridView>
    </div>
    </form>
</body>
</html>
