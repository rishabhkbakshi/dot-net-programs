﻿using System;
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
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        
    }
    protected void ddlMessage_SelectedIndexChanged(object sender, EventArgs e)
    {
        lblMessage.Text = ddlMessage.SelectedValue;
    }
}
