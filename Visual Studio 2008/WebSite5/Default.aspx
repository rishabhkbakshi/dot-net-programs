<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admission</title>
    <style type="text/css">
        .style1
        {
            width: 175px;
        }
    </style>
</head>
<body style="text-align: left;background-color: Yellow; width:100%">
    <form id="form1" runat="server">
    <asp:ScriptManager runat="server" ID="scriptmanager1" EnablePageMethods="true">
    </asp:ScriptManager>
    <div>
        <asp:Label ID="lblses" runat="server" ForeColor="Gray"></asp:Label>
        <table style="width: 100%; background-color: Yellow">
            <tr style="color: Gray">
                <td style="text-align: center">
                    <asp:Label ID="lblCollage" runat="server" Text="Marudhar engg. college" Font-Bold="true"
                        Font-Size="Larger" Font-Underline="true" Style="text-align: center"></asp:Label>
                </td>
            </tr>
            <tr style="color: Gray">
                <td style="text-align: center">
                    <asp:Label ID="Label1" runat="server" Text="student regestration" Font-Size="Large"
                        Font-Underline="true" Style="text-align: center"></asp:Label>
                </td>
            </tr>
        </table>
        <table style="background-color: Yellow; width: 100%;">
            <tr style="color: Gray">
                <td>
                    First Name
                </td>
                <td>
                    <asp:TextBox ID="txtFirstName" runat="server"></asp:TextBox>
                    <cc1:AutoCompleteExtender ID="autoComplete" runat="server" TargetControlID="txtFirstName"
                        MinimumPrefixLength="1" EnableCaching="true" CompletionSetCount="10" ServiceMethod="GetFirstNameList">
                    </cc1:AutoCompleteExtender>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="rfv" runat="server" ControlToValidate="txtFirstName"
                        ErrorMessage="*">
                    </asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr style="color: Gray">
                <td>
                    Last Name
                </td>
                <td>
                    <asp:TextBox ID="txtLastName" runat="server"></asp:TextBox>
                    <cc1:AutoCompleteExtender ID="AutoCompleteExtender1" runat="server" TargetControlID="txtLastName"
                        MinimumPrefixLength="1" EnableCaching="true" CompletionSetCount="10" ServiceMethod="LastNameList">
                    </cc1:AutoCompleteExtender>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="rfv1" runat="server" ControlToValidate="txtLastName"
                        ErrorMessage="*" ValidationGroup="Submit"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr style="color: Gray">
                <td>
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
            <tr style="color: Gray">
                <td>
                    Phone no.
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
        <fieldset style="width: 100%; border: 5; border-bottom-style:solid; border-color: gray; background-color: Yellow;">
            <legend style="color: Gray">Course Details </legend>
            <table>
                <tr>
                    <td style="color:Gray">
                        <asp:RadioButtonList ID="RB" runat="server" AutoPostBack="true" OnSelectedIndexChanged="RB_SelectedIndexChanged">
                            <asp:ListItem Text="B Tech" Value="1"></asp:ListItem>
                            <asp:ListItem Text="MBA" Value="2"></asp:ListItem>
                            <asp:ListItem Text="B Pharma" Value="3"></asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                    <td valign="top">
                        <asp:RequiredFieldValidator ID="rfv4" runat="server" ControlToValidate="RB" ValidationGroup="Submit" ErrorMessage="*">
                        </asp:RequiredFieldValidator>
                    </td>
                    <td valign="top" style="color:Gray">
                        <asp:DropDownList ID="DropDownList1" runat="server" Visible="false" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" ForeColor="Gray" >
                        </asp:DropDownList>
                    </td>
                </tr>
            </table>
        </fieldset>
        <table style="background-color: Yellow; width: 100%;">
            <tr style="color: Gray">
                <td class="style1">
                    RPET Rank
                </td>
                <td>
                    <asp:TextBox ID="txtRR" runat="server" MaxLength="3"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="rfv5" runat="server" ValidationGroup="Submit" ControlToValidate="txtRR" ErrorMessage="*">
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
        <table style="background-color: Yellow; width: 100%">
            <tr>
                <td align="center" style="color: Gray">
                    <asp:Button ID="button" runat="server" Text="Submit"  OnClick="Submit"
                        BorderStyle="Groove" BackColor="BlanchedAlmond" ValidationGroup="Submit" />
                </td>
                <td style="text-align: center">
                    <asp:Button ID="button1" runat="server" Text="ClearAllField" OnClick="Clear"
                        BorderStyle="Groove" BackColor="BlanchedAlmond" />
                </td>
            </tr>
        </table>
        <table style="background-color: Yellow; width: 100%">
            <tr>
                <td style="color: Gray">
                    Fot further information visit this site :->
                    <asp:HyperLink ID="link1" runat="server" Text="www.marudhar.ac.in" NavigateUrl="http://www.marudhar.ac.in"
                        BackColor="Yellow" ForeColor="Gray" />
                </td>
            </tr>
        </table>
        <table style="background-color: Yellow; width: 100%;">
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
                                            ForeColor="Black" Height="270px" Width="200px">
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
                                        <asp:Label ID="Label2" Text="Clock->" ForeColor="Gray" runat="server"></asp:Label>
                                        <asp:Label ID="label_time" runat="server" Font-Underline="true" ForeColor="Gray"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="Label3" Text="Date->" ForeColor="Gray" runat="server"></asp:Label>
                                        <asp:Label ID="label_date" runat="server" ForeColor="Gray" Font-Underline="true"></asp:Label>
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
        <table style="background-color: Yellow; width: 100%;">
            <tr>
                <td>
                    <asp:Label ID="lbl_note" runat="server" Text="Note:-" ForeColor="Gray"></asp:Label>
                </td>
                <td style="color: Gray">
                    <marquee direction="right" style="height: 30px; width: 500px">
                    <asp:Label ID="mov" runat="server" Text="All * field are mandatory"></asp:Label></marquee>
                </td>
            </tr>
        </table>
        <table style="background-color: Yellow; width: 100%;">
            <tr>
                <td>
                    <asp:GridView ID="gvStudentDetails" AllowSorting="True" runat="server" DataKeyNames="Student_ID"
                        AutoGenerateColumns="False" Width="100%" BackColor="White" BorderColor="#E7E7FF"
                        BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal" OnRowUpdating="gvStudentDetails_RowUpdating"
                        OnRowDeleting="gvStudentDetails_RowDeleting">
                        <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
                        <Columns>
                            <asp:BoundField DataField="Student_ID" HeaderText="Student ID" />
                            <asp:BoundField DataField="FirstName" HeaderText="First Name" />
                            <asp:BoundField DataField="LastName" HeaderText="Last Name" />
                            <asp:BoundField DataField="Email" HeaderText="Email" />
                            <asp:BoundField DataField="PhoneNo" HeaderText="Phone No." />
                            <asp:BoundField DataField="CourseDetail" HeaderText="Course Details" />
                            <asp:BoundField DataField="Branch" HeaderText="Branch" />
                            <asp:BoundField DataField="RPETRank" HeaderText="RPET Rank" />
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
    </div>
    </form>
</body>
</html>
