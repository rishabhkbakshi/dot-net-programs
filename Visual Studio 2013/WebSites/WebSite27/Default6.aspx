<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default6.aspx.cs" Inherits="_Default" EnableEventValidation="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Export Selected records from Gridview to Excel/ Word</title>
    <style type="text/css">
        .GridviewDiv {
            font-size: 100%;
            font-family: 'Lucida Grande', 'Lucida Sans Unicode', Verdana, Arial, Helevetica, sans-serif;
            color: #303933;
        }

        Table.Gridview {
            border: solid 1px #df5015;
        }

        .Gridview th {
            color: #FFFFFF;
            border-right-color: #abb079;
            border-bottom-color: #abb079;
            padding: 0.5em 0.5em 0.5em 0.5em;
            text-align: center;
        }

        .Gridview td {
            border-bottom-color: #f0f2da;
            border-right-color: #f0f2da;
            padding: 0.5em 0.5em 0.5em 0.5em;
        }

        .Gridview tr {
            color: Black;
            background-color: White;
            text-align: left;
        }

        :link, :visited {
            color: #DF4F13;
            text-decoration: none;
        }

        .highlight {
            text-decoration: none;
            color: black;
            background: yellow;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table>
                <tr>
                    <td align="right">
                        <asp:ImageButton ID="btnExcel" runat="server" ImageUrl="~/ExcelImage.jpg"
                            OnClick="btnExportExcel_Click" />
                        <asp:ImageButton ID="btnWord" runat="server" ImageUrl="~/WordImage.jpg"
                            OnClick="btnWord_Click" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <div class="GridviewDiv">
                            <asp:GridView ID="gvdetails" runat="server" AutoGenerateColumns="False" AllowPaging="True"
                                AllowSorting="true" Width="540px" PageSize="10" CssClass="Gridview" DataKeyNames="UserId" OnPageIndexChanging="gvdetails_PageIndexChanging">
                                <HeaderStyle BackColor="#df5015" />
                                <Columns>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:CheckBox ID="chkSelect" runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="UserId" HeaderText="UserId" />
                                    <asp:BoundField DataField="UserName" HeaderText="UserName" />
                                    <asp:BoundField DataField="LastName" HeaderText="LastName" />
                                    <asp:BoundField DataField="Location" HeaderText="Location" />
                                </Columns>
                            </asp:GridView>
                        </div>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
