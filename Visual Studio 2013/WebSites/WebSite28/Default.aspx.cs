﻿using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

public partial class _Default : System.Web.UI.Page 
{
     private SqlConnection con = new SqlConnection("Data Source=SureshDasari;Integrated Security=true;Initial Catalog=MySampleDB");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindEmployeeDetails();
            }
        }
        protected void BindEmployeeDetails()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("Select * from Employee_Details", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
            con.Close();
            if (ds.Tables[0].Rows.Count > 0)
            {
                gvDetails.DataSource = ds;
                gvDetails.DataBind();
            }
            else
            {
                ds.Tables[0].Rows.Add(ds.Tables[0].NewRow());
                gvDetails.DataSource = ds;
                gvDetails.DataBind();
                int columncount = gvDetails.Rows[0].Cells.Count;
                gvDetails.Rows[0].Cells.Clear();
                gvDetails.Rows[0].Cells.Add(new TableCell());
                gvDetails.Rows[0].Cells[0].ColumnSpan = columncount;
                gvDetails.Rows[0].Cells[0].Text = "No Records Found";
            }

        }

        protected void gvDetails_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvDetails.EditIndex = e.NewEditIndex;
            BindEmployeeDetails();
        }

        protected void gvDetails_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int userid = Convert.ToInt32(gvDetails.DataKeys[e.RowIndex].Value.ToString());
            string username = gvDetails.DataKeys[e.RowIndex].Values["UserName"].ToString();
            TextBox txtcity = (TextBox)gvDetails.Rows[e.RowIndex].FindControl("txtcity");
            TextBox txtDesignation = (TextBox)gvDetails.Rows[e.RowIndex].FindControl("txtstate");
            con.Open();
            SqlCommand cmd = new SqlCommand("update Employee_Details set City='" + txtcity.Text + "',Designation='" + txtDesignation.Text + "' where UserId=" + userid, con);
            cmd.ExecuteNonQuery();
            con.Close();
            lblresult.ForeColor = Color.Green;
            lblresult.Text = username + " Details Updated successfully";
            gvDetails.EditIndex = -1;
            BindEmployeeDetails();
        }

        protected void gvDetails_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvDetails.EditIndex = -1;
            BindEmployeeDetails();
        }

        protected void gvDetails_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int userid = Convert.ToInt32(gvDetails.DataKeys[e.RowIndex].Values["UserId"].ToString());
            string username = gvDetails.DataKeys[e.RowIndex].Values["UserName"].ToString();
            con.Open();
            SqlCommand cmd = new SqlCommand("delete from Employee_Details where UserId=" + userid, con);
            int result = cmd.ExecuteNonQuery();
            con.Close();
            if (result == 1)
            {
                BindEmployeeDetails();
                lblresult.ForeColor = Color.Red;
                lblresult.Text = username + " details deleted successfully";
            }
        }

        protected void gvDetails_RowDataBound(object sender, GridViewRowEventArgs e)
        {
          
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                //getting username from particular row
                string username = Convert.ToString(DataBinder.Eval(e.Row.DataItem, "UserName"));
                //identifying the control in gridview
                ImageButton lnkbtnresult = (ImageButton)e.Row.FindControl("imgbtnDelete");
                //raising javascript confirmationbox whenver user clicks on link button
                if (lnkbtnresult != null)
                {
                    lnkbtnresult.Attributes.Add("onclick", "javascript:return ConfirmationBox('" + username + "')");
                }

            }
        }

        protected void gvDetails_RowCommand(object sender, GridViewCommandEventArgs e)
        {
           if(e.CommandName.Equals("AddNew"))
           {
               TextBox txtUsrname = (TextBox)gvDetails.FooterRow.FindControl("txtftrusrname");
               TextBox txtCity = (TextBox)gvDetails.FooterRow.FindControl("txtftrcity");
               TextBox txtDesgnation = (TextBox) gvDetails.FooterRow.FindControl("txtftrDesignation");
               con.Open();
               SqlCommand cmd =
                   new SqlCommand(
                       "insert into Employee_Details(UserName,City,Designation) values('" + txtUsrname.Text + "','" +
                       txtCity.Text + "','" + txtDesgnation.Text + "')", con);
              int result= cmd.ExecuteNonQuery();
              con.Close();
               if(result==1)
               {
                   BindEmployeeDetails();
                   lblresult.ForeColor = Color.Green;
                   lblresult.Text = txtUsrname.Text + " Details inserted successfully";
               }
               else
               {
                   lblresult.ForeColor = Color.Red;
                   lblresult.Text = txtUsrname.Text + " Details not inserted"; 
               }
               

           }
            

        }

    }


