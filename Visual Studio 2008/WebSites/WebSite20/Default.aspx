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
                    <asp:Label ID="lblC" Text="Country" runat="server"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="DrpCountry" runat="server" AutoPostBack="true" 
                        onselectedindexchanged="DrpCountry_SelectedIndexChanged" ></asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblS" Text="State" runat="server"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="DrpState" runat="server" AutoPostBack="true" 
                        onselectedindexchanged="DrpState_SelectedIndexChanged" >
                        </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblD" Text="District" runat="server"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="DrpDistrict" runat="server" >
                    </asp:DropDownList>
                </td>
            </tr>
           </table>
    </div>
    </form>
</body>
</html>
