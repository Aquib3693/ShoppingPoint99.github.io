using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Admin_CategoryMaster : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["myCon"].ToString());
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            ShowCategoryGrid();
            ShowCategoryID();
        }
    }

    public void ShowCategoryGrid()
    {
        SqlCommand cmd = new SqlCommand("SELECT * from NLevelCategories where IsDeleted='NO' order by ParentCategoryID;", con);
        SqlDataAdapter dad = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        dad.Fill(dt);
        gvwCategoryRecord.DataSource = dt;
        gvwCategoryRecord.DataBind();

        if (dt.Rows.Count > 0)
        {
            for (int i = 0; i < gvwCategoryRecord.Rows.Count; i++)
            {
                DropDownList ddlGPCategoryName = (DropDownList)gvwCategoryRecord.Rows[i].FindControl("ddlGPCategoryName");
                Label Label2 = (Label)gvwCategoryRecord.Rows[i].FindControl("Label2");
                ddlGPCategoryName.DataSource = dt;
                ddlGPCategoryName.DataTextField = "CategoryName";
                ddlGPCategoryName.DataValueField = "CategoryID";
                ddlGPCategoryName.DataBind();
                ddlGPCategoryName.Items.Insert(0, new ListItem("New Category", "0"));
                ddlGPCategoryName.Items.Insert(0, new ListItem("Select Category", "-1"));
                ddlGPCategoryName.SelectedValue = Label2.Text;

            }


        }
    }

    public void ShowCategoryID()
    {
        SqlCommand com = new SqlCommand("select * from NLevelCategories where IsDeleted='NO' order by ParentCategoryID", con);
        SqlDataAdapter dad = new SqlDataAdapter(com);
        DataTable dt = new DataTable();
        dad.Fill(dt);

        ddlPCategory.DataSource = dt;
        ddlPCategory.Items.Clear();
        ddlPCategory.DataTextField = "CategoryName";
        ddlPCategory.DataValueField = "CategoryID";
        ddlPCategory.DataBind();
        ddlPCategory.Items.Insert(0, new ListItem("New Category", "0"));
        ddlPCategory.Items.Insert(0, new ListItem("Select Category", "-1"));

        dt.Dispose();
        dad.Dispose();
        com.Dispose();
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        SqlDataAdapter cmd = new SqlDataAdapter("exec InsertCategory '" + ddlPCategory.SelectedValue + "','" + txtCategoryName.Text.Trim() + "','" + Session["adminlogin"].ToString() + "';", con);
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
        ShowCategoryGrid();
        ShowCategoryID();
    }
    protected void btnReset_Click(object sender, EventArgs e)
    {
        Response.Redirect(Request.RawUrl);
    }
    protected void gvwCategoryRecord_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvwCategoryRecord.PageIndex = e.NewPageIndex;
        ShowCategoryGrid();

    }

    protected void btnGUpdate_Click(object sender, EventArgs e)
    {
        ImageButton btn = (ImageButton)sender;

        //Get the row that contains this button
        GridViewRow gvr = (GridViewRow)btn.NamingContainer;

        Label Label1 = (Label)gvwCategoryRecord.Rows[gvr.RowIndex].FindControl("Label1"); 
        DropDownList ddlGPCategoryName = (DropDownList)gvwCategoryRecord.Rows[gvr.RowIndex].FindControl("ddlGPCategoryName");
        TextBox txtCategoryName = (TextBox)gvwCategoryRecord.Rows[gvr.RowIndex].FindControl("txtCategoryName");
        if (con.State == ConnectionState.Closed)
        {
            con.Open();
        }
        SqlCommand cmd = new SqlCommand("update NLevelCategories set CategoryName=@CategoryName,ParentCategoryID='" + ddlGPCategoryName.SelectedValue + "' where CategoryID=@CategoryID", con);

        cmd.Parameters.AddWithValue("CategoryName", txtCategoryName.Text);
        cmd.Parameters.AddWithValue("CategoryID", Label1.Text);

        int i = cmd.ExecuteNonQuery();
        if (con.State == ConnectionState.Open)
        {
            con.Close();
        }

        txtCategoryName.Focus();
        ShowCategoryGrid();
        ShowCategoryID();
    }
    protected void btnGDelete_Click(object sender, EventArgs e)
    {
        ImageButton btn = (ImageButton)sender;

        //Get the row that contains this button
        GridViewRow gvr = (GridViewRow)btn.NamingContainer;

        Label Label1 = (Label)gvwCategoryRecord.Rows[gvr.RowIndex].FindControl("Label1");
        if (con.State == ConnectionState.Closed)
        {
            con.Open();
        }
        SqlCommand cmd = new SqlCommand("update NLevelCategories set IsDeleted='YES' where CategoryID=@CategoryID", con);
        cmd.Parameters.AddWithValue("CategoryID", Label1.Text);

        int i = cmd.ExecuteNonQuery();
        if (con.State == ConnectionState.Open)
        {
            con.Close();
        }

        ShowCategoryGrid();
        ShowCategoryID();
    }
    
}