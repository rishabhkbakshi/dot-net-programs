using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class _Default : System.Web.UI.Page 
{
    protected void Page_Load(object sender, EventArgs e)
    {
       
    }

    protected void UpdateButtonClick(object sender, EventArgs e)
    {
        DateTimeLabel1.Text = DateTime.Now.ToString();
        
    }
    protected void UpdateButton_Click(object sender, EventArgs e)
    {
        DateTimeLabel2.Text = DateTime.Now.ToString();
    }

    protected void Time(object sender, EventArgs e)
    {
        DateTimeLabel1.Text = DateTime.Now.ToLongTimeString();
        DateTimeLabel2.Text = DateTime.Now.ToLongTimeString();
    }
}
