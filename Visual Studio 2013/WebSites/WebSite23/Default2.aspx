<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default2.aspx.cs" Inherits="Default2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:GridView ID="grdView" runat="server" AutoGenerateColumns="false" DataKeyNames="EvaluatorId" OnRowUpdating="grdView_RowUpdating">
                <Columns>
                    <asp:BoundField DataField="EvaluatorId" HeaderText="EvaluatorId" />
                    <asp:BoundField DataField="EvaluatorName" HeaderText="EvaluatorName" />
                    <asp:TemplateField HeaderText="Update">
                        <ItemTemplate>
                            <asp:LinkButton ID="lnkEva" runat="server" Text='Update' CommandName="Update"></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <asp:CheckBoxList ID="chklst" runat="server" Visible="false" RepeatColumns="4" RepeatLayout="Table" RepeatDirection="Vertical"></asp:CheckBoxList>
            <asp:GridView ID="grdvew2" runat="server" AutoGenerateColumns="true">
            </asp:GridView>
            <asp:Button ID="btn" runat="server" Text="Submit" OnClick="btn_Click" />
        </div>
    </form>
</body>
</html>
