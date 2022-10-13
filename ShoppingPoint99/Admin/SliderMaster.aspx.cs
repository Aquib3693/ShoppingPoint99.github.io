using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Admin_SliderMaster : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["myCon"].ToString());
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            ShowSliderGrid();
        }
    }

    public void ShowSliderGrid()
    {
        SqlDataAdapter dad = new SqlDataAdapter("select * from SliderMaster where isdeleted='NO'", con);
        DataTable dt = new DataTable();
        dad.Fill(dt);

        gvwSlider.DataSource = dt;
        gvwSlider.DataBind();
    }


    protected void gvwSlider_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvwSlider.PageIndex = e.NewPageIndex;
        ShowSliderGrid();
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        if (con.State == ConnectionState.Closed)
        {
            con.Open();
        }

        string imgPath1 = "../Images/SliderImages/" + fup1.FileName.ToString(); ;
        fup1.SaveAs(Server.MapPath(imgPath1));
        string imgPath2 = "../Images/SliderImages/" + fup2.FileName.ToString(); ;
        fup2.SaveAs(Server.MapPath(imgPath2));
        string imgPath3 = "../Images/SliderImages/" + fup3.FileName.ToString(); ;
        fup3.SaveAs(Server.MapPath(imgPath3));

        SqlCommand comd = new SqlCommand("exec InsertSlider '" + imgPath1 + "','" + txtLink1.Text.Trim() + "','" + imgPath2 + "','" + txtLink2.Text.Trim() + "','" + imgPath3 + "','" + txtLink3.Text.Trim() + "','" + Session["adminlogin"].ToString() + "' ;", con);
        int i = comd.ExecuteNonQuery();
        if (i > 0)
        {
            Response.Write("<script>alert('record saved.')</script>");
        }
        else
        {
            Response.Write(" <script>alert('record not saved.')</script>");
        }
        comd.Dispose();
        if (con.State == ConnectionState.Open)
        {
            con.Close();
        }
        ShowSliderGrid();
    }
    protected void btnReset_Click(object sender, EventArgs e)
    {
        Response.Redirect(Request.RawUrl);
    }
    protected void btnGUpdate_Click(object sender, ImageClickEventArgs e)
    {
        GridViewRow gvr = ((ImageButton)sender).NamingContainer as GridViewRow;
        Label Label1 = (Label)gvr.FindControl("Label1");
        TextBox txtGLink1 = (TextBox)gvr.FindControl("txtGLink1");
        TextBox txtGLink2 = (TextBox)gvr.FindControl("txtGLink2");
        TextBox txtGLink3 = (TextBox)gvr.FindControl("txtGLink3");
        if (con.State == ConnectionState.Closed)
        {
            con.Open();
        }
        SqlCommand cmd = new SqlCommand("update SliderMaster set ImgLink1='" + txtGLink1.Text.Trim() + "',ImgLink2='" + txtGLink2.Text.Trim() + "',ImgLink3='" + txtGLink3.Text.Trim() + "'  where Sliderid=@Sliderid", con);
        cmd.Parameters.AddWithValue("Sliderid", Label1.Text);

        int i = cmd.ExecuteNonQuery();
        if (con.State == ConnectionState.Open)
        {
            con.Close();
        }
        ShowSliderGrid();

    }
    protected void btnGDelete_Click(object sender, ImageClickEventArgs e)
    {
        GridViewRow gvr = ((ImageButton)sender).NamingContainer as GridViewRow;
        Label Label1 = (Label)gvr.FindControl("Label1");
        if (con.State == ConnectionState.Closed)
        {
            con.Open();
        }
        SqlCommand cmd = new SqlCommand("update SliderMaster set IsDeleted='YES' where Sliderid=@Sliderid", con);
        cmd.Parameters.AddWithValue("Sliderid", Label1.Text);

        int i = cmd.ExecuteNonQuery();
        if (con.State == ConnectionState.Open)
        {
            con.Close();
        }
        ShowSliderGrid();
    }
}