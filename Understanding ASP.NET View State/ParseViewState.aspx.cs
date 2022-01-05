using System;
using System.IO;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using ViewStateArticle.ExtendedPageClasses;
using System.Web.UI.HtmlControls;

namespace ViewStateArticle
{
	/// <summary>
	/// Summary description for ParseViewState.
	/// </summary>
	public class ParseViewState : System.Web.UI.Page
	{
		protected System.Web.UI.WebControls.TextBox txtViewState;
		protected System.Web.UI.WebControls.Literal ltlViewState;
		protected System.Web.UI.WebControls.Button btnParse;
	
		private void Page_Load(object sender, System.EventArgs e)
		{
			// Put user code to initialize the page here
		}

		#region Web Form Designer generated code
		override protected void OnInit(EventArgs e)
		{
			//
			// CODEGEN: This call is required by the ASP.NET Web Form Designer.
			//
			InitializeComponent();
			base.OnInit(e);
		}
		
		/// <summary>
		/// Required method for Designer support - do not modify
		/// the contents of this method with the code editor.
		/// </summary>
		private void InitializeComponent()
		{    
			this.btnParse.Click += new System.EventHandler(this.btnParse_Click);
			this.Load += new System.EventHandler(this.Page_Load);

		}
		#endregion

		private void btnParse_Click(object sender, System.EventArgs e)
		{
			// parse the viewState
			StringWriter writer = new StringWriter();
			ViewStateParser p = new ViewStateParser(writer);

			p.ParseViewStateGraph(txtViewState.Text);
			ltlViewState.Text = writer.ToString();
		}
	}
}
