<%@ Page Title="" Language="C#" MasterPageFile="~/My Orkut.master" AutoEventWireup="true"
    CodeFile="Profile.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table>
        <tr>
            <td>
                <asp:Label ID="lblResponse" runat="server"></asp:Label>
            </td>
            <td class="linkbtn">
                <asp:HyperLink ID="hylnkUseraccount" runat="server" Text="Your Account" NavigateUrl="~/AfterLogin.aspx"></asp:HyperLink>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblUser" runat="server"></asp:Label>
            </td>
            <td>
                <asp:Button ID="btnStatus" runat="server" Text="+1 Add As Friend" OnClick="btnStatus_Click" />
            </td>
        </tr>
    </table>
    <table>
        <tr>
            <td>
                <asp:GridView ID="UserImageGrid" runat="server" AutoGenerateColumns="False" BorderStyle="None"
                    BorderColor="Silver" BorderWidth="0">
                    <Columns>
                        <asp:TemplateField HeaderText="Profile Picture">
                            <ItemTemplate>
                                <asp:Image ID="Image1" runat="server" Width="150px" Height="150px" ImageUrl='<%# "Handler.ashx?ImageID="+Eval("Id")%>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </td>
        </tr>
    </table>
    <table>
        <tr>
            <td class="linkbtn" style="width: 90px">
                <asp:LinkButton ID="lnkbtnProfile" runat="server" OnClick="lnkbtnProfile_Click" Text="View Profile"></asp:LinkButton>
            </td>
        </tr>
    </table>
    <table>
        <tr>
            <td>
                <asp:GridView ID="UserProfileGrid" runat="server" AutoGenerateColumns="false" Visible="false">
                    <Columns>
                        <asp:BoundField DataField="Email" HeaderText="Email" />
                        <asp:BoundField DataField="PhoneNo" HeaderText="PhoneNo" />
                    </Columns>
                </asp:GridView>
            </td>
        </tr>
    </table>
</asp:Content>
