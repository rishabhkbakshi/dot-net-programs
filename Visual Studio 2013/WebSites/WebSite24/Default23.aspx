<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default23.aspx.cs" Inherits="Default23" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Save Images In Folder and Display Images in Gridview from folder</title>
    <style type="text/css">
        .Gridview {
            font-family: Verdana;
            font-size: 10pt;
            font-weight: normal;
            color: black;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:FileUpload ID="fileuploadimages" runat="server" />
            <br />
            <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
        </div>
        <div>
            <asp:GridView runat="server" ID="gvImages" AutoGenerateColumns="false" DataSourceID="sqldataImages" CssClass="Gridview" HeaderStyle-BackColor="#61A6F8">
                <Columns>
                    <asp:BoundField DataField="ID" HeaderText="ID" />
                    <asp:BoundField DataField="ImageName" HeaderText="Image Name" />
                    <asp:ImageField HeaderText="Image" DataImageUrlField="ImagePath" ControlStyle-Height="120" ControlStyle-Width="100" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="sqldataImages" runat="server" ConnectionString="<%$ConnectionStrings:constr %>"
                SelectCommand="select * from ImagesPath"></asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
