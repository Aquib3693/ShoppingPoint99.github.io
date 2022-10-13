<%@ Page Title="" Language="C#" MasterPageFile="~/mainwebsite.master" AutoEventWireup="true" CodeFile="MyOrders.aspx.cs" Inherits="Customer_MyOrders" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
  <style>
        #liProfile:hover,#liOrder:hover,#liAddress:hover,#liPassword:hover{
            background-color:lightgray;
        }
        .spantextnewforstatus-shi{color: #171616!important;text-decoration: none!important;font-size: 15px!important;}

        .gridline{
    border-color:#DCDCDC;
    border-right-color:#ffffff;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <!--=================== main containt start==================-->       
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

            
           <%-- MyOrders start--%>
                   
          <div id="divMyOrders" class="col-md-9 myorder-new-formob-shi ordernoorder">
    <div class="col-md-12 myordr col9foradd heading-new-formob-shi-custpro myneworder-shi-kan">
        <h2>MY ORDERS</h2>
        <asp:GridView ID="gvwOrders" DataKeyNames="uniqueorderno" OnRowDataBound="gvwOrders_RowDataBound"  runat="server" AutoGenerateColumns="false" ShowHeader="False" CssClass="gridline">
            <Columns>
                <asp:TemplateField>
                    <ItemTemplate>
                        <div class="col-md-12 orderlist">

                            <div class="row orderrow">
                                <div class="col-md-4 orderno">
                                    <a class="btn btn-success" href="#" >OrderNo:<span><%#Eval("UniqueOrderNo")%></span></a></div>

                                <div class="col-md-3  status newstatusdesign-shi">
                                    <a href="#!" style="color: #171616!important;margin: 0 2px!important;text-decoration: none!important;font-size: 13px!important;">Payment Status :</a><span><asp:label cssClass="spantextnewforstatus-shi" ID="lblpaymentstatus" runat="server" Text='<%# Bind("PaidStatus") %>'></asp:label> </span>
                                </div>
                                <div class="col-md-3  status newstatusdesign-shi">
                                    <a href="#!" style="color: #171616!important;margin: 0 2px!important;text-decoration: none!important;font-size: 13px!important;">Order Status :</a><span><asp:Label ID="lblorderstatus" cssClass="spantextnewforstatus-shi" runat="server" Text='<%# Bind("orderstatus") %>'></asp:Label> </span>
                                </div>

                            </div>

                           <%-- gridview order items start--%>

                            <asp:GridView ID="gvworderitems" runat="server" AutoGenerateColumns="false" ShowHeader="False" Width="100%" CssClass="gridline">
                                <Columns>
                                    <asp:TemplateField>
                                        <ItemTemplate>

                                  
                            <div class="row orderdata">
                                <div class="col-md-2 col-xs-12 orderimg">
                                    <img src='<%#Eval("MainImagePath")%>' />
                                </div>
                                <div class="col-md-4 col-xs-12 abtproduct">
                                    <span><%#Eval("ProductName")%>  (<%#Eval("PckUnit")%>)</span>
                                </div>
                                <div class="col-md-2 col-xs-6 qnty1 custpro-for-myorder-shi">
                                    <p>Qty : </p>
                                    <span><%#Eval("pckquantity")%></span>
                                    <asp:DropDownList ID="ddlcancel" Width="108px" Height="30px" runat="server">
                                        <asp:ListItem Selected="True" Value="0">Select Reason</asp:ListItem>
                                        <asp:ListItem Value="1">The Delivery is Delayed</asp:ListItem>
                                        <asp:ListItem Value="2">Order Place by mistake.</asp:ListItem>
                                        <asp:ListItem Value="3">Expected Delivery time is too long.</asp:ListItem>
                                        <asp:ListItem Value="4">Item Price /Shopping cost is too high.</asp:ListItem>
                                        <asp:ListItem Value="5">Need to Change Shipping address.</asp:ListItem>
                                        <asp:ListItem Value="6">My reason is not listed.</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="ddlcancel" ForeColor="Red" runat="server" Display="Dynamic" ErrorMessage="Select reason "></asp:RequiredFieldValidator>
                                </div>
                                <div class="col-md-2 col-xs-6 price custpro-for-myorder-shi">
                                    <span><i class="fa fa-inr" aria-hidden="true">
                                    </i><%#Eval("sellprice")%>
                                    <asp:Button ID="btncancel" runat="server" Height="32px" Text="Item Cancel" Width="115px" CssClass="customer-button" />
                                    <br />
                                   <br />
                                    </span>

                                </div>

                            </div>

                                  </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>

                            <%-- gridview order items end--%>
                            <div class="row total">
                                <div class="col-md-6 col-xs-12 orderdate ">
                                    <p>Ordered On </p>
                                    &nbsp; <span><asp:Label ID="lbldate" runat="server" Text='<%#Bind("createddate")%>'></asp:Label></span>
                                </div>
                                <div class="col-md-6 col-xs-12 totalamnt text-right txtcntr-formob-myordr">
                                    <div>
                                        <p>Amount : </p>
                                        &nbsp;<i class="fa fa-inr" aria-hidden="true"></i> <span><%#Eval("TotalAmount")%></span>
                                    </div>
                                    <div>
                                        <p>Shipping Amount : </p>
                                        &nbsp;<i class="fa fa-inr" aria-hidden="true"></i> <span><%#Eval("DeliveryCharges")%></span>
                                    </div>
                                  
                                    <div>
                                        <p>Total Amount : </p>
                                        &nbsp;<i class="fa fa-inr" aria-hidden="true"></i> <span><%#Eval("NetAmount")%></span>
                                    </div>
                                </div>

                            </div>



                        </div>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>

             
    </div>
</div>   

              <%-- MyOrders end--%>


        <%--  <div id="divMyWishlist" class="col-md-9 col9forwishlist">
                    

        <h2>Empty Wishlist <span>(0)</span></h2>
        <div class="col-md-12 emptywislidt">
            <div class="imgdiv-wish">
                <i class="fa fa-laptop fa-stack-2x" aria-hidden="true"></i>
                <i class="fa fa-heart" aria-hidden="true"></i>
            </div>
        </div>
        <div class="emptywishtag text-center">
            <h3>your wishlist is empty!</h3>
            <a href="../index.aspx">Shop Now</a>
        </div>
    


                </div>--%>



        </div>
    </section>
    
     <!--=================== main containt end==================-->

     <!--=================== footer containt start==================-->
     
     <div id="footer" style="padding-bottom: 5px;">
                    <div style="clear:both;">
                        <div class="bottombartop_r">
                            <div class="bottombartop_l"></div>
                        </div>
                        <div class="bottombarmiddle_r">
                            <div class="bottombarmiddle_l">
                                <center>
                                </center>
                                <div class='storeaddress'>
                                    <div class="hyper_footer">
                                        <div class="footer_inner">
                                            <div class="foo-cols">
                                                <h2>Quick Links                     <h2>Quick Links</h2>
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
                                                       <%-- <li class="dribble"><a href="//www.youtube.com/channel/UCqE3YjVFGjZDTWuKDNRxDsQ" target="_blank">Youtube</a></li>--%>
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
                                                       <%-- <li class="dribble"><a href="//www.youtube.com/channel/UCqE3YjVFGjZDTWuKDNRxDsQ" target="_blank">Youtube</a></li>--%>
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

