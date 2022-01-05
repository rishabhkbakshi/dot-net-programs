<%@ Page Language="VB" %>
<%@ Import Namespace="System.xml" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server">
    Dim i, max As Integer
    Dim a(5) As Integer
    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim xmlreader As New XmlTextReader(Request.MapPath("books.xml"))
        Do While xmlreader.Read()
            If xmlreader.NodeType = XmlNodeType.Element And xmlreader.Name = "price" Then
                
                Response.Write(xmlreader.ReadElementContentAsString)
                
            End If
            'max = 0
            'If xmlreader.NodeType = XmlNodeType.Element And xmlreader.Name = "price" Then
               
            '    For i = 0 To 2
            '        a(i) = xmlreader.ReadElementContentAsString()
            '    Next
                    
            'End If
            'For Each i In a
            '    If (i > max) Then
            '        max = i
            '    End If
            'Next
            'Response.Write(max & "<br>")
                
        
        Loop
        
        
    End Sub
</script>

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Button" /></div>
    </form>
</body>
</html>
