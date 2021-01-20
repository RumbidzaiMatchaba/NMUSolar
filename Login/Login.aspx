<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="NMUSolar.Login.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
    <link href="loginStyle.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
             <div class="back-drop">
            <div class="nmmu-banner">
                <h2>Nelson Mandela University Solar</h2>
            </div>
            <div id="login-form">
                <h2>Login</h2>
                <section class="login">
                   <div id="lables">
                       <asp:Label ID="Label1" runat="server" Text="EmailAddress"></asp:Label>                    
                       <asp:Label ID="Label2" runat="server" Text="Password"></asp:Label>
                   </div>
                   <div id="text"> 
                       <asp:TextBox ID="txtEmail" placeholder="EmailAddress" runat="server"></asp:TextBox>
                       <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ForeColor="Red" runat="server" ErrorMessage="EmailAddress Required" ControlToValidate="txtEmail"></asp:RequiredFieldValidator>                  
                   <asp:TextBox ID="txtPassword" placeholder="Password" runat="server"></asp:TextBox>
                   <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ForeColor="Red" ErrorMessage="Password Required" ControlToValidate="txtPassword"></asp:RequiredFieldValidator>
                  </div>
                 </section>
                <div id="login-buttons">        
                     <asp:Button ID="Button1" CssClass="btn-login" runat="server" Text="Login" OnClick="loginUser" OnClientClick="loginUser" />                                       
                     <asp:Button runat="server" CssClass="btn-login" Text="Cancel" ID="logCancel" OnClick="logCancel_Click"/>
                  </div>
                <div id="lblmsg">
                      <asp:Label ID="Label3" runat="server" Text=""></asp:Label>
                </div>
                <div class="signup-buttons">
                    <h3>Do not have an account?</h3>   
                    <asp:Button runat="server" OnClick="signUp" text="Sign-Up" ID="btnsignUp" OnClientClick="signUp"/>
                </div>

            </div>
        </div>
    </form>
  <%--  <script src="loginScript.js"></script>--%>
</body>
</html>
