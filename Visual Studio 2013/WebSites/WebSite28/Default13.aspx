<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default13.aspx.cs" Inherits="Default13" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script language="javascript" type="text/javascript">
        function validate() {
            var summary = "";
            summary += isvaliduser();
            summary += isvalidFirstname();
            summary += isvalidLocation();
            if (summary != "") {
                alert(summary);
                return false;
            }
            else {
                return true;
            }
        }
        function isvaliduser() {
            var uid;
            var temp = document.getElementById("<%=txtuser.ClientID %>");
            uid = temp.value;
            if (uid == "") {
                return ("Please Enter UserName" + "\n");
            }
            else {
                return "";
            }
        }
        function isvalidFirstname() {
            var uid;
            var temp = document.getElementById("<%=txtfname.ClientID %>");
            uid = temp.value;
            if (uid == "") {
                return ("Please enter firstname" + "\n");
            }
            else {
                return "";
            }
        }
        function isvalidLocation() {
            var uid;
            var temp = document.getElementById("<%=txtlocation.ClientID %>");
            uid = temp.value;
            if (uid == "") {
                return ("Please enter Location" + "\n");
            }
            else {
                return "";
            }
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Button ID="btnSubmit" runat="server" Text="SwitchServer" OnClick="btnSubmit_Click" />
            <asp:Button ID="btnResponse" runat="server" Text="SwitchResponse" OnClick="btnResponse_Click" />
            <asp:Button ID="btnRedirect" runat="server" Text="RedirectPermanently" OnClick="btnRedirect_Click" />
        </div>
        <div>
            <table>
                <tr>
                    <td>
                        <asp:DropDownList ID="ddl" runat="server" ValidationGroup="chu">
                            <asp:ListItem Value="0" Text="--Select--"></asp:ListItem>
                            <asp:ListItem Value="1" Text="IT"></asp:ListItem>
                            <asp:ListItem Value="2" Text="CS"></asp:ListItem>
                            <asp:ListItem Value="3" Text="EE"></asp:ListItem>
                            <asp:ListItem Value="4" Text="EC"></asp:ListItem>
                            <asp:ListItem Value="5" Text="ME"></asp:ListItem>
                            <asp:ListItem Value="6" Text="CE"></asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfv" runat="server" ControlToValidate="ddl" ErrorMessage="*" ValidationGroup="chu" InitialValue="0"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Button ID="btn" Text="Validate" runat="server" ValidationGroup="chu" />
                    </td>
                </tr>
            </table>
        </div>
        <div>
            <table>
                <tr>
                    <td>UserName</td>
                    <td>
                        <asp:TextBox ID="txtuser" runat="server" /></td>
                </tr>
                <tr>
                    <td>First Name</td>
                    <td>
                        <asp:TextBox ID="txtfname" runat="server" /></td>
                </tr>
                <tr>
                    <td>Location</td>
                    <td>
                        <asp:TextBox ID="txtlocation" runat="server" /></td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <asp:Button ID="Button1" runat="server" Text="Save"
                            OnClientClick="javascript:validate()" />
                    </td>
                </tr>
            </table>
        </div>
        <div>
            <table>
                <tr>
                    <td>
                        <asp:Button ID="btnRead" runat="server" Text="Get Text File Text" OnClick="btnRead_Click" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblShow" runat="server"></asp:Label> 
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
