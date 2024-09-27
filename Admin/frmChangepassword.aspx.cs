using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Admin_frmChangepassword : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        try
        {
            if (txtconform.Text == txtnew.Text)
            {
                using (SqlConnection con = new SqlConnection(Connection.ConnView))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("aspChangeAdminpassword", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@aid", Convert.ToInt32(Session["Admin"].ToString()));
                    cmd.Parameters.AddWithValue("@pwd", txtconform.Text);
                    cmd.Parameters.AddWithValue("@old", txtold.Text);
                    int i = Convert.ToInt32(cmd.ExecuteScalar().ToString());
                    con.Close();
                    if (i == 0)
                    {                      
                        ScriptManager.RegisterStartupScript(mypanel, mypanel.GetType(), "hwa", "swal('Oops!','Old Password is not Matching.','error').then();", true);
                    }
                    else if (i == 1)
                    {                        
                        ScriptManager.RegisterStartupScript(mypanel, mypanel.GetType(), "hwa", "swal('wow!','Password Updated.','success').then();", true);
                    }
                }
            }
            else
            {                
                ScriptManager.RegisterStartupScript(mypanel, mypanel.GetType(), "hwa", "swal('Oops!','new password and conform password is not matching.','error').then();", true);
            }
        }
        catch (Exception ex)
        {
            lblerror.Text = ex.Message.ToString();
        }
    }
}