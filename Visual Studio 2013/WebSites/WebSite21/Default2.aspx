<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default2.aspx.cs" Inherits="Default2" %>

<%@ Register Src="WebUserControl2.ascx" TagName="WebUserControl" TagPrefix="uc1" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <uc1:WebUserControl ID="WebUserControl1" runat="server" OnSelectedIndexChange="User_SelectedIndexChanged" />
            <table>
                <tr>
                    <td>
                        <asp:GridView ID="StudentGrid" runat="server" DataKeyNames="StudentId" AutoGenerateColumns="false">
                            <Columns>
                                <asp:BoundField DataField="StudentId" HeaderText="StudentId" />
                                <asp:BoundField DataField="FirstName" HeaderText="FirstName" />
                                <asp:BoundField DataField="LastName" HeaderText="LastName" />
                                <asp:BoundField DataField="DOB" HeaderText="DOB" />
                                <asp:BoundField DataField="Email" HeaderText="Email" />
                                <asp:BoundField DataField="PhoneNo" HeaderText="PhoneNo" />
                                <asp:BoundField DataField="CourseDetail" HeaderText="CourseDetail" />
                                <asp:BoundField DataField="Branch" HeaderText="Branch" />
                                <asp:BoundField DataField="RRank" HeaderText="RRank" />
                            </Columns>
                        </asp:GridView>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
