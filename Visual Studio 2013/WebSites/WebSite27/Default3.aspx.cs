using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.Services;


public partial class Default3 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    [WebMethod]
    public static string InsertData(string username, string subj, string desc)
    {
        string msg = string.Empty;
        using (SqlConnection con = new SqlConnection("Data Source=SureshDasari;Integrated Security=true;Initial Catalog=MySampleDB"))
        {
            using (SqlCommand cmd = new SqlCommand("insert into TEMP_User(Name,Subject,Description) VALUES(@name,@subject,@desc)", con))
            {
                con.Open();
                cmd.Parameters.AddWithValue("@name", username);
                cmd.Parameters.AddWithValue("@subject", subj);
                cmd.Parameters.AddWithValue("@desc", desc);
                int i = cmd.ExecuteNonQuery();
                con.Close();
                if (i == 1)
                {
                    msg = "true";
                }
                else
                {
                    msg = "false";
                }
            }
        }
        return msg;
    }
}