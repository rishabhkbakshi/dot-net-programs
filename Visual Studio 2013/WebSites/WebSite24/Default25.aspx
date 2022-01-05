<%--<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default25.aspx.cs" Inherits="Default25" %>--%>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>jQuery Cascading Dropdown Example</title>
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.8.2.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table>
                <tr>
                    <td>State</td>
                    <td>
                        <asp:DropDownList ID="ddlstate" runat="server"></asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>District</td>
                    <td>
                        <asp:DropDownList ID="ddldistrict" runat="server"></asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>Villege</td>
                    <td>
                        <asp:DropDownList ID="ddlvillege" runat="server"></asp:DropDownList>
                    </td>
                </tr>
            </table>
        </div>
    </form>
    <script type="text/javascript">
        $(function () {
            $('#<%=ddldistrict.ClientID %>').attr('disabled', 'disabled');
            $('#<%=ddlvillege.ClientID %>').attr('disabled', 'disabled');
            $('#<%=ddldistrict.ClientID %>').append('<option selected="selected" value="0">Select District</option>');
            $('#<%=ddlvillege.ClientID %>').empty().append('<option selected="selected" value="0">Select Villege</option>');
            $('#<%=ddlstate.ClientID %>').change(function () {
                var state = $('#<%=ddlstate.ClientID%>').val()
                $('#<%=ddldistrict.ClientID %>').removeAttr("disabled");
                $('#<%=ddlvillege.ClientID %>').empty().append('<option selected="selected" value="0">Select Villege</option>');
                $('#<%=ddlvillege.ClientID %>').attr('disabled', 'disabled');
                $.ajax({
                    type: "POST",
                    url: "Default25.aspx/BindDistrict",
                    data: "{'state':'" + state + "'}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (msg) {
                        var j = jQuery.parseJSON(msg.d);
                        var options;
                        for (var i = 0; i < j.length; i++) {
                            options += '<option value="' + j[i].optionValue + '">' + j[i].optionDisplay + '</option>'
                        }
                        $('#<%=ddldistrict.ClientID %>').html(options)
                },
                error: function (data) {
                    alert('Something Went Wrong')
                }
            });
            });
            $('#<%=ddldistrict.ClientID %>').change(function () {
                var district = $('#<%=ddldistrict.ClientID%>').val()
                $('#<%=ddlvillege.ClientID %>').removeAttr("disabled");
                $.ajax({
                    type: "POST",
                    url: "Default25.aspx/BindVillege",
                    data: "{'district':'" + district + "'}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (msg) {
                        var j = jQuery.parseJSON(msg.d);
                        var options;
                        for (var i = 0; i < j.length; i++) {
                            options += '<option value="' + j[i].optionValue + '">' + j[i].optionDisplay + '</option>'
                        }
                        $('#<%=ddlvillege.ClientID %>').html(options)
                },
                error: function (data) {
                    alert('Something Went Wrong')
                }
            });
            })
        })
    </script>
</body>
</html>
