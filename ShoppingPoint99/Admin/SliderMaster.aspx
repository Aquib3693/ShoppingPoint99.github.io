<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin.master" AutoEventWireup="true" CodeFile="SliderMaster.aspx.cs" Inherits="Admin_SliderMaster" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style8 {
            width: 100%;
        }
        .auto-style9 {
            width: 20%;
            height: 23px;
        }
        .auto-style10 {
            width: 30%;
            height: 23px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="auto-style8">
        <tr>
            <td colspan="4" style="font-size: x-large; font-weight: 700">SLIDER&nbsp; MASTER</td>
        </tr>
        <tr>
            <td colspan="4" style="color: #FF3300">*Fields are Mandatory</td>
        </tr>
        <tr>
            <td style="width: 20%">Upload Image 1*</td>
            <td style="width: 30%">
                <asp:FileUpload ID="fup1" runat="server" />
            </td>
            <td style="width: 20%">Enter Link1*</td>
            <td style="width: 30%">
                <asp:TextBox ID="txtLink1" runat="server" CssClass="admin-textbox" Width="90%"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="width: 20%">&nbsp;</td>
            <td style="width: 30%">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="fup1" CssClass="validation" Display="Dynamic" ErrorMessage="Field must not be empty" SetFocusOnError="True" ValidationGroup="A"></asp:RequiredFieldValidator>
            </td>
            <td style="width: 20%">&nbsp;</td>
            <td style="width: 30%">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtLink1" CssClass="validation" Display="Dynamic" ErrorMessage="Field must not be empty" SetFocusOnError="True" ValidationGroup="A"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="width: 20%">Upload Image 2*</td>
            <td style="width: 30%">
                <asp:FileUpload ID="fup2" runat="server" />
            </td>
            <td style="width: 20%">Enter Link2*</td>
            <td style="width: 30%">
                <asp:TextBox ID="txtLink2" runat="server" CssClass="admin-textbox" Width="90%"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="width: 20%">&nbsp;</td>
            <td style="width: 30%">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="fup2" CssClass="validation" Display="Dynamic" ErrorMessage="Field must not be empty" SetFocusOnError="True" ValidationGroup="A"></asp:RequiredFieldValidator>
            </td>
            <td style="width: 20%">&nbsp;</td>
            <td style="width: 30%">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtLink2" CssClass="validation" Display="Dynamic" ErrorMessage="Field must not be empty" SetFocusOnError="True" ValidationGroup="A"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="width: 20%">Upload Image 3*</td>
            <td style="width: 30%">
                <asp:FileUpload ID="fup3" runat="server" />
            </td>
            <td style="width: 20%">Enter Link3*</td>
            <td style="width: 30%">
                <asp:TextBox ID="txtLink3" runat="server" CssClass="admin-textbox" Width="90%"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="width: 20%">&nbsp;</td>
            <td style="width: 30%">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="fup3" CssClass="validation" Display="Dynamic" ErrorMessage="Field must not be empty" SetFocusOnError="True" ValidationGroup="A"></asp:RequiredFieldValidator>
            </td>
            <td style="width: 20%">&nbsp;</td>
            <td style="width: 30%">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtLink3" CssClass="validation" Display="Dynamic" ErrorMessage="Field must not be empty" SetFocusOnError="True" ValidationGroup="A"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="width: 20%">&nbsp;</td>
            <td style="width: 30%">
                &nbsp;</td>
            <td style="width: 20%">&nbsp;</td>
            <td style="width: 30%">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style9"></td>
            <td class="auto-style10">
                <asp:Button ID="btnSave" runat="server" CssClass="admin-button" Text="Save" ValidationGroup="A" OnClick="btnSave_Click" />
            </td>
            <td class="auto-style9">
                <asp:Button ID="btnReset" runat="server" CssClass="admin-button" Text="Reset" ValidationGroup="B" OnClick="btnReset_Click" />
            </td>
            <td class="auto-style10"></td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td colspan="4">
                <asp:UpdatePanel ID="up" runat="server">
                    <ContentTemplate>
                        <asp:GridView ID="gvwSlider" runat="server" AutoGenerateColumns="False" Width="100%" PageSize="50" AllowPaging="True" OnPageIndexChanging="gvwSlider_PageIndexChanging">
                            <AlternatingRowStyle BackColor="#8DC73F" />
                            <Columns>
                                <asp:TemplateField HeaderText="SNo">
                                    <ItemTemplate>
                                        <%#Container.DataItemIndex+1 %>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("SliderID") %>' Visible="False"></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle Width="5%" HorizontalAlign="Center" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Slider1">
                                    <ItemTemplate>
                                        <table class="auto-style8">
                                            <tr>
                                                <td>
                                                    <asp:Image ID="img1" runat="server" Height="150px" Width="97%" ImageUrl='<%# Bind("Img1") %>' />
                                                </td>
                                            </tr>

                                            <tr>
                                                <td>
                                                    <asp:TextBox ID="txtGLink1" runat="server" Width="97%" Text='<%# Bind("ImgLink1") %>'></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" CssClass="validation" Display="Dynamic" ErrorMessage="Field must not be empty" SetFocusOnError="True" ValidationGroup="C" ControlToValidate="txtGLink1"></asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                        </table>
                                    </ItemTemplate>
                                    <ItemStyle Width="30%" HorizontalAlign="Center" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Slider2">
                                    <ItemTemplate>
                                        <table class="auto-style8">
                                            <tr>
                                                <td>
                                                    <asp:Image ID="img2" runat="server" Height="150px" Width="97%" ImageUrl='<%# Bind("Img2") %>' />
                                                </td>
                                            </tr>

                                            <tr>
                                                <td>
                                                    <asp:TextBox ID="txtGLink2" runat="server" Width="97%" Text='<%# Bind("ImgLink2") %>'></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" CssClass="validation" Display="Dynamic" ErrorMessage="Field must not be empty" SetFocusOnError="True" ValidationGroup="C" ControlToValidate="txtGLink2"></asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                        </table>
                                    </ItemTemplate>
                                    <ItemStyle Width="30%" HorizontalAlign="Center" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Slider3">
                                    <ItemTemplate>
                                        <table class="auto-style8">
                                            <tr>
                                                <td>
                                                    <asp:Image ID="img3" runat="server" Height="150px" Width="97%" ImageUrl='<%# Bind("Img3") %>' />
                                                </td>
                                            </tr>

                                            <tr>
                                                <td>
                                                    <asp:TextBox ID="txtGLink3" runat="server" Width="97%" Text='<%# Bind("ImgLink3") %>'></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" CssClass="validation" Display="Dynamic" ErrorMessage="Field must not be empty" SetFocusOnError="True" ValidationGroup="C" ControlToValidate="txtGLink3"></asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                        </table>
                                    </ItemTemplate>
                                    <ItemStyle Width="30%" HorizontalAlign="Center" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Actions">
                                    <ItemTemplate>
                                        <asp:ImageButton ID="btnGUpdate" runat="server" ImageUrl="../Images/OtherImages/save.png" Width="20px" Height="20px" ValidationGroup="C" OnClick="btnGUpdate_Click" />
                                        <asp:ImageButton ID="btnGDelete" runat="server" ImageUrl="../Images/OtherImages/delete.png" Width="20px" Height="20px" OnClick="btnGDelete_Click" />
                                    </ItemTemplate>
                                    <ItemStyle Width="5%" HorizontalAlign="Center" />
                                </asp:TemplateField>
                            </Columns>
                            <HeaderStyle BackColor="#8DC73F" ForeColor="White" Height="30px" />
                            <RowStyle BackColor="Silver" />
                        </asp:GridView>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>
</asp:Content>



