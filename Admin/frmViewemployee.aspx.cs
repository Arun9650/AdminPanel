using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Admin_frmViewemployee : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            this.ViewEmployees();
            Session["Empid"] = null;
        }
    }

    protected void ViewEmployees()
    {
        try
        {
            using (SqlConnection con = new SqlConnection(Connection.ConnView))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("aspGetEmployees", con);
                cmd.CommandType = CommandType.StoredProcedure;
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);            
                gvEmployee.DataSource = dt;
                gvEmployee.DataBind();
                con.Close();
            }
        }
        catch (Exception ex)
        {
            lblerror.Text = ex.Message.ToString();
        }
    }

    protected void gvEmployee_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvEmployee.PageIndex = e.NewPageIndex;
        this.ViewEmployees();
    }

    protected void gvEmployee_RowEditing(object sender, GridViewEditEventArgs e)
    {
        Session["Empid"] = gvEmployee.DataKeys[e.NewEditIndex].Value.ToString();
        Response.Redirect("frmEmpdetails.aspx");       
    } 

    protected void gvEmployee_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        try
        {
            int empid = Convert.ToInt32(gvEmployee.DataKeys[e.RowIndex].Value.ToString());
            using (SqlConnection con = new SqlConnection(Connection.ConnView))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("aspUpdateEmpstatus", con);
                cmd.CommandType = CommandType.StoredProcedure;              
                cmd.Parameters.AddWithValue("@empid", empid);
                cmd.ExecuteNonQuery();
                this.ViewEmployees();
                con.Close();
            }
        }
        catch (Exception ex)
        {
            lblerror.Text = ex.Message.ToString();
        }
    }

}