<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <p>
            <u><b>
                <%=DateTime.Now.ToLongTimeString()%>
            </b></u>
        </p>
        <table>
            <tr>
                <td>
                    <asp:GridView ID="Grid" runat="server" AutoGenerateColumns="false" OnPageIndexChanging="Grid_PageIndexChanging"
                        AllowPaging="true">
                        <PagerSettings Mode="NumericFirstLast" PageButtonCount="4" FirstPageText="First"
                            LastPageText="Last" />
                        <Columns>
                            <asp:ButtonField HeaderText="Id" DataTextField="Id" />
                            <asp:ButtonField HeaderText="name" DataTextField="name" />
                            <asp:ButtonField HeaderText="Designation" DataTextField="Designation" />
                        </Columns>
                    </asp:GridView>
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
