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
    [System.Web.Services.WebMethod]
    [System.Web.Script.Services.ScriptMethod]
    public static AjaxControlToolkit.Slide[] GetSlides()
    {
        AjaxControlToolkit.Slide[] imgSlide = new AjaxControlToolkit.Slide[4];

        imgSlide[0] = new AjaxControlToolkit.Slide("images/Blue hills.jpg", "Autumn", "Autumn Leaves");
        imgSlide[1] = new AjaxControlToolkit.Slide("images/nature02.jpg", "Creek", "Creek");
        imgSlide[2] = new AjaxControlToolkit.Slide("images/Sunset.jpg", "Landscape", "Landscape");
        imgSlide[3] = new AjaxControlToolkit.Slide("images/Water lilies.jpg", "Dock", "Dock");

        return (imgSlide);
    }
}