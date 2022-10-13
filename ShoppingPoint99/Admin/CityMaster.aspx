<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin.master" AutoEventWireup="true" CodeFile="CityMaster.aspx.cs" Inherits="Admin_CityMaster" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="../CSS/MasterStyleSheet.css" rel="stylesheet" />
    <style type="text/css">
    .auto-style8 {
        width: 100%;
    }
    .auto-style9 {
        height: 30px;
            font-size: x-large;
            font-weight: 700;
        }
    .auto-style10 {
        height: 8px;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="auto-style8">
    <tr>
        <td class="auto-style9" colspan="2">CITY MASTER </td>
    </tr>
    <tr>
        <td class="auto-style10" colspan="2" style="color: Red">* Fields are mandatory</td>
    </tr>
         
    <tr>
        <td style="width: 20%; ">Select Country*</td>
        
        <td style="width: 80%">
            
            <asp:DropDownList ID="ddlCountry" runat="server" CssClass="admin-textbox" OnSelectedIndexChanged="ddlCountry_SelectedIndexChanged" AutoPostBack="True">
            </asp:DropDownList>
                
            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="ddlCountry" CssClass="validation" Display="Dynamic" ErrorMessage="Please select Country" SetFocusOnError="True" ValidationGroup="A" InitialValue="0"></asp:RequiredFieldValidator>
                
        </td>
            
    </tr>
        <tr>
        <td style="width: 20%; ">Select State*</td>
           
        <td style="width: 80%">
            <asp:DropDownList ID="ddlState" runat="server" CssClass="admin-textbox">
            </asp:DropDownList>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="ddlState" CssClass="validation" Display="Dynamic" ErrorMessage="Please select State" SetFocusOnError="True" ValidationGroup="A" InitialValue="0"></asp:RequiredFieldValidator>
        </td>
               
    </tr>
            
    <tr>
        <td style="width: 20%">City Name*</td>
        <td style="width: 80%">
            <asp:TextBox ID="txtCityName" runat="server" CssClass="admin-textbox" onkeypress='return ((event.charCode >= 65 && event.charCode <= 90) || (event.charCode >= 97 && event.charCode <= 122) || (event.charCode == 32) || (event.charCode == 38) )' placeholder="Enter City Name"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtCityName" CssClass="validation" Display="Dynamic" ErrorMessage="Field must not be empty" SetFocusOnError="True" ValidationGroup="A"></asp:RequiredFieldValidator>
        </td>
    </tr>
        <tr>
        <td style="width: 20%">&nbsp;</td>
        <td style="width: 80%">
            &nbsp;</td>
    </tr>
    <tr>
        <td style="width: 20%">&nbsp;</td>
        <td style="width: 80%">
            <asp:Button ID="btnSave" runat="server" OnClick="btnSave_Click" ValidationGroup="A" CssClass="admin-button" Text="Save" />
&nbsp;<asp:Button ID="btnReset" runat="server"  OnClick="btnReset_Click" ValidationGroup="B" CssClass="admin-button" Text="Reset" />
        </td>
    </tr>
    <tr>
        <td style="width: 20%">&nbsp;</td>
        <td style="width: 80%">&nbsp;</td>
    </tr>
    <tr>
        <td style="width: 20%">&nbsp;</td>
        <td style="width: 80%">
            <asp:UpdatePanel ID="up" runat="server"><ContentTemplate>
        <asp:GridView ID="gvwCityRecord" runat="server" Width="90%" AllowPaging="True"  PageSize="100" AutoGenerateColumns="False" OnPageIndexChanging="gvwCityRecord_PageIndexChanging"  >
                <AlternatingRowStyle BackColor="#8DC73F" />
                <Columns>
                    <asp:TemplateField HeaderText="SNo">
                        <ItemTemplate>
                             <%#Container.DataItemIndex+1 %> 
                            <asp:Label ID="Label1" runat="server" style="text-align: left" Text='<%# Bind("CityID") %>' Visible="false"></asp:Label>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Country Name">
                        <ItemTemplate>
                             
                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("CountryName") %>' ></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="State Name">
                       
                        <ItemTemplate>
                            
                            <asp:Label ID="Label5" runat="server" Text='<%# Bind("StateName") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="City Name">
                        <ItemTemplate>
                            <asp:TextBox ID="txtGCityName" runat="server" Text='<%# Bind("CityName") %>' onkeypress='return ((event.charCode >= 65 && event.charCode <= 90) || (event.charCode >= 97 && event.charCode <= 122) || (event.charCode == 32) || (event.charCode == 38) )'></asp:TextBox>
                            <br />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtGCityName" CssClass="validation" Display="Dynamic" ErrorMessage="Enter City" SetFocusOnError="True" ValidationGroup="B"></asp:RequiredFieldValidator>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Action">
                        <ItemTemplate>
                            <asp:ImageButton ID="btnGUpdate" runat="server" ImageUrl="../Images/OtherImages/save.png" width="20px" Height="20px" OnClick="btnGUpdate_Click" ValidationGroup="B"/>
                            <asp:ImageButton ID="btnGDelete" runat="server" ImageUrl="../Images/OtherImages/delete.png" width="20px" Height="20px" OnClick="btnGDelete_Click"/>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <HeaderStyle BackColor="#8DC73F" ForeColor="White" Height="30px" />
                <RowStyle BackColor="Silver" />
            </asp:GridView>      
                </ContentTemplate></asp:UpdatePanel>  
        </td>
    </tr>
    <tr>
        <td style="width: 20%">&nbsp;</td>
        <td style="width: 80%">&nbsp;</td>
    </tr>
    <tr>
        <td style="width: 20%">&nbsp;</td>
        <td style="width: 80%">&nbsp;</td>
    </tr>
</table>
</asp:Content>

