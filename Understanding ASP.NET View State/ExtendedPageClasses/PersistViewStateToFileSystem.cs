using System;
using System.Collections;
using System.Text;
using System.IO;
using System.Web.UI;

namespace ViewStateArticle.ExtendedPageClasses
{
	/// <summary>
	/// Persists a page's view state to the Web server's file system.
	/// </summary>
	/// <remarks>
	/// This class names the files on the Web server based on the user's SessionID and the requested URL.
	/// Hence, this approach will not work for users whose browsers do not accept cookies. (Their experience
	/// will be the same as if you had added EnableViewState="False" in the @Page directive...)
	/// </remarks>
	public class PersistViewStateToFileSystem : Page
	{
		/// <summary>
		/// Saves the view state to the Web server file system.
		/// </summary>
		protected override void SavePageStateToPersistenceMedium(object viewState)
		{
			// save the view state to disk based on the user's session ID and the URL

			// serialize the view state into a base-64 encoded string
			LosFormatter los = new LosFormatter();
			StringWriter writer = new StringWriter();

			los.Serialize(writer, viewState);

			// save the string to disk
			StreamWriter sw = File.CreateText(ViewStateFilePath);
			sw.Write(writer.ToString());
			sw.Close();
		}

		/// <summary>
		/// Loads the page's view state from the Web server's file system.
		/// </summary>
		protected override object LoadPageStateFromPersistenceMedium()
		{
			// determine the file to access
			if (!File.Exists(ViewStateFilePath))
				return null;
			else
			{
				// open the file
				StreamReader sr = File.OpenText(ViewStateFilePath);
				string viewStateString = sr.ReadToEnd();
				sr.Close();

				// deserialize the string
				LosFormatter los = new LosFormatter();
				return los.Deserialize(viewStateString);
			}
		}

		/// <summary>
		/// The path for this user's/page's view state information.
		/// </summary>
		public string ViewStateFilePath
		{
			get
			{
				string folderName = Path.Combine(Request.PhysicalApplicationPath, "PersistedViewState");
				string fileName = Session.SessionID + "-" + Path.GetFileNameWithoutExtension(Request.Path).Replace("/", "-") + ".vs";

				return Path.Combine(folderName, fileName);
			}
		}
	}
}
