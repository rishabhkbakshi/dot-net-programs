<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default3.aspx.cs" Inherits="Default3" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <script language="javascript" type="text/javascript">
        function changeColor(source, args) {
            var txtuser = document.getElementById('txtUsername');
            var txtpwd = document.getElementById('txtPwd');
            var txtfname = document.getElementById('txtfname');
            var txtlname = document.getElementById('txtlname');
            if (args.Value == "") {
                args.IsValid = false;
                document.getElementById(source.id.replace('cv', 'txt')).style.background = 'orange';
            }
            else {
                args.IsValid = true;
                document.getElementById(source.id.replace('cv', 'txt')).style.background = 'white';
            }
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table>
            <tr>
                <td colspan="2">
                    <b>Change Background of Textbox</b>
                </td>
            </tr>
            <tr>
                <td>
                    UserName:
                </td>
                <td>
                    <asp:TextBox ID="txtUsername" runat="server"></asp:TextBox>
                    <asp:CustomValidator ID="cvUsername" runat="server" ValidateEmptyText="true" ControlToValidate="txtUsername"
                        ClientValidationFunction="changeColor" ErrorMessage="Please enter UserName"> 

                    </asp:CustomValidator>
                </td>
            </tr>
            <tr>
                <td>
                    Password:
                </td>
                <td>
                    <asp:TextBox ID="txtPwd" runat="server"></asp:TextBox>
                    <asp:CustomValidator ID="cvPwd" runat="server" ValidateEmptyText="true" ControlToValidate="txtPwd"
                        ClientValidationFunction="changeColor" ErrorMessage="Please enter Password"> 

                    </asp:CustomValidator>
                </td>
            </tr>
            <tr>
                <td>
                    FirstName:
                </td>
                <td>
                    <asp:TextBox ID="txtfname" runat="server"></asp:TextBox>
                    <asp:CustomValidator ID="cvfname" runat="server" ValidateEmptyText="true" ControlToValidate="txtfname"
                        ClientValidationFunction="changeColor" ErrorMessage="Please enter FirstName"> 

                    </asp:CustomValidator>
                </td>
            </tr>
            <tr>
                <td>
                    LastName:
                </td>
                <td>
                    <asp:TextBox ID="txtlname" runat="server"></asp:TextBox>
                    <asp:CustomValidator ID="cvlname" runat="server" ValidateEmptyText="true" ControlToValidate="txtlname"
                        ClientValidationFunction="changeColor" ErrorMessage="Please enter LastName"> 

                    </asp:CustomValidator>
                </td>
                <tr>
                    <td>
                    </td>
                    <td>
                        <asp:Button ID="Button1" runat="server" Text="Submit" OnClick="Button1_Click" />
                    </td>
                </tr>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
