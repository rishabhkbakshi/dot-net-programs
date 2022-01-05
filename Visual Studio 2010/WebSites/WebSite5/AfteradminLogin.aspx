<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="AfteradminLogin.aspx.cs" Inherits="_Default" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table style="background-color: Silver;" align="center">
        <tr>
            <td>
                <table class="style1">
                    <tr>
                        <td>
                            <asp:Label ID="lblUserResponse" runat="server" ForeColor="Red"></asp:Label>
                        </td>
                    </tr>
                </table>
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
                                CausesValidation="false" CssClass="input_button" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <table class="style1">
                    <tr>
                        <td style="text-align: center">
                            <asp:Label ID="lblRegestration" runat="server" Text="Student Regestration" Font-Size="X-Large"
                                Font-Underline="true" Style="text-align: center"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td align="center" style="color: Red">
                            <marquee direction="right" style="height: 30px; width: 500px; text-align: center;">All * field are mandatory</marquee>
                        </td>
                    </tr>
                </table>
                <table class="style1">
                    <tr>
                        <td style="width: 200px;">
                            <asp:Label ID="lblFname" runat="server" Text="First Name"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtFirstName" runat="server" CssClass="input_text"></asp:TextBox>
                        </td>
                        <td>
                            <cc1:AutoCompleteExtender ID="autoCompleteFirstname" runat="server" TargetControlID="txtFirstName"
                                MinimumPrefixLength="1" EnableCaching="true" CompletionSetCount="10" ServiceMethod="GetFirstNameList">
                            </cc1:AutoCompleteExtender>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="rfvFname" runat="server" ControlToValidate="txtFirstName"
                                ErrorMessage="*" ValidationGroup="Submit">
                            </asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 200px">
                            <asp:Label ID="lblLname" runat="server" Text="Last Name"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtLastName" runat="server" CssClass="input_text"></asp:TextBox>
                        </td>
                        <td>
                            <cc1:AutoCompleteExtender ID="autoCompleteLastname" runat="server" TargetControlID="txtLastName"
                                MinimumPrefixLength="1" EnableCaching="true" CompletionSetCount="10" ServiceMethod="GetLastNameList">
                            </cc1:AutoCompleteExtender>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="rfvLname" runat="server" ControlToValidate="txtLastName"
                                ErrorMessage="*" ValidationGroup="Submit"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 200px;">
                            <asp:Label ID="lblDate" runat="server" Text="DateOfBirth"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtDate" runat="server" CssClass="input_text"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="rfvDate" runat="server" ControlToValidate="txtDate"
                                ErrorMessage="*" ValidationGroup="Submit"></asp:RequiredFieldValidator>
                        </td>
                        <td>
                            <cc1:CalendarExtender ID="calDOB" runat="server" TargetControlID="txtDate" Format="dd/MM/yyyy">
                            </cc1:CalendarExtender>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 200px">
                            <asp:Label ID="lblEmail" runat="server" Text="Email"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtEmail" runat="server" CssClass="input_text"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail"
                                ErrorMessage="*" ValidationGroup="Submit"></asp:RequiredFieldValidator>
                        </td>
                        <td>
                            <asp:RegularExpressionValidator ID="revemail" runat="server" ControlToValidate="txtEmail"
                                ValidationGroup="Submit" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                ErrorMessage="Enter proper address"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 200px">
                            <asp:Label ID="lblPhone" runat="server" Text="Phone No."></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtPhone" runat="server" MaxLength="11" CssClass="input_text"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="rfvPhone" runat="server" ControlToValidate="txtPhone"
                                ErrorMessage="*" ValidationGroup="Submit"></asp:RequiredFieldValidator>
                        </td>
                        <td>
                            <cc1:FilteredTextBoxExtender ID="ftv" runat="server" TargetControlID="txtPhone" FilterType="Numbers">
                            </cc1:FilteredTextBoxExtender>
                        </td>
                    </tr>
                </table>
                <fieldset style="border-style: groove; border-color: Black; border: 5; font-size: medium">
                    <legend>
                        <asp:Label ID="lblCourse" runat="server" Text="Course Details" ForeColor="Black"></asp:Label>
                    </legend>
                    <table>
                        <tr>
                            <td>
                                <asp:RadioButtonList ID="radiolstDegree" runat="server" AutoPostBack="true" OnSelectedIndexChanged="RB_SelectedIndexChanged">
                                    <asp:ListItem Text="B Tech" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="MBA" Value="2"></asp:ListItem>
                                    <asp:ListItem Text="B Pharma" Value="3"></asp:ListItem>
                                </asp:RadioButtonList>
                            </td>
                            <td valign="top">
                                <asp:RequiredFieldValidator ID="rfvDegree" runat="server" ControlToValidate="radiolstDegree"
                                    ValidationGroup="Submit" ErrorMessage="*">
                                </asp:RequiredFieldValidator>
                            </td>
                            <td valign="top">
                                <asp:DropDownList ID="DrpListBranch" runat="server" Visible="false">
                                </asp:DropDownList>
                            </td>
                        </tr>
                    </table>
                </fieldset>
                <table class="style1">
                    <tr>
                        <td style="width: 200px">
                            <asp:Label ID="lblRRank" runat="server" Text="RPET Rank"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtRR" runat="server" CssClass="input_text" MaxLength="4"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="rfvRRank" runat="server" ValidationGroup="Submit"
                                ControlToValidate="txtRR" ErrorMessage="*">
                            </asp:RequiredFieldValidator>
                        </td>
                        <td>
                            <asp:RangeValidator ID="rgv" runat="server" ControlToValidate="txtRR" MaximumValue="1000"
                                Type="Integer" MinimumValue="1" ErrorMessage="The Rank must be from 1 to 1000"
                                ValidationGroup="Submit">
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
                            <asp:Button ID="button" runat="server" Text="Submit" OnClick="Submit" ValidationGroup="Submit"
                                CssClass="input_button" />
                        </td>
                        <td align="center">
                            <asp:Button ID="button1" runat="server" Text="ClearAllField" OnClick="Clear" CssClass="input_button"
                                CausesValidation="false" />
                        </td>
                    </tr>
                </table>
                <table class="style1">
                    <tr>
                        <td>
                            <asp:Label ID="lblHlink" runat="server" Text="Fot further information visit this site :- "></asp:Label>
                            <asp:HyperLink ID="link1" runat="server" Text="www.marudhar.ac.in" NavigateUrl="http://www.marudhar.ac.in"
                                ForeColor="Black" />
                        </td>
                    </tr>
                </table>
                <table class="style1">
                    <tr>
                        <td>
                            <asp:GridView ID="gvStudentDetails" AllowSorting="True" runat="server" DataKeyNames="Student_Id"
                                AutoGenerateColumns="False" Width="100%" BackColor="Silver" BorderColor="Black"
                                BorderStyle="Solid" BorderWidth="2px" CellPadding="3" OnRowUpdating="gvStudentDetails_RowUpdating"
                                OnRowDeleting="gvStudentDetails_RowDeleting">
                                <Columns>
                                    <asp:BoundField DataField="Student_Id" HeaderText="Student ID" />
                                    <asp:BoundField DataField="Firstname" HeaderText="First Name" />
                                    <asp:BoundField DataField="Lastname" HeaderText="Last Name" />
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
</asp:Content>
