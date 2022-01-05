<%@ Page Title="" Language="C#" MasterPageFile="~/My Orkut.master" AutoEventWireup="true"
    CodeFile="AfterLogin.aspx.cs" Inherits="_Default" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ScriptManager ID="Script" runat="server">
    </asp:ScriptManager>
    <table>
        <tr>
            <td>
                <asp:Label ID="lblUseraccount" runat="server" Text="Your Orkut Account" Font-Size="X-Large"
                    Font-Underline="true"></asp:Label>
            </td>
        </tr>
    </table>
    <table>
        <tr>
            <td>
                <asp:Label ID="lblWelcome" runat="server" Font-Size="Large"></asp:Label>
            </td>
            <td class="linkbtn" >
                <asp:LinkButton ID="lnkSignOut" runat="server" Text="Sign Out" OnClick="lnkSignOut_Click"></asp:LinkButton>
            </td>
        </tr>
    </table>
    <table>
        <tr>
            <td>
                <asp:Label ID="lblSearch" runat="server" Text="Find Friend"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtSearch" runat="server" Width="150px"></asp:TextBox>
                <cc1:AutoCompleteExtender ID="autoComplete" runat="server" TargetControlID="txtSearch"
                    MinimumPrefixLength="1" EnableCaching="true" CompletionSetCount="10" ServiceMethod="SearchFriend">
                </cc1:AutoCompleteExtender>
            </td>
            <td>
                <asp:ImageButton ID="btnSearch" runat="server" ImageUrl="~/search-icon.jpg" Width="20px"
                    Height="20px" OnClick="btnSearch_Click" />
            </td>
        </tr>
    </table>
    <table>
        <tr>
            <td>
                <asp:GridView ID="ProfileGrid" runat="server" AutoGenerateColumns="False" BorderStyle="None"
                    BorderColor="Silver" BorderWidth="0">
                    <Columns>
                        <asp:TemplateField HeaderText="Profile Picture">
                            <ItemTemplate>
                                <asp:Image runat="server" Width="150px" Height="150px" ImageUrl='<%# "Handler.ashx?ImageID="+Eval("Id")%>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </td>
        </tr>
    </table>
    <table>
        <tr>
            <td class="linkbtn">
                <asp:LinkButton ID="lnkInbox" runat="server" Text="Inbox" OnClick="lnkInbox_Click"></asp:LinkButton>
            </td>
            <td class="linkbtn">
                <asp:LinkButton ID="lnkCompose" runat="server" Text="ComposeMail" OnClick="lnkCompose_Click"></asp:LinkButton>
            </td>
        </tr>
    </table>
    <table>
        <tr>
            <td>
                <asp:GridView ID="MailGrid" runat="server" AutoGenerateColumns="false" Visible="false">
                    <Columns>
                        <asp:BoundField DataField="Id" HeaderText="Id" />
                        <asp:BoundField DataField="FromMail" HeaderText="MailFrom" />
                        <asp:BoundField DataField="Subject" HeaderText="Subject" />
                        <asp:BoundField DataField="Message" HeaderText="Message" />
                        <asp:TemplateField>
                            <HeaderTemplate>
                                <asp:CheckBox ID="chkMarkAll" runat="server" Text="Delete All" OnCheckedChanged="AllDeleteItem"
                                    AutoPostBack="true" />
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:CheckBox ID="chkMark" runat="server" Text="Delete" OnCheckedChanged="DeleteItem"
                                    AutoPostBack="true" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="btnDelete" runat="server" Text="Delete" OnClick="btnDelete_Click" />
            </td>
        </tr>
    </table>
</asp:Content>
