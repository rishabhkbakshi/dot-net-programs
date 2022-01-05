<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default24.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>LIGHTBOX EXAMPLE</title>
    <style type="text/css">
        .black_overlay {
            display: none;
            position: absolute;
            top: 0%;
            left: 0%;
            width: 100%;
            height: 100%;
            background-color: black;
            z-index: 1001;
            -moz-opacity: 0.8;
            opacity: .80;
            filter: alpha(opacity=80);
        }

        .white_content {
            display: none;
            position: absolute;
            top: 25%;
            left: 35%;
            width: 35%;
            padding: 0px;
            border: 0px solid #a6c25c;
            background-color: white;
            z-index: 1002;
            overflow: auto;
        }

        .headertext {
            font-family: Arial, Helvetica, sans-serif;
            font-size: 14px;
            color: #f19a19;
            font-weight: bold;
        }

        .textfield {
            border: 1px solid #a6c25c;
            width: 135px;
        }

        .button2 {
            background-color: #a6c25c;
            color: White;
            font-size: 11px;
            font-weight: bold;
            border: 1px solid #7f9db9;
            width: 68px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">

        <a href="javascript:void(0)" onclick="document.getElementById('light').style.display='block';document.getElementById('fade').style.display='block'">Click here</a>


        <div id="light" class="white_content">
            <table cellpadding="0" cellspacing="0" border="0" style="background-color: #a6c25c;" width="100%">
                <tr>
                    <td height="16px"><a href="javascript:void(0)" onclick="document.getElementById('light').style.display='none';document.getElementById('fade').style.display='none'">
                        <img src="close.gif" style="border: 0px" width="13px" align="right" height="13px" /></a></td>
                </tr>
                <tr>
                    <td style="padding-left: 16px; padding-right: 16px; padding-bottom: 16px">
                        <table align="center" border="0" cellpadding="0" cellspacing="0" style="background-color: #fff" width="100%">
                            <tr>
                                <td align="center" colspan="2" class="headertext">Login Form </td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td align="center">
                                    <table>
                                        <tr>
                                            <td align="right">Username:</td>
                                            <td>
                                                <asp:TextBox ID="txtUser" runat="server" CssClass="textfield"></asp:TextBox>
                                                <%--<input type="text" id="txtUser"  runat="server"   class="textfield" />--%></td>
                                        </tr>
                                        <tr>
                                            <td height="10px"></td>
                                        </tr>
                                        <tr>
                                            <td align="right">Password:</td>
                                            <td>
                                                <asp:TextBox ID="txtPwd" runat="server" CssClass="textfield"></asp:TextBox><%--<input type="password"  id="txtPwd"   runat="server" name="user" class="textfield"/>--%></td>
                                        </tr>
                                        <tr>
                                            <td height="10px"></td>
                                        </tr>
                                        <tr>
                                            <td></td>
                                            <td>
                                                <asp:Button ID="Button1" runat="server" Text="Sign In" class="button2" />
                                                <asp:Button ID="Button2" runat="server" Text="Sign Up" class="button2" /></td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td height="10px"></td>
                            </tr>
                        </table>
                    </td>
                </tr>

            </table>

            <div align="center" class=" headertext">
                <asp:Label ID="txtlbl" runat="server"></asp:Label>
            </div>

        </div>
        <div id="fade" class="black_overlay"></div>
    </form>
</body>
</html>
