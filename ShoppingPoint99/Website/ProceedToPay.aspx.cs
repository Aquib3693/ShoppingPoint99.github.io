using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using paytm;
using System.Net.Mail;
using System.Net;
public partial class Website_ProceedToPay : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["myCon"].ToString());
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["login"] != null)
        {
            if (!IsPostBack)
            {
                showCartDetails();
                grandtotal();
                ShowUserdetail();
            }
        }
        else
        {
            Response.Redirect("../Customer/Login.aspx");
        }
     
    }
    //Customer details and his address start
    public void ShowUserdetail()
    {
        if (Session["login"] != null)
        {
            txtMobileNo.Text = Session["login"].ToString();
            SqlCommand cmd = new SqlCommand("select customerid,([dbo].[InitCap](Name))name from Customer where Mobile='" + Session["login"] + "';", con);
            SqlDataAdapter dad = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            dad.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                Session["id"] = dt.Rows[0]["Customerid"].ToString();                
                string name=dt.Rows[0]["Name"].ToString();
                if (name != "")
                {
                    lblCustomername.Text = name;
                }
                else
                {
                    lblCustomername.Text = "Customer";
                }
                SqlDataAdapter dad1 = new SqlDataAdapter("select IsDefault,Addressid,(Address+', '+City+', '+State+', '+cast(Pin as varchar(6)))addrss from CustomerAddress where CustomerID='"+Session["id"]+"' ", con);
                DataTable dt1 = new DataTable();
                dad1.Fill(dt1);


                int addrow = dt1.Rows.Count;
                if (addrow > 0)
                {
                    pnlenteraddress.Visible = false;
                    pnlselectaddress.Visible = true;
                    pnlOrderBtn.Visible = true;
                   

                    for (int i = 0; i < addrow; i++)
                    {
                        string isdefault = dt1.Rows[i]["IsDefault"].ToString();
                        
                        if (isdefault == "YES")
                        {
                            lbladdressid.Text=dt1.Rows[i]["addressid"].ToString();
                        }
                    }                    
                }
                else
                {
                    ShowState();
                    pnlenteraddress.Visible = true;
                    pnlselectaddress.Visible = false;
                }

                rdladdress.DataSource = dt1;
                rdladdress.DataTextField = "addrss";
                rdladdress.DataValueField = "Addressid";
                rdladdress.DataBind();
                rdladdress.SelectedValue = lbladdressid.Text;

            }
            dt.Dispose();
            dad.Dispose();
            cmd.Dispose();
        }
        else
        {
            Response.Redirect("../Customer/Login.aspx");
        }
    }
    public void ShowState()
    {
        SqlCommand com = new SqlCommand("select ([dbo].[InitCap](StateName))StateName,stateid from StateMaster  where isdeleted='NO' order by StateName", con);
        SqlDataAdapter dad = new SqlDataAdapter(com);
        DataTable dt = new DataTable();
        dad.Fill(dt);

        ddlState.DataSource = dt;
        ddlState.Items.Clear();
        ddlState.DataTextField = "StateName";
        ddlState.DataValueField = "StateID";
        ddlState.DataBind();
        ddlState.Items.Insert(0, new ListItem("Select State", "0"));
        ddlCity.Items.Insert(0, new ListItem("--Select--", "0"));

        dt.Dispose();
        dad.Dispose();
        com.Dispose();
    }
    public void ShowCity()
    {
        SqlCommand com = new SqlCommand("select ([dbo].[InitCap](CityName))CityName,CityID from Citymaster where StateID='" + ddlState.SelectedValue + "' and isdeleted='NO' order by CityName", con);
        SqlDataAdapter dad = new SqlDataAdapter(com);
        DataTable dt = new DataTable();
        dad.Fill(dt);

        ddlCity.DataSource = dt;
        ddlCity.Items.Clear();
        ddlCity.DataTextField = "CityName";
        ddlCity.DataValueField = "CityID";
        ddlCity.DataBind();
        ddlCity.Items.Insert(0, new ListItem("Select City", "0"));

        dt.Dispose();
        dad.Dispose();
        com.Dispose();
    }
    protected void ddlState_SelectedIndexChanged(object sender, EventArgs e)
    {
        ShowCity();
    }
    protected void rdladdress_SelectedIndexChanged(object sender, EventArgs e)
    {

            int id = Convert.ToInt32(rdladdress.SelectedValue);
            if (id>0)
            {
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                string sqlquery = "update CustomerAddress set IsDefault='NO' where Customerid='" + Session["id"] + "'";
                sqlquery += "update CustomerAddress set IsDefault='YES' where AddressID='" + id + "'";
                SqlCommand cmd = new SqlCommand(sqlquery, con);
                cmd.Parameters.AddWithValue("AddressID", id);
                int i = cmd.ExecuteNonQuery();
                if (con.State == ConnectionState.Open)
                {
                    con.Close();
                }
            }            
        
    }
   
    protected void btnSaveAddress_Click(object sender, EventArgs e)
    {
        if (con.State == ConnectionState.Closed)
        {
            con.Open();
        }
        string sqltext = "update Customer set name='" + txtname.Text.Trim() + "',Email='" + txtEmail.Text.Trim() + "' where Mobile='" + Session["login"] + "'";
        sqltext += "exec InsertCustomerAddress '" + Session["id"] + "','" + txtAddress.Text.Trim() + "','" + txtLandmark.Text.Trim() + "','" + txtPin.Text.Trim() + "','" + ddlState.SelectedItem + "','" + ddlCity.SelectedItem + "' ";
        SqlCommand cmd = new SqlCommand(sqltext, con);
        int i = cmd.ExecuteNonQuery();
        if (i > 0)
        {
            Response.Write("<script>alert('Record Saved.')</script>");
        }
        else
        {
            Response.Write("<script>alert('Oops! There is some problem while saving data.')</script>");
        }
        if (con.State == ConnectionState.Open)
        {
            con.Close();
        }

        cmd.Dispose();
        ShowUserdetail();
    }
    //Customer details and his address end



    //Cart details start
    public void showCartDetails()
    {
        if (Session["UniqueNumber"] != null)
        {
            SqlCommand cmd = new SqlCommand("select pm.MainImagePath,c.ProductID,pm.ProductName,c.PckDetail,c.Quantity,c.MRP,c.SP,c.Discount from productmaster pm inner join TempCart c on c.ProductID=pm.ProductID where c.UniqueNo='" + Session["UniqueNumber"] + "' ;", con);
            SqlDataAdapter dad = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            dad.Fill(dt);

            gvwCart.DataSource = dt;
            gvwCart.DataBind();
        }
        else
        {
            Response.Write("<script>alert('Cart is Empty')</script>");
            Response.Redirect("../Website/MyCart.aspx");
        }

    }
    public void grandtotal()
    {
        int nrow = 0;
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
                Response.Write("<script>alert('Cart is Empty.Please add some product to cart.')</script>");
                Response.Redirect("../Website/MyCart.aspx");
            }
            else
            {
                lblCartValue.Text = nrow.ToString();
            }

        }
        

    }
    protected void btnPlaceOrder_Click(object sender, EventArgs e)
    {

        SqlDataAdapter cmd = new SqlDataAdapter("exec InsertOrder '" + Session["id"] + "','" + lblTotal.Text + "','" + 0 + "','" + lblDelivery.Text + "','" + 0 + "','" + lblGTotal.Text + "','" + "pending" + "','" + "unpaid" + "','" + 0 + "','" + "Online Payment" + "','" + Session["UniqueNumber"] + "' ", con);
        DataTable dt = new DataTable();
        cmd.Fill(dt);
        string status = "";
        string orderid = "";
        if (dt.Rows.Count > 0)
        {
            status = dt.Rows[0][1].ToString();
            if (status == "success")
            {
                orderid = dt.Rows[0][0].ToString();
                paymentModule(orderid, Session["id"].ToString(), lblGTotal.Text);

            }
            else
            {
                Response.Write("<script>alert('Opps! there is some problem while saving order.')</script>");
            }
        }
        else
        {
            Response.Write("<script>alert('Opps! there is some problem while saving order.')</script>");
        }
        //string subject = "Update Email in Profile";
        //String BODY =
        //     "<p>Thank you</p>" +
        //     "<p>Your order place </p>" +
        //     "<a href='https://www.shoppingpoint99.in/'>Go To Website</a>";
        //mailsent(txtEmail, subject, BODY);

        cmd.Dispose();
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
        SqlCommand cmd = new SqlCommand("update TempCart set Quantity='" + txtQty.Text + "' where ProductID=@ProductID", con);
        cmd.Parameters.Add("ProductID", lblPID.Text);
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
    //Cart details end



    //payment module start
    public void paymentModule(string ordrid,string customerid,string payableAmount)
    {
        string otp = "";
        string outputHTML = "";
        Dictionary<string, string> parameters = new Dictionary<string, string>();
        parameters.Add("MID", "PxAiMM23343831231456");
        parameters.Add("CHANNEL_ID", "WEB");
        parameters.Add("INDUSTRY_TYPE_ID", "Retail");
        parameters.Add("WEBSITE", "WEBSTAGING");

        parameters.Add("CALLBACK_URL", "http://localhost:4880/payment-successful.aspx");
        string custId = customerid;
        string orderid = ordrid;

        string paytmURL = "https://securegw-stage.paytm.in/order/process";

        //string paytmURL = "https://securegw-stage.paytm.in/theia/processTransaction";

        parameters.Add("EMAIL", "yoyorg15@gmail.com");
        parameters.Add("MOBILE_NO", "9634512812");
        parameters.Add("CUST_ID", custId);
        parameters.Add("ORDER_ID", orderid);
        parameters.Add("TXN_AMOUNT", payableAmount);
        try
        {
            string MERCHANTKEY = "HzvIdjX1t&cnvE2E";
            string checksum = CheckSum.generateCheckSum(MERCHANTKEY, parameters);
            string correct_check = Server.UrlEncode(checksum);
            outputHTML = "<html>";
            outputHTML += "<head>";
            outputHTML += "<title>Merchant Check Out Page</title>";
            outputHTML += "</head>";
            outputHTML += "<body>";
            outputHTML += "<center>Please do not refresh page</center>";
            outputHTML += "<form method='post' action='" + paytmURL + "' name='f1'>";
            outputHTML += "<table border='1'>";
            outputHTML += "<tbody>";
            foreach (string key in parameters.Keys)
            {
                outputHTML += "<input type='hidden' name='" + key + "' value='" + parameters[key] + "'>'";
            }
            outputHTML += "<input type='hidden' name='CHECKSUMHASH' value='" + checksum + "'>";
            outputHTML += "</tbody>";
            outputHTML += "</table>";
            outputHTML += "<script type='text/javascript'>";
            outputHTML += "document.f1.submit();";
            outputHTML += "</script>";
            outputHTML += "</form>";
            outputHTML += "</body>";
            outputHTML += "</html>";
            Response.Write(outputHTML);
        }
        catch (Exception ex)
        {
            Response.Write(ex.Message);
        }
    }

    //payment module end



    public string Email { get; set; }
}