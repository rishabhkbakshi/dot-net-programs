using System;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.IO;
using System.Drawing;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

namespace ViewStateArticle
{
	/// <summary>
	/// Summary description for LightDataGrid_WithFeatures.
	/// </summary>
	public class LightDataGrid_WithFeatures : System.Web.UI.Page
	{
		protected System.Web.UI.WebControls.Button Button1;
		protected System.Web.UI.WebControls.DataGrid dgFiles;
	
		private void Page_Load(object sender, System.EventArgs e)
		{
			// Since view state is disabled, need to rebind data to DataGrid on every page load
			BindData();	
		}

		private void BindData()
		{
			// Sorts the FileInfo array based on the SortExpression...
			DirectoryInfo dirInfo = new DirectoryInfo(Request.PhysicalApplicationPath);
			FileInfo [] files = dirInfo.GetFiles();
			Array.Sort(files, new FileSorter(SortExpression));
			dgFiles.DataSource = files;
			dgFiles.DataBind();
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
			this.dgFiles.SortCommand += new System.Web.UI.WebControls.DataGridSortCommandEventHandler(this.dgFiles_Sort);
			this.Load += new System.EventHandler(this.Page_Load);

		}
		#endregion

		private void dgFiles_Sort(object source, System.Web.UI.WebControls.DataGridSortCommandEventArgs e)
		{
			// Store the sort expression in the Page-level ViewState StateBag
			SortExpression = e.SortExpression;

			BindData();
		}

		/// <summary>
		/// Persists the sort expression in a Page-level ViewState variable
		/// (As opposed to having to store the entire DataGrid's viewstate)
		/// </summary>
		private string SortExpression
		{
			get
			{
				string se = (string) ViewState["SortExpression"];
				if (se == null)
					return "Name";
				else
					return se;
			}
			set
			{
				ViewState["SortExpression"] = value;
			}
		}
	}


	/// <summary>
	/// Helper class used for sorting the FileInfo array by Name or by File Size
	/// </summary>
	public class FileSorter : IComparer
	{
		private string sortExpr;
		public FileSorter(string sortExpr)
		{
			this.sortExpr = sortExpr;
		}
		#region IComparer Members

		public int Compare(object x, object y)
		{
			FileInfo a = (FileInfo) x;
			FileInfo b = (FileInfo) y;

			if (sortExpr == "Name")
				return a.Name.CompareTo(b.Name);
			else
				return a.Length.CompareTo(b.Length);
		}

		#endregion
	}
}
