using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserInfoboxControl : System.Web.UI.UserControl
{
    private string UserName;

    public string UserName1
    {
        get { return UserName; }
        set { UserName = value; }
    }
    private int UserAge;

    public int UserAge1
    {
        get { return UserAge; }
        set { UserAge = value; }
    }
    private string UserCountry;

    public string UserCountry1
    {
        get { return UserCountry; }
        set { UserCountry = value; }
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }
}
