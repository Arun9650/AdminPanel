using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Admin_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnlogin_Click(object sender, EventArgs e)
    {
        try
        {
            using (SqlConnection con = new SqlConnection(Connection.ConnView))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("aspCheckadminlogin", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@aname", txtadmin.Text);
                cmd.Parameters.AddWithValue("@apwd", txtpwd.Text);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if(dt.Rows.Count == 1)
                {
                    Session["Admin"] = dt.Rows[0]["adminid"].ToString();
                    Response.Redirect("frmDashboard.aspx");
                }
                else
                {
                    ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), "hwa", "swal('Oops!','Invalid Admin','error').then();", true);
                }

                con.Close();
            }
        }
        catch(Exception ex)
        {
            ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), "window", "alert(" + ex.Message.ToString()+")",true);
        }
    }
}