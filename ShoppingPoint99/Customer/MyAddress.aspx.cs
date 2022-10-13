using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Net.Mail;
using System.Net;

public partial class Customer_MyAddress : System.Web.UI.Page
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
            ShowState();
            ShowDataList();
        }
    }
    protected void btnSaveAddress_Click(object sender, EventArgs e)
    {

        SqlDataAdapter cmd = new SqlDataAdapter();
        if(HiddenField1.Value=="")
        {
            cmd = new SqlDataAdapter("exec InsertCustomerAddress '" + Session["id"] + "','" + txtAddress.Text.Trim() + "','" + txtlandmark.Text.Trim() + "','" + txtPin.Text.Trim() + "','" + ddlState.SelectedItem + "','" + ddlCity.SelectedItem + "' ;", con);

        }
            
        else
        {
            cmd = new SqlDataAdapter("exec editCustomerAddress '" + Session["id"]+ "','" + txtAddress.Text.Trim() + "','" + txtlandmark.Text.Trim() + "','" + txtPin.Text.Trim() + "','" + ddlState.SelectedItem + "','" + ddlCity.SelectedItem + "','"+HiddenField1.Value+"' ;", con);

        }
        DataTable dt = new DataTable();
        cmd.Fill(dt);
      
        string status = "";
        if (dt.Rows.Count > 0)
        {
            status = dt.Rows[0][0].ToString();
            if (status == "Success")
            {
                Response.Redirect("../Customer/MyAddress.aspx");

            }
            else
            {
                Response.Redirect("../Customer/MyAddress.aspx");
            }
        }
        else
        {
            Response.Write("<script>alert('Opps! there is some problem while save data.')</script>");
        }

        cmd.Dispose();
        ShowDataList();
    }
    protected void ddlState_SelectedIndexChanged(object sender, EventArgs e)
    {
        ShowCity();
    }
    protected void btnGoBack_Click(object sender, EventArgs e)
    {
        paneladdaddress.Visible = true;
        paneleditaddress.Visible = false;
    }
    public void ShowDataList()
    {
        SqlCommand cmd = new SqlCommand("SELECT * from CustomerAddress where CustomerID='" + Session["id"] + "';", con);
        SqlDataAdapter dad = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        dad.Fill(dt);
        gvwaddress.DataSource = dt;
        gvwaddress.DataBind();



        if (dt.Rows.Count > 0)
        {
            for (int i = 0; i < gvwaddress.Rows.Count; i++)
            {
                string isdefault = dt.Rows[i]["IsDefault"].ToString();
                CheckBox chkdefaultaddress = (CheckBox)gvwaddress.Rows[i].FindControl("chkdefaultaddress");
                if (isdefault == "YES")
                {
                    chkdefaultaddress.Checked = true;
                }
            }
        }


        dt.Dispose();
        dad.Dispose();
    }

    public void ShowState()
    {
        SqlCommand com = new SqlCommand("select * from StateMaster  where isdeleted='NO' order by StateName", con);
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
        SqlCommand com = new SqlCommand("select * from Citymaster where StateID='" + ddlState.SelectedValue + "' and isdeleted='NO' order by CityName", con);
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
    protected void btnAddAddress_Click(object sender, EventArgs e)
    {
        paneladdaddress.Visible = false;
        paneleditaddress.Visible = true;
    }
    protected void DLbtnDelete_Click(object sender, EventArgs e)
    {
        Button delete = (Button)sender;

        GridViewRow row = (GridViewRow)delete.NamingContainer;
        Label lblAddressId = (Label)row.FindControl("lblAddressId");
        if (con.State == ConnectionState.Closed)
        {
            con.Open();
        }
        SqlCommand cmd = new SqlCommand("delete from customeraddress where AddressID=@AddressID", con);
        cmd.Parameters.AddWithValue("AddressID", lblAddressId.Text);

        int i = cmd.ExecuteNonQuery();
        if (con.State == ConnectionState.Open)
        {
            con.Close();
        }

        ShowDataList();
    }
    protected void chkdefaultaddress_CheckedChanged(object sender, EventArgs e)
    {

        foreach (GridViewRow item in gvwaddress.Rows)
        {
            CheckBox chkDefauktAdd = (CheckBox)item.FindControl("chkdefaultaddress");
            Label lblAddressId = (Label)item.FindControl("lblAddressId");
            if (chkDefauktAdd.Checked == true)
            {
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("update CustomerAddress set IsDefault='YES' where AddressID=@AddressID", con);
                cmd.Parameters.AddWithValue("AddressID", lblAddressId.Text);
                int i = cmd.ExecuteNonQuery();
                if (con.State == ConnectionState.Open)
                {
                    con.Close();
                }
            }
            else
            {
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("update CustomerAddress set IsDefault='NO' where AddressID=@AddressID", con);
                cmd.Parameters.AddWithValue("AddressID", lblAddressId.Text);
                int i = cmd.ExecuteNonQuery();
                if (con.State == ConnectionState.Open)
                {
                    con.Close();
                }
            }
        }
        ShowDataList();

    }
    protected void btnEdit_Click(object sender, EventArgs e)
    {
        paneladdaddress.Visible = false;
        paneleditaddress.Visible = true;
        string state = "";
        string city = "";
        Button btn = (Button)sender;
        //Get the row that contains this button
        GridViewRow gvr = (GridViewRow)btn.NamingContainer;
        Label lblAddressId = (Label)gvr.FindControl("lblAddressId");
        HiddenField1.Value = lblAddressId.Text;
        if (con.State == ConnectionState.Closed)
        {
            con.Open();
        }
        SqlCommand cmd = new SqlCommand("select * from customeraddress where addressid=@addressid", con);
        cmd.Parameters.Add("addressid", lblAddressId.Text);
        SqlDataReader rdr = cmd.ExecuteReader();
        if (rdr.Read())
        {
            txtAddress.Text = (rdr["Address"].ToString());
            txtlandmark.Text = (rdr["Landmark"].ToString());
            txtPin.Text = (rdr["pin"].ToString());
            state = rdr["State"].ToString();
            city = rdr["City"].ToString();
        }
        if (con.State == ConnectionState.Open)
        {
            con.Close();
        }
        if (state != "" && city != "")
        {
            ddlState.ClearSelection();
            ddlCity.ClearSelection();
            ddlState.Items.FindByText(state).Selected = true;
            ddlState_SelectedIndexChanged(sender, e);
            ddlCity.Items.FindByText(city).Selected = true;

        }


    }

    protected void gvwaddress_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}