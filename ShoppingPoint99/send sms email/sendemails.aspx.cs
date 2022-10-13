using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Net.Mail;
public partial class sendemails : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // Replace sender@example.com with your "From" address. 
        // This address must be verified with Amazon SES.
        const String FROM = "contact@shoppingpoint99.in";
        const String FROMNAME = "ShoppingPoint99";

        // Replace recipient@example.com with a "To" address. If your account 
        // is still in the sandbox, this address must be verified.
        const String TO = "arvindpatelkurmi92@gmail.com";

        // Replace smtp_username with your Amazon SES SMTP user name.
        const String SMTP_USERNAME = "AKIAID4CTM6TAZP5NX7Q";

        // Replace smtp_password with your Amazon SES SMTP user name.
        const String SMTP_PASSWORD = "Akx+muLlF5UnPGms8c39Jx/YZapLKvDntPoMR9DCx9TJ";

        // (Optional) the name of a configuration set to use for this message.
        // If you comment out this line, you also need to remove or comment out
        // the "X-SES-CONFIGURATION-SET" header below.
        const String CONFIGSET = "ConfigSet";

        // If you're using Amazon SES in a region other than US West (Oregon), 
        // replace email-smtp.us-west-2.amazonaws.com with the Amazon SES SMTP  
        // endpoint in the appropriate Region.
        const String HOST = "email-smtp.us-east-1.amazonaws.com";

        // The port you will connect to on the Amazon SES SMTP endpoint. We
        // are choosing port 587 because we will use STARTTLS to encrypt
        // the connection.
        const int PORT = 587;

        // The subject line of the email
        const String SUBJECT =
            "Shoppingpoint99 - To Chnage Password With OTP";

        // The body of the email
        const String BODY =
            "<h1 style='background-image: url(http://inventive.in/images/logo.gif);'>OTP is 13242</h1>" +
            "<p>This email was sent through the " +
            "<a href='https://aws.amazon.com/ses'>Amazon SES</a> SMTP interface " +
            "using the .NET System.Net.Mail library.</p>";

        // Create and build a new MailMessage object
        MailMessage message = new MailMessage();
        message.IsBodyHtml = true;
        message.From = new MailAddress(FROM, FROMNAME);
        message.To.Add(new MailAddress(TO));
        message.Subject = SUBJECT;
        message.Body = BODY;
        // Comment or delete the next line if you are not using a configuration set
        //message.Headers.Add("X-SES-CONFIGURATION-SET", CONFIGSET);

        // Create and configure a new SmtpClient
        SmtpClient client =
            new SmtpClient(HOST, PORT);
        // Pass SMTP credentials
        client.Credentials =
            new NetworkCredential(SMTP_USERNAME, SMTP_PASSWORD);
        // Enable SSL encryption
        client.EnableSsl = true;

        // Send the email. 
        try
        {
            //Console.WriteLine("Attempting to send email...");
            client.Send(message);
            Response.Write("Email sent");
            //Label1.Text = "Email sent!";
            //Console.WriteLine("Email sent!");
        }
        catch (Exception ex)
        {
            //Console.WriteLine("The email was not sent.");
            //Console.WriteLine("Error message: " + ex.Message);
            //Label1.Text = "Email sent!" + ex.Message;

            Response.Write(ex.Message);
        }

        // Wait for a key press so that you can see the console output
        //Console.Write("Press any key to continue...");
        //Console.ReadKey();
    }
}