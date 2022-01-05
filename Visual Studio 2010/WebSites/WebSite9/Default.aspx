<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register Assembly="ASPNetVideo.NET3" Namespace="ASPNetVideo" TagPrefix="ASPNetVideo" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <style type="text/css">
        body
        {
            margin: 50px 0px;
            padding: 0px;
            text-align: center;
        }
        .Image
        {
            width: 475px;
            margin: 0px auto;
            text-align: center;
            padding: 20px;
            border: 1px dashed gray;
            background-color: Silver;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <div class="Image">
            <asp:Image ID="img1" runat="server" Height="400px" Width="400px" ImageUrl="~/images/Jellyfish.jpg" />
        </div>
        <cc1:SlideShowExtender ID="SlideShowExtender1" runat="server" BehaviorID="SSBehaviorID"
            TargetControlID="img1" SlideShowServiceMethod="GetSlides" AutoPlay="true" ImageDescriptionLabelID="lblDesc"
            NextButtonID="btnNext" PreviousButtonID="btnPrev" PlayButtonID="btnPlay" PlayButtonText="Play"
            StopButtonText="Stop" Loop="true">
        </cc1:SlideShowExtender>
        <cc1:AnimationExtender ID="AnimationExtender1" runat="server" BehaviorID="ae" TargetControlID="img1">
            <Animations>
            <OnLoad>
            <Sequence>
              <FadeOut Duration="0" Fps="20" />
              <FadeIn Duration="0" Fps="20" />
            </Sequence>
            </OnLoad>
            </Animations>
        </cc1:AnimationExtender>
        <div>
            <asp:Label ID="lblDesc" runat="server" Text=""></asp:Label><br />
            <asp:Button ID="btnPrev" runat="server" Text="Previous" />
            <asp:Button ID="btnPlay" runat="server" Text="" />
            <asp:Button ID="btnNext" runat="server" Text="Next" />
        </div>
        <ASPNetVideo:WindowsMedia ID="WindowsMedia1" runat="server" VideoURL="Wildlife.wmv">
        </ASPNetVideo:WindowsMedia>
    </div>
    </form>
</body>
</html>
