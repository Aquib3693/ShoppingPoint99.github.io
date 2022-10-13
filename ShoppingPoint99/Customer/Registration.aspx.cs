using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;

public partial class Customer_Registration : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["myCon"].ToString());
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnGenerateOTP_Click(object sender, EventArgs e)
    {
        SqlDataAdapter dad = new SqlDataAdapter("exec check_customer_mobile '" + txtCMobile.Text.Trim() + "'", con);
        DataTable dt = new DataTable();
        dad.Fill(dt);
        if (dt.Rows.Count > 0)
        {
            string status = dt.Rows[0][0].ToString();
            if (status == "NotExist")
            {
                RandomOTP();
                SendSMS(lblotp.Text,txtCMobile.Text.Trim());
                pnlbtnGenOTP.Visible = false;
                pnlVerifyOTP.Visible = true;
                txtCMobile.ReadOnly = true;
            }
            else
            {

                txtCMobile.Text = "";
                Response.Write("<script>alert('Already Registered ! Please SignIn')</script>");

            }
        }
        else
        {
            txtCMobile.Text = "";
            Response.Write("<script>alert('Already Registered !')</script>");
        }
        dt.Dispose();
        dad.Dispose();

    }
    public void RandomOTP()
    {
        Random r = new Random();
        int min = 1000;
        int max = 9999;
        int num = r.Next(min, max);
        lblotp.Text = num.ToString();
    }

    public void SendSMS(string otp, string mobile)
    {

        string createdURL = "http://bulksms.inventive.in/rest/services/sendSMS/sendGroupSms?AUTH_KEY=16bb4b75dc5d2255ebe836d216278&message=Your 4 digits OTP is " + otp + "&senderId=ITDEMO&routeId=1&mobileNos=" + mobile + "&smsContentType=english";
        try
        {

            HttpWebRequest myReq = (HttpWebRequest)WebRequest.Create(createdURL);

            //Get response from Ozeki NG SMS Gateway Server and read the answer
            HttpWebResponse myResp = (HttpWebResponse)myReq.GetResponse();
            System.IO.StreamReader respStreamReader = new System.IO.StreamReader(myResp.GetResponseStream());
            string responseString = respStreamReader.ReadToEnd();
            respStreamReader.Close();
            myResp.Close();


        }
        catch (Exception)
        {
            //if sending request or getting response is not successful, Ozeki NG - SMS Gateway Server may not be running

        }
    }

    protected void btnResendOTP_Click(object sender, EventArgs e)
    {
        RandomOTP();
        SendSMS(lblotp.Text, txtCMobile.Text.Trim());
        lblotperror.Visible = false;
    }
    protected void btnVerifyOTP_Click(object sender, EventArgs e)
    {
        if (lblotp.Text == txtOTP.Text.Trim())
        {
            pnlVerifyOTP.Visible = false;
            pnlBtnRegister.Visible = true;
            pnlPass.Visible = true;
            lblotperror.Visible = false;
        }
        else
        {
            //Response.Write("<script>alert('OTP not correct!')</script>");
            lblotperror.Visible = true;
            txtOTP.Text = "";
        }

    }
    protected void btnRegister_Click(object sender, EventArgs e)
    {

        //Session["pass"] = txtNewPass.Text.Trim();

        SqlDataAdapter dad = new SqlDataAdapter("exec InsertCustomer '" + txtCMobile.Text.Trim() + "','" + txtNewPass.Text.Trim() + "';", con);
        DataTable dt = new DataTable();
        dad.Fill(dt);
        string status = "";
        if (dt.Rows.Count > 0)
        {
            status = dt.Rows[0][0].ToString();
            if (status == "Success")
            {
                Session["login"] = txtCMobile.Text.Trim();
                Response.Write("<script>alert('Registration succesfull!')</script>");
                Response.Redirect("MyProfile.aspx");

            }
            else
            {
                Response.Write("<script>alert('Go To Login Page.')</script>");
            }
        }
        else
        {
            Response.Write("<script>alert('Opps! there is some problem.')</script>");
        }



    }

    protected void lbtnSignIn_Click(object sender, EventArgs e)
    {
        Response.Redirect("../Customer/Login.aspx");
    }
}