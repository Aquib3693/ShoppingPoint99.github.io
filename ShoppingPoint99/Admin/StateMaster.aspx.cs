using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
public partial class Admin_StateMaster : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["myCon"].ToString());
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            ShowStateGrid();
            ShowCountry();
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

   
    protected void btnSave_Click(object sender, EventArgs e)
    {
        SqlDataAdapter cmd = new SqlDataAdapter("exec InsertState '" + ddlCountry.SelectedValue + "','" + txtState.Text.Trim() + "','" + Session["adminlogin"].ToString() + "';", con);
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

        ShowStateGrid();
    }
    protected void btnReset_Click(object sender, EventArgs e)
    {
        Response.Redirect(Request.RawUrl);
    }


    public void ShowStateGrid()
    {

        SqlDataAdapter dad = new SqlDataAdapter("SELECT a.CountryID,a.CountryName,b.StateName,b.StateID FROM [dbo].[CountryMaster]a INNER JOIN [dbo].[StateMaster]b ON a.CountryID = b.CountryID where a.IsDeleted='NO' and b.IsDeleted='NO' order by StateName", con);
        DataTable dt = new DataTable();
        dad.Fill(dt);
        gvwStateRecord.DataSource = dt;
        gvwStateRecord.DataBind();

        dt.Dispose();
        dad.Dispose();
             
    }
  
 
  
    protected void btnGUpdate_Click(object sender, EventArgs e)
    {
        ImageButton btn = (ImageButton)sender;

        //Get the row that contains this button
        GridViewRow gvr = (GridViewRow)btn.NamingContainer;

        Label Label1 = (Label)gvwStateRecord.Rows[gvr.RowIndex].FindControl("Label1"); //stateid
        TextBox txtGStateName = (TextBox)gvwStateRecord.Rows[gvr.RowIndex].FindControl("txtGStateName");
        if(con.State==ConnectionState.Closed)
        { 
            con.Open();
        }
        SqlCommand cmd = new SqlCommand("update StateMaster set StateName=@StateName where StateID=@Stateid", con);

        cmd.Parameters.AddWithValue("StateName", txtGStateName.Text);
        cmd.Parameters.AddWithValue("StateID", Label1.Text);

        int i = cmd.ExecuteNonQuery();
        if (con.State == ConnectionState.Open)
        {
            con.Close();
        }

        txtGStateName.Focus();
        ShowStateGrid();

    }
    protected void btnGDelete_Click(object sender, EventArgs e)
    {
        ImageButton btn = (ImageButton)sender;

        //Get the row that contains this button
        GridViewRow gvr = (GridViewRow)btn.NamingContainer;

        Label Label1 = (Label)gvwStateRecord.Rows[gvr.RowIndex].FindControl("Label1"); //stateid
        if (con.State == ConnectionState.Closed)
        {
            con.Open();
        }
        SqlCommand cmd = new SqlCommand("update StateMaster set IsDeleted='YES' where StateID=@Stateid", con);
        cmd.Parameters.AddWithValue("StateID", Label1.Text);

        int i = cmd.ExecuteNonQuery();
        if (con.State == ConnectionState.Open)
        {
            con.Close();
        }


        ShowStateGrid();
    }

    protected void gvwStateRecord_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvwStateRecord.PageIndex = e.NewPageIndex;
        ShowStateGrid();        
    }
}