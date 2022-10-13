using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Admin_BrandMaster : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["myCon"].ToString());
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            ShowBrandGrid();
        }
    }
    public void ShowBrandGrid()
    {
        SqlCommand cmd = new SqlCommand("SELECT * from BrandMaster where IsDeleted='NO' order by BrandName", con);
        SqlDataAdapter dad = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        dad.Fill(dt);
        gvwBrandRecord.DataSource = dt;
        gvwBrandRecord.DataBind();
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        SqlDataAdapter cmd = new SqlDataAdapter("exec InsertBrand '" + txtBrandName.Text.Trim() + "','" + Session["adminlogin"].ToString() + "';", con);
        DataTable dt = new DataTable();
        cmd.Fill(dt);
        string status = "";
        if (dt.Rows.Count > 0)
        {
            status = dt.Rows[0][0].ToString();
            if (status == "Success")
            {
                Response.Write("<script>alert('Record saved')</script>");
            }
            else
            {
                Response.Write("<script>alert('Record already exist.')</script>");
            }
        }
        else
        {
            Response.Write("<script>alert('Opps! there is some problem while save data.')</script>");
        }

        cmd.Dispose();

        ShowBrandGrid();
    }
    protected void btnReset_Click(object sender, EventArgs e)
    {
        Response.Redirect(Request.RawUrl);
    }
    protected void btnGUpdate_Click1(object sender, ImageClickEventArgs e)
    {
        ImageButton btn = (ImageButton)sender;
        //Get the row that contains this button
        GridViewRow gvr = (GridViewRow)btn.NamingContainer;

        Label Label1 = (Label)gvwBrandRecord.Rows[gvr.RowIndex].FindControl("Label1"); //stateid
        TextBox txtGBrandName = (TextBox)gvwBrandRecord.Rows[gvr.RowIndex].FindControl("txtGBrandName");
        if (con.State == ConnectionState.Closed)
        {
            con.Open();
        }
        SqlCommand cmd = new SqlCommand("update BrandMaster set BrandName=@BrandName where BrandID=@BrandID", con);

        cmd.Parameters.AddWithValue("BrandName", txtGBrandName.Text);
        cmd.Parameters.AddWithValue("BrandID", Label1.Text);

        int i = cmd.ExecuteNonQuery();
        if (con.State == ConnectionState.Open)
        {
            con.Close();
        }
        txtGBrandName.Focus();
        ShowBrandGrid();
    }
    protected void btnGDelete_Click1(object sender, ImageClickEventArgs e)
    {
        ImageButton btn = (ImageButton)sender;
        GridViewRow gvr = (GridViewRow)btn.NamingContainer;

        Label Label1 = (Label)gvwBrandRecord.Rows[gvr.RowIndex].FindControl("Label1");
        if (con.State == ConnectionState.Closed)
        {
            con.Open();
        }
        SqlCommand cmd = new SqlCommand("update BrandMaster set IsDeleted='YES' where BrandID=@BrandID", con);
        cmd.Parameters.AddWithValue("BrandID", Label1.Text);
        int i = cmd.ExecuteNonQuery();
        if (con.State == ConnectionState.Open)
        {
            con.Close();
        }

        ShowBrandGrid();
    }

    protected void gvwBrandRecord_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvwBrandRecord.PageIndex = e.NewPageIndex;
        ShowBrandGrid();
    }
}