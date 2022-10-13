<%@ Page Language="C#" AutoEventWireup="true" CodeFile="OrdersList.aspx.cs" Inherits="Admin_OrdersList" %>

<!DOCTYPE html>

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
      
        .auto-style11 {
            width: 50%;
            height: 23px;
        }
      
        </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <table class="auto-style1">
            <tr>
                <td class="auto-style10">
                    <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/OtherImages/shoplogo.jpg" Height="86px" Width="223px" />
                </td>
                <td class="auto-style4" style="font-size: 25px; font-weight: 600" colspan="2" >WELCOME ADMIN AQUIB
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
                    Orders List</td>
                <td class="auto-style3" colspan="2">
            <asp:LinkButton ID="lbtnGoback" runat="server" OnClick="lbtnGoback_Click"  style="font-size: x-large">Go Back</asp:LinkButton>
                </td>
            </tr>
        </table>
    </div>
    <div>
        <table class="auto-style6">
                
                <tr>
                    <td colspan="2">

                        <asp:GridView ID="gvwOrders" runat="server" DataKeyNames="uniqueorderno" OnRowDataBound="gvwOrders_RowDataBound" AutoGenerateColumns="False" Width="100%" ShowHeader="false">
                            <Columns>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        
                                        <table class="auto-style6">
                                            <tr>
                                                <td style="height: 300px; width: 25%;" valign="top">
                                                    <table class="auto-style6">
                                                        <tr>
                                                            <td style="width: 50%">Order No:</td>
                                                            <td style="width: 50%">
                                                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("UniqueOrderNo") %>'></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="width: 50%">&nbsp;</td>
                                                            <td style="width: 50%">&nbsp;</td>
                                                        </tr>
                                                        <tr>
                                                            <td style="width: 50%">Order Date:</td>
                                                            <td style="width: 50%">
                                                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("createddate") %>'></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="width: 50%">&nbsp;</td>
                                                            <td style="width: 50%">&nbsp;</td>
                                                        </tr>
                                                        <tr>
                                                            <td style="width: 50%">Customer Name:</td>
                                                            <td style="width: 50%">
                                                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("Name") %>'></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="auto-style11"></td>
                                                            <td class="auto-style11"></td>
                                                        </tr>
                                                        <tr>
                                                            <td style="width: 50%">Customer Mobile No:</td>
                                                            <td style="width: 50%">
                                                                <asp:Label ID="Label4" runat="server" Text='<%# Bind("Mobile") %>'></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="width: 50%">&nbsp;</td>
                                                            <td style="width: 50%">&nbsp;</td>
                                                        </tr>
                                                        <tr>
                                                            <td style="width: 50%">Customer Address:</td>
                                                            <td style="width: 50%">
                                                                <asp:Label ID="Label5" runat="server" Text='<%# Bind("address") %>'></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="width: 50%">&nbsp;</td>
                                                            <td style="width: 50%">&nbsp;</td>
                                                        </tr>
                                                        <tr>
                                                            <td style="width: 50%">Net Amount:</td>
                                                            <td style="width: 50%">
                                                                <asp:Label ID="Label13" runat="server" Text='<%# Bind("netamount") %>'></asp:Label>
                                                                ( <asp:Label ID="Label15" runat="server" Text='<%# Bind("deliverycharges") %>'></asp:Label>
                                                                 + <asp:Label ID="Label16" runat="server" Text='<%# Bind("totalamount") %>'></asp:Label>
                                                                )</td>
                                                        </tr>
                                                    </table>
                                                </td>
                                                <td style="height: 300px; width: 25%;" valign="top">
                                                    <table class="auto-style6">
                                                        <tr>
                                                            <td style="width: 50%">Payment Status:</td>
                                                            <td style="width: 50%">
                                                                <asp:Label ID="Label6" runat="server" Text='<%# Bind("PaidStatus") %>'></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="width: 50%">&nbsp;</td>
                                                            <td style="width: 50%">&nbsp;</td>
                                                        </tr>
                                                        <tr>
                                                            <td style="width: 50%">Payment Transaction No:</td>
                                                            <td style="width: 50%">
                                                                <asp:Label ID="Label7" runat="server" Text='<%# Bind("PaymentTranscation") %>'></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="width: 50%">&nbsp;</td>
                                                            <td style="width: 50%">&nbsp;</td>
                                                        </tr>
                                                        <tr>
                                                            <td style="width: 50%">Order Status:</td>
                                                            <td style="width: 50%">
                                                                <asp:DropDownList ID="ddlOrderStatus" runat="server">
                                                                    <asp:ListItem Value="1">Pending</asp:ListItem>
                                                                    <asp:ListItem Value="2">Processing</asp:ListItem>
                                                                    <asp:ListItem Value="3">Shipped</asp:ListItem>
                                                                    <asp:ListItem Value="4">Completed</asp:ListItem>
                                                                    <asp:ListItem Value="5">Cancelled</asp:ListItem>
                                                                    <asp:ListItem Value="6">Returned</asp:ListItem>
                                                                </asp:DropDownList>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="width: 50%">&nbsp;</td>
                                                            <td style="width: 50%">&nbsp;</td>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="2">
                                                                <asp:Button ID="btnSaveOrderStaus" runat="server" style="text-align: center" Text="Save Order Status" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="width: 50%">&nbsp;</td>
                                                            <td style="width: 50%">&nbsp;</td>
                                                        </tr>
                                                        <tr>
                                                            <td style="width: 50%">
                                                                <asp:Button ID="btnTakeOrder" runat="server" OnClick="btnTakeOrder_Click" Text="Take Order" />
                                                            </td>
                                                            <td style="width: 50%">&nbsp;</td>
                                                        </tr>
                                                        <tr>
                                                            <td style="width: 50%">&nbsp;</td>
                                                            <td style="width: 50%">&nbsp;</td>
                                                        </tr>
                                                        <tr>
                                                            <td style="width: 50%">&nbsp;</td>
                                                            <td style="width: 50%">&nbsp;</td>
                                                        </tr>
                                                    </table>
                                                </td>
                                                <td style="height: 300px; width: 50%;" valign="top">
                                                    <asp:GridView ID="gvwItems" runat="server" AutoGenerateColumns="False" Height="100%" Width="100%" >
                                                        <Columns>
                                                            <asp:TemplateField HeaderText="SNo">
                                                                <ItemTemplate>
                                                                   <%#Container.DataItemIndex+1 %> 
                                                                </ItemTemplate>
                                                                <ItemStyle HorizontalAlign="Center" />
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Item">
                                                                <ItemTemplate>
                                                                     <asp:Image ID="Image2" runat="server" Height="78px" ImageUrl='<%# Bind("MainImagePath") %>' Width="94px" style="text-align: center" /><br />
                                                                     <asp:Label ID="Label9" runat="server" Text='<%# Bind("ProductName") %>'></asp:Label>
                                                                                &nbsp;(<asp:Label ID="Label14" runat="server" Text='<%# Bind("PckUnit") %>'></asp:Label>
                                                                                )
                                                                    
                                                                </ItemTemplate>
                                                                <ItemStyle HorizontalAlign="Center" />
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Quantity">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="Label10" runat="server" Text='<%# Bind("pckquantity") %>'></asp:Label>
                                                                </ItemTemplate>
                                                                <ItemStyle HorizontalAlign="Center" />
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Sale Price">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="Label11" runat="server" Text='<%# Bind("sellprice") %>'></asp:Label>
                                                                </ItemTemplate>
                                                                <ItemStyle HorizontalAlign="Center" />
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Total">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="Label12" runat="server" Text='<%# Bind("total") %>'></asp:Label>
                                                                </ItemTemplate>
                                                                <ItemStyle HorizontalAlign="Center" />
                                                            </asp:TemplateField>
                                                        </Columns>
                                                    </asp:GridView>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="3" style="height: 250px" valign="top">&nbsp;</td>
                                            </tr>
                                        </table>
                                        
                                    </ItemTemplate>

                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                            
                        </td>
                    </tr>
                    </table>
    </div>
    </form>
</body>
</html>
