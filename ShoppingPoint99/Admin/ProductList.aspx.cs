using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class _Default : System.Web.UI.Page
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
            ShowProductsGrid();
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
    protected void lbtnAddProduct_Click(object sender, EventArgs e)
    {
        Response.Redirect("ProductMaster.aspx");
    }

    public void ShowProductsGrid()
    {
        SqlDataAdapter dad = new SqlDataAdapter("select * from ProductMaster where ISDeleted='No' order by ProductName;", con);
        DataTable dt = new DataTable();
        dad.Fill(dt);
        gvwProducts.DataSource = dt;
        gvwProducts.DataBind();

        if (dt.Rows.Count > 0)
        {
            for (int i = 0; i < gvwProducts.Rows.Count; i++)
            {

                string home = dt.Rows[i]["IsShowHomePage"].ToString();
                string newl = dt.Rows[i]["IsNewLaunch"].ToString();
                CheckBox chkHome = (CheckBox)gvwProducts.Rows[i].FindControl("chkHome");
                CheckBox chkNewLaunch = (CheckBox)gvwProducts.Rows[i].FindControl("chkNewLaunch");
                if (home == "YES")
                {
                    chkHome.Checked = true;
                }

                if (newl == "YES")
                {
                    chkNewLaunch.Checked = true;
                }

                DropDownList ddlCategory = (DropDownList)gvwProducts.Rows[i].FindControl("ddlCategory");
                Label lblCId = (Label)gvwProducts.Rows[i].FindControl("lblCId");

                SqlDataAdapter dad2 = new SqlDataAdapter("select * from NLevelCategories where isdeleted='no' order by CategoryName", con);
                DataTable dt2 = new DataTable();
                dad2.Fill(dt2);

                ddlCategory.DataSource = dt2;
                ddlCategory.DataTextField = "CategoryName";
                ddlCategory.DataValueField = "CategoryID";
                ddlCategory.DataBind();
                ddlCategory.Items.Insert(0, new ListItem("Select Category", "0"));
                ddlCategory.SelectedValue = lblCId.Text;

                dt2.Dispose();
                dad2.Dispose();



                DropDownList ddlBrand = (DropDownList)gvwProducts.Rows[i].FindControl("ddlBrand");
                Label lblBId = (Label)gvwProducts.Rows[i].FindControl("lblBId");

                SqlDataAdapter dad1 = new SqlDataAdapter("select * from Brandmaster where isdeleted='no' order by BrandName", con);
                DataTable dt1 = new DataTable();
                dad1.Fill(dt1);

                ddlBrand.DataSource = dt1;
                ddlBrand.DataTextField = "BrandName";
                ddlBrand.DataValueField = "BrandID";
                ddlBrand.DataBind();
                ddlBrand.Items.Insert(0, new ListItem("Select Brand", "0"));
                ddlBrand.SelectedValue = lblBId.Text;

                dt1.Dispose();
                dad1.Dispose();

            }

        }


        dt.Dispose();
        dad.Dispose();

    }
    
    protected void btnGUpdate_Click1(object sender, ImageClickEventArgs e)
    {
        GridViewRow gvr = ((ImageButton)sender).NamingContainer as GridViewRow;
        Label lblPId = (Label)gvr.FindControl("lblPId");
        TextBox txtPName = (TextBox)gvr.FindControl("txtPName");
        TextBox txtSDesc = (TextBox)gvr.FindControl("txtSDesc");
        TextBox txtLDesc = (TextBox)gvr.FindControl("txtLDesc");
        DropDownList ddlBrand = (DropDownList)gvr.FindControl("ddlBrand");
        TextBox txtSKUID = (TextBox)gvr.FindControl("txtSKUID");
        DropDownList ddlCategory = (DropDownList)gvr.FindControl("ddlCategory");
        FileUpload fup1 = (FileUpload)gvr.FindControl("fup1");
        FileUpload fup2 = (FileUpload)gvr.FindControl("fup2");
        FileUpload fup3 = (FileUpload)gvr.FindControl("fup3");
        Label lblImag1 = (Label)gvr.FindControl("lblImag1");
        Label lblImag2 = (Label)gvr.FindControl("lblImag2");
        Label lblImag3 = (Label)gvr.FindControl("lblImag3");
        string imgPath1 = lblImag1.Text;
        string imgPath2 = lblImag2.Text;
        string imgPath3 = lblImag3.Text;
        if (fup1.HasFile)
        {
            imgPath1 = "../Images/ProductImages/" + fup1.FileName.ToString();
            fup1.SaveAs(Server.MapPath(imgPath1));
        }
        if (fup2.HasFile)
        {
            imgPath2 = "../Images/ProductImages/" + fup2.FileName.ToString();
            fup2.SaveAs(Server.MapPath(imgPath2));
        }
        if (fup3.HasFile)
        {
            imgPath3 = "../Images/ProductImages/" + fup3.FileName.ToString();
            fup3.SaveAs(Server.MapPath(imgPath3));
        }
        if (con.State == ConnectionState.Closed)
        {
            con.Open();
        }
        SqlCommand cmd = new SqlCommand("update ProductMaster set MainImagePath='" + imgPath1 + "',ImagePath1='" + imgPath2 + "',ImagePath2='"+imgPath3+"',ProductName='" + txtPName.Text.Trim() + "',SKUID='" + txtSKUID.Text.Trim() + "',ShortDescription='" + txtSDesc.Text.Trim() + "',LongDescription='" + txtLDesc.Text.Trim() + "',CategoryID='" + ddlCategory.SelectedValue + "',BrandID='" + ddlBrand.SelectedValue + "' where ProductID=@ProductID", con);
        cmd.Parameters.AddWithValue("ProductID", lblPId.Text);
        cmd.ExecuteNonQuery();
        if (con.State == ConnectionState.Open)
        {
            con.Close();
        }

        txtPName.Focus();
        ShowProductsGrid();
    }
    protected void btnGDelete_Click1(object sender, ImageClickEventArgs e)
    {
        ImageButton btn = (ImageButton)sender;
        GridViewRow gvr = (GridViewRow)btn.NamingContainer;

        Label lblPId = (Label)gvwProducts.Rows[gvr.RowIndex].FindControl("lblPId");
        if (con.State == ConnectionState.Closed)
        {
            con.Open();
        }
        SqlCommand cmd = new SqlCommand("update ProductMaster set IsDeleted='YES' where ProductID=@ProductID", con);
        cmd.Parameters.AddWithValue("ProductID", lblPId.Text);
        int i = cmd.ExecuteNonQuery();
        if (con.State == ConnectionState.Open)
        {
            con.Close();
        }

        ShowProductsGrid();
    }

    protected void btngvwUOMUpdate_Click(object sender, ImageClickEventArgs e)
    {
        GridViewRow gvr = ((ImageButton)sender).NamingContainer as GridViewRow;
        Label lblMId = (Label)gvr.FindControl("lblMId");
        TextBox txtGMRP = (TextBox)gvr.FindControl("txtGMRP");
        TextBox txtGSP = (TextBox)gvr.FindControl("txtGSP");
        TextBox txtQty = (TextBox)gvr.FindControl("txtQty");
        TextBox txtStockQty = (TextBox)gvr.FindControl("txtStockQty");
        DropDownList ddlGUnit = (DropDownList)gvr.FindControl("ddlGUnit");
        if (con.State == ConnectionState.Closed)
        {
            con.Open();
        }
        SqlCommand cmd = new SqlCommand("update product_unitmapping set UnitID='" + ddlGUnit.SelectedValue + "',Quantity='" + txtQty.Text.Trim() + "',MRP='" + txtGMRP.Text.Trim() + "',SellingPrice='" + txtGSP.Text.Trim() + "',StockQuantity='" + txtStockQty.Text.Trim() + "' where MappingID=@MappingID", con);
        cmd.Parameters.AddWithValue("MappingID", lblMId.Text);
        int i = cmd.ExecuteNonQuery();
        if (con.State == ConnectionState.Open)
        {
            con.Close();
        }
        txtGMRP.Focus();
        ShowProductsGrid();
    }
    protected void btngvwUOMGDelete_Click(object sender, ImageClickEventArgs e)
    {
        GridViewRow gvr = ((ImageButton)sender).NamingContainer as GridViewRow;
        Label lblMId = (Label)gvr.FindControl("lblMId");
        if (con.State == ConnectionState.Closed)
        {
            con.Open();
        }
        SqlCommand cmd = new SqlCommand("update product_unitmapping set IsDeleted='YES' where MappingID=@MappingID", con);
        cmd.Parameters.AddWithValue("MappingID", lblMId.Text);
        int i = cmd.ExecuteNonQuery();
        if (con.State == ConnectionState.Open)
        {
            con.Close();
        }
        ShowProductsGrid();

    }

    protected void chkHome_CheckedChanged(object sender, EventArgs e)
    {
        foreach (GridViewRow row in gvwProducts.Rows)
        {
            CheckBox chkHome = (CheckBox)row.FindControl("chkHome");
            Label lblPId = (Label)row.FindControl("lblPId");
            if (chkHome.Checked == true)
            {
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("update ProductMaster set IsShowHomePage='YES' where ProductID=@ProductID", con);
                cmd.Parameters.AddWithValue("ProductID", lblPId.Text);
                int i = cmd.ExecuteNonQuery();
                if (con.State == ConnectionState.Open)
                {
                    con.Close();
                }
            }
            else
            {
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("update ProductMaster set IsShowHomePage='NO' where ProductID=@ProductID", con);
                cmd.Parameters.AddWithValue("ProductID", lblPId.Text);
                int i = cmd.ExecuteNonQuery();
                if (con.State == ConnectionState.Open)
                {
                    con.Close();
                }
            }
        }
        
        ShowProductsGrid();

    }
    protected void chkNewLaunch_CheckedChanged(object sender, EventArgs e)
    {
        foreach (GridViewRow row in gvwProducts.Rows)
        {
            CheckBox chkNewLaunch = (CheckBox)row.FindControl("chkNewLaunch");
            Label lblPId = (Label)row.FindControl("lblPId");
            if (chkNewLaunch.Checked == true)
            {
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("update ProductMaster set IsNewLaunch='YES' where ProductID=@ProductID", con);
                cmd.Parameters.AddWithValue("ProductID", lblPId.Text);
                int i = cmd.ExecuteNonQuery();
                if (con.State == ConnectionState.Open)
                {
                    con.Close();
                }
            }
            else
            {
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("update ProductMaster set IsNewLaunch='NO' where ProductID=@ProductID", con);
                cmd.Parameters.AddWithValue("ProductID", lblPId.Text);
                int i = cmd.ExecuteNonQuery();
                if (con.State == ConnectionState.Open)
                {
                    con.Close();
                }
            }
        }
        ShowProductsGrid();
    }
    protected void gvwProducts_RowDataBound1(object sender, GridViewRowEventArgs e)
    {
        if ((e.Row.RowType != DataControlRowType.DataRow)) return;
        GridView gvwUnit = (GridView)e.Row.FindControl("gvwUnit");
        int rowId = int.Parse((gvwProducts.DataKeys[e.Row.RowIndex].Value.ToString()));

        SqlDataAdapter dad = new SqlDataAdapter("select a.MappingID,a.ProductID,a.Quantity,a.MRP,a.SellingPrice,a.Discount,a.StockQuantity,b.unitname,b.unitid from Product_UnitMapping a inner join UnitMaster b on a.Unitid=b.Unitid where a.ProductID='" + rowId + "' and a.Isdeleted='NO';", con);
        DataTable dt = new DataTable();
        dad.Fill(dt);

        gvwUnit.DataSource = dt;
        gvwUnit.DataBind();

        if (dt.Rows.Count > 0)
        {
            for (int i = 0; i < gvwUnit.Rows.Count; i++)
            {

                DropDownList ddlGUnit = (DropDownList)gvwUnit.Rows[i].FindControl("ddlGUnit");
                Label lblUnitId = (Label)gvwUnit.Rows[i].FindControl("lblUnitId");

                SqlDataAdapter dad1 = new SqlDataAdapter("select * from Unitmaster where isdeleted='no'", con);
                DataTable dt1 = new DataTable();
                dad1.Fill(dt1);

                ddlGUnit.DataSource = dt1;
                ddlGUnit.DataTextField = "unitname";
                ddlGUnit.DataValueField = "UnitID";
                ddlGUnit.DataBind();
                ddlGUnit.Items.Insert(0, new ListItem("Select Unit", "0"));
                ddlGUnit.SelectedValue = lblUnitId.Text;

                dt1.Dispose();
                dad1.Dispose();
            }

        }

        dt.Dispose();
        dad.Dispose();
    }
    protected void gvwProducts_PageIndexChanging1(object sender, GridViewPageEventArgs e)
    {
        gvwProducts.PageIndex = e.NewPageIndex;
        ShowProductsGrid();
    }
}