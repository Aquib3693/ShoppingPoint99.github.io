<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin.master" AutoEventWireup="true" CodeFile="HighLight.aspx.cs" Inherits="Admin_HighLight" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style8 {
            width: 100%;
        }
        .auto-style9 {
            height: 28px;
            font-weight: 700;
        }
        .auto-style10 {
            height: 23px;
        }
        .auto-style12 {
            width: 25%;
            height: 9px;
        }
        .auto-style13 {
            width: 25%;
            height: 25px;
        }
        .auto-style14 {
            width: 25%;
            height: 23px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="auto-style8">
        <tr>
            <td class="auto-style9" colspan="4">    <table class="auto-style8">
        <tr>
            <td style="font-size: x-large; font-weight: 700">HIGH LIGHT MASTER</td>
        </tr>
        </table>
            </td>
        </tr>
        <tr>
            <td class="auto-style10" style="color: #FF3300" colspan="4">*Fields are Mandatory</td>
        </tr>
        <tr>
            <td class="auto-style12"></td>
            <td class="auto-style12">&nbsp;</td>
            <td class="auto-style12">
                &nbsp;</td>
            <td class="auto-style12">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style12">Product Name</td>
            <td class="auto-style12">
                <asp:DropDownList ID="ddllist" runat="server" Width="100%" Height="37px">
                </asp:DropDownList>
            </td>
            <td class="auto-style12">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ForeColor="red" ValidationGroup="A" ControlToValidate="ddllist" ErrorMessage="Please select product" InitialValue="0" Display="Dynamic" SetFocusOnError="True"></asp:RequiredFieldValidator>
            </td>
            <td class="auto-style12">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style13">HighLight Point 1</td>
            <td class="auto-style13">
                <asp:TextBox ID="txthlp1" runat="server" CssClass="admin-textbox" Width="100%"></asp:TextBox>
            </td>
            <td class="auto-style13">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ForeColor="red" ControlToValidate="txthlp1" ValidationGroup="A" CssClass="validation" ErrorMessage=" Field must not be empty" Display="Dynamic" SetFocusOnError="True"></asp:RequiredFieldValidator></td>
            <td class="auto-style13"></td>
        </tr>
        <tr>
            <td class="auto-style14">HighLight Point 2</td>
            <td class="auto-style14">
                <asp:TextBox ID="txthlp2" runat="server" CssClass="admin-textbox" Width="100%"></asp:TextBox>
            </td>
            <td class="auto-style14">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ForeColor="red" ControlToValidate="txthlp2" ValidationGroup="A" CssClass="validation" ErrorMessage=" Field must not be empty" Display="Dynamic" SetFocusOnError="True"></asp:RequiredFieldValidator></td>
            <td class="auto-style14"></td>
        </tr>
        <tr>
            <td class="auto-style14">HighLight Point 3</td>
            <td style="width: 25%">
                <asp:TextBox ID="txthlp3" runat="server" CssClass="admin-textbox" Width="100%"></asp:TextBox>
            </td>
            <td style="width: 25%">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ForeColor="red" ControlToValidate="txthlp3" ValidationGroup="A" CssClass="validation" ErrorMessage=" Field must not be empty" Display="Dynamic" SetFocusOnError="True"></asp:RequiredFieldValidator>&nbsp;</td>
            <td style="width: 25%">&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 25%">HighLight Point 4</td>
            <td style="width: 25%">
                <asp:TextBox ID="txthlp4" runat="server" CssClass="admin-textbox" Width="100%"></asp:TextBox>
            </td>
            <td style="width: 25%">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ControlToValidate="txthlp4" runat="server" ForeColor="red" ValidationGroup="A" CssClass="validation" ErrorMessage=" Field must not be empty" Display="Dynamic" SetFocusOnError="True"></asp:RequiredFieldValidator>
            </td>
            <td style="width: 25%">&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 25%">HighLight Point 5</td>
            <td style="width: 25%">
                <asp:TextBox ID="txthlp5" runat="server" CssClass="admin-textbox" Width="100%"></asp:TextBox>
            </td>
            <td style="width: 25%">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txthlp5" ForeColor="red" CssClass="validation" ValidationGroup="A" ErrorMessage=" Field must not be empty" Display="Dynamic" SetFocusOnError="True"></asp:RequiredFieldValidator>
            </td>
            <td style="width: 25%">&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 25%">&nbsp;</td>
            <td style="width: 25%">&nbsp;</td>
            <td style="width: 25%">&nbsp;</td>
            <td style="width: 25%">&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 25%">&nbsp;</td>
            <td style="width: 25%">
                <asp:Button ID="btnSave" runat="server" CssClass="admin-button" Text="Save" ValidationGroup="A" OnClick="btnSave_Click"/>
            </td>
            <td style="width: 25%">
                <asp:Button ID="btnReset" runat="server" CssClass="admin-button" Text="Reset" OnClick="btnReset_Click"/>
            </td>
            <td style="width: 25%">&nbsp;</td>
        </tr>
        <tr>
            <td colspan="4">&nbsp;</td>
        </tr>
        <tr>
            <td colspan="4">

              
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False">
                    <AlternatingRowStyle BackColor="#8DC73F" />
                    <Columns>
                        <asp:TemplateField HeaderText="SNo">
                            <ItemTemplate>
                                <asp:Label ID="lblHID" runat="server" Text='<%# Bind("HighlightID") %>' Visible="false"></asp:Label>
                                <%#Container.DataItemIndex+1 %> 
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="ProductName">
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("ProductName") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Highlight1">
                            <ItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("H1") %>'></asp:TextBox>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Highlight2">
                            <ItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("H2") %>'></asp:TextBox>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Highlight3">
                            <ItemTemplate>
                                <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("H3") %>'></asp:TextBox>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Highlight4">
                            <ItemTemplate>
                                <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("H4") %>'></asp:TextBox>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Highlight5">
                            <ItemTemplate>
                                <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("H5") %>'></asp:TextBox>
                            </ItemTemplate>
                        </asp:TemplateField>
                      
                        <asp:TemplateField HeaderText="Actions">
                             <ItemTemplate>
                            <asp:ImageButton ID="btnGvwQtyUpdate" runat="server" ImageUrl="../Images/OtherImages/save.png" width="20px" Height="20px" OnClick="btnGvwQtyUpdate_Click"/>
                            <asp:ImageButton ID="btnGvwQtyDelete" runat="server" ImageUrl="../Images/OtherImages/delete.png" width="20px" Height="20px" OnClick="btnGvwQtyDelete_Click"/>
                        </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                <HeaderStyle BackColor="#8DC73F" ForeColor="White" Height="30px" />
                <RowStyle BackColor="Silver" />
                </asp:GridView>

              
            </td>
        </tr>
        <tr>
            <td style="width: 25%">&nbsp;</td>
            <td style="width: 25%">&nbsp;</td>
            <td style="width: 25%">&nbsp;</td>
            <td style="width: 25%">&nbsp;</td>
        </tr>
    </table>
</asp:Content>

