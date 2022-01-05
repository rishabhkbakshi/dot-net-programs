<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AfterLogin.aspx.cs" Inherits="_Default" %>
<%@ Register Assembly="CalendarExtenderPlus" Namespace="AjaxControlToolkitPlus" TagPrefix="asp" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admission</title>
    <style type="text/css">
        body
        {
            font-family: Arial;
            font-size: 12px;
            color: Black;
        }
        .arial12
        {
            font-family: Arial;
            font-size: 12px;
            color: Black;
        }
        .style1
        {
            width: 100%;
            color: Black;
        }
    </style>
</head>
<body style="text-align: left; background-color: Gray; width: 100%;">
    <form id="form1" runat="server">
    <div style="background-color: Gray;">
        <table style="background-color: Silver;" align="center">
            <tr>
                <td>
                    <asp:ScriptManager runat="server" ID="scriptmanager1" EnablePageMethods="true">
                    </asp:ScriptManager>
                </td>
            </tr>
            <tr>
                <td style="text-align: right">
                    <table class="style1">
                        <tr>
                            <td style="text-align: left">
                                <asp:Label ID="lblWelcome" runat="server"></asp:Label>
                            </td>
                            <td>
                                <asp:Button ID="btnLogOut" runat="server" Text="LogOut" OnClick="btnLogOut_Click"
                                    CausesValidation="false" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    <table align="center">
                        <tr>
                            <td>
                                <asp:Label ID="lblCollage" runat="server" Text="Marudhar Engg. College" Font-Bold="true"
                                    Font-Size="XX-Large" Font-Underline="true" Style="text-align: center"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: center">
                                <asp:Label ID="Label1" runat="server" Text="Student Regestration" Font-Size="X-Large"
                                    Font-Underline="true" Style="text-align: center"></asp:Label>
                            </td>
                        </tr>
                    </table>
                    <table class="style1">
                        <tr>
                            <td>
                                <marquee direction="right" style="height: 30px; width: 500px">
                                    <asp:Label ID="mov" runat="server" Text="All * field are mandatory"></asp:Label></marquee>
                            </td>
                        </tr>
                    </table>
                    <table class="style1">
                        <tr>
                            <td style="width: 200px">
                                First Name
                            </td>
                            <td>
                                <asp:TextBox ID="txtFirstName" runat="server"></asp:TextBox>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="rfv" runat="server" ControlToValidate="txtFirstName"
                                    ErrorMessage="*" ValidationGroup="Submit">
                                </asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 200px">
                                Last Name
                            </td>
                            <td>
                                <asp:TextBox ID="txtLastName" runat="server"></asp:TextBox>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="rfv1" runat="server" ControlToValidate="txtLastName"
                                    ErrorMessage="*" ValidationGroup="Submit"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblDate" runat="server" Text="DateOfBirth"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtDate" runat="server"></asp:TextBox>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="rfvDate" runat="server" ControlToValidate="txtDate"
                                    ErrorMessage="*" ValidationGroup="Submit"></asp:RequiredFieldValidator>
                            </td>
                            <%--<td>
                                <asp:CalendarExtenderPlus ID="CalendarExtenderPlus1" runat="server" TargetControlID="txtDate"
                                    MaximumDate="31/Dec/2010" MinimumDate="01/Jan/1985" DdlMaxNumberOfYears="20"
                                    ShowDdlHeader="true" Format="dd/MMM/yyyy">
                                </asp:CalendarExtenderPlus>
                            </td>--%>
                            <td>
                                <cc1:CalendarExtender ID="calDOB" runat="server" TargetControlID="txtDate" Format="dd/MM/yyyy">
                                </cc1:CalendarExtender>
                            </td>
                            <%-- <td>
                            <asp:RegularExpressionValidator ID="revDate" runat="Server" ControlToValidate="txtDate"
                                ValidationGroup="Submit" ValidationExpression="(0[1-9]|[12][0-9]|3[01])[/](0[1-9]|1[012])[/](19|20)[0-9]{2}"
                                ErrorMessage="Please Insert dd/mm/yyyy format"></asp:RegularExpressionValidator>
                        </td>--%>
                        </tr>
                        <tr>
                            <td style="width: 200px">
                                Email
                            </td>
                            <td>
                                <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="rfv2" runat="server" ControlToValidate="txtEmail"
                                    ErrorMessage="*" ValidationGroup="Submit"></asp:RequiredFieldValidator>
                            </td>
                            <td>
                                <asp:RegularExpressionValidator ID="rev1" runat="server" ControlToValidate="txtEmail"
                                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ErrorMessage="Enter proper address"></asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 200px">
                                Phone No.
                            </td>
                            <td>
                                <asp:TextBox ID="txtPhone" runat="server" MaxLength="10"></asp:TextBox>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="rfv3" runat="server" ControlToValidate="txtPhone"
                                    ErrorMessage="*" ValidationGroup="Submit"></asp:RequiredFieldValidator>
                            </td>
                            <td>
                                <asp:RegularExpressionValidator ID="rev2" runat="server" ControlToValidate="txtPhone"
                                    ErrorMessage="Enter correct mobile no." ValidationExpression="^[0-9]{10}"></asp:RegularExpressionValidator>
                            </td>
                            <td>
                                <cc1:FilteredTextBoxExtender ID="ftv" runat="server" TargetControlID="txtPhone" FilterType="Numbers">
                                </cc1:FilteredTextBoxExtender>
                            </td>
                        </tr>
                    </table>
                    <fieldset class="style1" style="border: 5; border-bottom-style: solid;">
                        <legend style="color: Black">Course Details </legend>
                        <table style="color: Black">
                            <tr>
                                <td>
                                    <asp:RadioButtonList ID="radiolistdegree" runat="server" AutoPostBack="true" OnSelectedIndexChanged="RB_SelectedIndexChanged">
                                        <asp:ListItem Text="B Tech" Value="1"></asp:ListItem>
                                        <asp:ListItem Text="MBA" Value="2"></asp:ListItem>
                                        <asp:ListItem Text="B Pharma" Value="3"></asp:ListItem>
                                    </asp:RadioButtonList>
                                </td>
                                <td valign="top">
                                    <asp:RequiredFieldValidator ID="rfv4" runat="server" ControlToValidate="radiolistdegree" ValidationGroup="Submit"
                                        ErrorMessage="*">
                                    </asp:RequiredFieldValidator>
                                </td>
                                <td valign="top" style="color: Black">
                                    <asp:DropDownList ID="drplistBranch" runat="server" Visible="false" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged"
                                        ForeColor="Black">
                                    </asp:DropDownList>
                                </td>
                            </tr>
                        </table>
                    </fieldset>
                    <table class="style1">
                        <tr>
                            <td style="width: 200px">
                                RPET Rank
                            </td>
                            <td>
                                <asp:TextBox ID="txtRR" runat="server" MaxLength="3"></asp:TextBox>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="rfv5" runat="server" ValidationGroup="Submit" ControlToValidate="txtRR"
                                    ErrorMessage="*">
                                </asp:RequiredFieldValidator>
                            </td>
                            <td>
                                <asp:RangeValidator ID="rgv" runat="server" ControlToValidate="txtRR" MaximumValue="999"
                                    MinimumValue="1" ErrorMessage="Not in Range">
                                </asp:RangeValidator>
                            </td>
                            <td>
                                <cc1:FilteredTextBoxExtender ID="ftv2" runat="server" FilterType="Numbers" TargetControlID="txtRR">
                                </cc1:FilteredTextBoxExtender>
                            </td>
                        </tr>
                    </table>
                    <table class="style1">
                        <tr>
                            <td align="center">
                                <asp:Button ID="button" runat="server" Text="Submit" OnClick="Submit" ValidationGroup="Submit" />
                            </td>
                            <td style="text-align: center">
                                <asp:Button ID="button1" runat="server" Text="ClearAllField" OnClick="Clear" CausesValidation="false" />
                            </td>
                        </tr>
                    </table>
                    <table class="style1">
                        <tr>
                            <td>
                                Fot further information visit this site :->
                                <asp:HyperLink ID="link1" runat="server" Text="www.marudhar.ac.in" NavigateUrl="http://www.marudhar.ac.in"
                                    ForeColor="Black" />
                            </td>
                        </tr>
                    </table>
                    <table class="style1">
                        <tr>
                            <td>
                                <asp:Timer ID="Timer1" Interval="5000" runat="server" OnTick="time" />
                                <asp:UpdatePanel ID="up1" runat="server">
                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="Timer1" EventName="Tick" />
                                    </Triggers>
                                    <ContentTemplate>
                                        <table>
                                            <tr>
                                                <td>
                                                    <asp:Calendar ID="calender" runat="server" BackColor="White" BorderColor="#999999"
                                                        CellPadding="4" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt"
                                                        ForeColor="Black" Height="270px" Width="204px">
                                                        <SelectedDayStyle BackColor="#666666" Font-Bold="True" ForeColor="White" />
                                                        <SelectorStyle BackColor="#CCCCCC" />
                                                        <WeekendDayStyle BackColor="#FFFFCC" />
                                                        <TodayDayStyle BackColor="#CCCCCC" ForeColor="Black" />
                                                        <OtherMonthDayStyle ForeColor="#808080" />
                                                        <NextPrevStyle VerticalAlign="Bottom" />
                                                        <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" />
                                                        <TitleStyle BackColor="#999999" BorderColor="Black" Font-Bold="True" />
                                                    </asp:Calendar>
                                                </td>
                                                <td>
                                                    <asp:Label ID="Label2" Text="Clock->" ForeColor="Black" runat="server"></asp:Label>
                                                    <asp:Label ID="label_time" runat="server" Font-Underline="true" ForeColor="Black"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="Label3" Text="Date->" ForeColor="Black" runat="server"></asp:Label>
                                                    <asp:Label ID="label_date" runat="server" ForeColor="Black" Font-Underline="true"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:AdRotator ID="AdRotator1" AdvertisementFile="~/Advertise.xml" Height="270px"
                                                        Width="501px" runat="server" />
                                                </td>
                                            </tr>
                                        </table>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </td>
                        </tr>
                    </table>
                    <table style="width: 100%;">
                        <tr>
                            <td>
                                <asp:GridView ID="gvStudentDetails" AllowSorting="True" runat="server" DataKeyNames="Student_ID"
                                    AutoGenerateColumns="False" Width="100%" BackColor="White" BorderColor="#E7E7FF"
                                    BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal" OnRowUpdating="gvStudentDetails_RowUpdating"
                                    OnRowDeleting="gvStudentDetails_RowDeleting">
                                    <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
                                    <Columns>
                                        <asp:BoundField DataField="Student_Id" HeaderText="Student ID" />
                                        <asp:BoundField DataField="FirstName" HeaderText="First Name" />
                                        <asp:BoundField DataField="LastName" HeaderText="Last Name" />
                                        <asp:BoundField DataField="DOB" HeaderText="DateOfBirth" />
                                        <asp:BoundField DataField="Email" HeaderText="Email" />
                                        <asp:BoundField DataField="PhoneNo" HeaderText="Phone No." />
                                        <asp:BoundField DataField="CourseDetail" HeaderText="Course Details" />
                                        <asp:BoundField DataField="Branch" HeaderText="Branch" />
                                        <asp:BoundField DataField="RRank" HeaderText="RPET Rank" />
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lnkbtnUpdate" runat="server" Text="Update" CommandName="Update"
                                                    CausesValidation="false"></asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lnkbtnDelete" runat="server" Text="Delete" CommandName="Delete"
                                                    CausesValidation="false"></asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
