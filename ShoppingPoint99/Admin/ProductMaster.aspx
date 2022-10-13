<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin.master" AutoEventWireup="true" CodeFile="ProductMaster.aspx.cs" Inherits="Admin_ProductsMaster" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="../CSS/MasterStyleSheet.css" rel="stylesheet" />
    <style type="text/css">
    .auto-style8 {
        width: 100%;
    }
    .auto-style9 {
        height: 30px;
    }
    .auto-style10 {
        height: 8px;
    }
        .auto-style11 {
            width: 30%;
        }
        .auto-style12 {
        }
        .auto-style13 {
            width: 30%;
            height: 23px;
        }
        .auto-style14 {
            height: 30px;
            font-size: large;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   
    <table class="auto-style8">
    <tr>
        <td class="auto-style14" colspan="2"><strong style="font-size: x-large">PRODUCT MASTER </strong> </td>
        <td class="auto-style9" colspan="2">
            <asp:LinkButton ID="lbtnSeeProduct" runat="server" OnClick="lbtnSeeProduct_Click" style="font-size: x-large">View Products</asp:LinkButton>
        </td>
    </tr>
       
    <tr>
        <td class="auto-style10" colspan="4" style="color: Red">* Fields are mandatory</td>
    </tr>
    <tr>
        <td class="auto-style12">Product Name*</td>
        <td class="auto-style13">
            <asp:TextBox ID="txtProductName" runat="server" CssClass="admin-textbox" placeholder="Enter Product Name" Width="90%" ></asp:TextBox>
        </td>
        <td class="auto-style12" colspan="2">Select Category*&nbsp;&nbsp;&nbsp;
            <asp:DropDownList ID="ddlCategory" runat="server" CssClass="admin-textbox" Width="30%">
            </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td style="width: 20%; ">&nbsp;</td>
        <td class="auto-style11">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtProductName" CssClass="validation" ErrorMessage="Field must not be empty" Display="Dynamic" SetFocusOnError="True" ValidationGroup="A"></asp:RequiredFieldValidator>
        </td>
        <td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="ddlCategory" CssClass="validation" ErrorMessage="Please select Category" Display="Dynamic" SetFocusOnError="True" ValidationGroup="A" InitialValue="0"></asp:RequiredFieldValidator>
            &nbsp;</td>
    </tr>
    <tr>
        <td colspan="2">Product Short Description*</td>
        <td colspan="2">Product Long Description</td>
    </tr>
    <tr>
        <td colspan="2">
            <asp:TextBox ID="txtProductDescription" runat="server" CssClass="admin-textbox" placeholder="Enter Short Description" Width="90%" Height="70px" TextMode="MultiLine"></asp:TextBox>
        </td>
        <td style="width: 80%" colspan="2">
            <asp:TextBox ID="txtProductLongDescription" runat="server" CssClass="admin-textbox" placeholder="Enter Long Description not mandatory" Width="90%" Height="70px" TextMode="MultiLine"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtProductDescription" CssClass="validation" ErrorMessage="Field must not be empty" Display="Dynamic" SetFocusOnError="True" ValidationGroup="A"></asp:RequiredFieldValidator>
        </td>
        <td style="width: 80%" colspan="2">&nbsp;</td>
    </tr>
    <tr>
        <td>Select Brand*</td>
        <td>
            <asp:DropDownList ID="ddlBrand" runat="server" CssClass="admin-textbox" Width="70%">
            </asp:DropDownList>
        </td>
        <td colspan="2">SKUID*&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="txtSKUID" runat="server" CssClass="admin-textbox" placeholder="Enter SKUID" Width="30%" ></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>&nbsp;</td>
        <td>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="ddlBrand" CssClass="validation" ErrorMessage="Please select Brand" Display="Dynamic" SetFocusOnError="True" ValidationGroup="A" InitialValue="0"></asp:RequiredFieldValidator>
        </td>
        <td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ControlToValidate="txtSKUID" CssClass="validation" ErrorMessage="Field must not be empty" Display="Dynamic" SetFocusOnError="True" ValidationGroup="A"></asp:RequiredFieldValidator>
        </td>
    </tr>
        
    <tr>
        <td class="auto-style12" colspan="4">
            <fieldset class="field-set"><legend style="color: #8DC73F; font-style: italic; font-weight: bold; font-size: large;">Add Quantity</legend>
            <table class="auto-style8">
                <tr>
                    <td style="width: 16%">Qty*</td>
                    <td style="width: 16%">UOM*</td>
                    <td style="width: 16%">MRP*</td>
                    <td style="width: 16%">SalePrice*</td>
                    <td style="width: 16%">Stock Qty*</td>
                    <td style="width: 16%">&nbsp;</td>
                </tr>
                <tr>
                    <td style="width: 16%">
                        <asp:TextBox ID="txtQty" runat="server" Height="25px" Width="90%" placeholder="Enter Quantity" onkeypress='return(event.charCode >= 48 && event.charCode <= 57)'></asp:TextBox>
                    </td>
                    <td style="width: 16%">
                        <asp:DropDownList ID="ddlUnit" runat="server" Height="25px" Width="90%" >
                        </asp:DropDownList>
                    </td>
                    <td style="width: 16%">
                        <asp:TextBox ID="txtMRP" runat="server" Height="25px" Width="90%" placeholder="Enter MRP" onkeypress='return(event.charCode >= 48 && event.charCode <= 57)'></asp:TextBox>
                    </td>
                    <td style="width: 16%">
                        <asp:TextBox ID="txtSalePrice" runat="server" Height="25px" Width="90%" placeholder="Enter Selling Price" onkeypress='return(event.charCode >= 48 && event.charCode <= 57)'></asp:TextBox>
                    </td>
                    <td style="width: 16%">
                        <asp:TextBox ID="txtStockQty" runat="server" Height="25px" Width="90%" placeholder="Enter Stock Quantity" onkeypress='return(event.charCode >= 48 && event.charCode <= 57)'></asp:TextBox>
                    </td>
                    <td style="width: 16%">
                        <asp:Button ID="btnAddQuantity" runat="server" CssClass="admin-button" OnClick="btnAddQuantity_Click1" Text="Add" width="50%" Height="25px" ValidationGroup="B"/>
                    </td>
                </tr>
                <tr>
                    <td style="width: 16%">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="txtQty" CssClass="validation" ErrorMessage="Field must not be empty" Display="Dynamic" SetFocusOnError="True" ValidationGroup="B"></asp:RequiredFieldValidator>
                    </td>
                    <td style="width: 16%">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="ddlUnit" CssClass="validation" ErrorMessage="Please select unit" Display="Dynamic" SetFocusOnError="True" ValidationGroup="B" InitialValue="0"></asp:RequiredFieldValidator>
                    </td>
                    <td style="width: 16%">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="txtMRP" CssClass="validation" ErrorMessage="Field must not be empty" Display="Dynamic" SetFocusOnError="True" ValidationGroup="B"></asp:RequiredFieldValidator>
                    </td>
                    <td style="width: 16%">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ControlToValidate="txtSalePrice" CssClass="validation" ErrorMessage="Field must not be empty" Display="Dynamic" SetFocusOnError="True" ValidationGroup="B"></asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtMRP" ControlToValidate="txtSalePrice" CssClass="validation" Display="Dynamic" ErrorMessage="value must be less than or equal to MRP" Operator="LessThanEqual" SetFocusOnError="True" Type="Integer" ValidationGroup="B"></asp:CompareValidator>
                    </td>
                    <td style="width: 16%">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" ControlToValidate="txtStockQty" CssClass="validation" ErrorMessage="Field must not be empty" Display="Dynamic" SetFocusOnError="True" ValidationGroup="B"></asp:RequiredFieldValidator>
                    </td>
                    <td style="width: 16%">&nbsp;</td>
                </tr>
            </table>
                </fieldset>
        </td>
    </tr>
    <tr>
        <td colspan="4">
            
            <asp:GridView ID="gvwQuantity" runat="server" Width="90%" AutoGenerateColumns="False" >
                <AlternatingRowStyle BackColor="#8DC73F" />
                <Columns>
                    <asp:TemplateField HeaderText="SNo.">
                        <ItemTemplate>                                        
                             <asp:Label ID="Label2" runat="server" Text='<%# Bind("id") %>'></asp:Label>
                         </ItemTemplate>
                        <ItemStyle Width="5%" Wrap="False" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Qty">
                        <ItemTemplate>
                            <asp:TextBox ID="txtGQty" runat="server" Height="16px" Width="72px" Text='<%# Bind("Quantity") %>' MaxLength="8" onkeypress='return(event.charCode >= 48 && event.charCode <= 57)'></asp:TextBox>
                            <br />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server" ControlToValidate="txtGQty" CssClass="validation" Display="Dynamic" ErrorMessage="Enter Qty" SetFocusOnError="True" ValidationGroup="D"></asp:RequiredFieldValidator>
                        </ItemTemplate>
                        <ItemStyle Width="15%" Wrap="False" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="UOM">
                        <ItemTemplate>
                            <asp:DropDownList ID="ddlGUnit" runat="server" Height="20px" Width="90px">
                            </asp:DropDownList>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("unitid") %>' Visible="false"></asp:Label>
                            <br />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ControlToValidate="ddlGUnit" CssClass="validation" Display="Dynamic" ErrorMessage="select unit" SetFocusOnError="True" InitialValue="0" ValidationGroup="D"></asp:RequiredFieldValidator>
                        </ItemTemplate>
                        <ItemStyle Width="15%" Wrap="False" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="MRP">
                        <ItemTemplate>
                            <asp:TextBox ID="txtGMRP" runat="server" Height="16px" Width="72px" Text='<%# Bind("MRP") %>' onkeypress='return(event.charCode >= 48 && event.charCode <= 57)' MaxLength="8"></asp:TextBox>
                            <br />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator18" runat="server" ControlToValidate="txtGMRP" CssClass="validation" Display="Dynamic" ErrorMessage="Enter MRP" SetFocusOnError="True" ValidationGroup="D"></asp:RequiredFieldValidator>
                        </ItemTemplate>
                        <ItemStyle Width="15%" Wrap="False" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="S.P.">
                        <ItemTemplate>
                            <asp:TextBox ID="txtGSaleP" runat="server" Height="16px" Width="72px" Text='<%# Bind("SellingPrice") %>' onkeypress='return(event.charCode >= 48 && event.charCode <= 57)' MaxLength="8"></asp:TextBox>
                            <br />
                            <asp:CompareValidator ID="CompareValidator2" runat="server" ControlToCompare="txtGMRP" ControlToValidate="txtGSaleP" CssClass="validation" Display="Dynamic" ErrorMessage="value must be leass than or equal to MRP" Operator="LessThanEqual" SetFocusOnError="True" Type="Integer" Font-Size="Small" ValidationGroup="D" Width="39%"></asp:CompareValidator>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator19" runat="server" ControlToValidate="txtGSaleP" CssClass="validation" Display="Dynamic" ErrorMessage="Enter Sale price" SetFocusOnError="True" ValidationGroup="D"></asp:RequiredFieldValidator>
                        </ItemTemplate>
                        <ItemStyle Width="15%" Wrap="False" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Discount">
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("Discount") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Width="15%" Wrap="False" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="StockQty">
                        <ItemTemplate>
                            <asp:TextBox ID="txtGStockQty" runat="server" Height="16px" Text='<%# Bind("StockQty") %>' Width="72px" onkeypress='return(event.charCode >= 48 && event.charCode <= 57)' MaxLength="8"></asp:TextBox>
                            <br />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator20" runat="server" ControlToValidate="txtGStockQty" CssClass="validation" Display="Dynamic" ErrorMessage="Enter Stock Qty" SetFocusOnError="True" ValidationGroup="D"></asp:RequiredFieldValidator>
                        </ItemTemplate>
                        <ItemStyle Width="15%" Wrap="False" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Action">
                        <ItemTemplate>
                            <asp:ImageButton ID="btnGvwQtyUpdate" runat="server" ImageUrl="../Images/OtherImages/save.png" width="20px" Height="20px" OnClick="btnGvwQtyUpdate_Click" ValidationGroup="D"/>
                            <asp:ImageButton ID="btnGvwQtyDelete" runat="server" ImageUrl="../Images/OtherImages/delete.png" width="20px" Height="20px" OnClick="btnGvwQuantityDelete_Click"/>
                        </ItemTemplate>
                        <ItemStyle Width="5%" Wrap="False" />
                    </asp:TemplateField>
                </Columns>
                <HeaderStyle BackColor="#8DC73F" ForeColor="White" Height="30px" />
                <RowStyle BackColor="Silver" />
            </asp:GridView>
                
        </td>
    </tr>
    <tr>
        <td colspan="2">&nbsp;</td>
        <td style="width: 80%" colspan="2">&nbsp;</td>
    </tr>
    <tr>
        <td class="auto-style12">Main Image Path*</td>
        <td class="auto-style13">
            <asp:FileUpload ID="fupMainImage" runat="server" Width="182px" />
        </td>
        <td class="auto-style12" colspan="2">Image Path1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:FileUpload ID="fupImage1" runat="server" Width="180px" />
        </td>
    </tr>
    <tr>
        <td style="width: 20%; ">&nbsp;</td>
        <td class="auto-style11">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="fupMainImage" CssClass="validation" ErrorMessage="Field must not be empty" Display="Dynamic" SetFocusOnError="True" ValidationGroup="A"></asp:RequiredFieldValidator>
        </td>
        <td style="width: 20%; ">&nbsp;</td>
        <td style="width: 30%; ">
            &nbsp;</td>
    </tr>
         <tr>
        <td class="auto-style12">Image Path2</td>
        <td class="auto-style13">
            <asp:FileUpload ID="fupImage2" runat="server" Width="182px" />
        </td>
        <td class="auto-style12">&nbsp;</td>
        <td class="auto-style13">
            <asp:Label ID="lblNumber" runat="server" Visible="False"></asp:Label>
             </td>
    </tr>
    <tr>
        <td style="width: 20%; ">&nbsp;</td>
        <td class="auto-style11">
            &nbsp;</td>
        <td style="width: 20%; ">&nbsp;</td>
        <td style="width: 30%; ">
            &nbsp;</td>
    </tr>
    <tr>
        <td colspan="2">
            <asp:Button ID="btnSaveProduct" runat="server" CssClass="admin-button" OnClick="btnSaveProduct_Click" style="text-align: center" Text="Save Product" width="80%" ValidationGroup="A"/>
        </td>
        <td style="width: 80%" colspan="2">
            <asp:Button ID="btnResetProduct" runat="server" CssClass="admin-button" OnClick="btnResetProduct_Click" style="text-align: center" Text="Reset Product" width="50%" ValidationGroup="C"/>
        </td>
    </tr>
    <tr>
        <td colspan="2">&nbsp;</td>
        <td style="width: 80%" colspan="2">&nbsp;</td>
    </tr>
    <tr>
        <td colspan="2">&nbsp;</td>
        <td style="width: 80%" colspan="2">&nbsp;</td>
    </tr>
    <tr>
        <td colspan="2">&nbsp;</td>
        <td style="width: 80%" colspan="2">&nbsp;</td>
    </tr>
           
</table>
       
</asp:Content>


