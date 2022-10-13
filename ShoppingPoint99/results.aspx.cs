using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections;


public partial class Searchbaar : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["myCon"].ToString());
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            showProductDataList();
        }

        //showProductDataList();
    }
    public void showProductDataList()
    {
        if (Session["product_name"]!= null)
        {
            SqlCommand cmd = new SqlCommand("exec getproducts_new @product_id='" + Session["product_name"].ToString() + "'", con);
            SqlDataAdapter dad = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            dad.Fill(dt);

            DataList1.DataSource = dt;
            DataList1.DataBind();
            if (dt.Rows.Count > 0)
            {
                for (int i = 0; i < DataList1.Items.Count; i++)
                {
                    Label lblPID = (Label)DataList1.Items[i].FindControl("lblPID");
                    DropDownList ddlUnitmapping = (DropDownList)DataList1.Items[i].FindControl("ddlUnitmapping");
                    SqlCommand cmd1 = new SqlCommand("select p.MappingID,(cast(Quantity as varchar(10))+' '+(select UnitName from UnitMaster where UnitID=p.UnitID))Unit from Product_UnitMapping p where ProductID='" + lblPID.Text + "';", con);
                    SqlDataAdapter dad1 = new SqlDataAdapter(cmd1);
                    DataTable dt1 = new DataTable();
                    dad1.Fill(dt1);
                    ddlUnitmapping.DataSource = dt1;
                    ddlUnitmapping.DataTextField = "Unit";
                    ddlUnitmapping.DataValueField = "MappingID";
                    ddlUnitmapping.DataBind();

                    dt1.Dispose();
                    dad1.Dispose();
                }
            }
            dt.Dispose();
            dad.Dispose();

        }
        else
        {

            SqlCommand cmd = new SqlCommand("exec getproducts ", con);
            SqlDataAdapter dad = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            dad.Fill(dt);

            DataList1.DataSource = dt;
            DataList1.DataBind();
            if (dt.Rows.Count > 0)
            {
                for (int i = 0; i < DataList1.Items.Count; i++)
                {
                    Label lblPID = (Label)DataList1.Items[i].FindControl("lblPID");
                    DropDownList ddlUnitmapping = (DropDownList)DataList1.Items[i].FindControl("ddlUnitmapping");
                    SqlCommand cmd1 = new SqlCommand("select p.MappingID,(cast(Quantity as varchar(10))+' '+(select UnitName from UnitMaster where UnitID=p.UnitID))Unit from Product_UnitMapping p where ProductID='" + lblPID.Text + "';", con);
                    SqlDataAdapter dad1 = new SqlDataAdapter(cmd1);
                    DataTable dt1 = new DataTable();
                    dad1.Fill(dt1);
                    ddlUnitmapping.DataSource = dt1;
                    ddlUnitmapping.DataTextField = "Unit";
                    ddlUnitmapping.DataValueField = "MappingID";
                    ddlUnitmapping.DataBind();

                    dt1.Dispose();
                    dad1.Dispose();
                }
            }
            dt.Dispose();
            dad.Dispose();
        }

    }
    public void RandomNumber()
    {
        Random r = new Random();
        int num = r.Next();
        Session["UniqueNumber"] = num.ToString();
    }
    protected void btnAddToCart_Click(object sender, EventArgs e)
    {
        Button btn = (Button)sender;
        DataListItem datalistitem = (DataListItem)btn.NamingContainer;
        Label lbpid = (Label)datalistitem.FindControl("lblPID");
        DropDownList ddlUnitmapping = (DropDownList)datalistitem.FindControl("ddlUnitmapping");
        Label lbMrp = (Label)datalistitem.FindControl("lblMRP");
        Label lblSP = (Label)datalistitem.FindControl("lblSP");
        Label lblDis = (Label)datalistitem.FindControl("lblDis");
        if (Session["UniqueNumber"] == null)
        {
            RandomNumber();
            SqlDataAdapter cmd = new SqlDataAdapter("exec InsertTempCart '" + Session["UniqueNumber"] + "','" + lbpid.Text + "','" + Session["Id"] + "','" + ddlUnitmapping.SelectedItem + "','" + 1 + "','" + lblSP.Text + "','" + lbMrp.Text + "','" + lblDis.Text + "';", con);
            DataTable dt = new DataTable();
            cmd.Fill(dt);
            string status = "";
            if (dt.Rows.Count > 0)
            {
                status = dt.Rows[0][0].ToString();
                if (status == "Success")
                {
                    Response.Write("<script>alert('Added To Cart')</script>");
                }
                else
                {
                    Response.Write("<script>alert('Record already exist.')</script>");
                }
            }
            else
            {
                Response.Write("<script>alert('Opps! there is some problem while save data.')</script>");
            }
            dt.Dispose();
            cmd.Dispose();

        }
        else
        {
            SqlDataAdapter cmd = new SqlDataAdapter("exec InsertTempCart '" + Session["UniqueNumber"] + "','" + lbpid.Text + "','" + Session["Id"] + "','" + ddlUnitmapping.SelectedItem + "','" + 1 + "','" + lblSP.Text + "','" + lbMrp.Text + "','" + lblDis.Text + "';", con);
            DataTable dt = new DataTable();
            cmd.Fill(dt);
            string status = "";

            dt.Dispose();
            cmd.Dispose();
        }
    }
    protected void btnbuynow_Click(object sender, EventArgs e)
    {
        Button btn = (Button)sender;
        DataListItem datalistitem = (DataListItem)btn.NamingContainer;
        Label lbpid = (Label)datalistitem.FindControl("lblPID");
        DropDownList ddlUnitmapping = (DropDownList)datalistitem.FindControl("ddlUnitmapping");
        Label lbMrp = (Label)datalistitem.FindControl("lblMRP");
        Label lblSP = (Label)datalistitem.FindControl("lblSP");
        Label lblDis = (Label)datalistitem.FindControl("lblDis");
        if (Session["UniqueNumber"] == null)
        {
            RandomNumber();
            SqlDataAdapter cmd = new SqlDataAdapter("exec InsertTempCart '" + Session["UniqueNumber"] + "','" + lbpid.Text + "','" + Session["Id"] + "','" + ddlUnitmapping.SelectedItem + "','" + 1 + "','" + lblSP.Text + "','" + lbMrp.Text + "','" + lblDis.Text + "';", con);
            DataTable dt = new DataTable();
            cmd.Fill(dt);
            string status = "";
            if (dt.Rows.Count > 0)
            {
                status = dt.Rows[0][0].ToString();
                if (status == "Success")
                {
                    Response.Redirect("Website/ProceedToPay.aspx");
                }
                else
                {
                    Response.Redirect("Website/ProceedToPay.aspx");
                }
            }
            else
            {
                Response.Write("<script>alert('Opps! there is some problem while save data.')</script>");
            }
            dt.Dispose();
            cmd.Dispose();
        }
        else
        {
            SqlDataAdapter cmd = new SqlDataAdapter("exec InsertTempCart '" + Session["UniqueNumber"] + "','" + lbpid.Text + "','" + Session["Id"] + "','" + ddlUnitmapping.SelectedItem + "','" + 1 + "','" + lblSP.Text + "','" + lbMrp.Text + "','" + lblDis.Text + "';", con);
            DataTable dt = new DataTable();
            cmd.Fill(dt);
            string status = "";
            if (status == "Success")
            {
                Response.Redirect("Website/ProceedToPay.aspx");
            }
            else
            {
                Response.Redirect("Website/ProceedToPay.aspx");
            }
            dt.Dispose();
            cmd.Dispose();
        }
    }
}