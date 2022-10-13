using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Admin_ProductsMaster : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["myCon"].ToString());    
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            ShowBrand();
            ShowCategory();
            ShowUnitOfMeasurement();
            ShowQuantityGrid();
            Random r = new Random();
            int num = r.Next();
            lblNumber.Text = num.ToString();
        }
    }

    public void ShowBrand()
    {
        SqlCommand com = new SqlCommand("select * from BrandMaster where IsDeleted='NO' order by BrandName", con);
        SqlDataAdapter dad = new SqlDataAdapter(com);
        DataTable dt = new DataTable();
        dad.Fill(dt);

        ddlBrand.DataSource = dt;
        ddlBrand.Items.Clear();
        ddlBrand.DataTextField = "BrandName";
        ddlBrand.DataValueField = "BrandID";
        ddlBrand.DataBind();
        ddlBrand.Items.Insert(0, new ListItem("Select Brand", "0"));

        dt.Dispose();
        dad.Dispose();
        com.Dispose();
    }

    public void ShowCategory()
    {
        SqlCommand com = new SqlCommand("select * from NLevelCategories where IsDeleted='NO' order by CategoryName", con);
        SqlDataAdapter dad = new SqlDataAdapter(com);
        DataTable dt = new DataTable();
        dad.Fill(dt);

        ddlCategory.DataSource = dt;
        ddlCategory.Items.Clear();
        ddlCategory.DataTextField = "CategoryName";
        ddlCategory.DataValueField = "CategoryID";
        ddlCategory.DataBind();
        ddlCategory.Items.Insert(0, new ListItem("Select Category", "0"));

        dt.Dispose();
        dad.Dispose();
        com.Dispose();
    }

    public void ShowUnitOfMeasurement()
    {
        SqlCommand com = new SqlCommand("select * from UnitMaster where IsDeleted='NO' order by UnitName", con);
        SqlDataAdapter dad = new SqlDataAdapter(com);
        DataTable dt = new DataTable();
        dad.Fill(dt);

        ddlUnit.DataSource = dt;
        ddlUnit.Items.Clear();
        ddlUnit.DataTextField = "UnitName";
        ddlUnit.DataValueField = "UnitID";
        ddlUnit.DataBind();
        ddlUnit.Items.Insert(0, new ListItem("Select Unit", "0"));

        dt.Dispose();
        dad.Dispose();
        com.Dispose();
    }

    public void ShowQuantityGrid()
    {
        SqlDataAdapter dad = new SqlDataAdapter("select * from tempunitmapping", con);       
        DataTable dt = new DataTable();
        dad.Fill(dt);        
        gvwQuantity.DataSource = dt;
        gvwQuantity.DataBind();

        if (dt.Rows.Count > 0)
        {
            for (int i = 0; i < gvwQuantity.Rows.Count; i++)
            {

                DropDownList ddlGUnit = (DropDownList)gvwQuantity.Rows[i].FindControl("ddlGUnit");
                Label Label1 = (Label)gvwQuantity.Rows[i].FindControl("Label1");

                SqlDataAdapter dad1 = new SqlDataAdapter("select * from Unitmaster where isdeleted='no'", con);
                DataTable dt1 = new DataTable();
                dad1.Fill(dt1);  

                ddlGUnit.DataSource = dt1;
                ddlGUnit.DataTextField = "unitname";
                ddlGUnit.DataValueField = "UnitID";
                ddlGUnit.DataBind();
                ddlGUnit.Items.Insert(0, new ListItem("Select Unit", "0"));
                ddlGUnit.SelectedValue = Label1.Text;

                dt1.Dispose();
                dad1.Dispose();
            }
            
        }
        dt.Dispose();
        dad.Dispose();
    }


   
    protected void btnSaveProduct_Click(object sender, EventArgs e)
    {
        string imgPath = "../Images/ProductImages/" + fupMainImage.FileName.ToString();
        fupMainImage.SaveAs(Server.MapPath(imgPath));
        string imgPath1 ="";
        string imgPath2 = "";  
        if (fupImage1.HasFile)
        {           
            imgPath1 = "../Images/ProductImages/" + fupImage1.FileName.ToString();
            fupImage1.SaveAs(Server.MapPath(imgPath1));
        }
        if (fupImage2.HasFile)
        {
            imgPath2 = "../Images/ProductImages/" + fupImage2.FileName.ToString();
            fupImage2.SaveAs(Server.MapPath(imgPath2));
        }
        SqlDataAdapter cmd = new SqlDataAdapter("exec InsertProduct '" + txtProductName.Text.Trim() + "','" + txtSKUID.Text.Trim() + "','" + ddlCategory.SelectedValue + "','" + txtProductDescription.Text.Trim() + "','" + txtProductLongDescription.Text.Trim() + "','" + ddlBrand.SelectedValue + "','" + imgPath + "','" + imgPath1 + "','" + imgPath2 + "','" + Session["adminlogin"].ToString() + "','" + lblNumber.Text + "';", con);
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
        ShowQuantityGrid();
    }

    protected void btnAddQuantity_Click1(object sender, EventArgs e)
    {
        SqlDataAdapter cmd = new SqlDataAdapter("insert into TempUnitMapping(UniqueNumber,Quantity,UnitID,MRP,SellingPrice,StockQty)values('" + lblNumber.Text.Trim() + "','" + txtQty.Text.Trim() + "','" + ddlUnit.SelectedValue + "','" + txtMRP.Text.Trim() + "','" + txtSalePrice.Text.Trim() + "','"+ txtStockQty.Text.Trim() +"');", con);
        DataTable dt = new DataTable();
        cmd.Fill(dt);

        txtQty.Text = " ";
        ddlUnit.SelectedValue ="0";
        txtMRP.Text = " ";
        txtSalePrice.Text = " ";
        txtQty.Focus();
        txtStockQty.Text = "";

        cmd.Dispose();
        ShowQuantityGrid();
    }
    protected void btnGvwQtyUpdate_Click(object sender, ImageClickEventArgs e)
    {
        ImageButton btn = (ImageButton)sender;
        GridViewRow gvr = (GridViewRow)btn.NamingContainer;
        Label Label2 = (Label)gvr.FindControl("Label2");
        TextBox txtGQty = (TextBox)gvr.FindControl("txtGQty");
        TextBox txtGMRP = (TextBox)gvr.FindControl("txtGMRP");
        TextBox txtGSaleP = (TextBox)gvr.FindControl("txtGSaleP");
        TextBox txtGStockQty = (TextBox)gvr.FindControl("txtGStockQty");
        DropDownList ddlGUnit = (DropDownList)gvr.FindControl("ddlGUnit");

        if (con.State == ConnectionState.Closed)
        {
            con.Open();
        }
        SqlCommand cmd = new SqlCommand("update tempunitmapping set Quantity='" + txtGQty.Text.Trim() + "',MRP='" + txtGMRP.Text.Trim() + "',SellingPrice='" + txtGSaleP.Text.Trim() + "',StockQty='" + txtGStockQty.Text.Trim() + "',UnitID='"+ddlGUnit.SelectedValue+"' where id=@id", con);
        cmd.Parameters.AddWithValue("id", Label2.Text);
        int i = cmd.ExecuteNonQuery();
        if (con.State == ConnectionState.Open)
        {
            con.Close();
        }

        txtGQty.Focus();
        ShowQuantityGrid();
        
    }

    protected void btnGvwQuantityDelete_Click(object sender, ImageClickEventArgs e)
    {
        ImageButton btn = (ImageButton)sender;

        //Get the row that contains this button
        GridViewRow gvr = (GridViewRow)btn.NamingContainer;
        Label Label2 = (Label)gvr.FindControl("Label2");
        TextBox txtGQty = (TextBox)gvr.FindControl("txtGQty");
        if (con.State == ConnectionState.Closed)
        {
            con.Open();
        }
        SqlCommand cmd = new SqlCommand("delete from tempunitmapping where id=@id", con);
        cmd.Parameters.AddWithValue("id", Label2.Text);
        int i = cmd.ExecuteNonQuery();
        if (con.State == ConnectionState.Open)
        {
            con.Close();
        }

        txtGQty.Focus();        
        ShowQuantityGrid();
        
    }

    protected void btnResetProduct_Click(object sender, EventArgs e)
    {
        Response.Redirect(Request.RawUrl);
    }
    protected void lbtnSeeProduct_Click(object sender, EventArgs e)
    {
        Response.Redirect("ProductList.aspx");
    }
}