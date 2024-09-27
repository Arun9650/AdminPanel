using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Admin_frmEmpdetails : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["Empid"] != null)
            {
                int iempid = Convert.ToInt32(Session["Empid"].ToString());
                this.ViewEmployeeDetails(iempid);
            }
        }
    }

    protected void ViewEmployeeDetails(int iemp)
    {
        try
        {
            using (SqlConnection con = new SqlConnection(Connection.ConnView))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("aspGetEmpDetails", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@empid", iemp);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if(dt.Rows.Count == 1)
                {
                    txtempname.Text = dt.Rows[0]["empname"].ToString();
                    txtempnumber.Text = dt.Rows[0]["empphoneno"].ToString();
                    txtusername.Text = dt.Rows[0]["empusername"].ToString();
                    txtusername.ReadOnly = true;
                    txtemppwd.Text = dt.Rows[0]["emppassword"].ToString();
                    txtempemail.Text = dt.Rows[0]["empemailid"].ToString();
                }
                con.Close();
            }
        }
        catch (Exception ex)
        {
            lblerror.Text = ex.Message.ToString();
        }
    }

    protected int UpdateEmployeedetails()
    {
        try
        {
            int count = 0;
            if (Session["Empid"] != null)
            {
                SqlConnection con = new SqlConnection(Connection.ConnView);
                con.Open();
                SqlCommand cmd = new SqlCommand("aspGetEmpDetails", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@empid", Convert.ToInt32(Session["Empid"].ToString()));
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                con.Close();
                count = dt.Rows.Count;
            }
            return count;
        }
        catch (Exception ex)
        {
            lblerror.Text = ex.Message.ToString();
            return -1;
        }
    }

    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        try
        {
            lblerror.Text = "";
            btnsubmit.Enabled = false;
            if (this.CheckEmpUsername() == 0)
            { 
                //insert
                using (SqlConnection con = new SqlConnection(Connection.ConnView))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("aspInsertEmpDetails", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@empname", txtempname.Text);
                    cmd.Parameters.AddWithValue("@empnumber", txtempnumber.Text);
                    cmd.Parameters.AddWithValue("@empuser", txtusername.Text);
                    cmd.Parameters.AddWithValue("@empwd", txtemppwd.Text);
                    cmd.Parameters.AddWithValue("@empemail", txtempemail.Text);
                    cmd.Parameters.AddWithValue("@status", "Active");
                    cmd.ExecuteNonQuery();                   
                    con.Close();                    
                    ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), "hwa", "swal('WOW!','One Record Inserted.','success').then();", true);
                    txtempname.Text = txtempnumber.Text = txtusername.Text = txtemppwd.Text = txtempemail.Text = "";
                    btnsubmit.Enabled = true;
                }
            }
            else if(this.CheckEmpUsername() == 1 && this.UpdateEmployeedetails() == 1)
            {
                //update  
                using (SqlConnection con=new SqlConnection(Connection.ConnView))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("uspupdateEmployeedetails", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@empname", txtempname.Text);
                    cmd.Parameters.AddWithValue("@empnumber", txtempnumber.Text);               
                    cmd.Parameters.AddWithValue("@empwd", txtemppwd.Text);
                    cmd.Parameters.AddWithValue("@empemail", txtempemail.Text);
                    cmd.Parameters.AddWithValue("@empid", Convert.ToInt32(Session["Empid"].ToString()));
                    cmd.ExecuteNonQuery();                   
                    con.Close();
                    ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), "hwa", "swal('WOW!','One Record Updated.','success').then();", true);
                    btnsubmit.Enabled = true;
                    Response.Redirect("frmViewemployee.aspx");
                } 
            }
            else if(this.CheckEmpUsername() == 1)
            {
                 ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), "hwa", "swal('Oops!','UserName Already Existed.','error').then();", true);
                btnsubmit.Enabled = true;
            }
        }
        catch (Exception ex)
        {
            lblerror.Text = ex.Message.ToString();
        }
    }

    protected int CheckEmpUsername()
    {
        try
        {
            using (SqlConnection con = new SqlConnection(Connection.ConnView))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("aspCheckempUsername", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@empUser", txtusername.Text);
                int t = Convert.ToInt32(cmd.ExecuteScalar().ToString());                
                con.Close();
                return t;
            }
        }
        catch (Exception ex)
        {
            lblerror.Text = ex.Message.ToString();
            return -1;
        }
    }

}