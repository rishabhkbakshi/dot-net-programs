<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <%--<table>
    <tr>
        <th>EmployeeName</th>
        <td>
            <asp:DropDownList ID="DropDownList1" runat="server">
            </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <th>EmployeeAddress</th>
        <td>
            <asp:DropDownList ID="DropDownList2" runat="server">
            </asp:DropDownList>
        </td>
    </tr>
    </table>--%>
    <table>
        <tr>
            <td>
                <asp:Label ID="lblFname" runat="server" Text="Fname"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtFname" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label1" runat="server" Text="Lname"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtLname" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:FileUpload ID="Fupload" runat="server" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="btn1" Text="Submit" runat="server" onclick="btn1_Click" />
            </td>
        </tr>
        <tr>
            <asp:GridView ID="Grid" runat="server" DataKeyNames="Id" AutoGenerateColumns="false">
                <Columns>
                    <asp:BoundField DataField="Id" HeaderText="Id" />
                    <asp:BoundField DataField="Fname" HeaderText="Fname" />
                    <asp:BoundField DataField="Lname" HeaderText="Lname" />
                    <asp:TemplateField HeaderText="Image">
                        <ItemTemplate>
                            <asp:Image ID="Image" runat="server" Height="50px" Width="50px" ImageUrl='<%# Eval("Image") %>'/>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </tr>
    </table>
    </div>
    </form>
</body>
</html>
