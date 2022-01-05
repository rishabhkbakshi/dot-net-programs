<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script type="text/javascript" language="javascript">
        function Validation() {
            var txtEmployeeName = document.getElementById('<%=txtEmployeeName.ClientID %>').value;
            var txtEmployeeEmail = document.getElementById('<%=txtEmployeeEmail.ClientID %>').value;
            var txtServiceTax = document.getElementById('<%=txtServiceTax.ClientID %>').value;
            var txtParkingCharge = document.getElementById('<%=txtParkingCharge.ClientID %>').value;
            var txtTollTax = document.getElementById('<%=txtTollTax.ClientID %>').value;

            if (txtEmployeeName == "") {
                alert("Enter EmployeeName")
                return false;
            }
            if (txtEmployeeEmail == "") {
                alert("Enter EmployeeEmail")
                return false;
            }
            var RegExp = /^\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}$/;
            var EmailMatch = txtEmployeeEmail.match(RegExp);
            if (EmailMatch == null) {
                alert("Email Address Not in Correct Format");
                return false;
            }
            if (txtServiceTax == "") {
                alert("Enter ServiceTax")
                return false;
            }
            if (txtParkingCharge == "") {
                alert("Enter ParkingCharge")
                return false;
            }
            if (txtTollTax == "") {
                alert("Enter TollTax")
                return false;
            }
            return true;
        }

        function Numeric(key) {
            var charCode = (key.which) ? key.which : event.keyCode
            if (charCode > 31 && (charCode < 48 || charCode > 57)) {
                return false;
            }
            return true;
        }

        function Calculate() {
            var txtServiceTax = parseInt(document.getElementById('<%=txtServiceTax.ClientID %>').value);
            var txtParkingCharge = parseInt(document.getElementById('<%=txtParkingCharge.ClientID %>').value);
            var txtTollTax = parseInt(document.getElementById('<%=txtTollTax.ClientID %>').value);
            document.getElementById('<%=txtTotalTax.ClientID %>').value = txtServiceTax + txtParkingCharge + txtTollTax;
            return true;
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table>
                <tr>
                    <td>
                        <asp:Label ID="lblHeading" runat="server" Text="Java Script Tutorial" Font-Size="X-Large"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblEmployeeName" runat="server" Text="EmployeeName"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtEmployeeName" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblEmployeeEmail" runat="server" Text="EmployeeEmail"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtEmployeeEmail" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblServiceTax" runat="server" Text="ServiceTax"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtServiceTax" runat="server" onKeyPress="return Numeric(event)"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblParkingCharge" runat="server" Text="ParkingCharge"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtParkingCharge" runat="server" onKeyPress="return Numeric(event)"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblTollTax" runat="server" Text="TollTax"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtTollTax" runat="server" onBlur="Calculate()" onKeyPress="return Numeric(event)"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblTotalTax" runat="server" Text="TotalTax"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtTotalTax" runat="server" ReadOnly="true"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClientClick="Validation()" />
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
