<%@ Control Language="C#" AutoEventWireup="true" CodeFile="WebUserControl.ascx.cs" Inherits="WebUserControl" %>

<table>
    <tr>
        <td>
            <asp:GridView ID="StudentGrid" runat="server" DataKeyNames="StudentId" AutoGenerateColumns="false" >
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