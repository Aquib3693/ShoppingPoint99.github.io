<%@ Page Title="" Language="C#" MasterPageFile="~/mainwebsite.master" AutoEventWireup="true" CodeFile="MyCart.aspx.cs" Inherits="Website_MyCart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        .gridline{
    border-color:#DCDCDC;
    border-right-color:#ffffff;
        }

    </style>
  

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
      <!--=================== main containt start==================-->
       <div class="container-fluid cart-containerfluid" id="maindiv">
                                            
                                           <asp:UpdatePanel ID="up2" runat="server">
                                      <ContentTemplate>
                                            <div class="col-md-9 cartdata-col8">
                                                <div class="row mainrowcart">
                                                    <div class="col-md-12 col-xs-12 col6forcartheadn">
                                                        <h2>My Cart<span>(<asp:Label ID="lblCartValue" runat="server" Text="0"></asp:Label>)</span></h2>
                                                    </div>
                                                </div>
                                           

                                                <%--gridview cart start--%>
                                                <asp:GridView ID="gvwCart"  runat="server" Width="90%" AutoGenerateColumns="False" ShowHeader="False" CssClass="gridline">
                                                    <Columns>
                                                        <asp:TemplateField>
                                                            <ItemTemplate>
                                                                <div class="col-md-12 crtcntcol12">
                                                    <div class="row">
                                                        <div class="col-md-2 imgcart">
                                                            
                                                            <img src='<%#Eval("MainImagePath")%>' >
                                                               
                                                        </div>
                                                        <div class="col-md-7 cartimgabout">
                                                            <h4><a href="../Website/ProductDetails.aspx?ProductID=<%#Eval("ProductID") %>""><%#Eval("ProductName")%></a></h4>

                                                            <p style="font-size:large">  <%#Eval("PckDetail")%></p>
                                                            
                                                            <div class="wish-price-cart">
                                                                
                                                                <span class="actualwishprice"><i class="fa fa-inr"></i><asp:Label ID="lblSP" runat="server" Text='<%# Bind("SP") %>'></asp:Label> </span>
                                                                <span class="cnclewishprice"> <i class="fa fa-inr"></i><asp:Label ID="lblMRP" runat="server" Text='<%# Bind("MRP") %>'></asp:Label></span>
                                                                <span class="wishpriceoff"><%#Eval("Discount")%> % off</span>
                                                                
                                                            </div>
                                                        </div>

                                                        <input id="1" type="hidden" pval="12397" sval="622130">
                                                    </div>
                                                    <div class="row minuplsrow">
                                                        <div class="col-md-2 col2forpadding-btnplusminus">
                                                            <div class="qntty">
                                                               <%-- <button ids="1" type="button" class="minisqntty" onclick="btnminus_Click" >-</button>--%>
                                                                <%--<button ids="1" type="button" incretype="plus" class="plusqntty" onclick="">+</button>--%>
                                                                 <%--<input id="txt_1" ids="1" type="text" value="1" readonly="true" class="form-control quan copypastecloase">--%>
                                                                <asp:Button ID="minus" CssClass="minisqntty" runat="server" Text="-"  OnClick="btnminus_Click" />
                                                                <asp:TextBox ID="txtQty" runat="server" CssClass="form-control quan copypastecloase" Text='<%# Bind("Quantity") %>' minlength="1" ReadOnly="true" MaxLength="20"></asp:TextBox>
                                                                <asp:Button ID="btnplus" class="plusqntty" runat="server" Text="+" Font-Size="Large" OnClick="btnplus_Click" Font-Bold="true"/>
                                                            </div>

                                                        </div>
                                                        <div class="col-md-6">
                                                            <div class="removeandlatr">
                                                                <%--<a style="cursor:pointer" ids="1" class="rmv">Remove</a>--%>
                                                                <asp:Button ID="gvwbtnDelete" runat="server" CssClass="btn btn-danger" OnClick="gvwbtnDelete_Click" Text="Remove" />
                                                                <asp:Label ID="lblPID" runat="server" Text='<%# Bind("ProductID") %>' Visible="false"></asp:Label>
                                                            </div>
                                                        </div>
                                                    </div>

                                                </div>
                                                            </ItemTemplate>
                                                             
                                                        </asp:TemplateField>
                                                    </Columns>
                                                </asp:GridView>

                                                <%--gridview cart end--%>

                                                <div class="row col-md-12 cart-new-shi-addon newformob-space-shi">
                                                    <div class="disc-price-cart text-right">
                                                        <a href="../index.aspx" class="btn btn-default"><i class="fa fa-angle-left" aria-hidden="true"></i> Continue shopping</a>
                                                        <%--<button type="button" class="btn btn-default procctopay">Place Order</button>--%>
                                                        <asp:Button ID="btnPlaceOrder" runat="server" CssClass="btn btn-default procctopay" Text="Place Order" OnClick="btnPlaceOrder_Click"/>
                                                    </div>
                                                </div>
                                                <br/>


                                            </div>
                                     

                                            <div class="col-md-3 pricedetails-cart-col4 discnt-add-shi">


                                             
                                                    <div class="coupon-inner-cart">
                                                        <div class="row pricerow-cart">
                                                            <h2>PRICE DETAILS</h2>
                                                            <div class="pricelistcart">
                                                                <p>Price: (<asp:Label ID="lblitems" runat="server"></asp:Label> items) <span class="pull-right"><i class="fa fa-inr"></i><asp:Label ID="lblTotal" runat="server"></asp:Label></span></p>
                                                                <p>Delivery: <span class="pull-right"><i class="fa fa-inr"></i><asp:Label ID="lblDelivery" Text="28" runat="server"></asp:Label></span></p>
                                                                <p class="grand-addon-shi">Grand Total: <span class="pull-right"><i class="fa fa-inr"></i><asp:Label ID="lblGTotal" runat="server"></asp:Label></span></p>
                                                            </div>

                                                        </div>
                                                    </div>
                                               


                                            </div>
                                               </ContentTemplate></asp:UpdatePanel>
                                        </div>
     <!--=================== main containt end==================-->

     <!--=================== footer containt start==================-->
     <div class="container_nopadding">
                                                        <div class="controlcontent_r">
                                                            <div class="htmlbucket">
                                                                <p>
                                                                    <div class="why-hyper-block">
                                                                        <h2>Why ShoppingPoint99</h2>
                                                                        <div class="hyper-block">
                                                                            <div class="block">
                                                                                <div class="brand_image_block"><img alt="Hyper Range" height="107" src="//storage.sg.content-cdn.io/in-resources/e04386d8-7ca8-4fa3-b8b8-6c606844d257/Stylesheet/images/icons/icon-1.png" width="104" /></div>
                                                                <p>
                                                                    Hyper Range<br />
                                                                    Everything in Food, Home & Fashion
                                                                </p>
                                                            </div>
                                                            <div class="block">
                                                                <div class="brand_image_block"><img alt="Hyper Fresh" height="107" src="//storage.sg.content-cdn.io/in-resources/e04386d8-7ca8-4fa3-b8b8-6c606844d257/Stylesheet/images/icons/icon-2.png" width="104" /></div>
                                                                <p>
                                                                    Hyper Fresh<br />
                                                                    Freshness Delivered
                                                                </p>
                                                            </div>
                                                            <div class="block">
                                                                <div class="brand_image_block"><img alt="Hyper Speed" height="107" src="//storage.sg.content-cdn.io/in-resources/e04386d8-7ca8-4fa3-b8b8-6c606844d257/Stylesheet/images/icons/icon-3.png" width="104" /></div>
                                                                <p>
                                                                    Hyper Speed<br />
                                                                    Direct from store in 3 hours
                                                                </p>
                                                            </div>
                                                            <div class="block">
                                                                <div class="brand_image_block"><img alt="Hyper Trust" height="107" src="//storage.sg.content-cdn.io/in-resources/e04386d8-7ca8-4fa3-b8b8-6c606844d257/Stylesheet/images/icons/icon-4.png" width="104" /></div>
                                                                <p>
                                                                    Hyper Trust<br />
                                                                    Easy Returns and Refunds
                                                                </p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    </p>
                                                </div>
                                            </div>
                                            <div class="r_bottom">
                                                <div class="l_bottom">
                                                </div>
                                            </div>
                                        </div>
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
                                                        <%--<li class="dribble"><a href="//www.youtube.com/channel/UCqE3YjVFGjZDTWuKDNRxDsQ" target="_blank">Youtube</a></li>--%>
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
                                            <p style="text-align:center;font-size:large">Copyright © 2022 ShoppingPoint99</p>
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
                                                <p>Copyright © 2022 ShoppingPoint99</p>                                                
                                            </div>
                                            <div class="footer-logos"><img height="51" src="//storage.sg.content-cdn.io/in-resources/e04386d8-7ca8-4fa3-b8b8-6c606844d257/Stylesheet/images/footer-logos-11-7-17.png" width="700" /></div>
                                        </div>--%>
                                        <div>
                                            <p>Copyright © 2022 ShoppingPoint99</p>
                                        </div>
                                    </div>
                                    <div class="scrollToTop" style="display:none;"></div>
                                </div>
                            </div>
                        </div>
                     
                    </div>
                    <div id="ctl00_pnlPoweredByLogo" class="martjacklogo">
                        <a id="ctl00_lnkPoweredby" title="eCommerce platform" href="https://www.capillarytech.com/products/anywhere-commerce-plus/anywhere-commerce" target="_blank"></a>
                    </div>
                </div>
     <!--=================== footer containt end==================-->
</asp:Content>

