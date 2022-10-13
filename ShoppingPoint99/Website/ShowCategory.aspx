<%@ Page Title="" Language="C#" MasterPageFile="~/mainwebsite.master" AutoEventWireup="true" CodeFile="ShowCategory.aspx.cs" Inherits="Website_ShowCategory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <!--=================== main containt start==================-->
     <div id="main" class="mainnewdivforcontent">
                                        <div id="">
                                        </div>
                                        <div style="width:100%;">
                                            <div class="col1_T017">
                                                <div id="ctl00_ContentPlaceHolder1_ctl00_Pane1" class="col1_content_T017" style="width:100%">
                                                  <%--  <div id="pnlBanners">
                                                        <div class="container1" >
                                                            
                                                        </div>
                                                    </div>--%>
                                                    
                                                   <img src="../Images/BannerImages/banner-2.jpg" style="width:100%;" />
                                                    <div id="ctl00_ContentPlaceHolder1_ctl00_ctl03_divMain">
                                                        <div class="container2 cont2shinew">
                                                            
                                                            
                                                           
                                                            <div id="3568150" data-showcasetype="razor" data-widget="lightweightvariant">
                                                                
                                                                
                                                                <div id='Productshowcase'>
                                                                    <div class="controlcontent_r" style="position:relative">
                                                                        <div class="test" id="corosal_div_3568150" rel="5">
                                                                            <div class="bucketgroup">
                                                                                
                                                                                <asp:UpdatePanel ID="up1" runat="server">
                                                                                    <ContentTemplate>
                                                                                            <asp:DataList ID="DataList1" runat="server" RepeatColumns="5" RepeatDirection="Horizontal">
                                                                <ItemTemplate>
                                                              <div class="bucket" data-productid="12077148" data-sku="10015311" data-title='<%#Eval("ProductName")%>' data-price="75" data-brand="MartjackML.Brand" data-category="Hair Oils">
                                                                                    <div class="bucket_left">
                                                                                        <div class="mobshowcaseimg">
                                                                                            
                                                                                                <a href="../Website/ProductDetails.aspx?ProductID=<%#Eval("ProductID") %>"> 
                                                                                                <img src='<%#Eval("MainImagePath")%>' style="width:350px;height:350px" class="mtb-img" >
                                                                                                </a>
                                                                                           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
                                                                                        <div class="mobshowcasetitle">
                                                                                            
                                                                                            <h4 class="mtb-title"><a href="../Website/ProductDetails.aspx?ProductID=<%#Eval("ProductID") %>"><%#Eval("ProductName")%></a></h4>
                                                                                            <asp:Label ID="lblPID" runat="server" Text='<%# Eval("ProductID") %>' Visible="False"></asp:Label>
                                                                                         
                                                                                            <a class="mtb-more btn_addqty" title="Click for more details" href="/cart.aspx"><span class="mtb-more">more details</span></a>
                                                                                            <div class="formobile-price">
                                                                                                <span class="mtb-price">
                                                                                                    <label class="mtb-mrp"> <b class="lb1"> MRP </b> <span class='sp_currencysyb WebRupee'>INR </span> <span class="sp_amt"> 75</span> </label>
                                                                                                    <label class="mtb-ofr SaveOnMRP"> <b class="lb2"> Offer Price </b> <span class='sp_currencysyb WebRupee'>INR </span> <span class="sp_amt">63</span> </label>
                                                                                                    <label class="mtb-offer"><b class="lb5"> 16% </b>OFF</label>
                                                                                                </span>
                                                                                            </div>
                                                                                            <div class="btn_quick_view" id="12077148" style="display:none">
                                                                                                <a href="#" rel="12077148,0,11766482,e04386d8-7ca8-4fa3-b8b8-6c606844d257">Quick View</a>
                                                                                            </div>
                                                                                        </div>
                                                                                        <div class="hyc-showcase-bottom">
                                                                                            <div class="mtb-varientselection" id='QuickAddVarient12077148' data-variantjson='[{"ProductID":8584468,"SKU":"101171857","PackageQuantity":1,"MOQ":1,"MRP":75.0,"WebPrice_S":"63","MRP_S":"75","WebPrice":63.0,"Available":true,"Inventory":3,"SellableStock":3,"PreOrder":false,"BackOrder":false,"Variants":[{"PropertyID":"13294","Rank":9,"ReferenceCode":"","IsDisplaySwatch":true,"VariantValues":[{"ValueID":"276708","ValueDescription":"","PropertyID":"13294","VariantValue":"150ml Bottle"}],"ID":null,"Name":"Volume"}],"PropertyIDValueIDMap":{"13294":276708},"IsOutofStock":false,"WebSeoUrl":"https://www.hypercityfresh.com/beauty-and-wellness/hair-care/hair-oils/parachute-advanced-hair-oil-aloe-vera/p/12077148/8584468","MobileSeoUrl":"https://www.hypercityfresh.com/mobile/products/root-beauty--wellness-hair-care-hair-oils/parachute-advance/beauty-and-wellnesshair-carehair-oilsparachute-advanced-hair-oil-aloe-vera/12077148?vpid=8584468","IsPeriodicityExpired":false,"ShoExpired":false},{"ProductID":8584470,"SKU":"101171858","PackageQuantity":1,"MOQ":1,"MRP":120.0,"WebPrice_S":"120","MRP_S":"120","WebPrice":120.0,"Available":true,"Inventory":15,"SellableStock":15,"PreOrder":false,"BackOrder":false,"Variants":[{"PropertyID":"13294","Rank":9,"ReferenceCode":"","IsDisplaySwatch":true,"VariantValues":[{"ValueID":"276764","ValueDescription":"","PropertyID":"13294","VariantValue":"250ml Bottle"}],"ID":null,"Name":"Volume"}],"PropertyIDValueIDMap":{"13294":276764},"IsOutofStock":false,"WebSeoUrl":"https://www.hypercityfresh.com/beauty-and-wellness/hair-care/hair-oils/parachute-advanced-hair-oil-aloe-vera/p/12077148/8584470","MobileSeoUrl":"https://www.hypercityfresh.com/mobile/products/root-beauty--wellness-hair-care-hair-oils/parachute-advance/beauty-and-wellnesshair-carehair-oilsparachute-advanced-hair-oil-aloe-vera/12077148?vpid=8584470","IsPeriodicityExpired":false,"ShoExpired":false}]' data-images='[{}]'>
                                                                                                <div class="TemplateSource">
                                                                                                    <div class="mtb-swatch attributeslist_swatch VariantProperty variantp dropdownparent" data-variantpropertyrank="9" data-variantpropertyid="13294" name="Volume">
                                                                                                       <%-- <div class="VariantItem" data-value="150ml Bottle" data-variantpropertyid="13294" data-title="150ml Bottle" data-variantpropertyvalueid="276708">
                                                                                                            <a id="276708" href="javascript:void(0);" class="VariantPropertyValue selected" data-variantpropertyvalueid="276708">
                                                                                                                <div class="variantswatchtext">150ml Bottle</div>
                                                                                                            </a>
                                                                                                        </div>
                                                                                                        <div class="VariantItem" data-value="250ml Bottle" data-variantpropertyid="13294" data-title="250ml Bottle" data-variantpropertyvalueid="276764">
                                                                                                            <a id="276764" href="javascript:void(0);" class="VariantPropertyValue " data-variantpropertyvalueid="276764">
                                                                                                                <div class="variantswatchtext">250ml Bottle</div>
                                                                                                            </a>
                                                                                                        </div>--%>

                                                                                                        <%--<asp:DropDownList ID="ddlUnitmapping" runat="server" CssClass="qnttydropdown" Height="23px" Width="180px" AutoPostBack="True" OnSelectedIndexChanged="ddlUnitmapping_SelectedIndexChanged">
                                                                                                            
                                                                                                        </asp:DropDownList>--%>
                                                                                                        <asp:DropDownList ID="ddlUnitmapping" runat="server" Height="36px" Font-Size="Medium" CssClass="qnttydropdown" AutoPostBack="True" OnSelectedIndexChanged="ddlUnitmapping_SelectedIndexChanged">
                                                                                                            
                                                                                                        </asp:DropDownList>
                                                                                                        <div class="clear"></div>
                                                                                                    </div>
                                                                                                </div>
                                                                                            </div>
                                                                                            <div class="hyc-price-block">
                                                                                                <label class="hyc-quantity-label">Price</label>
                                                                                                <span class="mtb-price">
                                                                                                    <label class="mtb-mrp"> <b class="lb1"> MRP </b> <span class='sp_currencysyb WebRupee'>INR </span> <span class="sp_amt"> <asp:Label ID="lblMRP" style="text-decoration:line-through;" runat="server" Text='<%#Eval("MRP")%>'></asp:Label></span> </label>
                                                                                                    <label class="mtb-ofr SaveOnMRP"> <b class="lb2"> Offer Price </b> <span class='sp_currencysyb WebRupee'>INR </span> <span class="sp_amt"><asp:Label ID="lblSP" runat="server" Text='<%#Eval("SellingPrice")%>'></asp:Label></span> </label>
                                                                                                    <label class="mtb-offer mtb-yousave"><b class="lb5"><span class="sp_amt"> <asp:Label ID="lblDis" runat="server" Text='<%#Eval("discount")%>'></asp:Label></span>% </b>OFF</label>
                                                                                                </span>
                                                                                            </div>
                                                                                            <div class="mtb-qtyadd" id="QuickAdd12077148" data-usequantityfromtextbox="true" data-productid="12077148" data-mid="e04386d8-7ca8-4fa3-b8b8-6c606844d257" data-bulkqty="1" data-minorderqty="1" data-isparent="True">
                                                                                                <asp:UpdatePanel ID="up2" runat="server">
                                                                                                    <ContentTemplate>
                                                                                                           <div class="editcart">
                                                                                                    <%--<a class='btn_qtydecrease' style='display:none;' href='#' data-cartrefkey='$product.DeleteKey$'>-</a>
                                                                                                    <div class="added-cart-box"><input class='text_qty' type='text' value='1' maxlength='3'></input><span>Added in Cart</span></div>
                                                                                                    <a class='btn_qtyincrease' href='#' style='display:none;'>+</a>--%>
                                                                                                     <asp:Button runat="server" ID="btnAddToCart" CssClass="btn btn-success" Text="Add To Cart" OnClick="btnAddToCart_Click" />
                                                                                                               <asp:Button ID="btnbuynow" runat="server" BackColor="#ff6600" CssClass="btn btn-success" Text="Buy Now" OnClick="btnbuynow_Click" />
                                                                                                </div>
                                                                                                    </ContentTemplate>
                                                                                                    <Triggers>
                                                                                                        <asp:PostBackTrigger ControlID="btnAddToCart" />
                                                                                                    </Triggers>
                                                                                                </asp:UpdatePanel>
                                                                                             
                                                                                                <%--<a class='snackbar-msg btn_addqty' href='#'>Add<img class='loading_cart_img' /></a>
                                                                                                <div class='MsgDiv' style='display:none;'>Please Select&nbsp;</div>--%>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                </ItemTemplate>
                                                            </asp:DataList>

                                                                                    </ContentTemplate>
                                                                                </asp:UpdatePanel>
                                                                             
                                                                              
                                                                                
                                                                            </div>
                                                                        </div>
                                                                        <div class="new">
                                                                            <a class="pagenext showcase_next hyc-sprite showcase_middlepager_next" id="PageNext_3568150"></a><a class="pageprev showcase_prev hyc-sprite showcase_middlepager_prv" id="PagePrev_3568150"></a>
                                                                        </div>
                                                                    </div>
                                                                    <div class='r_bottom'><div class='l_bottom'></div></div>
                                                                </div><div id="html" style='display:none'>
                                                                    <img src="//assets.sg.content-cdn.io/css/themes/mjt02012538/images/main/show_loader.gif" />
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <script type="text/javascript">

                                                        DynamicModules.push(function () {
                                                            require(['App/Widgets/ProductShowCase'], function (ProductShowCase) {
                                                                ProductShowCase();
                                                                var objShowCaseInputs = { "PgControlId": 3568150, "IsConfigured": true, "ConfigurationType": "", "CombiIds": "", "PageNo": 1, "DivClientId": "3568150", "SortingValues": "CS", "ShowViewType": "H", "PropertyBag": null, "IsRefineExsists": true, "CID": "", "CT": 7, "TabId": 3262, "LocationIds": "18360", "CurrencyCode": "INR", "ContentType": "A" };
                                                                $('#' + objShowCaseInputs.DivClientId + '').ProductShowCase({ ShowCaseInputs: { "PgControlId": 3568150, "IsConfigured": true, "ConfigurationType": "", "CombiIds": "", "PageNo": 1, "DivClientId": "3568150", "SortingValues": "CS", "ShowViewType": "H", "PropertyBag": null, "IsRefineExsists": true, "CID": "", "CT": 7, "TabId": 3262, "LocationIds": "18360", "CurrencyCode": "INR", "ContentType": "A" }, ShowCaseType: 'PS', IsDataAvailable: 'True', UnLoadShowcase: 'False' });
                                                                ProductCommon.FlipImageAttr();
                                                                if ($('#' + objShowCaseInputs.DivClientId + '').find('.controlcontent_r').attr('rel') != undefined) {
                                                                    var TempAttr = $('div[id="' + objShowCaseInputs.DivClientId + '"]').find('.loadmore').find('.pagercontrol .pagerdiv .pagerdiv span').next().attr('href');
                                                                    if (TempAttr != undefined && TempAttr != null) {
                                                                        $('#' + objShowCaseInputs.DivClientId + ' .loadmoreproducts').find('.div_l').wrapInner('<a href="' + TempAttr + '"/>');
                                                                    }
                                                                }
                                                            });
                                                        });
                                                    </script>
                                                    
                                                   
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
                                                                        <h2>Why ShoppingPoint99
                                                                        <asp:Label runat="server" ID="lblCId" Visible="false"></asp:Label>
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
                                                        <li class="dribble"><a href="//www.youtube.com/channel/UCqE3YjVFGjZDTWuKDNRxDsQ" target="_blank">Youtube</a></li>
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
                                                     <%--   <li class="dribble"><a href="//www.youtube.com/channel/UCqE3YjVFGjZDTWuKDNRxDsQ" target="_blank">Youtube</a></li>--%>
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

