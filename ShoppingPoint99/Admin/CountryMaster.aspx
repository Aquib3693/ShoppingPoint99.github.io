<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin.master" AutoEventWireup="true" CodeFile="CountryMaster.aspx.cs" Inherits="Admin_CountryMaster" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="../CSS/MasterStyleSheet.css" rel="stylesheet" />
    <style type="text/css">
    .auto-style8 {
        width: 100%;
    }
    .auto-style9 {
        height: 30px;
            font-size: large;
        }
    .auto-style10 {
        height: 8px;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="auto-style8">
    <tr>
        <td class="auto-style9" colspan="2"><strong style="font-size: x-large">COUNTRY MASTER </strong> </td>
    </tr>
    <tr>
        <td class="auto-style10" colspan="2" style="color: Red">* Fields are mandatory</td>
    </tr>
    <tr>
        <td style="width: 20%; ">Country Name*</td>
        <td style="width: 80%">
            <asp:TextBox ID="txtCName" runat="server" CssClass="admin-textbox" onkeypress='return ((event.charCode >= 65 && event.charCode <= 90) || (event.charCode >= 97 && event.charCode <= 122) || (event.charCode == 32) || (event.charCode == 38) )' placeholder="Enter Country Name"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtCName" CssClass="validation" Display="Dynamic" ErrorMessage="Field must not be empty" SetFocusOnError="True" ValidationGroup="A"></asp:RequiredFieldValidator>
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
            <asp:GridView ID="gvwCountryRecord" runat="server" Width="90%" AllowPaging="True" PageSize="100" OnPageIndexChanging="gvwCountryRecord_PageIndexChanging" AutoGenerateColumns="False" >
                <AlternatingRowStyle BackColor="#8DC73F" />
                <Columns>
                    <asp:TemplateField HeaderText="SNo">
                        <ItemTemplate>
                            <%#Container.DataItemIndex+1 %>   
                            <asp:Label ID="Label1" runat="server" style="text-align: left" Text='<%# Bind("CountryID") %>' Visible="false"></asp:Label>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Country Name">
                        <ItemTemplate>
                            <asp:TextBox ID="txtGCountryName" runat="server" Text='<%# Bind("CountryName") %>' onkeypress='return ((event.charCode >= 65 && event.charCode <= 90) || (event.charCode >= 97 && event.charCode <= 122) || (event.charCode == 32) || (event.charCode == 38) )'></asp:TextBox>
                            <br />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtGCountryName" CssClass="validation" Display="Dynamic" ErrorMessage="Enter Country" SetFocusOnError="True" ValidationGroup="B"></asp:RequiredFieldValidator>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Action">
                        <ItemTemplate>
                            <asp:ImageButton ID="btnGUpdate" runat="server" ImageUrl="../Images/OtherImages/save.png" width="20px" Height="20px" OnClick="btnGUpdate_Click1" ValidationGroup="B"/>
                            <asp:ImageButton ID="btnGDelete" runat="server" ImageUrl="../Images/OtherImages/delete.png" width="20px" Height="20px" OnClick="btnGDelete_Click1"/>
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

