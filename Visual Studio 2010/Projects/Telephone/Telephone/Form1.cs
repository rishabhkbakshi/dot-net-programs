using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Data;

namespace Telephone
{
    public partial class EntryForm : Form
    {
        SqlConnection con = new SqlConnection("Data Source=.; User Id=sa; Password=sqlserver2008; Database=Window");
        public EntryForm()
        {
            InitializeComponent();
        }

        private void btnCancel_Click(object sender, EventArgs e)
        {
            
        }

        private void btnSubmit_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("usp_InsertRecord", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Fname", txtFname.Text);
            cmd.Parameters.AddWithValue("@Mname", txtMname.Text);
            cmd.Parameters.AddWithValue("@Lname", txtLname.Text);
            cmd.Parameters.AddWithValue("@Contact", txtContact.Text);
            //cmd.Parameters.AddWithValue("@FileName", txtContact.Text);
            //cmd.Parameters.AddWithValue("@FileSize", picBox.Image.Size);
            //cmd.Parameters.AddWithValue("@FileImage", picBox.Image);
            cmd.ExecuteNonQuery();
            con.Close();
        }
    }
}
