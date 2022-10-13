using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Admin_CityMaster : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["myCon"].ToString());
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            ShowCountry();
            ShowCityGrid();
        } 
    }

    public void ShowCountry()
    {
        SqlCommand com = new SqlCommand("select * from CountryMaster where IsDeleted='NO' order by CountryName", con);
        SqlDataAdapter dad = new SqlDataAdapter(com);
        DataTable dt = new DataTable();
        dad.Fill(dt);

        ddlCountry.DataSource = dt;
        ddlCountry.Items.Clear();
        ddlCountry.DataTextField = "CountryName";
        ddlCountry.DataValueField = "CountryID";
        ddlCountry.DataBind();
        ddlCountry.Items.Insert(0, new ListItem("Select Country", "0"));

        dt.Dispose();
        dad.Dispose();
        com.Dispose();
    }

    public void ShowCityGrid()
    {
        SqlCommand cmd = new SqlCommand("SELECT a.CountryName,b.StateName,b.StateID,c.CityID,c.CityName FROM [dbo].[CountryMaster]a INNER JOIN [dbo].[StateMaster]b ON a.CountryID = b.CountryID inner join [dbo].[CityMaster]c on c.StateID=b.StateID where c.IsDeleted='NO' and b.IsDeleted='NO' and a.IsDeleted='NO' order by StateName;", con);
        SqlDataAdapter dad = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        dad.Fill(dt);
        gvwCityRecord.DataSource = dt;
        gvwCityRecord.DataBind();


        dt.Dispose();
        dad.Dispose();
        

    }

    public void showState()
    {
        SqlCommand com = new SqlCommand("select * from StateMaster where IsDeleted='NO' and CountryID='" + ddlCountry.SelectedValue + "' order by StateName", con);
        SqlDataAdapter dad = new SqlDataAdapter(com);
        DataTable dt = new DataTable();
        dad.Fill(dt);

        ddlState.DataSource = dt;
        ddlState.Items.Clear();
        ddlState.DataTextField = "StateName";
        ddlState.DataValueField = "StateID";
        ddlState.DataBind();
        ddlState.Items.Insert(0, new ListItem("Select State", "0"));

        dt.Dispose();
        dad.Dispose();
        com.Dispose();
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        SqlDataAdapter cmd = new SqlDataAdapter("exec InsertCity '" + ddlState.SelectedValue + "','" + txtCityName.Text.Trim() + "','" + Session["adminlogin"].ToString() + "';", con);
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

        ShowCityGrid();
    }
    protected void btnReset_Click(object sender, EventArgs e)
    {
        Response.Redirect(Request.RawUrl);
    }


    protected void ddlCountry_SelectedIndexChanged(object sender, EventArgs e)
    {
        showState();
    }

    protected void btnGUpdate_Click(object sender, EventArgs e)
    {
        ImageButton btn = (ImageButton)sender;

        //Get the row that contains this button
        GridViewRow gvr = (GridViewRow)btn.NamingContainer;

        Label Label1 = (Label)gvwCityRecord.Rows[gvr.RowIndex].FindControl("Label1");
        
        TextBox txtGCityName = (TextBox)gvwCityRecord.Rows[gvr.RowIndex].FindControl("txtGCityName");
        if (con.State == ConnectionState.Closed)
        {
            con.Open();
        }
        SqlCommand cmd = new SqlCommand("update CityMaster set CityName=@CityName where CityID=@CityID", con);

        cmd.Parameters.AddWithValue("CityName", txtGCityName.Text);
        cmd.Parameters.AddWithValue("CityID", Label1.Text);

        int i = cmd.ExecuteNonQuery();
        if (con.State == ConnectionState.Open)
        {
            con.Close();
        }

        txtGCityName.Focus();
        ShowCityGrid();

    }
    protected void btnGDelete_Click(object sender, EventArgs e)
    {
        ImageButton btn = (ImageButton)sender;

        //Get the row that contains this button
        GridViewRow gvr = (GridViewRow)btn.NamingContainer;

        Label Label1 = (Label)gvwCityRecord.Rows[gvr.RowIndex].FindControl("Label1");

        if (con.State == ConnectionState.Closed)
        {
            con.Open();
        }
        SqlCommand cmd = new SqlCommand("update CityMaster set IsDeleted='YES' where CityID=@CityID", con);
        cmd.Parameters.AddWithValue("CityID", Label1.Text);

        int i = cmd.ExecuteNonQuery();
        if (con.State == ConnectionState.Open)
        {
            con.Close();
        }


        ShowCityGrid();
    }
    protected void gvwCityRecord_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvwCityRecord.PageIndex = e.NewPageIndex;
        ShowCityGrid();
    }
}