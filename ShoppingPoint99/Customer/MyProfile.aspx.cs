using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Net;
using System.Net.Mail;

public partial class Customer_MyProfile : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["myCon"].ToString());
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

            ShowData();
        }

        if (Session["login"] != null)
        {
            txtMobile.Text = Session["login"].ToString();
        }
        else
        {
            Response.Redirect("login.aspx");
        }
    }
    protected void btnSaveData_Click(object sender, EventArgs e)
    {
        if (con.State == ConnectionState.Closed)
        {
            con.Open();
        }
        SqlCommand cmd = new SqlCommand("update customer set Name='" + txtName.Text.Trim() + "',Email='" + txtEmail.Text.Trim() + "' where mobile='" + Session["login"] + "';", con);

        int i = cmd.ExecuteNonQuery();
        if (i > 0)
        {
            Response.Write("<script>alert('Record saved')</script>");
        }
        else
        {
            Response.Write("<script>alert('Opps! there is some problem while saving data.')</script>");
        }

        if (con.State == ConnectionState.Open)
        {
            con.Close();
        }
       
        //string otp= "check your name in Profile";
        //SendSMS(otp, txtMobile.Text.Trim());
    }
    //public void SendSMS(string otp, string mobile)
    //{

    //    string createdURL = "http://bulksms.inventive.in/rest/services/sendSMS/sendGroupSms?AUTH_KEY=16bb4b75dc5d2255ebe836d216278&message=your profile is update" + otp + "&senderId=ITDEMO&routeId=1&mobileNos=" + mobile + "&smsContentType=english";
    //    try
    //    {

    //        HttpWebRequest myReq = (HttpWebRequest)WebRequest.Create(createdURL);

    //        //Get response from Ozeki NG SMS Gateway Server and read the answer
    //        HttpWebResponse myResp = (HttpWebResponse)myReq.GetResponse();
    //        System.IO.StreamReader respStreamReader = new System.IO.StreamReader(myResp.GetResponseStream());
    //        string responseString = respStreamReader.ReadToEnd();
        
    //        respStreamReader.Close();
    //        myResp.Close();


    //    }
    //    catch (Exception)
    //    {
    //        //if sending request or getting response is not successful, Ozeki NG - SMS Gateway Server may not be running

    //    }
    //}
    //public void mailsent(string toemail,string _subject,string _body)
    //{
    //    const String FROM = "contact@shoppingpoint99.in";
    //    const String FROMNAME = "ShoppingPoint99";
    //    String TO = toemail;
    //    const String SMTP_USERNAME = "AKIAID4CTM6TAZP5NX7Q";
    //    const String SMTP_PASSWORD = "Akx+muLlF5UnPGms8c39Jx/YZapLKvDntPoMR9DCx9TJ";
    //    const String CONFIGSET = "ConfigSet";
    //    const String HOST = "email-smtp.us-east-1.amazonaws.com";
    //    const int PORT = 587;
    //    String SUBJECT = _subject;
    //    String BODY = _body;   
    //    MailMessage message = new MailMessage();
    //    message.IsBodyHtml = true;
    //    message.From = new MailAddress(FROM, FROMNAME);
    //    message.To.Add(new MailAddress(TO));
    //    message.Subject = SUBJECT;
    //    message.Body = BODY;
    //    SmtpClient client =
    //        new SmtpClient(HOST, PORT);
    //    client.Credentials =
    //        new NetworkCredential(SMTP_USERNAME, SMTP_PASSWORD);
    //    client.EnableSsl = true;
    //    try
    //    {
    //        client.Send(message);
    //        Response.Write("Email sent");
    //    }
    //    catch (Exception ex)
    //    {
    //        Response.Write(ex.Message);
    //    }
    //}
    public void ShowData()
    {
        if (Session["login"] != null)
        {
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }

            SqlCommand cmd = new SqlCommand("select * from Customer where Mobile='" + Session["login"] + "';", con);
            SqlDataReader rdr = cmd.ExecuteReader();
            if (rdr.Read())
            {
                txtEmail.Text = (rdr["Email"].ToString());
                txtName.Text = (rdr["Name"].ToString());
                Session["Id"] = (rdr["CustomerID"].ToString());

                
                              
            }
            rdr.Dispose();
            cmd.Dispose();

            if (con.State == ConnectionState.Open)
            {
                con.Close();
            }
        }


    }



  
  
   

 

}