using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;



public partial class Admin_HighLight : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["myCon"].ToString());    

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            ShowProduct();
            ShowHighLightGrid();
        }
    }
    public void ShowProduct()
    {
        SqlCommand com = new SqlCommand("select * from ProductMaster where IsDeleted='NO' order by ProductName", con);
        SqlDataAdapter dad = new SqlDataAdapter(com);
        DataTable dt = new DataTable();
        dad.Fill(dt);

        ddllist.DataSource = dt;
        ddllist.Items.Clear();
        ddllist.DataTextField = "ProductName";
        ddllist.DataValueField = "ProductID";
        ddllist.DataBind();
        ddllist.Items.Insert(0, new ListItem("Select Product", "0"));

        dt.Dispose();
        dad.Dispose();
        com.Dispose();
    }
    public void ShowHighLightGrid()
    {
        SqlDataAdapter dad = new SqlDataAdapter("select a.productname,a.productid,b.HighlightID,b.H1,b.H2,b.H3,b.H4,b.H5 from productmaster a inner join highlight b on a.productid=b.productid where a.isdeleted='no'  ", con);
        DataTable dt = new DataTable();
        dad.Fill(dt);

        GridView1.DataSource = dt;
        GridView1.DataBind();
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {        
        SqlDataAdapter cmd = new SqlDataAdapter("exec InsertHighlight '" + ddllist.SelectedValue + "','" + txthlp1.Text.Trim() + "','" + txthlp2.Text.Trim() + "','" + txthlp3.Text.Trim() + "','" + txthlp4.Text.Trim() + "','" + txthlp5.Text.Trim() + "','"+Session["adminlogin"].ToString()+"';", con);
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

        ShowHighLightGrid();
    }

    
    protected void btnGvwQtyUpdate_Click(object sender, ImageClickEventArgs e)
    {

        ImageButton btn = (ImageButton)sender;

        //Get the row that contains this button
        GridViewRow gvr = (GridViewRow)btn.NamingContainer;

        Label lblHID = (Label)GridView1.Rows[gvr.RowIndex].FindControl("lblHID");
        TextBox h1 = (TextBox)GridView1.Rows[gvr.RowIndex].FindControl("TextBox1");
        TextBox h2 = (TextBox)GridView1.Rows[gvr.RowIndex].FindControl("TextBox2");
        TextBox h3 = (TextBox)GridView1.Rows[gvr.RowIndex].FindControl("TextBox3");
        TextBox h4 = (TextBox)GridView1.Rows[gvr.RowIndex].FindControl("TextBox4");
        TextBox h5 = (TextBox)GridView1.Rows[gvr.RowIndex].FindControl("TextBox5");
        TextBox h6 = (TextBox)GridView1.Rows[gvr.RowIndex].FindControl("TextBox6");
        if (con.State == ConnectionState.Closed)
        {
            con.Open();
        }
        SqlCommand cmd = new SqlCommand("update highlight set H1='" + h1.Text.Trim() + "',H2='" + h2.Text.Trim() + "',H3='" + h3.Text.Trim() + "',H4='" + h4.Text.Trim() + "',H5='" + h5.Text.Trim() + "' where HighlightID=@HighlightID", con);
        cmd.Parameters.AddWithValue("HighlightID", lblHID.Text);
        int i = cmd.ExecuteNonQuery();
        if (con.State == ConnectionState.Open)
        {
            con.Close();
        }

        ShowHighLightGrid();
    }
    protected void btnReset_Click(object sender, EventArgs e)
    {
        Response.Redirect(Request.RawUrl);
    }
    protected void btnGvwQtyDelete_Click(object sender, ImageClickEventArgs e)
    {
        ImageButton btn = (ImageButton)sender;

        //Get the row that contains this button
        GridViewRow gvr = (GridViewRow)btn.NamingContainer;

        Label lblHID = (Label)GridView1.Rows[gvr.RowIndex].FindControl("lblHID");
        if (con.State == ConnectionState.Closed)
        {
            con.Open();
        }
        SqlCommand cmd = new SqlCommand("delete from highlight where HighlightID=@HighlightID", con);
        cmd.Parameters.AddWithValue("HighlightID", lblHID.Text);
        int i = cmd.ExecuteNonQuery();
        if (con.State == ConnectionState.Open)
        {
            con.Close();
        }

        ShowHighLightGrid();
    }
}