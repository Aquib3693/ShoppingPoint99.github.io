using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Admin_UnitMaster : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["myCon"].ToString());
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            ShowUnitGrid();
        }
    }

    public void ShowUnitGrid()
    {
        SqlCommand cmd = new SqlCommand("SELECT * from UnitMaster where IsDeleted='NO' order by UnitName", con);
        SqlDataAdapter dad = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        dad.Fill(dt);
        gvwUnitRecord.DataSource = dt;
        gvwUnitRecord.DataBind();
    }

    protected void btnGUpdate_Click1(object sender, ImageClickEventArgs e)
    {
        ImageButton btn = (ImageButton)sender;
        //Get the row that contains this button
        GridViewRow gvr = (GridViewRow)btn.NamingContainer;

        Label Label1 = (Label)gvwUnitRecord.Rows[gvr.RowIndex].FindControl("Label1"); //stateid
        TextBox txtGUnitName = (TextBox)gvwUnitRecord.Rows[gvr.RowIndex].FindControl("txtGUnitName");
        if (con.State == ConnectionState.Closed)
        {
            con.Open();
        }
        SqlCommand cmd = new SqlCommand("update UnitMaster set UnitName=@UnitName where UnitID=@UnitID", con);

        cmd.Parameters.AddWithValue("UnitName", txtGUnitName.Text);
        cmd.Parameters.AddWithValue("UnitID", Label1.Text);

        int i = cmd.ExecuteNonQuery();
        if (con.State == ConnectionState.Open)
        {
            con.Close();
        }

        txtGUnitName.Focus();
        ShowUnitGrid();
    }
    protected void btnGDelete_Click1(object sender, ImageClickEventArgs e)
    {
        ImageButton btn = (ImageButton)sender;

        //Get the row that contains this button
        GridViewRow gvr = (GridViewRow)btn.NamingContainer;

        Label Label1 = (Label)gvwUnitRecord.Rows[gvr.RowIndex].FindControl("Label1");
        if (con.State == ConnectionState.Closed)
        {
            con.Open();
        }
        SqlCommand cmd = new SqlCommand("update UnitMaster set IsDeleted='YES' where UnitID=@UnitID", con);
        cmd.Parameters.AddWithValue("UnitID", Label1.Text);

        int i = cmd.ExecuteNonQuery();
        if (con.State == ConnectionState.Open)
        {
            con.Close();
        }

        ShowUnitGrid();
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        SqlDataAdapter cmd = new SqlDataAdapter("exec InsertUnit '" + txtUnitName.Text.Trim() + "','" + Session["adminlogin"].ToString() + "';", con);
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

        ShowUnitGrid();
    }
    protected void btnReset_Click(object sender, EventArgs e)
    {
        Response.Redirect(Request.RawUrl);
    }
    
    protected void gvwUnitRecord_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvwUnitRecord.PageIndex = e.NewPageIndex;
        ShowUnitGrid();
    }
}