using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
public partial class Admin_AdminLogin : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["myCon"].ToString());
    protected void Page_Load(object sender, EventArgs e)
    {
        if(Session["adminlogin"]!=null)
        {
            Response.Redirect("CountryMaster.aspx");
        }
    }
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        SqlDataAdapter dad = new SqlDataAdapter("sp_admin_login '"+txtUserID.Text.Trim()+"','"+txtPassword.Text.Trim()+"'",con);
        DataTable dt = new DataTable();
        dad.Fill(dt);
        if(dt.Rows.Count>0)
        {
            string name = dt.Rows[0]["Name"].ToString();
            if(name!="")
            {
                Session["adminlogin"] = txtUserID.Text.Trim();                
                Response.Redirect("CountryMaster.aspx");
            }
            else
            {

                txtUserID.Text = "";
                txtPassword.Text = "";
                Response.Write("<script>alert('Invalid User ID or Password')</script>");
            }
        }
        else
        {
            txtUserID.Text = "";
            txtPassword.Text = "";
            Response.Write("<script>alert('Invalid User ID or Password')</script>");
        }
        dt.Dispose();
        dad.Dispose();
    }
}