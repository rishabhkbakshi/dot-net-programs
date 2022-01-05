<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <div>
        <div>
            <script type="text/javascript">

                var imgObj = null;
                var animate;
                function init() {
                    imgObj = document.getElementById('slide');
                    imgObj.style.position = 'relative';
                    imgObj.style.left = '0px';
                }
                function moveRight() {
                    imgObj.style.left = parseInt(imgObj.style.left) + 10 + 'px';
                    animate = setTimeout(moveRight, 20); // call moveRight in 20msec
                }
                function stop() {
                    clearTimeout(animate);
                    imgObj.style.left = '0px';
                }
                window.onload = init;

            </script>
            <table>
                <tr>
                    <td>
                        <asp:Image ID="img1" runat="server" Height="400px" Width="400px" ImageUrl="~/images/Blue hills.jpg" />
                    </td>
                    <td>
                        <asp:Image ID="slide" runat="server" Width="400px" Height="400px" ImageUrl="~/images/nature02.jpg" />
                    </td>
                </tr>
            </table>
        </div>
        <cc1:SlideShowExtender ID="SlideShowExtender1" runat="server" BehaviorID="SSBehaviorID"
            TargetControlID="img1" SlideShowServiceMethod="GetSlides" AutoPlay="true" ImageDescriptionLabelID="lblDesc"
            NextButtonID="btnNext" PreviousButtonID="btnPrev" PlayButtonID="btnPlay" PlayButtonText="Play"
            StopButtonText="Stop" Loop="true">
        </cc1:SlideShowExtender>
        <cc1:AnimationExtender ID="AnimationExtender1" runat="server" TargetControlID="img1">
        </cc1:AnimationExtender>
        <div>
            <asp:Label ID="lblDesc" runat="server" Text=""></asp:Label>
            <table class="style1">
                <tr>
                    <td>
                        <asp:Button ID="btnPrev" runat="server" Text="Previous" />
                        <asp:Button ID="btnPlay" runat="server" Text="" />
                        <asp:Button ID="btnNext" runat="server" Text="Next" />
                    </td>
                    <td>
                        <%--<asp:Button ID="btnStart" runat="server" OnClick="moveRight()" Text="Start" />
                            <asp:Button ID="btnStop" runat="server" OnClick="stop()" Text="Stop" />--%>
                        <button id="btnStart" onclick="moveRight()" type="button">
                            Start
                        </button>
                        <button id="btnStop" onclick="stop()" type="button">
                            Stop</button>
                    </td>
                </tr>
            </table>
        </div>
    </div>
    </form>
</body>
</html>
