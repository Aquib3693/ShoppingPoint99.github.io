using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Admin_CountryMaster : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["myCon"].ToString());
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            ShowCountryGrid();
        }
    }
    public void ShowCountryGrid()
    {
        SqlCommand cmd = new SqlCommand("SELECT * from CountryMaster where IsDeleted='NO' order by CountryName", con);
        SqlDataAdapter dad = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        dad.Fill(dt);
        gvwCountryRecord.DataSource = dt;
        gvwCountryRecord.DataBind();

       
    }

    protected void btnReset_Click(object sender, EventArgs e)
    {
        Response.Redirect(Request.RawUrl);
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
               
        SqlDataAdapter cmd = new SqlDataAdapter("exec InsertCountry '" + txtCName.Text.Trim() + "','" + Session["adminlogin"].ToString() + "';", con);
        DataTable dt = new DataTable();
        cmd.Fill(dt);
        string status = "";
        if(dt.Rows.Count>0)
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

        ShowCountryGrid();
    }
    protected void gvwCountryRecord_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvwCountryRecord.PageIndex = e.NewPageIndex;
        ShowCountryGrid();
    }
    

    protected void btnGUpdate_Click1(object sender, ImageClickEventArgs e)
    {
        
        ImageButton btn = (ImageButton)sender;

        //Get the row that contains this button
        GridViewRow gvr = (GridViewRow)btn.NamingContainer;

        Label Label1 = (Label)gvwCountryRecord.Rows[gvr.RowIndex].FindControl("Label1"); //stateid
        TextBox txtGCountryName = (TextBox)gvwCountryRecord.Rows[gvr.RowIndex].FindControl("txtGCountryName");
        if (con.State == ConnectionState.Closed)
        {
            con.Open();
        }
        SqlCommand cmd = new SqlCommand("update CountryMaster set CountryName=@CountryName where CountryID=@CountryID", con);

        cmd.Parameters.AddWithValue("CountryName", txtGCountryName.Text);
        cmd.Parameters.AddWithValue("CountryID", Label1.Text);

        int i = cmd.ExecuteNonQuery();
        if (con.State == ConnectionState.Open)
        {
            con.Close();
        }
        txtGCountryName.Focus();
        ShowCountryGrid();
    }
    protected void btnGDelete_Click1(object sender, ImageClickEventArgs e)
    {
        ImageButton btn = (ImageButton)sender;

        //Get the row that contains this button
        GridViewRow gvr = (GridViewRow)btn.NamingContainer;

        Label Label1 = (Label)gvwCountryRecord.Rows[gvr.RowIndex].FindControl("Label1"); 
        if (con.State == ConnectionState.Closed)
        {
            con.Open();
        }
        SqlCommand cmd = new SqlCommand("update CountryMaster set IsDeleted='YES' where CountryID=@CountryID", con);
        cmd.Parameters.AddWithValue("CountryID", Label1.Text);

        int i = cmd.ExecuteNonQuery();
        if (con.State == ConnectionState.Open)
        {
            con.Close();
        }

        ShowCountryGrid();
    }
}