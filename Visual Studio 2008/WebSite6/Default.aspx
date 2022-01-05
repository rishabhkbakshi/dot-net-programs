<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table>
            <tr style="background-color: yellow">
                <td style="text-align: center">
                    <marquee direction="right" style="height: 30px; width: 500px">
                    <asp:Label ID="mov" runat="server" Text="Account Creation"></asp:Label></marquee>
                </td>
            </tr>
            <tr style="background-color: Olive">
                <td>
                    <asp:Wizard ID="Wzd1" runat="server" DisplaySideBar="true" HeaderText="Cute Avatar Wizard"
                        HeaderStyle-BackColor="DarkSlateBlue" HeaderStyle-ForeColor="Cyan" HeaderStyle-Font-Size="X-Large"
                        BorderColor="RosyBrown" BorderWidth="2" DisplayCancelButton="true" HeaderStyle-Height="50"
                        HeaderStyle-HorizontalAlign="Center" ActiveStepIndex="0">
                        <WizardSteps>
                            <asp:WizardStep StepType="Start" Title="User Information">
                                <img src="Blue hills.jpg" height="400" />
                                <table>
                                    <tr>
                                        <td>
                                            First Name:
                                        </td>
                                        <td>
                                            <asp:TextBox ID="tb1" runat="server"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:RequiredFieldValidator ID="rfe1" runat="server" ControlToValidate="tb1" ErrorMessage="*"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Last Name:
                                        </td>
                                        <td>
                                            <asp:TextBox ID="tb2" runat="server"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:RequiredFieldValidator ID="rfe2" runat="server" ControlToValidate="tb2" ErrorMessage="*"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Gender:
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="ddl1" runat="server">
                                                <asp:ListItem>Male</asp:ListItem>
                                                <asp:ListItem>Female</asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            State:
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="ddl2" runat="server">
                                                <asp:ListItem>Andaman and Nicobar Islands</asp:ListItem>
                                                <asp:ListItem>Andhra Pradesh</asp:ListItem>
                                                <asp:ListItem>Arunachal Pradesh</asp:ListItem>
                                                <asp:ListItem>Assam</asp:ListItem>
                                                <asp:ListItem>Bihar</asp:ListItem>
                                                <asp:ListItem>Chandigarh</asp:ListItem>
                                                <asp:ListItem>Chattisgarh</asp:ListItem>
                                                <asp:ListItem>Dadra and Nagar Haveli</asp:ListItem>
                                                <asp:ListItem>Daman and Diu</asp:ListItem>
                                                <asp:ListItem>Delhi</asp:ListItem>
                                                <asp:ListItem>Goa</asp:ListItem>
                                                <asp:ListItem>Gujarat</asp:ListItem>
                                                <asp:ListItem>Haryana</asp:ListItem>
                                                <asp:ListItem>Himachal Pradesh</asp:ListItem>
                                                <asp:ListItem>Jammu and Kashmir</asp:ListItem>
                                                <asp:ListItem>Jharkhand</asp:ListItem>
                                                <asp:ListItem>Karnataka</asp:ListItem>
                                                <asp:ListItem>Kerala</asp:ListItem>
                                                <asp:ListItem>Lakshadweep</asp:ListItem>
                                                <asp:ListItem>Madhya Pradesh</asp:ListItem>
                                                <asp:ListItem>Maharashtra</asp:ListItem>
                                                <asp:ListItem>Manipur</asp:ListItem>
                                                <asp:ListItem>Meghalaya</asp:ListItem>
                                                <asp:ListItem>Mizoram</asp:ListItem>
                                                <asp:ListItem>Nagaland</asp:ListItem>
                                                <asp:ListItem>Orissa</asp:ListItem>
                                                <asp:ListItem>Pondicherry</asp:ListItem>
                                                <asp:ListItem>Punjab</asp:ListItem>
                                                <asp:ListItem>Rajasthan</asp:ListItem>
                                                <asp:ListItem>Sikkim</asp:ListItem>
                                                <asp:ListItem>Tamil Nadu</asp:ListItem>
                                                <asp:ListItem>Tripura</asp:ListItem>
                                                <asp:ListItem>Uttarakhand</asp:ListItem>
                                                <asp:ListItem>Uttaranchal</asp:ListItem>
                                                <asp:ListItem>Uttar Pradesh</asp:ListItem>
                                                <asp:ListItem>West Bengal</asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Pin Code:
                                        </td>
                                        <td>
                                            <asp:TextBox ID="tb3" runat="server"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:RequiredFieldValidator ID="rfe3" runat="server" ControlToValidate="tb3" ErrorMessage="*"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Email:
                                        </td>
                                        <td>
                                            <asp:TextBox ID="tb4" runat="server"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:RequiredFieldValidator ID="rfe4" runat="server" ControlToValidate="tb4" ErrorMessage="*"></asp:RequiredFieldValidator>
                                        </td>
                                        <td>
                                            <asp:RegularExpressionValidator ID="re2" runat="server" ControlToValidate="tb4" ErrorMessage="Enter valid Email"
                                                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                        </td>
                                    </tr>
                                </table>
                            </asp:WizardStep>
                            <asp:WizardStep Title="Email Detail">
                                <img src="Sunset.jpg" height="400" />
                                <table>
                                    <tr>
                                        <td>
                                            Login Name:
                                        </td>
                                        <td>
                                            <asp:TextBox ID="tb5" runat="server"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:RequiredFieldValidator ID="rfe5" runat="server" ControlToValidate="tb5" ErrorMessage="*"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Password:
                                        </td>
                                        <td>
                                            <asp:TextBox ID="tb6" runat="server" TextMode="Password"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:RequiredFieldValidator ID="rf6" runat="server" ControlToValidate="tb6" ErrorMessage="*"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Confirm Password:
                                        </td>
                                        <td>
                                            <asp:TextBox ID="tb7" runat="server" TextMode="Password"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:RequiredFieldValidator ID="rf7" runat="server" ControlToValidate="tb7" ErrorMessage="*"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:CompareValidator ID="cv1" runat="server" ControlToValidate="tb7" ControlToCompare="tb6"
                                                ErrorMessage="Not Match ReEnter the Password"></asp:CompareValidator>
                                        </td>
                                    </tr>
                                </table>
                            </asp:WizardStep>
                            <asp:WizardStep Title="Forgot Password">
                                <img src="Water lilies.jpg" height="400" />
                                <table>
                                    <tr>
                                        <td>
                                            Hint Question
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="ddl3" runat="server">
                                                <asp:ListItem>What is the name of your first school?</asp:ListItem>
                                                <asp:ListItem>What is your mother's maiden name?</asp:ListItem>
                                                <asp:ListItem>What is your favourite food?</asp:ListItem>
                                                <asp:ListItem>What is your exact time of birth?</asp:ListItem>
                                                <asp:ListItem>What is your favourite pass-time?</asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            <asp:RequiredFieldValidator ID="rf8" runat="server" ControlToValidate="ddl3" ErrorMessage="*"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Hint Answer
                                        </td>
                                        <td>
                                            <asp:TextBox ID="tb8" runat="server"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:RequiredFieldValidator ID="rf9" runat="server" ControlToValidate="tb8" ErrorMessage="*"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                </table>
                            </asp:WizardStep>
                            <asp:WizardStep Title="Interest">
                                <img src="Winter.jpg" height="400" />
                                <table>
                                    <tr>
                                        <td>
                                            <asp:CheckBox ID="News" runat="server" Text="News" />
                                        </td>
                                        <td>
                                            <asp:CheckBox ID="HnF" runat="server" Text="Home &amp; Family" />
                                        </td>
                                        <td>
                                            <asp:CheckBox ID="HnN" runat="server" Text="Health &amp; Nutrition" />
                                        </td>
                                        <td>
                                            <asp:CheckBox ID="Auto" runat="server" Text="Automobiles" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:CheckBox ID="Education" runat="server" Text="Education" />
                                        </td>
                                        <td>
                                            <asp:CheckBox ID="Loand" runat="server" Text="Loans" />
                                        </td>
                                        <td>
                                            <asp:CheckBox ID="Travel" runat="server" Text="Travel" />
                                        </td>
                                        <td>
                                            <asp:CheckBox ID="Computers" runat="server" Text="Computers" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:CheckBox ID="Shopping" runat="server" Text="Shopping" />
                                        </td>
                                        <td>
                                            <asp:CheckBox ID="Insurance" runat="server" Text="Insurance" />
                                        </td>
                                        <td>
                                            <asp:CheckBox ID="Beauty" runat="server" Text="Beauty " />
                                        </td>
                                        <td>
                                            <asp:CheckBox ID="Fashion" runat="server" Text="Fashion" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:CheckBox ID="Sports" runat="server" Text="Sports " />
                                        </td>
                                        <td>
                                            <asp:CheckBox ID="OnlineGames" runat="server" Text="Online Gaming" />
                                        </td>
                                        <td>
                                            <asp:CheckBox ID="SpecialOffers" runat="server" Text="Special Offers" />
                                        </td>
                                        <td>
                                            <asp:CheckBox ID="Family" runat="server" Text="Family" />
                                        </td>
                                    </tr>
                                </table>
                            </asp:WizardStep>
                            <asp:WizardStep Title="Terms & Condition" StepType="Finish">
                                <img src="nature02.jpg" height="400" />
                                <table>
                                    <tr>
                                        <td>
                                            <asp:TextBox ID="TermsAndConditions" runat="server" TextMode="MultiLine" Height="323px"
                                                Width="337px" Text="Terms &amp; Conditions" Font-Bold="True" Font-Names="Impact"
                                                Font-Size="XX-Large">
                                            </asp:TextBox>
                                        </td>
                                    </tr>
                                </table>
                            </asp:WizardStep>
                        </WizardSteps>
                        <HeaderStyle HorizontalAlign="Center" BackColor="DarkSlateBlue" Font-Size="X-Large"
                            ForeColor="Cyan" Height="50px"></HeaderStyle>
                    </asp:Wizard>
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
