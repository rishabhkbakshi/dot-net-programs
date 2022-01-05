using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class WebUserControl : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Calendar1.Visible = false;
        }
    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        if (Calendar1.Visible == true)
        {
            Calendar1.Visible = false;
            CalenderVisibilityChangedEventArgs visibilityChangedEventData = new CalenderVisibilityChangedEventArgs(false);
            OnCalenderVisibilityChanged(visibilityChangedEventData);
        }
        else
        {
            Calendar1.Visible = true;
            CalenderVisibilityChangedEventArgs visibilityChangedEventData = new CalenderVisibilityChangedEventArgs(true);
            OnCalenderVisibilityChanged(visibilityChangedEventData);
        }
    }
    protected void Calendar1_SelectionChanged(object sender, EventArgs e)
    {
        TextBox1.Text = Calendar1.SelectedDate.ToShortDateString();
        Calendar1.Visible = false;
        CalenderVisibilityChangedEventArgs visibilityChangedEventData = new CalenderVisibilityChangedEventArgs(false);
        OnCalenderVisibilityChanged(visibilityChangedEventData);
    }

    public string Date
    {
        get { return TextBox1.Text; }
        set { TextBox1.Text = value; }
    }

    public event CalenderVisibilityChangedEventArgs.CalenderVisibilityChangedEventHandler CalenderVisibilityChanged;

    protected virtual void OnCalenderVisibilityChanged(CalenderVisibilityChangedEventArgs e)
    {
        if (CalenderVisibilityChanged != null)
        {
            CalenderVisibilityChanged(this, e);
        }
    }
    protected void ddlLogic_SelectedIndexChanged(object sender, EventArgs e)
    {
        lblLogic.Text = ddlLogic.SelectedItem.Text;
    }

    public string Color
    {
        get { return ddlLogic.SelectedItem.Text; }
        set { ddlLogic.SelectedItem.Text = value; }
    }

    public string Value
    {
        get { return ddlLogic.SelectedValue; }
        set { ddlLogic.SelectedValue = value; }
    }
}

public class CalenderVisibilityChangedEventArgs : EventArgs
{
    private bool _isCalenderVisible;

    public bool IsCalenderVisible
    {
        get { return this._isCalenderVisible; }
    }

    public CalenderVisibilityChangedEventArgs(bool isCalenderVisible)
    {
        this._isCalenderVisible = isCalenderVisible;
    }

    public delegate void CalenderVisibilityChangedEventHandler(object sender, CalenderVisibilityChangedEventArgs e);
}
