<%@ Page Title="" Language="C#" MasterPageFile="~/mainwebsite.master" AutoEventWireup="true" CodeFile="Registration.aspx.cs" Inherits="Customer_Registration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
   

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
  
    <!--=================== main containt start==================-->
         <div class="col-md-offset-3 col-md-6 logindivmain">

                                               <div class="container-fluid contfldmaindivform">
                                                    <div class="col-xs-12 col12loginheading">
                                                      <h3 >Registration</h3>
                                                    </div>
        
                       
                        <div class="col-xs-offset-2 col-xs-8  form-group logincol12frmgrp">
                            <label>MOBILE NUMBER*</label>
                          
                                <asp:TextBox ID="txtCMobile" runat="server" placeholder="Enter your Mobile Number" onkeypress='return(event.charCode >= 48 && event.charCode <= 57)' MaxLength="10" ValidationGroup="A" CssClass="customer-textbox"></asp:TextBox>
                            <asp:Label runat="server" ID="lblotp" Visible="false"></asp:Label>
                      
                        </div>
                        <div class="col-xs-offset-2 col-xs-8 logincol12frmgrp">
                          
                          
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtCMobile" CssClass="validation" Display="Dynamic" ErrorMessage="Mobile cannot be Blank" SetFocusOnError="True" ValidationGroup="A"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtCMobile" CssClass="validation" Display="Dynamic" ErrorMessage="Mobile is not valid" SetFocusOnError="True" ValidationExpression="^[6-9]\d{9}$" ValidationGroup="A"></asp:RegularExpressionValidator>
                          
                        </div>
                  
                      
                        <div class="col-xs-offset-2 col-xs-8 logincol12frmgrp">
                            
                           
                                <asp:Panel ID="pnlbtnGenOTP" runat="server" cssClass="loginbtnparent">
                                <asp:Button ID="btnGenerateOTP" runat="server" Height="38px" OnClick="btnGenerateOTP_Click" Text="Next" ValidationGroup="A" CssClass="customer-button" Width="130px" />
                                    </asp:Panel>
                          
                        </div>
                    <asp:Panel ID="pnlVerifyOTP" runat="server" Visible="false">

                        <div class="col-xs-offset-2 col-xs-8 form-group logincol12frmgrp">
                            <label>ENTER OTP*</label>
                          
                                <asp:TextBox ID="txtOTP" runat="server" onkeypress='return(event.charCode >= 48 && event.charCode <= 57)' placeholder="Enter your OTP"  CssClass="customer-textbox" Width="40%" MaxLength="4"></asp:TextBox>
                                
                                
                            <asp:Button ID="btnVerifyOTP" runat="server"  OnClick="btnVerifyOTP_Click" Text="Verify"  ValidationGroup="A" CssClass="customer-button" Height="30px" width="110px" />
                       
                        </div>

                        <div class="col-xs-offset-2 col-xs-8 logincol12frmgrp">
                            
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtOTP" CssClass="validation" Display="Dynamic" ErrorMessage="OTP cannot be Blank" SetFocusOnError="True" ValidationGroup="A"></asp:RequiredFieldValidator><br />
                            <asp:Label ID="lblotperror" runat="server" Text="OTP is not Correct" Visible="false" CssClass="validation"></asp:Label>
                           
                           
                        </div>
                         <div class="col-xs-offset-2 col-xs-8  logincol12frmgrp">
                             <div class="auto-style12 notregdiv">
                               <asp:Button ID="btnResendOTP" runat="server" CssClass="customer-button" Text="Resend OTP" Width="130px" Height="35px" OnClick="btnResendOTP_Click" />
                            </div>
        
                                
                            
                        </div>
                            </asp:Panel>
                      <asp:Panel ID="pnlPass" runat="server" Visible="false">

                         <div class="col-xs-offset-2 col-xs-8 form-group logincol12frmgrp">
                            <label>ENTER PASSWORD*</label>
                            
                                <asp:TextBox ID="txtNewPass" runat="server" CssClass="customer-textbox" TextMode="Password" placeholder="Enter Password"></asp:TextBox>
                              
             
                           
                        </div>
                         <div class="col-xs-offset-2 col-xs-8 logincol12frmgrp">
                          
                            
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtNewPass" CssClass="validation" Display="Dynamic" ErrorMessage="Password cannot be Blank" SetFocusOnError="True" ValidationGroup="A"></asp:RequiredFieldValidator>
                             <asp:RegularExpressionValidator ID="rvg1" runat="server" ControlToValidate="txtNewPass" CssClass="validation" Display="Dynamic" ErrorMessage="Password must contain a special character,an uppercase letter,a lowercase letter and must be atleast 6 characters long" SetFocusOnError="True" ValidationGroup="A" ValidationExpression="^(?:(?=.*[a-z])(?:(?=.*[A-Z])(?=.*[\d\W])|(?=.*\W)(?=.*\d))|(?=.*\W)(?=.*[A-Z])(?=.*\d)).{6,20}$"></asp:RegularExpressionValidator>
                                
                        </div>
                        <div class="col-xs-offset-2 col-xs-8 form-group logincol12frmgrp">
                            <label>CONFIRM PASSWORD*</label>
                          
                                <asp:TextBox ID="txtNewCPass" runat="server" CssClass="customer-textbox" TextMode="Password" placeholder="Confirm Password"></asp:TextBox>
                            
                        </div>
                         <div class="col-xs-offset-2 col-xs-8 logincol12frmgrp">
                            
                           
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtNewCPass" CssClass="validation" Display="Dynamic" ErrorMessage="Confirm Password cannot be Blank" SetFocusOnError="True" ValidationGroup="A"></asp:RequiredFieldValidator>
                                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtNewPass" ControlToValidate="txtNewCPass" CssClass="validation" Display="Dynamic" ErrorMessage="Password Mismatch" SetFocusOnError="True" ValidationGroup="A"></asp:CompareValidator>
                                
                        </div>
                            </asp:Panel>
                        <div class="col-xs-offset-2 col-xs-8 logincol12frmgrp">
                          
                           
                                <asp:Panel ID="pnlBtnRegister" runat="server" Visible="false" cssClass="loginbtnparent">
                                <asp:Button ID="btnRegister" runat="server" Height="38px" OnClick="btnRegister_Click" Text="Register" ValidationGroup="A" CssClass="customer-button" Width="130px" />
                                    </asp:Panel>
                        
                        </div>
                  
                      
                       
                  
                      
                        <div class="col-xs-offset-2 col-xs-8 logincol12frmgrp">
                          
                            <div class="auto-style12 notregdiv">
                                Already Registered
                                <asp:LinkButton ID="lbtnSignIn" Font-Size="Medium" runat="server" OnClick="lbtnSignIn_Click">Sign In!</asp:LinkButton>
                            </div>
                        </div>
                  
                      
                        
                
                     
      
    </div>
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
                                                     <%--   <li class="dribble"><a href="//www.youtube.com/channel/UCqE3YjVFGjZDTWuKDNRxDsQ" target="_blank">Youtube</a></li>--%>
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
                                                      <%--  <li class="dribble"><a href="//www.youtube.com/channel/UCqE3YjVFGjZDTWuKDNRxDsQ" target="_blank">Youtube</a></li>--%>
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
                      
                    </div>
                    <div id="ctl00_pnlPoweredByLogo" class="martjacklogo">
                        <a id="ctl00_lnkPoweredby" title="eCommerce platform" href="https://www.capillarytech.com/products/anywhere-commerce-plus/anywhere-commerce" target="_blank"></a>
                    </div>
                </div>
     <!--=================== footer containt end==================-->
</asp:Content>

