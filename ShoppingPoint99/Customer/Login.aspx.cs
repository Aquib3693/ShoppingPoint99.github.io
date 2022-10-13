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

public partial class Customer_Login : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["myCon"].ToString());
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["login"] != null)
        {
            Response.Redirect("MyProfile.aspx");
        }
      
    }
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        SqlDataAdapter dad = new SqlDataAdapter("exec sp_customer_login '" + txtCMobile.Text.Trim() + "','" + txtPassword.Text.Trim() + "'", con);
        DataTable dt = new DataTable();
        dad.Fill(dt);
       
        if (dt.Rows.Count > 0)
        {
            string name = dt.Rows[0]["Mobile"].ToString();
            if (name != "")
            {
                
                Session["login"] = txtCMobile.Text.Trim();
                Response.Redirect("MyProfile.aspx");                
            }
            else
            {

                txtCMobile.Text = "";
                txtPassword.Text = "";
                Response.Write("<script>alert('Invalid Mobile Number or Password')</script>");
            }
        }
        else
        {
            txtCMobile.Text = "";
            txtPassword.Text = "";
            Response.Write("<script>alert('Invalid Mobile Number or Password')</script>");
        }
       

        dt.Dispose();
        dad.Dispose();
    }
    protected void lbtnSignUp_Click(object sender, EventArgs e)
    {
        Response.Redirect("Registration.aspx");
    }
    protected void lbtnSignIn_Click(object sender, EventArgs e)
    {
        pnlbtnLogin.Visible = true;
        pnlbtnLoginNewPass.Visible = false;
        pnlPass.Visible = true;
        pnlVerifyOTP.Visible = false;
        pnlGenerateOTP.Visible = false;
        pnlLinkBtnForgetPass.Visible = true;
        pnlLinkBtnRememberPass.Visible = false;
        pnlNewPass.Visible = false;

    }
    protected void lbtnForgetPass_Click(object sender, EventArgs e)
    {
        pnlPass.Visible = false;
        pnlGenerateOTP.Visible = true;
        pnlbtnLogin.Visible = false;
        pnlLinkBtnForgetPass.Visible = false;
        pnlLinkBtnRememberPass.Visible = true;
    }


    protected void btnVerifyOTP_Click(object sender, EventArgs e)
    {

        if (lblotp.Text == txtOTP.Text.Trim())
        {
            pnlbtnLoginNewPass.Visible = true;
            pnlVerifyOTP.Visible = false;
            pnlNewPass.Visible = true;
            lblotperror.Visible = false;
        }
        else
        {
            lblotperror.Visible = true;
            txtOTP.Text = "";
        }
    }
    protected void btnResendOTP_Click(object sender, EventArgs e)
    {
        RandomOTP();
        SendSMS(lblotp.Text, txtCMobile.Text.Trim());
        lblotperror.Visible = false;
    }
    protected void btnGenerateOTP_Click(object sender, EventArgs e)
    {

        SqlDataAdapter dad = new SqlDataAdapter("exec check_customer_mobile '" + txtCMobile.Text.Trim() + "'", con);
        DataTable dt = new DataTable();
        dad.Fill(dt);
        if (dt.Rows.Count > 0)
        {
            string status = dt.Rows[0][0].ToString();
            if (status == "Exist")
            {
                RandomOTP();
                SendSMS(lblotp.Text,txtCMobile.Text.Trim());
                pnlGenerateOTP.Visible = false;
                pnlVerifyOTP.Visible = true;
                txtCMobile.ReadOnly = true;
            }
            else
            {

                txtCMobile.Text = "";
                Response.Write("<script>alert('Not Registered ! Please SignUp')</script>");

            }
        }
        else
        {
            txtCMobile.Text = "";
            Response.Write("<script>alert('Not Registered ! Please SignUp')</script>");
        }
        dt.Dispose();
        dad.Dispose();
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
    public void RandomOTP()
    {
        Random r = new Random();
        int min = 1000;
        int max = 9999;
        int num = r.Next(min, max);
        lblotp.Text = num.ToString();
    }
    protected void btnLoginNewPass_Click(object sender, EventArgs e)
    {
        //update query pass via mobile number
        if (con.State == ConnectionState.Closed)
        {
            con.Open();
        }

        SqlCommand cmd = new SqlCommand("update customer set Password='" + txtNewPass.Text.Trim() + "' where Mobile='" + txtCMobile.Text.Trim() + "';", con);
        int i = cmd.ExecuteNonQuery();
        if (i > 0)
        {
            Session["login"] = txtCMobile.Text.Trim();
            Response.Redirect("MyProfile.aspx");
        }
        else
        {
            Response.Write("<script>alert('Error:Please Retype your Passwords.')</script>");
        }

        if (con.State == ConnectionState.Open)
        {
            con.Close();
        }
    }
}