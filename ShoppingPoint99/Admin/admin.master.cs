using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Admin_admin : System.Web.UI.MasterPage
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["myCon"].ToString());     
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["adminlogin"] == null)
        {
            Response.Redirect("AdminLogin.aspx");
        }
        if (!IsPostBack)
        {
            showName();
        }
        
    }

    public void showName()
    {
        SqlDataAdapter dad = new SqlDataAdapter("select name from admin where userid='" + Session["adminlogin"].ToString() + "'", con);
        DataTable dt = new DataTable();
        dad.Fill(dt);

        lblName.Text = dt.Rows[0]["Name"].ToString();
    }
   
    protected void btnLogout_Click(object sender, EventArgs e)
    {
        Session.Abandon();
        Response.Redirect("AdminLogin.aspx");
    }
}
