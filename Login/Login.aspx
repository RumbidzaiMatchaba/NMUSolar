<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="NMUSolar.Login.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
    <link href="loginStyle.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <div id="nmu-banner">
            <h1>Nelson Mandela University Solar</h1>
        </div>
        <div class="login-section">
            <h1>Login</h1>
            <table>
                <tr>
                   <%-- EmailAddresss--%>
                    <td>  <asp:Label ID="Label1" runat="server" Cssclass="lbl-login" Text="Email Address"></asp:Label></td>
                    <td>
                       
                        <asp:TextBox ID="txtemailAddress" runat="server"></asp:TextBox>
                       <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                               ControlToValidate="txtemailAddress" ErrorMessage="EmailAddress is required"
                              SetFocusOnError="True" ForeColor="red" ></asp:RequiredFieldValidator>--%>

                         <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
                                     ErrorMessage="Invalid Email" ControlToValidate="txtemailAddress"
                                     SetFocusOnError="True"
                                     ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">
                        </asp:RegularExpressionValidator>
                        </td>
                </tr>
                <tr>
                    <%--Password--%>
                    <td>
                        <asp:Label ID="Label2" runat="server" Cssclass="lbl-login" Text="Password"></asp:Label>
                    </td>
                    <td>

                        <asp:TextBox ID="txtPassword" runat="server"></asp:TextBox>
                       <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="txtPassword" runat="server" ErrorMessage="Password Required"></asp:RequiredFieldValidator>--%>
                    </td>
                </tr>
            </table>
            <div id="top-login-buttons">
                <div>
                    <button class="login-btn"> Login</button>
                </div>
               <div><button class="login-btn"> Cancel</button></div>
                
            </div>
           <div id="line"></div>
            <div id="sign-up-button">
                <h2>
                    Do not have an account?
                </h2>
           
                <asp:Button ID="Button1"  CssClass="login-btn" runat="server" OnClick="signUp" Text="SignUp" />
               
            </div>
        </div>
    </form>
</body>
</html>
