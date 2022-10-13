using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
public partial class Website_MyCart : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["myCon"].ToString());
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            showCartDetails();
            grandtotal();            
        }

    }

    public void showCartDetails()
    {
        if (Session["UniqueNumber"] != null)
        {
            SqlCommand cmd = new SqlCommand("select pm.MainImagePath,c.ProductID,([dbo].[InitCap](pm.ProductName))ProductName,c.PckDetail,c.Quantity,c.MRP,c.SP,c.Discount from productmaster pm inner join TempCart c on c.ProductID=pm.ProductID where c.UniqueNo='" + Session["UniqueNumber"] + "' ;", con);
            SqlDataAdapter dad = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            dad.Fill(dt);

            gvwCart.DataSource = dt;
            gvwCart.DataBind();
        }
        else
        {
            Response.Write("<script>alert('Cart is Empty')</script>");
        }
        
    }
    
    protected void gvwbtnDelete_Click(object sender, EventArgs e)
    {
        GridViewRow gvr = ((Button)sender).NamingContainer as GridViewRow;
        Label lblPId = (Label)gvr.FindControl("lblPId");
      
        if (con.State == ConnectionState.Closed)
        {
            con.Open();
        }
        SqlCommand cmd = new SqlCommand("delete from  TempCart where ProductID=@ProductID", con);
        cmd.Parameters.AddWithValue("ProductID", lblPId.Text);

        int i = cmd.ExecuteNonQuery();
        if (con.State == ConnectionState.Open)
        {
            con.Close();
        }
        grandtotal();
        showCartDetails();
    }
    protected void btnminus_Click(object sender, EventArgs e)
    {
        GridViewRow gvr = ((Button)sender).NamingContainer as GridViewRow;
        TextBox txtQty = (TextBox)gvr.FindControl("txtQty");
        Label lblPID = (Label)gvr.FindControl("lblPID");
        int qty = Convert.ToInt32(txtQty.Text);
               
        if (txtQty.Text == "1")
        {
            txtQty.Enabled = false; 
        }
        else
        {            
            qty--;
            txtQty.Text = qty.ToString();
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            SqlCommand cmd = new SqlCommand("update TempCart set Quantity='" + txtQty.Text + "' where ProductID=@ProductID", con);
            cmd.Parameters.Add("ProductID", lblPID.Text);
            int i = cmd.ExecuteNonQuery();
            if (con.State == ConnectionState.Open)
            {
                con.Close();
            }
        }
        grandtotal();
        showCartDetails();
    }
    
    protected void btnplus_Click(object sender, EventArgs e)
    {
        GridViewRow gvr = ((Button)sender).NamingContainer as GridViewRow;
        TextBox txtQty = (TextBox)gvr.FindControl("txtQty");
        Label lblPID = (Label)gvr.FindControl("lblPID");
        int qty = Convert.ToInt32(txtQty.Text);
        qty++;
        txtQty.Text = qty.ToString();
        txtQty.Enabled = true;
        if (con.State == ConnectionState.Closed)
        {
            con.Open();
        }
        SqlCommand cmd = new SqlCommand("update TempCart set Quantity='"+txtQty.Text+"' where ProductID=@ProductID", con);
        cmd.Parameters.Add("ProductID", lblPID.Text);
        int i = cmd.ExecuteNonQuery();
        if (con.State == ConnectionState.Open)
        {
            con.Close();
        }
        grandtotal();
        showCartDetails();
       
    }

    public void grandtotal()
    {
        int nrow=0;
        int i = 0;
        int gtotal = 0;
        if (Session["UniqueNumber"] != null)
        {
            SqlCommand cmd = new SqlCommand("select Total from TempCart where UniqueNo='" + Session["UniqueNumber"] + "' ;", con);
            SqlDataAdapter dad = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            dad.Fill(dt);
             nrow = dt.Rows.Count;
             i = 0;
             gtotal = 0;
            while (i < nrow)
            {
                gtotal = gtotal + Convert.ToInt32(dt.Rows[i]["Total"].ToString());
                i = i + 1;
            }
            lblTotal.Text = gtotal.ToString();
            lblGTotal.Text = (int.Parse(lblDelivery.Text) + int.Parse(lblTotal.Text)).ToString();

            if (nrow == 0)
            {
                lblCartValue.Text = "0";
                lblitems.Text = "0";
            }
            else
            {
                lblCartValue.Text = nrow.ToString();
                lblitems.Text = nrow.ToString();
            }
        }        
        
    }

    protected void btnPlaceOrder_Click(object sender, EventArgs e)
    {
        int nrow = 0;
        if (Session["UniqueNumber"] != null)
        {
            SqlDataAdapter dad = new SqlDataAdapter("select Total from TempCart where UniqueNo='" + Session["UniqueNumber"] + "'", con);
            DataTable dt = new DataTable();
            dad.Fill(dt);
            nrow = dt.Rows.Count;
            if (nrow > 0)
            {
                if (Session["login"] != null)
                {
                    Response.Redirect("../Website/ProceedToPay.aspx");
                }
                else
                {
                    Response.Redirect("../Customer/Login.aspx");
                }
               
            }
            else
            {
                Response.Write("<script>alert('Cart is Empty.Please add some product to cart.')</script>");

            }   
            
        }
        else
        {
            Response.Write("<script>alert('Cart is Empty.Please add some product to cart.')</script>");
        }
        
    }
}