<%@ Page Title="" Language="C#" MasterPageFile="~/mainwebsite.master" AutoEventWireup="true" CodeFile="ChangePassword.aspx.cs" Inherits="Customer_ChangePassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
   <style>
        #liProfile:hover,#liOrder:hover,#liAddress:hover,#liPassword:hover{
            background-color:lightgray;
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

            
            <%--change Password start--%>
          <div id="divChangePassword" class="col-md-9" style="">
            
<div class="col-md-12 col9foradd foraddreskan chngepass-new-formmob-shi">

    <h2>CHANGE PASSWORD</h2>
        <div class="form-group">
           
             <label style="font-size:16px">Current Password<strong style="color:red">*</strong></label>
                <asp:TextBox ID="txtOldPass" runat="server" CssClass="form-control" placeholder="Enter your Current Password" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" Font-Size="14px" ControlToValidate="txtOldPass" Display="Dynamic" ErrorMessage="Current Password Cannot Be Blank" ForeColor="Red" SetFocusOnError="True" ValidationGroup="A"></asp:RequiredFieldValidator>
        </div>

        <div class="form-group">
            <label style="font-size:16px">New Password<strong style="color:red">*</strong></label>
                <asp:TextBox ID="txtNPass" runat="server" CssClass="form-control" placeholder="Enter your New Password" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" Font-Size="14px" ControlToValidate="txtNPass" Display="Dynamic" ErrorMessage="New Passsword Cannot Be Blank" ForeColor="Red" SetFocusOnError="True" ValidationGroup="A"></asp:RequiredFieldValidator>
        </div>

           <div class="form-group">
       
            <label style="font-size:16px">Confirm New Password<strong style="color:red">*</strong></label>
                <asp:TextBox ID="txtCNPass" runat="server" CssClass="form-control" placeholder="Confirm your New Password" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Font-Size="14px" ControlToValidate="txtCNPass" Display="Dynamic" ErrorMessage="Confirm Password Cannot Be Blank" ForeColor="Red" SetFocusOnError="True" ValidationGroup="A"></asp:RequiredFieldValidator>
                <asp:CompareValidator ID="CompareValidator1" runat="server" Font-Size="14px" ErrorMessage="Password Mismatch" ControlToCompare="txtNPass" ControlToValidate="txtCNPass" Display="Dynamic" ForeColor="Red" SetFocusOnError="True" ValidationGroup="A"></asp:CompareValidator>
        </div>

        <div class="editformsavebtn">
         
            <asp:Button ID="btnSaveChangePass" runat="server" CssClass="btn btn-success" Text="Save Password"  ValidationGroup="A" OnClick="btnSaveChangePass_Click" />
        </div>
</div>

            </div>

           <%--change Password end--%>


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
                                            <h2>Popular Brands</h2>
                                            <p><a href="/SearchResults.aspx?search=Fresh%20basket">Fresh Basket</a>, <a href="/SearchResults.aspx?search=24%20Mantra">24 Mantra</a>, <a href="/SearchResults.aspx?search=aashirvaad">Aashirwad</a>, <a href="/SearchResults.aspx?search=amul">Amul</a>, <a href="/SearchResults.aspx?search=ariel">Ariel</a>, <a href="/SearchResults.aspx?search=axe">Axe</a>, <a href="/SearchResults.aspx?search=bisleri">Bisleri</a>, <a href="/SearchResults.aspx?search=Bounty">Bounty</a>, <a href="/SearchResults.aspx?search=bournvita">Bournvita</a>, <a href="/SearchResults.aspx?search=Britannia">Britannia</a>, <a href="/SearchResults.aspx?search=Brooke%20Bond">Brooke Bond</a>, <a href="/SearchResults.aspx?search=bru">Bru</a>, <a href="/SearchResults.aspx?search=cadbury">Cadbury</a>, <a href="/SearchResults.aspx?search=dabur">Dabur</a>, <a href="/SearchResults.aspx?search=dairy%20milk">Dairy Milk</a>, <a href="/SearchResults.aspx?search=danone">Danone</a>, <a href="/SearchResults.aspx?search=dettol">Dettol</a>, <a href="/SearchResults.aspx?search=Ferrero%20Rocher">Ferrero Rocher</a>, <a href="/SearchResults.aspx?search=figaro">Figaro</a>, <a href="/SearchResults.aspx?search=Gillette">Gillette</a>, <a href="/SearchResults.aspx?search=Haldiram">Haldiram</a>, <a href="javascript:void(0);">Hatsun</a>, <a href="/SearchResults.aspx?search=Himalaya">Himalaya</a>, <a href="/SearchResults.aspx?search=Kelloggs">Kelloggs</a>, <a href="/SearchResults.aspx?search=Knorr">Knorr</a>, <a href="/SearchResults.aspx?search=Lakme">Lakme</a>, <a href="/SearchResults.aspx?search=Lipton">Lipton</a>, <a href="/SearchResults.aspx?search=Monginis">Monginis</a>, <a href="/SearchResults.aspx?search=Maggi">Maggi</a>, <a href="/SearchResults.aspx?search=Mother%20Dairy">Mother Dairy</a>, <a href="/SearchResults.aspx?search=mtr">MTR</a>, <a href="/SearchResults.aspx?search=Nestle">Nestle</a>, <a href="/SearchResults.aspx?search=Nutella">Nutella</a>, <a href="/SearchResults.aspx?search=Parle">Parle</a>, <a href="/SearchResults.aspx?search=Paper%20Boat">Paper Boat</a>, <a href="/SearchResults.aspx?search=Patanjali">Patanjali</a>, <a href="javascript:void(0);">Schmitten</a>, <a href="/SearchResults.aspx?search=Saffola">Saffola</a>, <a href="/SearchResults.aspx?search=Snickers">Snickers</a>, <a href="/SearchResults.aspx?search=Surf%20Excel">Surf Excel</a>, <a href="/SearchResults.aspx?search=Tata">Tata</a>, <a href="/SearchResults.aspx?search=Tropicana">Tropicana</a>, <a href="/SearchResults.aspx?search=Whisper">Whisper</a>, <a href="/SearchResults.aspx?search=Zandu">Zandu</a></p>
                                        </div>
                                        <%--<div class="copyrights ">
                                            <div class="copy-text fa-align-center" >
                                                <p>Copyright © 2019 ShoppingPoint99</p>                                                
                                            </div>
                                            <div class="footer-logos"><img height="51" src="//storage.sg.content-cdn.io/in-resources/e04386d8-7ca8-4fa3-b8b8-6c606844d257/Stylesheet/images/footer-logos-11-7-17.png" width="700" /></div>
                                        </div>--%>
                                        <div >
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

