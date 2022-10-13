<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ProductList.aspx.cs" Inherits="_Default" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../CSS/MasterStyleSheet.css" rel="stylesheet" />
    <style type="text/css">
        .auto-style1 {
            width: 100%;
            height: 40px;           
        }
       
        .auto-style3 {
            height: 40px;
            text-align: center;
            font-weight: 700;
            font-size: x-large;
        }
        .auto-style4 {
            width: 80%;
            font-weight: 700;
            text-align: center;
        }
      
        .auto-style6 {
            width: 100%;
        }
              
        .auto-style9 {
            height: 4px;
            text-align: center;
            }
      
        .auto-style10 {
            text-align: center;
            font-weight: 700;
            font-size: x-large;
            width: 20%;
        }
      
        </style>
</head>
<body>
    <form id="form1" runat="server" enctype="multipart/form-data">
       
    <div>
    <table class="auto-style1">
            <tr>
                <td class="auto-style10">
                    <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/OtherImages/shoplogo.jpg" Height="86px" Width="223px" />
                </td>
                <td class="auto-style4" style="font-size: 25px; font-weight: 600" colspan="2" >WELCOME ADMIN
                    <asp:Label ID="lblName" runat="server" Text="Label"></asp:Label>
                </td>
                <td class="auto-style4" style="font-size:25px; font-weight: 600" >
                    <asp:Button ID="btnLogout" runat="server" Text="Logout" CssClass="admin-button" OnClick="btnLogout_Click" />
                </td>
            </tr>
            <tr>
                <td class="auto-style9" colspan="4" style="background-color: #8dc73f">
                    </td>
            </tr>
            <tr>
                <td class="auto-style3" colspan="2">
                    PRODUCT LIST</td>
                <td class="auto-style3" colspan="2">
            <asp:LinkButton ID="lbtnAddProduct" runat="server" OnClick="lbtnAddProduct_Click" style="font-size: x-large">Add Products</asp:LinkButton>
                </td>
            </tr>
        </table>
    </div>
    <div>
        <table class="auto-style6">
                
                <tr>
                    <td colspan="2">
                       
        <asp:GridView ID="gvwProducts" runat="server" AutoGenerateColumns="False" Width="115%" DataKeyNames="ProductID" OnRowDataBound="gvwProducts_RowDataBound1" Height="5px" AllowPaging="True" OnPageIndexChanging="gvwProducts_PageIndexChanging1" PageSize="80">
            <AlternatingRowStyle BackColor="#8DC73F" />
            <Columns>
                <asp:TemplateField HeaderText="SNo">
                    <ItemTemplate>
                        <asp:Label ID="lblPId" runat="server" Text='<%# Bind("ProductID") %>' Visible="False"></asp:Label>
                         <%#Container.DataItemIndex+1 %> 
                    </ItemTemplate>
                    <ItemStyle Width="1%" Wrap="False" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Image">
                    <ItemTemplate>
                        <table class="auto-style6">
                            <tr>
                                <td>
                                    <asp:Image ID="image1" runat="server" Height="113px" Width="136px" ImageUrl='<%# Bind("MainImagePath") %>'  />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:FileUpload ID="fup1" runat="server" />
                                    <asp:Label ID="lblImag1" runat="server" Text='<%# Bind("MainImagePath") %>' Visible="False"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </ItemTemplate>
                    <ItemStyle Width="5%" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Name/SKUID">
                    <ItemTemplate>
                        <table class="auto-style6">
                            <tr>
                                <td>Product name</td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:TextBox ID="txtPName" runat="server" Text='<%# Bind("Productname") %>' Height="27px" Width="97%"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtPName" CssClass="validation" Display="Dynamic" ErrorMessage="Field must not be Empty" SetFocusOnError="True" ValidationGroup="B"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>SKUID</td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:TextBox ID="txtSKUID" runat="server" Text='<%# Bind("SKUID") %>' Height="27px" Width="97%"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtSKUID" CssClass="validation" Display="Dynamic" ErrorMessage="Field must not be Empty" SetFocusOnError="True" ValidationGroup="B"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                        </table>
                    </ItemTemplate>
                    <ItemStyle Width="13%" Wrap="False" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Brand/Category">
                    <ItemTemplate>
                        <table class="auto-style6">
                            <tr>
                                <td>Brand</td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:DropDownList ID="ddlBrand" runat="server" Height="25px" Width="97%"></asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="ddlBrand" CssClass="validation" Display="Dynamic" ErrorMessage="Select Brand" InitialValue="0" SetFocusOnError="True" ValidationGroup="B"></asp:RequiredFieldValidator>
                                    &nbsp;
                                    <asp:Label ID="lblBId" runat="server" Text='<%# Bind("BrandID") %>' Visible="False"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>Category</td>
                            </tr>
                            <tr>
                                <td>
                                   <asp:DropDownList ID="ddlCategory" runat="server" Height="25px" Width="97%"></asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                   <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="ddlCategory" CssClass="validation" Display="Dynamic" ErrorMessage="Select Category" InitialValue="0" SetFocusOnError="True" ValidationGroup="B"></asp:RequiredFieldValidator>
                                    <asp:Label ID="lblCId" runat="server" Text='<%# Bind("CategoryId") %>' Visible="false"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </ItemTemplate>
                    <ItemStyle Width="13%" Wrap="False" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="UOM">
                    <ItemTemplate>
                            
                            <asp:GridView ID="gvwUnit" runat="server" AutoGenerateColumns="False" >
                                <AlternatingRowStyle BackColor="#8DC73F"/>
                                <Columns>
                                    <asp:TemplateField HeaderText="Sno">
                                       <ItemTemplate >                    
                                          <%#Container.DataItemIndex+1 %>    
                                           <asp:Label ID="lblMId" runat="server" Text='<%# Bind("MappingID") %>' Visible="False"></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" Width="5%" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Qty">
                                        <ItemTemplate>
                                            <table class="auto-style6">
                                                <tr>
                                                    <td>
                                                        <asp:TextBox ID="txtQty" runat="server" Text='<%# Bind("Quantity") %>' Width="90%" MaxLength="8" onkeypress='return(event.charCode >= 48 && event.charCode <= 57)'></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtQty" CssClass="validation" Display="Dynamic" ErrorMessage="Field must not be empty" SetFocusOnError="True" ValidationGroup="A"></asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>
                                            </table>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" Width="15%" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="UOM">
                                        <ItemTemplate>
                                            <table class="auto-style6">
                                                <tr>
                                                    <td>
                                                        <asp:DropDownList ID="ddlGUnit" runat="server" Width="90%">
                                                        </asp:DropDownList>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="ddlGUnit" CssClass="validation" Display="Dynamic" ErrorMessage="Please select unit" InitialValue="0" SetFocusOnError="True" ValidationGroup="A"></asp:RequiredFieldValidator>
                                                        <asp:Label ID="lblUnitId" runat="server" Text='<%# Bind("UnitID") %>' Visible="False"></asp:Label>
                                                    </td>
                                                </tr>
                                            </table>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" Width="15%" />
                                    </asp:TemplateField>
                                  
                                    <asp:TemplateField HeaderText="MRP">
                                        <ItemTemplate>
                                            <table class="auto-style6">
                                                <tr>
                                                    <td>
                                                        <asp:TextBox ID="txtGMRP" runat="server" Text='<%# Bind("MRP") %>' Width="90%" MaxLength="8" onkeypress='return(event.charCode >= 48 && event.charCode <= 57)'></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtGMRP" CssClass="validation" Display="Dynamic" ErrorMessage="Field must not be empty" SetFocusOnError="True" ValidationGroup="A"></asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>
                                            </table>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" Width="15%" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="SP">
                                        <ItemTemplate>
                                            <table class="auto-style6">
                                                <tr>
                                                    <td>
                                                        <asp:TextBox ID="txtGSP" runat="server" Text='<%# Bind("SellingPrice") %>' Width="90%" MaxLength="8" onkeypress='return(event.charCode >= 48 && event.charCode <= 57)'></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtGSP" CssClass="validation" Display="Dynamic" ErrorMessage="Field must not be empty" SetFocusOnError="True" ValidationGroup="A"></asp:RequiredFieldValidator>
                                                        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtGMRP" ControlToValidate="txtGSP" CssClass="validation" Display="Dynamic" ErrorMessage="SP must be equal or less than MRP" Operator="LessThanEqual" SetFocusOnError="True" Type="Integer" ValidationGroup="A"></asp:CompareValidator>
                                                    </td>
                                                </tr>
                                            </table>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" Width="15%" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Discount">
                                        <ItemTemplate>                                          
                                            <asp:Label ID="Label12" runat="server" Text='<%# Bind("Discount") %>'></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" Width="15%" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="StockQty">
                                        <ItemTemplate>
                                            <table class="auto-style6">
                                                <tr>
                                                    <td>
                                                        <asp:TextBox ID="txtStockQty" runat="server" Text='<%# Bind("StockQuantity") %>' Width="90%" MaxLength="8" onkeypress='return(event.charCode >= 48 && event.charCode <= 57)'></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtStockQty" CssClass="validation" Display="Dynamic" ErrorMessage="Field must not be empty" SetFocusOnError="True" ValidationGroup="A"></asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>
                                            </table>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" Width="15%" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Actions">
                                        <ItemTemplate>
                                            <asp:ImageButton ID="btngvwUOMUpdate" runat="server" ImageUrl="../Images/OtherImages/save.png" width="20px" Height="20px" ValidationGroup="A" OnClick="btngvwUOMUpdate_Click" />
                                            <asp:ImageButton ID="btngvwUOMGDelete" runat="server" ImageUrl="../Images/OtherImages/delete.png" width="20px" Height="20px" OnClick="btngvwUOMGDelete_Click" />
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" Width="5%" />
                                    </asp:TemplateField>
                                  
                                </Columns>
                                <HeaderStyle BackColor="#8DC73F" ForeColor="White" Height="30px" />
                                <RowStyle BackColor="Silver"/>
                            </asp:GridView>
                            
                        </ItemTemplate>
                        <ItemStyle Width="30%" Wrap="False" HorizontalAlign="Center" />
                   
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Show Products">
                    <ItemTemplate>
                            <table class="auto-style6">
                                <tr>
                                    <td>
                                        <asp:CheckBox ID="chkHome" runat="server" AutoPostBack="True" OnCheckedChanged="chkHome_CheckedChanged" Text="At Home Page" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:CheckBox ID="chkNewLaunch" runat="server" AutoPostBack="True" OnCheckedChanged="chkNewLaunch_CheckedChanged" Text="At New Launch" />
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    <ItemStyle Width="15%" Wrap="False" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Action">
                    <ItemTemplate>
                           <asp:ImageButton ID="btnGUpdate" runat="server" ImageUrl="../Images/OtherImages/save.png" width="20px" Height="20px" OnClick="btnGUpdate_Click1" ValidationGroup="B"/>
                            <asp:ImageButton ID="btnGDelete" runat="server" ImageUrl="../Images/OtherImages/delete.png" width="20px" Height="20px" OnClick="btnGDelete_Click1"/>
                        </ItemTemplate>
                    <ItemStyle Width="5%" Wrap="False" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Short Desc">
                    <ItemTemplate>
                        <table class="auto-style6">
                            <tr>
                                <td>
                                    <asp:TextBox ID="txtSDesc" runat="server" Height="99px" Text='<%# Bind("ShortDescription") %>' TextMode="MultiLine" Width="266px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txtSDesc" CssClass="validation" Display="Dynamic" ErrorMessage="Field must not be empty" SetFocusOnError="True" ValidationGroup="B"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                        </table>
                    </ItemTemplate>
                    <ItemStyle Width="15%" Wrap="False" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Long Desc">
                    <ItemTemplate>
                        <table class="auto-style6">
                            <tr>
                                <td>
                                    <asp:TextBox ID="txtLDesc" runat="server" Height="99px" Text='<%# Bind("LongDescription") %>' TextMode="MultiLine" Width="266px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                            </tr>
                        </table>
                    </ItemTemplate>
                    <ItemStyle Width="13%" Wrap="False" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Other Images">
                    <ItemTemplate>
                        <table class="auto-style6">
                            <tr>
                                <td>
                                    <asp:Image ID="image2" runat="server" Height="113px" Width="136px" ImageUrl='<%# Bind("ImagePath1") %>'  />
                                </td>
                                <td>
                                    <asp:Image ID="image3" runat="server" Height="113px" Width="136px" ImageUrl='<%# Bind("ImagePath2") %>'  />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:FileUpload ID="fup2" runat="server" />
                                    <asp:Label ID="lblImag2" runat="server" Text='<%# Bind("ImagePath1") %>' Visible="False"></asp:Label>
                                </td>
                                <td>
                                    <asp:FileUpload ID="fup3" runat="server" />
                                    <asp:Label ID="lblImag3" runat="server" Text='<%# Bind("ImagePath2") %>' Visible="False"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <HeaderStyle BackColor="#8DC73F" ForeColor="White" Height="30px" Font-Size="Large" />
                <RowStyle BackColor="Silver"  />
        </asp:GridView>
                            
                        </td>
                    </tr>
                    </table>
    </div>
    </form>
</body>
</html>
