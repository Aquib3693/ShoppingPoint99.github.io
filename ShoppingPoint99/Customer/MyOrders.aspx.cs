using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Customer_MyOrders : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["myCon"].ToString());
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["id"] == null)
        {
            Response.Redirect("MyProfile.aspx");
        }
        if (!IsPostBack)
        {
            ShowGridOrders();

        }
    }
    public void ShowGridOrders()
    {
        SqlDataAdapter dad = new SqlDataAdapter("select convert(varchar,CreatedDate,106)createddate, OrderID, CustomerID, TotalAmount, Discount, DeliveryCharges, TaxAmount, NetAmount, OrderStatus, PaidStatus, PaymentTranscation, PaymentMode, UniqueOrderNo from orders where customerid='" + Session["id"] + "'", con);
        DataTable dt = new DataTable();
        dad.Fill(dt);       
        gvwOrders.DataSource = dt;
        gvwOrders.DataBind();

    }
    protected void gvwOrders_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if ((e.Row.RowType != DataControlRowType.DataRow)) return;
        GridView gvwItem = (GridView)e.Row.FindControl("gvworderitems");
        int rowId = int.Parse((gvwOrders.DataKeys[e.Row.RowIndex].Value.ToString()));

        SqlDataAdapter dad = new SqlDataAdapter("select p.ProductName,p.MainImagePath,d.PckUnit,d.pckquantity,d.mrp,d.sellprice,d.total from OrderDetail d inner join productmaster p on p.productid=d.productid where orderid='" + rowId + "'", con);        
        DataTable dt = new DataTable();
        dad.Fill(dt);

        gvwItem.DataSource = dt;
        gvwItem.DataBind();
    }
}