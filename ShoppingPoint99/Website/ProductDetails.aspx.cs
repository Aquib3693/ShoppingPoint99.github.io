using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
public partial class Website_ProductDetails : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["myCon"].ToString());
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            ShowProductDetails();
            showDropDownUnit();
            ShowunitDropDown();
        }
       
    }
    public void ShowProductDetails()
    {
        if (Request.QueryString["ProductID"] != null)
        {
            lblProductID.Text = Request.QueryString["ProductID"].ToString();
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }

            SqlCommand cmd = new SqlCommand("select pm.ProductID,([dbo].[InitCap](pm.ProductName))ProductName,([dbo].[InitCap](pm.ShortDescription))ShortDescription,pm.MainImagePath,([dbo].[InitCap](h.H1))H1,([dbo].[InitCap](h.H2))H2,([dbo].[InitCap](h.H3))H3,([dbo].[InitCap](h.H4))H4,([dbo].[InitCap](h.H5))H5  from ProductMaster pm left join Highlight h on pm.ProductID=h.ProductID  where pm.ProductID='" + lblProductID.Text + "';", con);
            SqlDataReader rdr = cmd.ExecuteReader();
            if (rdr.Read())
            {
                lblPrcdtname.Text = (rdr["ProductName"].ToString());
                lblSDesc.Text = (rdr["ShortDescription"].ToString());
                MainImage.ImageUrl = (rdr["MainImagePath"].ToString());
                H1.Text = (rdr["H1"].ToString());
                H2.Text = (rdr["H2"].ToString());
                H3.Text = (rdr["H3"].ToString());
                H4.Text = (rdr["H4"].ToString());
                H5.Text = (rdr["H5"].ToString());
                
            }
            rdr.Dispose();
            cmd.Dispose();

            if (con.State == ConnectionState.Open)
            {
                con.Close();
            }
        }
        else
        {
            Response.Redirect("../index.aspx");
        }
    }
    protected void showDropDownUnit()
    {
        SqlCommand cmd1 = new SqlCommand("select p.MappingID,(cast(Quantity as varchar(10))+' '+(select UnitName from UnitMaster where UnitID=p.UnitID))Unit from Product_UnitMapping p where ProductID='" + lblProductID.Text + "';select sellingPrice,MRP,dbo.calPercentage('" + lblProductID.Text + "','" + ddlUnitMapping.SelectedValue + "')discount from Product_UnitMapping  where ProductID='" + lblProductID.Text + "' and mappingid='" + ddlUnitMapping.SelectedValue + "'", con);
        SqlDataAdapter dad1 = new SqlDataAdapter(cmd1);
        DataTable dt1 = new DataTable();
        dad1.Fill(dt1);

        ddlUnitMapping.DataSource = dt1;
        ddlUnitMapping.DataTextField = "Unit";
        ddlUnitMapping.DataValueField = "MappingID";
        ddlUnitMapping.DataBind();

        dt1.Dispose();
        dad1.Dispose();
        cmd1.Dispose();
    }
    protected void ddlUnitMapping_SelectedIndexChanged(object sender, EventArgs e)
    {
        SqlCommand cmd = new SqlCommand("select sellingPrice,MRP,dbo.calPercentage('" + lblProductID.Text + "','" + ddlUnitMapping.SelectedValue + "')discount from Product_UnitMapping  where ProductID='" + lblProductID.Text + "' and mappingid='" + ddlUnitMapping.SelectedValue + "'", con);
        SqlDataAdapter dad = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        dad.Fill(dt);
        if (dt.Rows.Count > 0)
        {
            lblMRP.Text = dt.Rows[0]["MRP"].ToString();
            lblSP.Text = dt.Rows[0]["SellingPrice"].ToString();
            lblDis.Text = dt.Rows[0]["discount"].ToString();
        }
    }

    public void ShowunitDropDown()
    {
        SqlCommand cmd = new SqlCommand("select sellingPrice,MRP,dbo.calPercentage('" + lblProductID.Text + "','" + ddlUnitMapping.SelectedValue + "')discount from Product_UnitMapping  where ProductID='" + lblProductID.Text + "' and mappingid='" + ddlUnitMapping.SelectedValue + "'", con);
        SqlDataAdapter dad = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        dad.Fill(dt);
        if (dt.Rows.Count > 0)
        {
            lblMRP.Text = dt.Rows[0]["MRP"].ToString();
            lblSP.Text = dt.Rows[0]["SellingPrice"].ToString();
            lblDis.Text = dt.Rows[0]["discount"].ToString();
        }
    }
    public void RandomNumber()
    {
        Random r = new Random();
        int num = r.Next();
        Session["UniqueNumber"] = num.ToString();
    }
    protected void btnAddtoCart_Click(object sender, EventArgs e)
    {
        if (Session["UniqueNumber"] == null)
        {
            RandomNumber();
            SqlDataAdapter cmd = new SqlDataAdapter("exec InsertTempCart '" + Session["UniqueNumber"] + "','" + lblProductID.Text + "','" + Session["Id"] + "','" + ddlUnitMapping.SelectedItem + "','" + 1 + "','" + lblSP.Text + "','" + lblMRP.Text + "','" + lblDis.Text + "';", con);
            DataTable dt = new DataTable();
            cmd.Fill(dt);
            string status = "";
            if (dt.Rows.Count > 0)
            {
                status = dt.Rows[0][0].ToString();
                if (status == "Success")
                {
                    Response.Redirect("../Website/MyCart.aspx");
                }
                else
                {
                    Response.Redirect("../Website/MyCart.aspx");
                }
            }
            else
            {
                Response.Write("<script>alert('Opps! there is some problem while save data.')</script>");
            }
            dt.Dispose();
            cmd.Dispose();

        }
        else
        {
            SqlDataAdapter cmd = new SqlDataAdapter("exec InsertTempCart '" + Session["UniqueNumber"] + "','" + lblProductID.Text + "','" + Session["Id"] + "','" + ddlUnitMapping.SelectedItem + "','" + 1 + "','" + lblSP.Text + "','" + lblMRP.Text + "','" + lblDis.Text + "';", con);
            DataTable dt = new DataTable();
            cmd.Fill(dt);
            string status = "";
            if (dt.Rows.Count > 0)
            {
                status = dt.Rows[0][0].ToString();
                if (status == "Success")
                {
                    Response.Redirect("../Website/MyCart.aspx");
                }
                else
                {
                    Response.Redirect("../Website/MyCart.aspx");
                }
            }
            else
            {
                Response.Write("<script>alert('Opps! there is some problem while save data.')</script>");
            }
            dt.Dispose();
            cmd.Dispose();
        }        

    }
    protected void btnbuynow_Click(object sender, EventArgs e)
    {
        if (Session["UniqueNumber"] == null)
        {
            RandomNumber();
            SqlDataAdapter cmd = new SqlDataAdapter("exec InsertTempCart '" + Session["UniqueNumber"] + "','" + lblProductID.Text + "','" + Session["Id"] + "','" + ddlUnitMapping.SelectedItem + "','" + 1 + "','" + lblSP.Text + "','" + lblMRP.Text + "','" + lblDis.Text + "';", con);
            DataTable dt = new DataTable();
            cmd.Fill(dt);
            string status = "";
            if (dt.Rows.Count > 0)
            {
                status = dt.Rows[0][0].ToString();
                if (status == "Success")
                {
                    Response.Redirect("../Website/ProceedToPay.aspx");
                }
                else
                {
                    Response.Redirect("../Website/ProceedToPay.aspx");
                }
            }
            else
            {
                Response.Write("<script>alert('Opps! there is some problem while save data.')</script>");
            }
            dt.Dispose();
            cmd.Dispose();

        }
        else
        {
            SqlDataAdapter cmd = new SqlDataAdapter("exec InsertTempCart '" + Session["UniqueNumber"] + "','" + lblProductID.Text + "','" + Session["Id"] + "','" + ddlUnitMapping.SelectedItem + "','" + 1 + "','" + lblSP.Text + "','" + lblMRP.Text + "','" + lblDis.Text + "';", con);
            DataTable dt = new DataTable();
            cmd.Fill(dt);
            string status = "";
            if (dt.Rows.Count > 0)
            {
                status = dt.Rows[0][0].ToString();
                if (status == "Success")
                {
                    Response.Redirect("../Website/ProceedToPay.aspx");
                }
                else
                {
                    Response.Redirect("../Website/ProceedToPay.aspx");
                }
            }
            else
            {
                Response.Write("<script>alert('Opps! there is some problem while save data.')</script>");
            }
            dt.Dispose();
            cmd.Dispose();
        }        
    }
}