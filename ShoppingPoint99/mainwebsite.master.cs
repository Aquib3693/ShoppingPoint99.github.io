using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class mainwebsite : System.Web.UI.MasterPage
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["myCon"].ToString());
    protected void Page_Load(object sender, EventArgs e)
    {
       
        if (Session["login"] != null)
        {
            panelregister.Visible = false;
            panellogin.Visible = true;
            usermobileregister.Visible = false;
            usermobilelogin.Visible = true;
            showName();          
        }

        cartValue();
       
    }
    public void cartValue()
    {
        int nrow = 0;
        if (Session["UniqueNumber"] != null)
        {
            SqlCommand cmd = new SqlCommand("select ProductID from TempCart where UniqueNo='" + Session["UniqueNumber"] + "' ;", con);
            SqlDataAdapter dad = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            dad.Fill(dt);
            nrow = dt.Rows.Count;
            if (nrow > 0)
            {
                lblCartValue.Text = nrow.ToString();
            }
            else
            {
                lblCartValue.Text = "0";
            }
        }
        else
        {
            lblCartValue.Text = "0";
        }

    }
    protected void btnLogout_Click(object sender, EventArgs e)
    {
        Session.Abandon();
        Response.Redirect("~/index.aspx");
    }
    protected void btnmobilelogout_Click(object sender, EventArgs e)
    {
        Session.Abandon();
        Response.Redirect("~/index.aspx");
    }
    public void showName()
    {
        if (Session["login"] != null)
        {
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            string ss = "";

            SqlCommand cmd = new SqlCommand("select ([dbo].[InitCap](Name))Name from Customer where Mobile='" + Session["login"] + "';", con);
            SqlDataReader rdr = cmd.ExecuteReader();
            if (rdr.Read())
            {
                ss = (rdr["Name"].ToString());
                if (ss != "")
                {
                    lblname.Text = ss.ToString();
                }
                else
                {
                    lblname.Text = "Welcome";
                }
            }
            rdr.Dispose();
            cmd.Dispose();

            if (con.State == ConnectionState.Open)
            {
                con.Close();
            }
        }
        
    }
    protected void btnSearch1_Click(object sender, EventArgs e)
    {
        if(txtSearch.Text!="")
        {
             Session["product_name"] = txtSearch.Text;
             Response.Redirect("~/results.aspx");

        }
        else
        {
            Response.Redirect("~/index.aspx");
        }
    }
    [System.Web.Script.Services.ScriptMethod()]
    [System.Web.Services.WebMethod]
    public static List<string> SearchProducts(string prefixText, int count)
    {
        using (SqlConnection conn = new SqlConnection())
        {
            conn.ConnectionString = ConfigurationManager
                    .ConnectionStrings["myCon"].ConnectionString;
            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.CommandText = "select productName from productmaster where " +
                "productName like @SearchText + '%'";
                cmd.Parameters.AddWithValue("@SearchText", prefixText);
                cmd.Connection = conn;
                conn.Open();
                List<string> products = new List<string>();
                using (SqlDataReader sdr = cmd.ExecuteReader())
                {
                    while (sdr.Read())
                    {
                        products.Add(sdr["productName"].ToString());
                    }
                }
                conn.Close();
                return products;
            }
        }
    }
}
