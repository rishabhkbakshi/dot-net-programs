<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table>
            <tr>
                <td>
                    <asp:FileUpload ID="FUpload" runat="server" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="btnSubmit" runat="server" Text="Submit" 
                        onclick="btnSubmit_Click" />
                </td>
            </tr>
        </table>
        <table>
            <tr>
                <td>
                    <asp:GridView ID="Grid" runat="server" AutoGenerateColumns="False" 
                        DataKeyNames="Id">
                        <Columns>
                            <asp:BoundField HeaderText="Id" DataField="Id"/>
                            <asp:BoundField HeaderText="Imagename" DataField="Imagename" />
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("Image") %>' Height="100px" Width="80px"/>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
