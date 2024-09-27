using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using DocumentFormat.OpenXml;
using System.IO;
//using System.Xml.Linq;
using ClosedXML.Excel;


public partial class Admin_frmViewenquires : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            this.ViewEnquiryDetails();
            this.ViewEmployee();
            ViewState["Search"] = "All";
        }
    }

    protected void ViewEnquiryDetails()
    {
        try
        {
            using (SqlConnection con = new SqlConnection(Connection.ConnView))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("aspViewEnquirydetails", con);
                cmd.CommandType = CommandType.StoredProcedure;
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                gvenquiry.DataSource = dt;
                gvenquiry.DataBind();
                ViewState["Enquiry"] = dt;           
                con.Close();
            }
        }
        catch (Exception ex)
        {
            lblerror.Text = ex.Message.ToString();
        }
    }

    protected void gvenquiry_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        lblload.Visible = true;
        if (ViewState["Search"].ToString() == "All")
        {
            gvenquiry.PageIndex = e.NewPageIndex;
            this.ViewEnquiryDetails();
        }
        else if (ViewState["Search"].ToString() == "Search")
        {
            gvenquiry.PageIndex = e.NewPageIndex;
            this.ViewSearch();
        }
        else if (ViewState["Search"].ToString() == "Empwise")
        {
            gvenquiry.PageIndex = e.NewPageIndex;
            this.ViewEmpwiseEnquiry();
        }
        lblload.Visible = false;     
    }

    protected void btndatesearch_Click(object sender, EventArgs e)
    {
        try
        {
            lblload.Visible = true;
            lblerror.Text = "";
            ViewState["Search"] = "Search";
            this.ViewSearch();
            ddlemp.SelectedIndex = -1;
            lblload.Visible = false;
        }
        catch (Exception ex)
        {
            lblerror.Text = ex.Message.ToString();
        }
    }

    protected void ViewSearch()
    {
        using (SqlConnection con = new SqlConnection(Connection.ConnView))
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("aspViewDatewiseEnquity", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@from", txtfrom.Text);
            cmd.Parameters.AddWithValue("@to", txtto.Text);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            gvenquiry.DataSource = dt;
            gvenquiry.DataBind();
            ViewState["Enquiry"] = dt;
            con.Close();
        }
    }
    
    protected void ExporttoExcel(DataTable dt)
    {
        DataTable dtable = AssembleDatatable(dt);
        using (XLWorkbook wb = new XLWorkbook())
        {
            wb.Worksheets.Add(dtable, "Enquirysearch");
            Response.Clear();
            Response.Buffer = true;
            Response.Charset = "";
            Response.ContentType = "application/ms-excel";
            Response.AddHeader("content-disposition", "attachement;filename=EnquirySearch.xlsx");
            using (MemoryStream mstream = new MemoryStream())
            {
                wb.SaveAs(mstream);
                mstream.WriteTo(Response.OutputStream);
                Response.Flush();
                Response.End();
            }
        }
    }

    protected DataTable AssembleDatatable(DataTable dt)
    {
        DataTable dtable = new DataTable();
        dt.Columns.Remove("enquiryid");
        dt.Columns.Remove("empid");
        dt.Columns.Remove("latitude");
        dt.Columns.Remove("longitude");
        //foreach (DataColumn col in dt.Columns)
        //{
        //    dtable.Columns.Add(col.ColumnName);           
        //}          
        dtable.Columns.Add("Customer Name");
        dtable.Columns.Add("Phone Number");
        dtable.Columns.Add("Date Of Birth");
        dtable.Columns.Add("EmailID");
        dtable.Columns.Add("Address");
        dtable.Columns.Add("Entry Time");
        dtable.Columns.Add("Employee Name");

        for (int i = 0; i < dt.Rows.Count; i++)
        {
            DataRow dr = dtable.NewRow();         
            for (int j = 0; j < dt.Columns.Count; j++)
            {               
                dr[j] = dt.Rows[i][j].ToString();
            }
            dtable.Rows.Add(dr);
        }
        return dtable;
    }

    protected void ddlemp_SelectedIndexChanged(object sender, EventArgs e)
    {
        lblload.Visible = true;
        lblerror.Text = "";        
        ViewState["Search"] = "Empwise";
        this.ViewEmpwiseEnquiry();
        lblload.Visible = false;
       
    }

    protected void ViewEmpwiseEnquiry()
    {
        try
        {
            txtfrom.Text = txtto.Text = "";
            using (SqlConnection con = new SqlConnection(Connection.ConnView))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("aspViewEmpwiseEnquity", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@empid", Convert.ToInt32(ddlemp.SelectedValue));
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                gvenquiry.DataSource = dt;
                gvenquiry.DataBind();
                ViewState["Enquiry"] = dt;
                con.Close();
            }
        }
        catch (Exception ex)
        {
            lblerror.Text = ex.Message.ToString();
        }
    }

    protected void ViewEmployee()
    {
        try
        {
            using (SqlConnection con = new SqlConnection(Connection.ConnView))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("aspSelectEmployees", con);
                cmd.CommandType = CommandType.StoredProcedure;
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                ddlemp.DataSource = dt;
                ddlemp.DataBind();
                con.Close();
                ddlemp.Items.Insert(0, new ListItem("Select Employee","0"));
            }
        }
        catch (Exception ex)
        {
            lblerror.Text = ex.Message.ToString();
        }
    }
    
    protected void Button1_Click(object sender, EventArgs e)
    {
        DataTable dt = (DataTable)ViewState["Enquiry"];
        this.ExporttoExcel(dt);
    }

}