using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ExampleUserControl : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        MyUserInfoxControl.UserName1 = "Jane";
        MyUserInfoxControl.UserAge1 = 34;
        MyUserInfoxControl.UserCountry1 = "USA";
    }
}
