using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class sendsms : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        SendSMS("mere text massage khatam ho gaye hain please online aa", "8574734319");
    }

    //fun to send sms 
    public void SendSMS(string otp, string mobile)
    {

        string createdURL = "http://bulksms.inventive.in/rest/services/sendSMS/sendGroupSms?AUTH_KEY=16bb4b75dc5d2255ebe836d216278&message=" + otp + "&senderId=ITDEMO&routeId=1&mobileNos=" + mobile + "&smsContentType=english";
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
}