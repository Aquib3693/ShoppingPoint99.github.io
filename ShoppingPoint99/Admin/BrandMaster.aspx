<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin.master" AutoEventWireup="true" CodeFile="BrandMaster.aspx.cs" Inherits="Admin_BrandMaster" %>

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
        <td class="auto-style9" colspan="2">BRAND&nbsp; MASTER </td>
    </tr>
    <tr>
        <td class="auto-style10" colspan="2" style="color: Red">* Fields are mandatory</td>
    </tr>
    <tr>
        <td style="width: 20%; ">Brand Name*</td>
        <td style="width: 80%">
            <asp:TextBox ID="txtBrandName" runat="server" CssClass="admin-textbox"  placeholder="Enter Brand Name"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtBrandName" CssClass="validation" Display="Dynamic" ErrorMessage="Field must not be empty" SetFocusOnError="True" ValidationGroup="A"></asp:RequiredFieldValidator>
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
            <asp:GridView ID="gvwBrandRecord" runat="server" Width="90%" AllowPaging="True"  PageSize="100" AutoGenerateColumns="False" OnPageIndexChanging="gvwBrandRecord_PageIndexChanging" >
                <AlternatingRowStyle BackColor="#8DC73F" />
                <Columns>
                    <asp:TemplateField HeaderText="SNo">
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" style="text-align: left" Text='<%# Bind("BrandID") %>' Visible="false"></asp:Label>
                            <%#Container.DataItemIndex+1 %>   
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Brand Name">
                        <ItemTemplate>
                            <asp:TextBox ID="txtGBrandName" runat="server" Text='<%# Bind("BrandName") %>'></asp:TextBox>
                            <br />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtGBrandName" CssClass="validation" Display="Dynamic" ErrorMessage="Enter Brand" SetFocusOnError="True" ValidationGroup="B"></asp:RequiredFieldValidator>
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


