<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SignUp.aspx.cs" Inherits="NMUSolar.Login.SignUp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Sign Up</title>
    <link href="loginStyle.css" type="text/css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
       <div id="nmu-banner">
            <h1>Nelson Mandela University Solar</h1>
        </div>
        <div id="sign-up">
            
            <div id="sign-up-section">
                <h1>Sign Up</h1>
                <table>
                   <%-- name--%>
                    <tr>                        
                    <td>  <asp:Label ID="Label1" runat="server" Text="Name" Cssclass="lbl-login"></asp:Label></td>
                    <td>
                        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox> </td>
                        
                    </tr>
                     <%-- Surname--%>
                    <tr>
                         <td>  <asp:Label ID="Label2" runat="server" Text="Surname" Cssclass="lbl-login"></asp:Label></td>
                    <td>
                        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox> </td>
                        
                    </tr>
                     <%-- Email Address--%>
                    <tr>
                        <td>  <asp:Label ID="Label3" runat="server" Text="Email Address" Cssclass="lbl-login"></asp:Label></td>
                    <td>
                        <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox> </td>
                        
                    </tr>
                     <%-- UserRole--%>
                    <tr>
                        <td>  <asp:Label ID="Label4" runat="server" Text="User Role" Cssclass="lbl-login"></asp:Label>

                        </td>
                    <td> <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox></td>
                        
                    </tr>
                     <%-- Password--%>
                    <tr>
                        <td>  <asp:Label ID="Label5" runat="server" Text="Password" Cssclass="lbl-login"></asp:Label></td>
                    <td>
                        <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox> </td>
                        
                    </tr>
                     <%-- Re-enter Password--%>
                    <tr>
                        <td>  <asp:Label ID="Label6" runat="server" Text="Re-enter Password" Cssclass="lbl-login"></asp:Label></td>
                    <td><asp:TextBox ID="TextBox6" runat="server"></asp:TextBox> </td>
                        
                    </tr>
                </table>
                <div id="signUp-section">
                    <asp:Button ID="Button1"  CssClass="login-btn" runat="server"  Text="Sign Up" />
                    <asp:Button ID="Button2"  CssClass="login-btn" runat="server"  Text="Cancel" />
                </div>
                
            </div>
        </div>
    </form>
</body>
</html>
