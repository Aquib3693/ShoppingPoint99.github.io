<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AdminLogin.aspx.cs" Inherits="Admin_AdminLogin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>AdminLogin</title>
    <link href="../CSS/MasterStyleSheet.css" rel="stylesheet" />
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 20%;
            height: 137px;
        }
        .auto-style3 {
            width: 45%;
            height: 137px;
            text-align: center;
        }
        .auto-style4 {
            width: 20%;
            height: 325px;
        }
        .auto-style5 {
            width: 45%;
            height: 325px;
        }
        .auto-style6 {
            width: 20%;
            height: 63px;
        }
        .auto-style7 {
            width: 45%;
            height: 63px;
        }
        .auto-style8 {
            height: 33px;
        }
        .auto-style9 {
            width: 30%;
            height: 137px;
        }
        .auto-style10 {
            width: 30%;
            height: 325px;
        }
        .auto-style11 {
            width: 30%;
            height: 63px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
  
        <table class="auto-style1">
            <tr>
                <td class="auto-style9">&nbsp;</td>
                <td class="auto-style3">
                    <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/OtherImages/shoplogo.jpg" />
                </td>
                <td class="auto-style2"></td>
            </tr>
            <tr>
                <td class="auto-style8" colspan="3" style="background-color: #8dc73f"></td>
            </tr>
            <tr>
                <td class="auto-style10"></td>
                <td class="auto-style5"  valign="top">
                    <table class="auto-style1">
                        <tr>
                            <td style="width: 30%">&nbsp;</td>
                            <td style="width: 70%">&nbsp;</td>
                        </tr>
                        <tr>
                            <td style="width: 30%">USER ID</td>
                            <td style="width: 70%">
                                <asp:TextBox ID="txtUserID" runat="server" autocomplete="off" CssClass="admin-textbox" placeholder="Enter User ID"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 30%">&nbsp;</td>
                            <td style="width: 70%">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtUserID" CssClass="validation" Display="Dynamic" ErrorMessage="Field must not be empty" SetFocusOnError="True" ValidationGroup="A"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 30%">PASSWORD</td>
                            <td style="width: 70%; margin-left: 40px;">
                                <asp:TextBox ID="txtPassword" runat="server" autocomplete="off" TextMode="Password" CssClass="admin-textbox" placeholder="Enter Password"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 30%">&nbsp;</td>
                            <td style="width: 70%">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPassword" CssClass="validation" Display="Dynamic" ErrorMessage="Field must not be empty" SetFocusOnError="True" ValidationGroup="A"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 30%">&nbsp;</td>
                            <td style="width: 70%">
                                <asp:Button ID="btnLogin" runat="server"  OnClick="btnLogin_Click" Text="Login"  ValidationGroup="A" CssClass="admin-button" />
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 30%">&nbsp;</td>
                            <td style="width: 70%">&nbsp;</td>
                        </tr>
                    </table>
                </td>
                <td class="auto-style4"></td>
            </tr>
            <tr>
                <td class="auto-style11"></td>
                <td class="auto-style7"></td>
                <td class="auto-style6"></td>
            </tr>
        </table>
  
    </form>
</body>
</html>
