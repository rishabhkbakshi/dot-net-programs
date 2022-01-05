<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="Afterlogin.aspx.cs" Inherits="_Default" %>

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
                        <td align="center" style="color:Red">
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
                            <cc1:AutoCompleteExtender ID="autoComplete" runat="server" TargetControlID="txtFirstName"
                                MinimumPrefixLength="1" EnableCaching="true" CompletionSetCount="10" ServiceMethod="GetFirstNameList">
                            </cc1:AutoCompleteExtender>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="rfv" runat="server" ControlToValidate="txtFirstName"
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
                            <cc1:AutoCompleteExtender ID="AutoCompleteExtender1" runat="server" TargetControlID="txtLastName"
                                MinimumPrefixLength="1" EnableCaching="true" CompletionSetCount="10" ServiceMethod="LastNameList">
                            </cc1:AutoCompleteExtender>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="rfv1" runat="server" ControlToValidate="txtLastName"
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
                            <cc1:CalendarExtender ID="calDOB" runat="server" TargetControlID="txtDate" Format="dd/MM/yyyy" ></cc1:CalendarExtender>
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
                            <asp:RequiredFieldValidator ID="rfv2" runat="server" ControlToValidate="txtEmail"
                                ErrorMessage="*" ValidationGroup="Submit"></asp:RequiredFieldValidator>
                        </td>
                        <td>
                            <asp:RegularExpressionValidator ID="rev1" runat="server" ControlToValidate="txtEmail"
                                ValidationGroup="Submit" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                ErrorMessage="Enter proper address"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 200px">
                            <asp:Label ID="lblPhone" runat="server" Text="Phone No."></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtPhone" runat="server" MaxLength="10" CssClass="input_text"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="rfv3" runat="server" ControlToValidate="txtPhone"
                                ErrorMessage="*" ValidationGroup="Submit"></asp:RequiredFieldValidator>
                        </td>
                        <td>
                            <asp:RegularExpressionValidator ID="rev2" runat="server" ControlToValidate="txtPhone"
                                ErrorMessage="Enter correct mobile no." ValidationExpression="^[0-9]{10}" ValidationGroup="Submit"></asp:RegularExpressionValidator>
                        </td>
                        <td>
                            <cc1:FilteredTextBoxExtender ID="ftv" runat="server" TargetControlID="txtPhone" FilterType="Numbers">
                            </cc1:FilteredTextBoxExtender>
                        </td>
                    </tr>
                </table>
               <fieldset  style="border-style: groove; border-color: Black; border: 5;font-size:medium">
                    <legend>
                        <asp:Label ID="lblCourse" runat="server" Text="Course Details" ForeColor="Black" ></asp:Label>
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
                                <asp:RequiredFieldValidator ID="rfv4" runat="server" ControlToValidate="radiolstDegree" ValidationGroup="Submit"
                                    ErrorMessage="*">
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
                            <asp:RequiredFieldValidator ID="rfv5" runat="server" ValidationGroup="Submit" ControlToValidate="txtRR"
                                ErrorMessage="*">
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
                    <tr align="center">
                        <td>
                            <asp:Timer ID="Timer1" Interval="4000" runat="server" />
                            <asp:UpdatePanel ID="up1" runat="server">
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="Timer1" EventName="Tick" />
                                </Triggers>
                                <ContentTemplate>
                                    <table>
                                        <tr>
                                            <td>
                                                <asp:Label ID="lblSearch" Text="For Web Search Click Here:-" runat="server"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:AdRotator ID="AdRotator1" AdvertisementFile="~/Advertisement.xml" Height="270px"
                                                    Width="501px" runat="server" />
                                            </td>
                                        </tr>
                                    </table>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                    </tr>
                </table>
                
            </td>
        </tr>
    </table>
</asp:Content>
