<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table>
            <tr>
                <td>
                    <fieldset>
                        <legend>Print Message</legend>

                        <script type="text/javascript">
                            document.write("<h3>My first Page</h3>");
                        </script>

                        <asp:Button ID="btnAlert" runat="server" Text="Click Me" OnClick="Click" />
                    </fieldset>
                </td>
                <td>
                    <fieldset>
                        <legend>Function</legend>
                        <h3 id="demo">
                            Hellow
                        </h3>

                        <script type="text/javascript">
                            function myFunction() {
                                document.getElementById("demo").innerHTML = "Hello JavaScript!";    // Change the content
                            }
                        </script>

                        <button type="button" onclick="myFunction()">
                            Click Me</button>
                    </fieldset>
                </td>
                <td>
                    <fieldset>
                        <legend>Style Change</legend>
                        <h3 id="Style">
                            Style1</h3>

                        <script type="text/javascript">
                            function myStyle() {
                                document.getElementById("Style").style.color = "blue";
                            }
                        </script>

                        <button type="button" onclick="myStyle()">
                            Click Me</button>
                    </fieldset>
                </td>
                <td>
                    <fieldset>
                        <legend>Loss of Data</legend>
                        <h3>
                            My Data
                        </h3>
                        <button type="button" onclick="myData()">
                            Click Me</button>

                        <script type="text/javascript">
                            function myData() {
                                document.write("Your data is lose")
                            }
                        </script>

                    </fieldset>
                </td>
            </tr>
            <tr>
                <td>
                    <fieldset>
                        <legend>Grouping</legend>
                        <h3 id="Group1">
                            Vicky</h3>
                        <h3 id="Group2">
                            jain</h3>

                        <script type="text/javascript">
                            function myGroup() {
                                document.getElementById("Group1").innerHTML = "Rishabh";
                                document.getElementById("Group2").innerHTML = "Bakshi";
                            }
                        </script>

                        <button onclick="myGroup()" type="button">
                            Click Me</button>
                    </fieldset>
                </td>
                <td>
                    <fieldset>
                        <legend>Addition</legend>
                        <br />

                        <script type="text/javascript">
                            var x = 5;
                            var y = 7;
                            var z = x + y;
                            document.write(x + "<br>");
                            document.write(y + "<br>");
                            function Adding() {
                                document.getElementById("Add").innerHTML = z;
                            } 
                        </script>

                        <label id="Add">
                        </label>
                        <br />
                        <button onclick="Adding()" type="button">
                            Click Me</button>
                    </fieldset>
                </td>
                <td>
                    <fieldset>
                        <legend>Timer</legend>
                        <label id="Time">
                        </label>
                        <br />

                        <script type="text/javascript">
                            var myVar = setInterval(function() { Timer() }, 1000);
                            function Timer() {
                                document.getElementById("Time").innerHTML = new Date().toLocaleTimeString();
                            }
                        </script>

                    </fieldset>
                </td>
                <td>
                    <fieldset>
                        <legend>Array</legend>

                        <script type="text/javascript">
                            var i;
                            var cars = new Array();
                            cars[0] = "Saab";
                            cars[1] = "Volvo";
                            cars[2] = "BMW";
                            function ArrayFun() {
                                for (i = 0; i < cars.length; i++) {
                                    document.write(cars[i] + "<br>");
                                }
                            }
                        </script>

                        <button id="btnSubmit" type="button" onclick="ArrayFun()">
                            Click ME</button>
                    </fieldset>
                </td>
            </tr>
            <tr>
                <td>
                    <fieldset>
                        <legend>Show & Hide</legend>
                        <label id="lblText">
                            MY name is Rishabh</label>
                        <br />
                        <button id="btnShow" onclick="document.getElementById('lblText').style.visibility='hidden'">
                            Show Text</button>
                        <button id="btnHide" onclick="document.getElementById('lblText').style.visibility='visible'">
                            Hide Text</button>
                    </fieldset>
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
