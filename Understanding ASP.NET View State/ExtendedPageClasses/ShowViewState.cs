using System;
using System.Collections;
using System.Text;
using System.IO;
using System.Web.UI;

namespace ViewStateArticle.ExtendedPageClasses
{
	/// <summary>
	/// Extends the System.Web.UI.Page class, overriding the SavePageStateToPersistentMedium() method.
	/// Utilizes the <see cref="ViewStateParser"/> class to display the view state object graph via
	/// Response.Write() statements.
	/// </summary>
	public class ShowViewState : Page
	{
		#region Methods
		/// <summary>
		/// Called by the page to persist the view state to some medium.
		/// </summary>
		/// <param name="viewState">The view state object.</param>
		protected override void SavePageStateToPersistenceMedium(object viewState)
		{
			// Persist the view state to the hidden form field (default behavior)
			base.SavePageStateToPersistenceMedium (viewState);

			// display the viewState
			Response.Write("<p><hr /></p><h1>Saving the Following ViewState...</h1>");
			DisplayViewState(viewState);
			Response.Write("<p><hr /></p>");
		}

		/// <summary>
		/// Uses the <see cref="ViewStateParser"/> class to display the view state object graph
		/// </summary>
		/// <param name="viewState"></param>
		protected virtual void DisplayViewState(object viewState)
		{
			StringWriter writer = new StringWriter();

			Response.Write("<br />ViewState Object Graph:<pre>");

			ViewStateParser p = new ViewStateParser(writer);
			p.IndentString = this.IndentString;
			p.ParseViewStateGraph(viewState);

			Response.Write(writer.ToString());
            
			Response.Write("</pre></p>");
		}
		#endregion

		#region Properties
		/// <summary>
		/// Specifies the indentation to use for each level when displaying the object graph.
		/// </summary>
		/// <value>A string value; the default is three blank spaces.</value>
		public string IndentString
		{
			get
			{
				object o = ViewState["IndentString"];
				if (o != null)
					return o.ToString();
				else
					return "   ";
			}
			set
			{
				ViewState["IndentString"] = value;
			}
		}
		#endregion
	}
}
