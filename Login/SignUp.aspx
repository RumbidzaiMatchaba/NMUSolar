<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SignUp.aspx.cs" Inherits="NMUSolar.Login.SignUp"  %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Sign Up</title>
     <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css"/>
    <link href="loginStyle.css" type="text/css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
      <div class="back-drop-signUp">
          <div class="nmmu-banner">
              <h2>Nelson Mandela University Solar SignUp</h2>
          </div>
          <div id="signup-form">
              <asp:Table runat="server">
                 <asp:TableRow>
                   <%--  Name--%>
                     <asp:TableCell>
                         <h3>Name</h3>
                     </asp:TableCell>
                     <asp:TableCell>
                         <asp:TextBox ID="txtname" runat="server"></asp:TextBox>
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                             ErrorMessage="Name is Required" ControlToValidate="txtname" ForeColor="Red" Display="None" Width="10px"></asp:RequiredFieldValidator>
                         <asp:ValidationSummary ID="ValidationSummary1" runat="server"  ShowMessageBox="true" ShowSummary="false"/>
                         
                     </asp:TableCell>
                 </asp:TableRow>
                 <%-- Surname--%>
                   <asp:TableRow>
                     <asp:TableCell>
                         <h3>Surname</h3>
                     </asp:TableCell>
                     <asp:TableCell>
                         <asp:TextBox ID="txtsurname" runat="server"></asp:TextBox>
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Surname is required" ForeColor="Red" ControlToValidate="txtsurname"  ></asp:RequiredFieldValidator>
                     </asp:TableCell>
                 </asp:TableRow>
                   <%-- EmailAddress--%>
                   <asp:TableRow>
                     <asp:TableCell>
                         <h3>EmailAddress</h3>
                     </asp:TableCell>
                     <asp:TableCell>
                         <asp:TextBox ID="txtemail" runat="server"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Enter correct email address format" ValidateRequestMode="Enabled" ViewStateMode="Enabled" SetFocusOnError="True" ControlToValidate="txtemail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                     </asp:TableCell>
                 </asp:TableRow>
                   <%-- UserRole--%>
                   <asp:TableRow>
                     <asp:TableCell>
                         <h3>UserRole</h3>
                     </asp:TableCell>
                     <asp:TableCell>
                         <asp:DropDownList ID="UserRole" runat="server">
                             <asp:ListItem Value="Administrator" >Administrator</asp:ListItem>
                             <asp:ListItem Selected="True"  Value="Assistant">Assistant</asp:ListItem>
                         </asp:DropDownList>
                     </asp:TableCell>
                 </asp:TableRow>
                   <%-- Password --%>
                   <asp:TableRow>
                     <asp:TableCell>
                         <h3>Password</h3>
                     </asp:TableCell>
                     <asp:TableCell>
                         <div class="container">
                       
                             <asp:TextBox runat="server" CssClass="Password" ID="firstPassword"> </asp:TextBox>
                         <i class="far fa-eye" id="togglePassword" ></i>
                             <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Password Required" ForeColor="Red" ControlToValidate="firstPassword"></asp:RequiredFieldValidator>
                         </div>
                        
                     </asp:TableCell>
                 </asp:TableRow>
                   <%-- Re-enter Password--%>
                   <asp:TableRow>
                     <asp:TableCell>
                         <h3>Re-enter Password</h3>
                     </asp:TableCell>
                     <asp:TableCell>
                         <div class="container">
                        
                             <asp:TextBox runat="server" CssClass="PPassword" ID="secondPassword"> </asp:TextBox>
                         <i class="far fa-eye" id="rePassword" ></i>
                          </div>
                         </asp:TableCell>
                 </asp:TableRow>
                  <asp:TableRow>
                      <%--Buttons--%>
                      <asp:TableCell>
                         
                  <asp:Button ID="btnSignup" CssClass="s-btns" runat="server" Text="SignUp" OnClick="signUpUser" OnClientClick="signUpUser" />
           
                      </asp:TableCell>
                      <asp:TableCell>
                           <asp:Button ID="btnCancel" CssClass="s-btns" runat="server" Text="Cancel" OnClick="cancelUser" OnClientClick="cancelUser"/>
                      </asp:TableCell>
                  </asp:TableRow>
                 <asp:TableRow>
                     <asp:TableCell> 
                         <asp:Label ID="Label1"  runat="server" Text=""></asp:Label>
                     </asp:TableCell>
                 </asp:TableRow>
              </asp:Table>

          </div>
         
      </div>
        <%--<div id="passwordModal">
            <div id="modal-content">
              <label id="lblconfirmPassword"></label>
            </div>


        </div>--%>
         
    </form>

    <script src="loginScript.js"></script>
</body>
</html>
