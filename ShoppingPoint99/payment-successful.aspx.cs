using paytm;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Data;
public partial class payment_successful : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["myCon"].ToString());

    protected void Page_Load(object sender, EventArgs e)
    {
        string mid = string.Empty;
        string orderid = string.Empty;
        string txnamount = string.Empty;
        string currency = string.Empty;
        string txnid = string.Empty;
        string banktxnid = string.Empty;
        string status = string.Empty;
        string respcode = string.Empty;
        string respmsg = string.Empty;
        string txndate = string.Empty;
        string gatewayname = string.Empty;
        string bankname = string.Empty;
        string paymentmode = string.Empty;
        string checksumhash = string.Empty;
        String merchantKey = "HzvIdjX1t&cnvE2E"; // Replace the with the Merchant Key provided by Paytm at the time of registration.
        Dictionary<string, string> parameters = new Dictionary<string, string>();
        string paytmChecksum = "";
        foreach (string key in Request.Form.Keys)
        {
            parameters.Add(key.Trim(), Request.Form[key].Trim());

          
        }

        if (parameters.ContainsKey("CHECKSUMHASH"))
        {
            paytmChecksum = parameters["CHECKSUMHASH"];
            parameters.Remove("CHECKSUMHASH");
        }
        if (CheckSum.verifyCheckSum(merchantKey, parameters, paytmChecksum))
        {
            Response.Write("Checksum Matched");
        }
        else
        {
            Response.Write("Checksum MisMatch");
        }


        if (Request.Form["RESPCODE"].Trim() != "01")
        {
            Session["respcode"] = respcode = Request.Form["RESPCODE"].Trim();
            Session["respmsg"] = respmsg = Request.Form["RESPMSG"].Trim();
            Session["status"] = status = Request.Form["STATUS"].Trim();
            mid = Request.Form["MID"].Trim();
            Session["amt"] = txnamount = Request.Form["TXNAMOUNT"].Trim();
            orderid = Request.Form["ORDERID"].Trim();
            Session["txnid"] = txnid = Request.Form["TXNID"].Trim();
            checksumhash = Request.Form["CHECKSUMHASH"].Trim();

        }
        else
        {
            mid = Request.Form["MID"].Trim();
            orderid = Request.Form["ORDERID"].Trim();
            txnamount = Request.Form["TXNAMOUNT"].Trim();
            currency = Request.Form["CURRENCY"].Trim();
            txnid = Request.Form["TXNID"].Trim();
            banktxnid = Request.Form["BANKTXNID"].Trim();
            status = Request.Form["STATUS"].Trim();
            respcode = Request.Form["RESPCODE"].Trim();
            respmsg = Request.Form["RESPMSG"].Trim();
            txndate = Request.Form["TXNDATE"].Trim();
            gatewayname = Request.Form["GATEWAYNAME"].Trim();
            bankname = Request.Form["BANKNAME"].Trim();
            paymentmode = Request.Form["PAYMENTMODE"].Trim();
            checksumhash = Request.Form["CHECKSUMHASH"].Trim();
        }

        SqlCommand com = new SqlCommand("select Email from Customer where CustomerID=" + Session["id"].ToString() + "", con);
        SqlDataAdapter dad = new SqlDataAdapter(com);
        DataTable dt = new DataTable();
        dad.Fill(dt);
        SqlCommand com1 = new SqlCommand("select top 1 uniqueorderno,NetAmount,PaidStatus,CreatedDate from orders where CustomerID=" + Session["id"].ToString() + " order by OrderID desc", con);
        SqlDataAdapter dad1 = new SqlDataAdapter(com1);
        DataTable dt1 = new DataTable();
        dad1.Fill(dt1);

        SqlCommand com2 = new SqlCommand("Select (select ProductName from ProductMaster where ProductID=od.ProductID)ProductName from OrderDetail  od where orderid='" + orderid + "'", con);
        SqlDataAdapter dad2 = new SqlDataAdapter(com2);
        DataTable dt2 = new DataTable();
        dad2.Fill(dt2);


        string subject = "your order place.your orderId ";
        String BODY =
             "<p>Thank you</p>" +
             "<p>item successful order. And your orderID  are " + dt1.Rows[0][0].ToString() + " TotalAmount=" + dt1.Rows[0][1].ToString() + " payment status=" + dt1.Rows[0][2].ToString() + "</p>" 
             +"<p>you product name "+dt2.Rows[0][0].ToString()+"with other product name"+dt2.Rows[0][0].ToString()+"</p>"+"<a href='https://www.shoppingpoint99.in/'>Go To Website</a>";
        mailsent(dt.Rows[0][0].ToString(), subject, BODY);

    }

    public void mailsent(string toemail, string _subject, string _body)
    {
        const String FROM = "contact@shoppingpoint99.in";
        const String FROMNAME = "ShoppingPoint99";
        String TO = toemail;
        const String SMTP_USERNAME = "AKIAID4CTM6TAZP5NX7Q";
        const String SMTP_PASSWORD = "Akx+muLlF5UnPGms8c39Jx/YZapLKvDntPoMR9DCx9TJ";
        const String CONFIGSET = "ConfigSet";
        const String HOST = "email-smtp.us-east-1.amazonaws.com";
        const int PORT = 587;
        String SUBJECT = _subject;
        String BODY = _body;
        MailMessage message = new MailMessage();
        message.IsBodyHtml = true;
        message.From = new MailAddress(FROM, FROMNAME);
        message.To.Add(new MailAddress(TO));
        message.Subject = SUBJECT;
        message.Body = BODY;
        SmtpClient client =
            new SmtpClient(HOST, PORT);
        client.Credentials =
            new NetworkCredential(SMTP_USERNAME, SMTP_PASSWORD);
        client.EnableSsl = true;
        try
        {
            client.Send(message);
            Response.Write("Email sent");
        }
        catch (Exception ex)
        {
            throw;
        }
        
    }

    public SqlConnection myCon { get; set; }

    public System.Data.DataTable dt { get; set; }
}