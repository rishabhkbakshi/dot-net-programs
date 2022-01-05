<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table>
            <tr>
                <td>
                    <asp:GridView ID="Grid" runat="server" AutoGenerateColumns="false" DataKeyNames="Id">
                        <Columns>
                            <asp:BoundField HeaderText="Id" DataField="Id" />
                            <asp:BoundField HeaderText="Name" DataField="Name"/>
                            <asp:BoundField HeaderText="Age" DataField="Age" />
                            <asp:BoundField HeaderText="Address" DataField="Address" />
                        </Columns>
                    </asp:GridView>
                </td>
            </tr>
        </table>
        <table>
            <tr>
                <td>
                    <asp:Button ID="btn_Con" Text="Connect" runat="server" 
                        onclick="btn_Con_Click" />
                </td>
                <td>
                    <asp:Button ID="btn_discon" Text="DisConnect" runat="server" 
                        onclick="btn_discon_Click" />
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
