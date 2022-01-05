<%@ Page Title="" Language="C#" MasterPageFile="~/Login.master" AutoEventWireup="true" CodeFile="AfterLogin.aspx.cs" Inherits="AfterLogin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <table> 
            <tr>
                <td>
                    <asp:Label ID="lblWel" runat="server"></asp:Label>
                </td>
            </tr>
        </table>
        <table>
            <tr>
                <td>
                    <asp:Button ID="btnLo" runat="server" Text="LogOut" onclick="btnLo_Click" />
                </td>
            </tr>
        </table>
</asp:Content>

