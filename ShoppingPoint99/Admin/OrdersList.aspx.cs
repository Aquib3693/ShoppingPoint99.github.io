using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Admin_OrdersList : System.Web.UI.Page
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
            ShowOrderGrid();
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
    protected void lbtnGoback_Click(object sender, EventArgs e)
    {
        Response.Redirect("CountryMaster.aspx");
    }

    public void ShowOrderGrid()
    {
        SqlDataAdapter dad = new SqlDataAdapter(" select ([dbo].[InitCap](c.Name))Name,c.mobile,o.UniqueOrderNo,o.OrderStatus,convert(varchar,o.CreatedDate,106)createddate,o.PaidStatus,o.PaymentTranscation,o.netamount,o.deliverycharges,o.totalamount,([dbo].[InitCap](a.address+','+a.City+','+a.State+','+cast(a.pin as varchar(6))))address from orders o inner join Customer c on o.CustomerID=c.CustomerID inner join CustomerAddress a on a.CustomerID=c.CustomerID where a.isdefault='yes'", con);
        DataTable dt = new DataTable();
        dad.Fill(dt);
        gvwOrders.DataSource = dt;
        gvwOrders.DataBind();
    }
    protected void gvwOrders_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if ((e.Row.RowType != DataControlRowType.DataRow)) return;
        GridView gvwItem = (GridView)e.Row.FindControl("gvwItems");
        int rowId = int.Parse((gvwOrders.DataKeys[e.Row.RowIndex].Value.ToString()));

        SqlDataAdapter dad = new SqlDataAdapter("select p.ProductName,p.MainImagePath,d.PckUnit,d.pckquantity,d.mrp,d.sellprice,d.total from OrderDetail d inner join productmaster p on p.productid=d.productid where orderid='" + rowId + "'", con);
        DataTable dt = new DataTable();
        dad.Fill(dt);

        gvwItem.DataSource = dt;
        gvwItem.DataBind();
    }
    protected void btnTakeOrder_Click(object sender, EventArgs e)
    {

    }
}