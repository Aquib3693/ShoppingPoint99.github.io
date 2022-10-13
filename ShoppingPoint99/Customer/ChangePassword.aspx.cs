using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Customer_ChangePassword : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["myCon"].ToString());
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["id"] == null)
        {
            Response.Redirect("MyProfile.aspx");
        }
    }
    protected void btnSaveChangePass_Click(object sender, EventArgs e)
    {
        if (con.State == ConnectionState.Closed)
        {
            con.Open();
        }

        SqlDataAdapter dad = new SqlDataAdapter("select * from customer where customerid='"+Session["id"]+"'",con);
        DataTable dt = new DataTable();
        dad.Fill(dt);
        string oldpass = "";
        if (dt.Rows.Count > 0)
        {
            oldpass = dt.Rows[0]["Password"].ToString();
        }
        if (oldpass == txtOldPass.Text)
        {
            if (oldpass != txtNPass.Text)
            {
                SqlCommand cmd = new SqlCommand("update customer set Password='"+txtNPass.Text.Trim()+"' where CustomerID='"+Session["id"]+"';", con);
                int i = cmd.ExecuteNonQuery();
                if (i > 0)
                {
                    Response.Write("<script>alert('Password changed !')</script>");
                }
                else
                {
                    Response.Write("<script>alert('Error:Please Retype your Passwords.')</script>");
                }
            }
            else
            {
                Response.Write("<script>alert('Error:Your Password must not be the old one.')</script>");
            }
        }
        else
        {
            Response.Write("<script>alert('Error:Old Password Not Correct.')</script>");
        }


        if (con.State == ConnectionState.Open)
        {
            con.Close();
        }
    }
}