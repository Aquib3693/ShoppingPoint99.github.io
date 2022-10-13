<%@ Page Title="" Language="C#" MasterPageFile="~/mainwebsite.master" AutoEventWireup="true" CodeFile="MyAddress.aspx.cs" Inherits="Customer_MyAddress" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        #liProfile:hover,#liOrder:hover,#liAddress:hover,#liPassword:hover{
            background-color:lightgray;
        }
        .gridline{
    border-color:#DCDCDC;
    border-right-color:#ffffff;
    border-bottom-color:#fff;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
       <!--=================== main containt start==================-->     
      <script>
        $(document).ready(function () {
            $(".btnEditAddress").click(function () {
                $(".addnewaddressafteredit").show();
                $("#showAddress").hide();
            });


            $(".test input:checkbox").on('change', function () {
                $(".test input:checkbox").not(this).prop('checked', false);
            });
            
        });
</script>
    
      
      <section class="profileimage-section">
        <div class="col-md-12 col12foruserimage">
            <div class="custmrimage">
                <img alt="name" src="https://www.shareicon.net/data/128x128/2016/09/01/822762_user_512x512.png"/>
            </div>
        </div>
    </section>

 

        <section class="myprofile-section">

        <div class="container eform cod formob-custmrpro">
            <div class="col-md-3 userlinks cs userlink-formob-shi">
                <h2>MY ACCOUNT</h2>
                <ul>
                    <li class="liAccuont" id="liProfile" ><a href="MyProfile.aspx">My Profile</a></li>                   
                    <li class="liAccuont" id="liOrder" ><a href="MyOrders.aspx">My Orders</a></li>
                    <%--<li class="liAccuont" id="liWishlist" ><a href="#">My Wishlist</a></li>--%>
                    <li class="liAccuont" id="liAddress" ><a href="MyAddress.aspx">My Address</a></li>                    
                    <li class="liAccuont" id="liPassword" ><a href="ChangePassword.aspx">Change Password</a></li>

                </ul>   
            </div>

            
     <%--My address start--%>
          <div id="divMyAddresses" class="col-md-9">
             
              
<asp:Panel ID="paneladdaddress" runat="server" Visible="true">
    
<div class="col-md-12 updateadd-for-mob-maindiv" id="showAddress">
   
    <div class="adractionsnewkan foraddreskan for-mob-new-updtadd">
       <%-- <button type="button" class="btn btn-danger btnEditAddress" id="addNewAddress"><i class="fa fa-pencil-square-o"></i>Add New</button>--%>
         <div class="editformsavebtn">
             
            <asp:Button ID="btnAddAddress" runat="server" Text="Add New Address" CssClass="btn btn-success" OnClick="btnAddAddress_Click"/>
        </div>
    </div>
       
    
<%--             <asp:DataList runat="server" ID="dataListAddress" RepeatDirection="Horizontal" RepeatColumns="1" width="100%">
                 <ItemTemplate>
            <div class="col-md-12 foraddreskan">
                <ul>
                   
                    <li class="adr"><asp:Label ID="lbladdress" runat="server" Text='<%# Eval("Address") %>'></asp:Label>  </li>
                    <li class="adr"><asp:Label ID="lblLandMak" runat="server" Text='<%# Eval("Landmark") %>'></asp:Label></li>
                    <li class="adr"><asp:Label ID="lblcity" runat="server" Text='<%# Eval("City") %>'></asp:Label>&nbsp;<asp:Label ID="lblState" runat="server" Text='<%# Eval("State") %>'></asp:Label>  ,&nbsp;<asp:Label ID="lblPincode" runat="server" Text='<%# Eval("Pin") %>'></asp:Label></li>
                 
                </ul>
                <div class="adractionsnewkan">

                     <asp:Button ID="btnEdit" CssClass="btn" runat="server" Text="Edit" OnClick="btnEdit_Click" ForeColor="White" />
                    <asp:Button ID="DLbtnDelete" CssClass="btn" runat="server" Text="Delete" OnClick="DLbtnDelete_Click" ForeColor="White" />
                    <asp:Label ID="lblAddressId" runat="server" Text='<%# Eval("AddressID") %>' Visible="False"></asp:Label>
                    <asp:CheckBox ID="chkdefaultaddress" CssClass="test" runat="server" Text="Use As Default" Font-Size="14px" OnCheckedChanged="chkdefaultaddress_CheckedChanged" AutoPostBack="true"/>
                </div>
            </div>
                    
                     </ItemTemplate>
          </asp:DataList>--%>

    <asp:GridView ID="gvwaddress" runat="server" Width="100%" ShowHeader="false" AutoGenerateColumns="false" CssClass="gridline" OnSelectedIndexChanged="gvwaddress_SelectedIndexChanged">
        <Columns>
            <asp:TemplateField>
                <ItemTemplate>
                    <div class="col-md-12 foraddreskan">
                <ul>
                    <%--<li class="name">Shiva Rathore</li>--%>
                    <li class="adr"><asp:Label ID="lbladdress" runat="server" Text='<%# Eval("Address") %>'></asp:Label>  </li>
                    <li class="adr"><asp:Label ID="lblLandMak" runat="server" Text='<%# Eval("Landmark") %>'></asp:Label></li>
                    <li class="adr"><asp:Label ID="lblcity" runat="server" Text='<%# Eval("City") %>'></asp:Label>&nbsp;<asp:Label ID="lblState" runat="server" Text='<%# Eval("State") %>'></asp:Label>  ,&nbsp;<asp:Label ID="lblPincode" runat="server" Text='<%# Eval("Pin") %>'></asp:Label></li>
                    <%--<li class="mail">shiva@inventive.in</li>
                    <li class="mobile">mobile: 9999999999</li>--%>
                </ul>
                <div class="adractionsnewkan">
                   <%-- <button type="button"  class="btn btn-danger btnEditAddress"  name="btnEditAddress" id="btnEditAddress"><i class="fa fa-pencil-square-o"></i> edit</button>--%>
                    <%--<button type="button"  class="btn btn-danger btnDeleteAddress btndlt-for-mob" name="btnDeleteAddress" id="btnDeleteAddress"><i class="fa fa-trash-o"></i> delete</button>--%>
                     <asp:Button ID="btnEdit"  CssClass="btn" runat="server" Text="Edit" OnClick="btnEdit_Click" ForeColor="White" />
                    <asp:Button ID="DLbtnDelete" CssClass="btn" runat="server" Text="Delete" OnClick="DLbtnDelete_Click" ForeColor="White" />
                    <asp:Label ID="lblAddressId" runat="server" Text='<%# Eval("AddressID") %>' Visible="False"></asp:Label>
                    <asp:CheckBox ID="chkdefaultaddress" CssClass="test" runat="server" Text="Use As Default" Font-Size="14px" OnCheckedChanged="chkdefaultaddress_CheckedChanged" AutoPostBack="true"/>
                </div>
            </div>
                </ItemTemplate>
                 
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
          
    
</div>

</asp:Panel>




<asp:Panel ID="paneleditaddress" runat="server" Visible="false">
<div class="col-md-12 col9foradd address-addNew foraddreskan updatenewadd-shi-for-mob " >
    <h2>Save Address</h2>
        
  <%-- Enter address start--%>
      
            <div class="form-group ">
                <label style="font-size:16px">State<strong style="color:red">*</strong></label>
                <div class="dropdown">
                    <asp:DropDownList ID="ddlState" runat="server" CssClass="form-control  col-lg-12 dropdown-toggle" AutoPostBack="True" OnSelectedIndexChanged="ddlState_SelectedIndexChanged"></asp:DropDownList>                   
                </div>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" Font-Size="14px" ControlToValidate="ddlState" Display="Dynamic" ErrorMessage="Select State" InitialValue="0" ForeColor="Red" SetFocusOnError="True" ValidationGroup="A"></asp:RequiredFieldValidator>
            </div>
    

        
            <div class="form-group ">
                <label style="font-size:16px">City<strong style="color:red">*</strong></label>
                <div class="dropdown">
                    <asp:DropDownList ID="ddlCity" runat="server" CssClass="form-control  col-lg-12 dropdown-toggle" AutoPostBack="true"></asp:DropDownList>                   
                </div>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" Font-Size="14px" ControlToValidate="ddlCity" Display="Dynamic" ErrorMessage="Select City" InitialValue="0" ForeColor="Red" SetFocusOnError="True" ValidationGroup="A"></asp:RequiredFieldValidator>
            </div>
       
       
        
            <div class="form-group">
                <label style="font-size:16px">Pincode<strong style="color:red">*</strong></label>
                <asp:TextBox ID="txtPin" runat="server" CssClass="form-control" placeholder="Enter your Pincode" MaxLength="6" onkeypress='return(event.charCode >= 48 && event.charCode <= 57)'></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Font-Size="14px" ForeColor="Red" ErrorMessage="Pincode Cannot Be Blank" ControlToValidate="txtPin" Display="Dynamic" SetFocusOnError="True" ValidationGroup="A"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" Font-Size="14px" ForeColor="Red" ErrorMessage="Enter a valid Pincode" ControlToValidate="txtPin" Display="Dynamic" SetFocusOnError="True" ValidationExpression="^[1-9][0-9]{5}$" ValidationGroup="A"></asp:RegularExpressionValidator>
            </div>
      

      
            <div class="form-group" >
                <label style="font-size:16px">Address<strong style="color:red">*</strong></label>
                <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" placeholder="Enter your Address" TextMode="MultiLine"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" Font-Size="14px" ControlToValidate="txtAddress" Display="Dynamic" ErrorMessage="Address Cannot Be Blank" ForeColor="Red" SetFocusOnError="True" ValidationGroup="A"></asp:RequiredFieldValidator>
            </div>
      

      
            <div class="form-group">
                <label style="font-size:16px">Landmark</label>
                <asp:TextBox ID="txtlandmark" runat="server" CssClass="form-control" placeholder="Enter your Landmark" TextMode="MultiLine"></asp:TextBox>
               
            </div>
    <DIV>
        <asp:HiddenField ID="HiddenField1" runat="server" />
    </DIV>
    

          
            <div class="editformsavebtn">
                <asp:Button ID="btnSaveAddress" runat="server" CssClass="btn btn-success" Text="Save Address" OnClick="btnSaveAddress_Click" ValidationGroup="A" />
            </div>  <br />
 




    <div class="editformsavebtn">
                <asp:Button ID="btnGoBack" runat="server" CssClass="btn btn-success" Text="Go Back" OnClick="btnGoBack_Click" />
            </div>
       
  
 <%--   Enter address end--%>   
</div>     
</asp:Panel>
          </div>
             <%--My address end--%>
      </div>
    </section>
   
       


    
     <!--=================== main containt end==================-->

     <!--=================== footer containt start==================-->
     
     <div id="footer" style="padding-bottom: 5px;">
                    <div style="clear:both;">
                      
                        <div class="bottombarmiddle_r">
                            <div class="bottombarmiddle_l">
                                <center>
                                </center>
                                <div class='storeaddress'>
                                    <div class="hyper_footer">
                                        <div class="footer_inner">
                                            <div class="foo-cols">
                                                <h2>Quick Links</h2>
                                                <ul>
                                                    <li><a href="/about-hypercity-fresh">About Us</a></li>
                                                   
                                                    <li><a href="/about-hypercity-fresh#tandc">Terms & Conditions</a></li>
                                                    <li><a href="/about-hypercity-fresh#rr-policy">Return & Refund Policy</a></li>
                                                  
                                                </ul>
                                            </div>
                                            <div class="foo-cols">
                                                <h2>Categories</h2>
                                                <ul>
                                                    <li><a href="/fresh-fruits">Fruits</a></li>
                                                    <li><a href="/fresh-vegetables">Vegetables</a></li>
                                                    <li><a href="/food-and-grocery/staples-and-grocery">Ice cream</a></li>
                                                    <li><a href="/baby-care-and-toys/baby-and-child-care">Baby Products</a></li>
                                                    <li><a href="/food-and-grocery/biscuits">Biscuits</a></li>
                                                </ul>
                                            </div>
                                            <div class="foo-cols">
                                                <h2></h2>
                                                <ul>
                                                    <li><a href="/milk">Milk</a></li>
                                                    <li><a href="/food-and-grocery/chocolates-and-sweets/chocolates">Chocolates</a></li>
                                                    <li><a href="/food-and-grocery/breakfast-and-cereals">Soaps</a></li>
                                                    <li><a href="/stationary">Namkeen & Mixture </a></li>
                                                    <li><a href="/root/home-needs-pet-care">Cosmetics</a></li>
                                                </ul>
                                            </div>

                                            <div class="foo-cols last-col">
                                                <h2>Follow Us</h2>
                                                <div class="social-icons">
                                                    <ul>
                                                        <li class="twitter"><a href="//twitter.com/HyperCITYIndia" target="_blank">Twitter</a></li>
                                                        <li class="facebook"><a href="//www.facebook.com/HyperCITY/" target="_blank">Facebook</a></li>
                                                        <li class="g-plus"><a href="//www.instagram.com/hypercityindia/" target="_blank">Instagram</a></li>
                                                      <%--  <li class="dribble"><a href="//www.youtube.com/channel/UCqE3YjVFGjZDTWuKDNRxDsQ" target="_blank">Youtube</a></li>--%>
                                                    </ul>
                                                </div>
                                                <h2 class="h2-inner">Shop on the Go</h2>
                                                <div class="app-downloads"> <a href="https://play.google.com/store/apps/details?id=com.hypercity.fresh&amp;hl=en" target="_blank"><img border="0" height="58" src="//storage.sg.content-cdn.io/in-resources/e04386d8-7ca8-4fa3-b8b8-6c606844d257/Images/userimages/google-play-download.png" width="167" /></a></div>
                                            </div>
                                        </div>
                                        <div class="seo-content">
                                            <h2>Online grocery Shopping</h2>
                                            <p>With ShoppingPoint99 , you can get the freshest products delivered to your doorstep in 3 hours!. The unbeatable variety and quality of products available at your neighbourhood ShoppingPoint99 store shall now be delivered right to your doorstep. So Order groceries online, buy fruits online, buy vegetables online, and buy Milk online, every one of your daily needs can now be ordered online. So, say hello to the freshest experience out there and let us help you save time and make your life simpler!</p>
                                            <h2>ShoppingPoint99 - Online Grocery shop</h2>
                                            <p>Order groceries online from our unbeatable range to get the best quality and freshest products delivered to your doorstep, you can buy, Fruits, Vegetables, Mango, milk, rice, sugar, olive oil, meat, biscuits, chocolates, Maggi, honey, baby products, nail polish, dog food and so much more online.</p>
                                           
                                        </div>
                                       
                                        <div class="copyrights">
                                          <p style="text-align:center;font-size:large">Copyright © 2019 ShoppingPoint99</p>
                                             <img style="margin-left:auto;margin-right:auto;width:50%;display:block" height="51" src="//storage.sg.content-cdn.io/in-resources/e04386d8-7ca8-4fa3-b8b8-6c606844d257/Images/userimages/footer-logos-11-7-17.png" width="674" />
                                         
                                        </div>
                                    </div>
                                    <div class="hyper_mobilefooter" style="display:none;">
                                        <div class="footer_inner">
                                            <div class="foo-cols">
                                                <h2>Quick Links</h2>
                                                <ul>
                                                    <li><a href="/about-hypercity-fresh">About Us</a></li>
                                                    <li><a href="/about-hypercity-fresh#p-policy">Privacy Policy</a></li>
                                                    <li><a href="/about-hypercity-fresh#tandc">Terms & Conditions</a></li>
                                                    <li><a href="/about-hypercity-fresh#rr-policy">Return & Refund Policy</a></li>
                                                    <li><a href="/store-locator">Stores</a></li>
                                                    <li><a href="/sitemap1">Sitemap</a></li>
                                                </ul>
                                            </div>
                                            <div class="foo-cols">
                                                <h2>Categories</h2>
                                                <ul>
                                                    <li><a href="/fresh-fruits">Fruits</a></li>
                                                    <li><a href="/fresh/all-fresh-vegetables">Vegetables</a></li>
                                                    <li><a href="/fresh/fresh-meat-and-fish">Meat</a></li>
                                                    <li><a href="/food-and-grocery/staples-and-grocery">Staples</a></li>
                                                    <li><a href="/baby-care-and-toys/baby-and-child-care">Baby Products</a></li>
                                                    <li><a href="/food-and-grocery/biscuits">Biscuits</a></li>
                                                    <li><a href="/milk">Milk</a></li>
                                                    <li><a href="/food-and-grocery/chocolates-and-sweets/chocolates">Chocolates</a></li>
                                                    <li><a href="/food-and-grocery/breakfast-and-cereals">Breakfast Cereals</a></li>
                                                    <li><a href="/stationary">Stationery </a></li>
                                                    <li><a href="/root/home-needs-pet-care">Pet Care</a></li>
                                                </ul>
                                            </div>
                                            <div class="foo-cols">
                                                <h2>AREAS SERVICED</h2>
                                                <ul>
                                                    <li>Malad, Mumbai</li>
                                                    <li>Infosys Gachibowli, Hyderabad</li>
                                                </ul>
                                            </div>
                                            <div class="foo-cols last-col">
                                                <h2>Follow Us</h2>
                                                <div class="social-icons">
                                                    <ul>
                                                        <li class="twitter"><a href="//twitter.com/HyperCITYIndia" target="_blank">Twitter</a></li>
                                                        <li class="facebook"><a href="//www.facebook.com/HyperCITY/" target="_blank">Facebook</a></li>
                                                        <li class="g-plus"><a href="//www.instagram.com/hypercityindia/" target="_blank">Instagram</a></li>
                                                        <li class="dribble"><a href="//www.youtube.com/channel/UCqE3YjVFGjZDTWuKDNRxDsQ" target="_blank">Youtube</a></li>
                                                    </ul>
                                                </div>
                                                <h2 class="h2-inner">Shop on the Go</h2>
                                                <div class="app-downloads"><a href="https://itunes.apple.com/us/app/hypercity/id1301199731?mt=8&amp;ign-mpt=uo%3D4" target="_blank"><img border="0" height="auto" src="//storage.sg.content-cdn.io/in-resources/e04386d8-7ca8-4fa3-b8b8-6c606844d257/Images/userimages/app-download-icon.png" width="124" /></a> <a href="https://play.google.com/store/apps/details?id=com.hypercity.fresh&amp;hl=en" target="_blank"><img border="0" height="auto" src="//storage.sg.content-cdn.io/in-resources/e04386d8-7ca8-4fa3-b8b8-6c606844d257/Images/userimages/google-play-download.png" width="124" /></a></div>
                                            </div>
                                        </div>
                                        <div class="seo-content">
                                            <h2>Online grocery Shopping</h2>
                                            <p>With ShoppingPoint99, you can get the freshest products delivered to your doorstep in 3 hours! We are delivering in Mumbai Only. The unbeatable variety and quality of products available at your neighbourhood HyperCITY store shall now be delivered right to your doorstep. So Order groceries online, buy fruits online, buy vegetables online, and buy Milk online, every one of your daily needs can now be ordered online. So, say hello to the freshest experience out there and let us help you save time and make your life simpler!</p>
                                            <h2>ShoppingPoint99- Online Grocery shop</h2>
                                            <p>Order groceries online from our unbeatable range to get the best quality and freshest products delivered to your doorstep, you can buy, Fruits, Vegetables, Mango, milk, rice, sugar, olive oil, meat, biscuits, chocolates, Maggi, honey, baby products, nail polish, dog food and so much more online.</p>
                                         
                                        </div>
                                        <%--<div class="copyrights ">
                                            <div class="copy-text fa-align-center" >
                                                <p>Copyright © 2019 ShoppingPoint99</p>                                                
                                            </div>
                                            <div class="footer-logos"><img height="51" src="//storage.sg.content-cdn.io/in-resources/e04386d8-7ca8-4fa3-b8b8-6c606844d257/Stylesheet/images/footer-logos-11-7-17.png" width="700" /></div>
                                        </div>--%>
                                        <div>
                                            <p>Copyright © 2019 ShoppingPoint99</p>
                                        </div>
                                    </div>
                                    <div class="scrollToTop" style="display:none;"></div>
                                </div>
                            </div>
                        </div>
                        <div class="bottombarbottom_r">
                            <div class="bottombarbottom_l"></div>
                        </div>
                    </div>
                    <div id="ctl00_pnlPoweredByLogo" class="martjacklogo">
                        <a id="ctl00_lnkPoweredby" title="eCommerce platform" href="https://www.capillarytech.com/products/anywhere-commerce-plus/anywhere-commerce" target="_blank"></a>
                    </div>
                </div>
     <!--=================== footer containt end==================-->
</asp:Content>

