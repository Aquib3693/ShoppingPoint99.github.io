<%@ Page Title="" Language="C#" MasterPageFile="~/mainwebsite.master" AutoEventWireup="true" CodeFile="ProceedToPay.aspx.cs" Inherits="Website_ProceedToPay" %>

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

                                        <div class="container-fluid proceedtopay-section">
                                            <asp:UpdatePanel ID="up1" runat="server">
                                                <ContentTemplate>
                                                    
                                            <div class="col-md-8 proceedcol9">
                                                <div class="alldiv-proceed">
                                                    <div class="main-expenddiv-proceed">
                                                        <div class="main-dic-proceed">

                                                            <span class="headingnumber-proceed">1</span>
                                                            <span class="headingname-procced">Welcome </span>
                                                            <span class="addonchange-div3"><svg height="20" width="20" viewBox="0 0 24 24"><path d="M9 16.2L4.8 12l-1.4 1.4L9 19 21 7l-1.4-1.4L9 16.2z" stroke="#388e3c"></path></svg></span>
                                                            <div class="aftercompletediv-hidediv">
                                                                <span class="cname"><asp:Label ID="lblCustomername" runat="server"></asp:Label></span>



                                                            </div>
                                                        </div>
                                                        
                                                    </div>
                                                    <div class="main-expenddiv-proceed">

                                                        <div class="main-dic-proceed checkdiv hidemysiblink">
                                                            <span class="headingnumber-proceed">2</span>
                                                            <span class="headingname-procced">Delivery Address</span>
                                                            <span class="addonchange-div3"><svg height="20" width="20" viewBox="0 0 24 24"><path d="M9 16.2L4.8 12l-1.4 1.4L9 19 21 7l-1.4-1.4L9 16.2z" stroke="#388e3c"></path></svg></span>
                                                            <asp:Panel ID="pnlselectaddress" runat="server">
                                                            <div class="aftercompletediv-hidediv">
                                                                <%--<span class="cname">Shiva Rathore</span>--%>
                                                                <span class="caddress">
                                                                   <%-- Bareilly Old city ,  Bareilly  District, Uttar Pradesh  - <span class="cpincode">243001</span>--%>
                                                                    <asp:RadioButtonList ID="rdladdress" runat="server" AutoPostBack="true" OnSelectedIndexChanged="rdladdress_SelectedIndexChanged"></asp:RadioButtonList>
                                                                    <asp:Label ID="lbladdressid" runat="server" Visible="False"></asp:Label>
                                                                    <asp:RequiredFieldValidator ID="rrff1" runat="server" ControlToValidate="rdladdress" ForeColor="Red" Font-Size="14px" Text="Please select Address" ValidationGroup="A" SetFocusOnError="true" Display="Dynamic"></asp:RequiredFieldValidator>
                                                                    
                                                                </span>
                                                                <%--<button type="button" class="chngbtn">Change</button>--%>
                                                            </div>
                                                                </asp:Panel>
                                                        </div>

                                                     <asp:Panel ID="pnlenteraddress" runat="server">
                                                            <div class="row hidediv2-proceed">
                                                                <div class="col-md-12 inputfield-col6-proceed-for-div2">
                                                                    <div class="row proceddiv2row">
                                                                        <div class="input-field proceed-input-field-forhidediv2">
                                                                            <%--<input type="text" class="proceed-input-forhidediv2  controls input-mail firstname" id="name" value="">
                                                                            <label id="name-label" class="proceed-label-forhidediv2 label-mail">Name</label>--%>
                                                                            <asp:TextBox ID="txtname" runat="server" CssClass=" customer-textbox" placeholder="Enter Name"></asp:TextBox>
                                                                            <asp:RequiredFieldValidator ID="rv1" runat="server" ForeColor="Red" Font-Size="14px" Text="Name cannot be empty" ValidationGroup="B" ControlToValidate="txtname" SetFocusOnError="true" Display="Dynamic"></asp:RequiredFieldValidator>
                                                                        </div>
                                                                        <!--<div class="input-field proceed-input-field-forhidediv2">
                                                                            <input type="text" class="proceed-input-forhidediv2  controls input-mail lastname" id="last-name" value="">
                                                                            <label id="last-name-label" class="proceed-label-forhidediv2 label-mail">Last Name</label>
                                                                        </div>-->
                                                                        <div class="input-field proceed-input-field-forhidediv2">
                                                                            <%--<input type="tel" class="proceed-input-forhidediv2 controls copypastecloase" maxlength="10" onkeypress="return NumberOnly();" id="phone" value="">
                                                                            <label id="phone-label" class="proceed-label-forhidediv2">10-digit Mobile number</label>--%>
                                                                            <asp:TextBox ID="txtMobileNo" runat="server" CssClass=" customer-textbox" ReadOnly="true"></asp:TextBox>
                                                                        
                                                                        </div>
                                                                    </div>
                                                                    <div class="row proceddiv2row">
                                                                        <div class="input-field proceed-input-field-forhidediv2">
                                                                            <asp:TextBox ID="txtPin" runat="server" CssClass=" customer-textbox" placeholder="Enter Pincode" MaxLength="6" onkeypress='return(event.charCode >= 48 && event.charCode <= 57)'></asp:TextBox>
                                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ForeColor="Red" Font-Size="14px" Text="Pin cannot be empty" ValidationGroup="B" ControlToValidate="txtPin" SetFocusOnError="true" Display="Dynamic"></asp:RequiredFieldValidator>
                                                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" Font-Size="14px" ForeColor="Red" ErrorMessage="Enter a valid Pincode" ControlToValidate="txtPin" Display="Dynamic" SetFocusOnError="True" ValidationExpression="^[1-9][0-9]{5}$" ValidationGroup="B"></asp:RegularExpressionValidator>
                                                                            <%--<input type="text" class="proceed-input-forhidediv2 controls copypastecloase" id="zip" onkeypress="return NumberOnly();" value="">
                                                                            <label id="zip-label" class="proceed-label-forhidediv2">Pincode</label>--%>
                                                                        </div>
                                                                        <div class="input-field proceed-input-field-forhidediv2">
                                                                            <%--<input type="text" class="proceed-input-forhidediv2 controls copypastecloase" id="locality" value="">
                                                                            <label id="locality-label" class="proceed-label-forhidediv2">Email</label>--%>
                                                                            <asp:TextBox ID="txtEmail" runat="server" CssClass=" customer-textbox" placeholder="Enter Email"></asp:TextBox>
                                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ForeColor="Red" Font-Size="14px" Text="Email cannot be empty" ValidationGroup="B" ControlToValidate="txtEmail" SetFocusOnError="true" Display="Dynamic"></asp:RequiredFieldValidator>
                                                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" Font-Size="14px" ErrorMessage="Enter a valid Email" Display="Dynamic" SetFocusOnError="True" ValidationGroup="B" ValidationExpression="^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})$" ControlToValidate="txtEmail" ForeColor="Red"></asp:RegularExpressionValidator>
                                                                        </div>
                                                                    </div>
                                                                    <div class="row proceddiv2row">
                                                                        <div class="input-field proceed-input-field-forhidediv2 fortextarea-div2-proceed">
                                                                            <asp:TextBox ID="txtAddress" TextMode="MultiLine" runat="server" CssClass=" customer-textbox" placeholder="Enter Address"></asp:TextBox>
                                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ForeColor="Red" Font-Size="14px" Text="Address cannot be empty" ValidationGroup="B" ControlToValidate="txtAddress" SetFocusOnError="true" Display="Dynamic"></asp:RequiredFieldValidator>
                                                                        </div>
                                                                    </div>
                                                                    <div class="row proceddiv2row">
                                                                        <input type="hidden" class="1" widd="18862">
                                                                        <div class="input-field proceed-input-field-forhidediv2">
                                                                            
                                                                            <asp:DropDownList ID="ddlState" OnSelectedIndexChanged="ddlState_SelectedIndexChanged" AutoPostBack="true" runat="server" CssClass=" customer-textbox dropdown-toggle"></asp:DropDownList>                   
                                                                               <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ForeColor="Red" Font-Size="14px" InitialValue="0" Text="Please Select State" ValidationGroup="B" ControlToValidate="ddlState" SetFocusOnError="true" Display="Dynamic"></asp:RequiredFieldValidator>
                                                                        </div>
                                                                        <div class="input-field proceed-input-field-forhidediv2">
                                                                            <%--<input type="text" class="proceed-input-forhidediv2 controls" id="city" value="">
                                                                            <label id="city-label" class="proceed-label-forhidediv2">City/District/Town</label>--%>
                                                                            
                                                                                <asp:DropDownList ID="ddlCity" runat="server" CssClass=" customer-textbox dropdown-toggle"></asp:DropDownList>                   
                                                                               <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ForeColor="Red" Font-Size="14px" InitialValue="0" Text="Please Select City" ValidationGroup="B" ControlToValidate="ddlCity" SetFocusOnError="true" Display="Dynamic"></asp:RequiredFieldValidator>
                                                                        </div>
                                                                    </div>

                                                                    <div class="row proceddiv2row">
                                                                        <div class="input-field proceed-input-field-forhidediv2 fortextarea-div2-proceed">
                                                                            <%--<input id="landmark" type="text" class="proceed-input-forhidediv2" name="">
                                                                            <label id="landmark-label" class="proceed-label-forhidediv2">Landmark (Optional)</label>--%>
                                                                            <asp:TextBox ID="txtLandmark" runat="server" placeholder="Enter landmark(Optional)" CssClass="customer-textbox" TextMode="MultiLine"></asp:TextBox>
                                                                        </div>
                                                                        <%--<div class="input-field proceed-input-field-forhidediv2">
                                                                            <input id="alternate-phone" type="text" class="proceed-input-forhidediv2" name="">
                                                                            <label id="alternate-phone-label" class="proceed-label-forhidediv2">Alternate Phone (Optional)</label>
                                                                        </div>--%>
                                                                    </div>
                                                                   <asp:UpdatePanel ID="up2" runat="server">
                                                                       <ContentTemplate>
                                                                             <div class="saveanddlvr-proceed">
                                                                        <%--<button type="button" class="savedlvr">Save and Deliver Here</button>--%>
                                                                        <asp:Button ID="btnSaveAddress" runat="server" OnClick="btnSaveAddress_Click" Font-Size="Large"  Width="100px" Height="35px" ValidationGroup="B" CssClass="btn btn-success" Text="Save"/>
                                                                    </div>
                                                                       </ContentTemplate>
                                                                       <Triggers>
                                                                           <asp:PostBackTrigger ControlID="btnSaveAddress" />
                                                                       </Triggers>
                                                                   </asp:UpdatePanel>
                                                                  

                                                                </div>

                                                            </div>
                                                    </asp:Panel>

                                                    </div>
                                                    <div class="main-expenddiv-proceed">
                                                        <div class="main-dic-proceed">
                                                            <span class="headingnumber-proceed">3</span>
                                                            <span class="headingname-procced">Order Summary</span>
                                                            <span class="addonchange-div3"><svg height="20" width="20" viewBox="0 0 24 24"><path d="M9 16.2L4.8 12l-1.4 1.4L9 19 21 7l-1.4-1.4L9 16.2z" stroke="#388e3c"></path></svg></span>

                                                        </div>
                                                        <div class="row hidediv3-proceed hidemekndsection">
                                                            <div class="col-md-12 hidediv3col12">


                                                                <asp:GridView ID="gvwCart" runat="server"  Width="98%" AutoGenerateColumns="False" ShowHeader="False" CssClass="gridline">
                                                                    <Columns>
                                                                        <asp:TemplateField>
                                                                            <ItemTemplate>
                                                                                <div class="row crtcntcol12 proceeddiv3itemshow">
                                                                    <div class="row">
                                                                        <div class="col-md-3 imgcart">
                                                                            <%--<img src="Images/ProductImages/50-50.jpg">--%>
                                                                            <img src='<%#Eval("MainImagePath")%>' >
                                                                        </div>
                                                                        <div class="col-md-6 cartimgabout">
                                                                            <h4><a href="../Website/ProductDetails.aspx?ProductID=<%#Eval("ProductID") %>""><%#Eval("ProductName")%></a></h4>

                                                                            <p style="font-size:large"> <%#Eval("PckDetail")%></p>
                                                                            <div class="wish-price-cart">
                                                                                <span class="actualwishprice"><i class="fa fa-inr"></i> <asp:Label ID="lblSP" runat="server" Text='<%# Bind("SP") %>'></asp:Label></span>
                                                                                <span class="cnclewishprice"> <i class="fa fa-inr"></i> <asp:Label ID="lblMRP" runat="server" Text='<%# Bind("MRP") %>'></asp:Label></span>
                                                                                <span class="wishpriceoff"><%#Eval("Discount")%> % off</span>
                                                                                
                                                                            </div>

                                                                        </div>

                                                                        <input id="1" type="hidden" pval="12397" sval="622130">

                                                                    </div>
                                                                    <div class="row minuplsrow">
                                                                        <div class="col-md-3">
                                                                            <div class="qntty qntybtnforproceeddiv3">
                                                                                <%--<button type="button" incretype="minus" ids="1" class="minisqntty">-</button>
                                                                                <input type="text" id="txt_1" ids="1" value="1" class="form-control quan copypastecloase">
                                                                                <button type="button" ids="1" incretype="plus" class="plusqntty">+</button>--%>
                                                                                <asp:Button ID="btnminus" class="minisqntty" runat="server" Text="-" Font-Size="Large" OnClick="btnminus_Click"  Font-Bold="true" />
                                                                <asp:TextBox ID="txtQty" runat="server" CssClass="form-control quan copypastecloase" Text='<%# Bind("Quantity") %>' minlength="1" ReadOnly="true" MaxLength="20"></asp:TextBox>
                                                                <asp:Button ID="btnplus" class="plusqntty" runat="server" Text="+" Font-Size="Large" OnClick="btnplus_Click" Font-Bold="true"/>
                                                                                <asp:Label ID="lblPID" runat="server" Text='<%# Bind("ProductID") %>' Visible="false"></asp:Label>
                                                                            </div>
                                                                        </div>
                                                                        <asp:Button ID="gvwbtnDelete" runat="server" CssClass="btn btn-danger" OnClick="gvwbtnDelete_Click" Text="Remove" />
                                                                    </div>


                                                                </div>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                    </Columns>
                                                                </asp:GridView>
                                                                
                                                               
                                                                <div class="row orderconfirmdiv">
                                                                    <div class="col-md-8 orderspan-proceed">
                                                                      <%--  <div class="form-group">
                                                                             <asp:Panel ID="pnlverifymobile" runat="server" Visible="false">

                                                                        <label style="font-size:16px">Enter Mobile Number<strong style="color:red">*</strong></label>
                                                                            <asp:TextBox ID="txtVerifyMobile" runat="server" onkeypress='return(event.charCode >= 48 && event.charCode <= 57)' MaxLength="10" CssClass="form-control" placeholder="Enter your Mobile Number"></asp:TextBox><br />
                                                                              <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtVerifyMobile" CssClass="validation" Display="Dynamic" ErrorMessage="Enter your Mobile number" SetFocusOnError="True" ValidationGroup="C"></asp:RequiredFieldValidator>
                                                                      <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtVerifyMobile" CssClass="validation" Display="Dynamic" ErrorMessage="Enter a valid Mobile Number" SetFocusOnError="True" ValidationExpression="^[6-9]\d{9}$" ValidationGroup="C"></asp:RegularExpressionValidator>
                                                                            

                                                                        </asp:Panel>
                                                                        </div>
                                                                        <div class="form-group">
                                                                            <asp:Panel ID="pblbtngenotp" runat="server">
                                                                             <asp:Button ID="btngenerateotp" CssClass="btn btn-success"  Font-Size="Large"  runat="server" Text="Next" ValidationGroup="C" OnClick="btngenerateotp_Click"/>
                                                                                 </asp:Panel>
                                                                        </div>
                                                                        <asp:Panel ID="pnlverifyotp" runat="server">
                                                                              <div class="form-group">
                                                                            
                                                                        </div>
                                                                            <div class="form-group">
                                                                            
                                                                        </div>
                                                                            <div class="form-group">
                                                                            
                                                                        </div>
                                                                                 </asp:Panel>--%>
                                                                       
                                                                       
                                                                    </div>
                                                                     
                                                                    <div class="col-md-4 disablecontbtn-proceed cont-newbtn-shi">
                                                                       
                                                                        
                                                                         <asp:Panel ID="pnlOrderBtn" runat="server" Visible="false">
                                                                      
                                                                             <asp:UpdatePanel ID="up3" runat="server">
                                                                                 <ContentTemplate>
                                                                                      <asp:Button ID="btnPlaceOrder" CssClass="btn btn-success" Width="120px" Font-Size="Large" Height="50px" runat="server" Text="Continue" ValidationGroup="A" OnClick="btnPlaceOrder_Click"/>
                                                                                 </ContentTemplate>
                                                                                 <Triggers>
                                                                                     <asp:PostBackTrigger ControlID="btnPlaceOrder" />

                                                                                 </Triggers>
                                                                             </asp:UpdatePanel>
                                                                       

                                                                              </asp:Panel>
                                                                    </div>
                                                                  
                                                                </div>
                                                                    
                                                            </div>

                                                        </div>
                                                    </div>



                                                </div>
                                            </div>
                                            <div class="col-md-4 proceedprice-div">
                                                <div class="pricedtl-prcd">
                                                    <h2>PRICE DETAILS</h2>
                                                    <div class="proceedlist">
                                                        <p>Price: (<asp:Label ID="lblCartValue" runat="server"></asp:Label> items) <span class="pull-right"><i class="fa fa-inr"></i><asp:Label ID="lblTotal" runat="server"></asp:Label></span></p>
                                                        <p>Delivery Charges: <span class="pull-right proceedfree"><asp:Label ID="lblDelivery" runat="server" Text="28"></asp:Label></span></p>
                                                        <%--<p>Tax:<span class="pull-right proceedfree"><asp:Label ID="lblTax" runat="server" Text="100"></asp:Label></span></p>--%>
                                                        <%--<p>Discount:<span class="pull-right proceedfree"><asp:Label ID="lblDiscount" runat="server" Text="0"></asp:Label></span></p>--%>
                                                        <div class="row paybleamnt-proceed">
                                                            <p>Amount Payable <span class="pull-right"><i class="fa fa-inr"></i><asp:Label ID="lblGTotal" runat="server"></asp:Label></span></p>
                                                        </div>
                                                        <div class="row savingdiv">
                                                            <span>Your Total Savings on this order  <i class="fa fa-inr"></i>0</span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                                </ContentTemplate>
                                            </asp:UpdatePanel>

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
                                                        <%--<li class="dribble"><a href="//www.youtube.com/channel/UCqE3YjVFGjZDTWuKDNRxDsQ" target="_blank">Youtube</a></li>--%>
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
                        <div class="bottombarbottom_r">
                            <div class="bottombarbottom_l"></div>
                        </div>
                    </div>
                    <div id="ctl00_pnlPoweredByLogo" class="martjacklogo">
                        <a id="ctl00_lnkPoweredby" title="eCommerce platform" href="https://www.capillarytech.com/products/anywhere-commerce-plus/anywhere-commerce" target="_blank"></a>
                    </div>
                </div>
    <!--=================== footer containt start==================-->
</asp:Content>

