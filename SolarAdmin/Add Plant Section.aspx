<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Add Plant Section.aspx.cs" Inherits="NMUSolar.SolarAdmin.Add_Plant_Section" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Add Plant Section</title>
    
     <script  src="../SweetAlert2/dist/sweetalert2.min.js" type="module"></script>
     <script  src="../SweetAlert2/dist/sweetalert2.all.min.js" type="module"></script>
     <script src="../Scripts/solar.js"></script>
      <link href="../SweetAlert2/dist/sweetalert2.css"  rel="stylesheet"/>
     <link href="../Login/loginStyle.css" rel="stylesheet" />
    
    
</head>
<body>
    <form id="form1" runat="server">
        <div id="content-main">
        <div class="main-main">
            <div class="main-image">
                <asp:Image ID="Image1" runat="server"  src="../Images/LogoMandela.png" />
            </div>
          
            <div class="main-nav">
                 <asp:Menu ID="Menu1" runat="server" StaticDisplayLevels="3" Orientation="Horizontal">
              <StaticMenuItemStyle CssClass="menu-style" />
                    <%-- <StaticHoverStyle CssClass="menu-hover" />--%>
                    <%-- <StaticHoverStyle BackColor="Yellow" ForeColor="Black" />--%>
                     <Items>
           <asp:MenuItem  Text="User Settings" Value="File" NavigateUrl="~/SolarAdmin/SupposedMasterFile.aspx"></asp:MenuItem>
                <asp:MenuItem Text="Plant Section Settings" Value="Edit" NavigateUrl="~/SolarAdmin/PlantSectionSettings.aspx"></asp:MenuItem>
                <asp:MenuItem Text="Valuation Settings" Value="View" NavigateUrl="~/SolarAdmin/ValuationSettings.aspx"></asp:MenuItem>
                <asp:MenuItem Text="Logout" Value="View" NavigateUrl="~/Login/Login.aspx"></asp:MenuItem>
                   </Items>
        </asp:Menu>
            </div>
             </div>

        <div class="content">
            <h1>Add Plant Section</h1>
            <div id="content-table">
                <div id="signup-form">
              <asp:Table runat="server">
                 <asp:TableRow>
                   <%--  PlantSection--%>
                     <asp:TableCell>
                         <h3>Plant Section</h3>
                     </asp:TableCell>
                     <asp:TableCell>
                         <asp:TextBox ID="txtplantsection" runat="server"></asp:TextBox>
                     </asp:TableCell>
                 </asp:TableRow>
                 <%-- Azimuth--%>
                   <asp:TableRow>
                     <asp:TableCell>
                         <h3>Azimuth</h3>
                     </asp:TableCell>
                     <asp:TableCell>
                         <asp:TextBox ID="txtazimuth" runat="server"></asp:TextBox>
                     </asp:TableCell>
                 </asp:TableRow>
                   <%-- Inclination--%>
                   <asp:TableRow>
                     <asp:TableCell>
                         <h3>Inclination</h3>
                     </asp:TableCell>
                     <asp:TableCell>
                         <asp:TextBox ID="txtinclination" runat="server"></asp:TextBox>
                        
                     </asp:TableCell>
                 </asp:TableRow>
                   <%-- Invertor--%>
                   <asp:TableRow>
                     <asp:TableCell>
                         <h3>Invertor</h3>
                     </asp:TableCell>
                     <asp:TableCell>
                         <asp:TextBox ID="txtinvertor" runat="server"></asp:TextBox>
                     </asp:TableCell>
                 </asp:TableRow>
                   <%-- Quantity --%>
                   <asp:TableRow>
                     <asp:TableCell>
                         <h3>Quantity</h3>
                     </asp:TableCell>
                     <asp:TableCell>                                                
                             <asp:TextBox runat="server"  ID="txtquantity"> </asp:TextBox>                                      
                     </asp:TableCell>
                 </asp:TableRow>
                  <asp:TableRow>
                      <%--Buttons--%>
                      <asp:TableCell>
                         
                  <asp:Button ID="btnSignup" CssClass="s-btns" runat="server" Text="Add"  OnClick="addPlant" OnClientClick="addPlant" />
           
                      </asp:TableCell>
                      <asp:TableCell>
                           <asp:Button ID="btnCancel" CssClass="s-btns" runat="server" OnClick="cancelPlantData" OnClientClick="cancelPlantData" Text="Cancel" />
                      </asp:TableCell>
                  </asp:TableRow>
                 <asp:TableRow>
                     <asp:TableCell> 
                         <asp:Label ID="lblplantConfirm"  runat="server" Text=""></asp:Label>
                     </asp:TableCell>
                 </asp:TableRow>
                   <asp:TableRow>
                     <asp:TableCell> 
                         
                     </asp:TableCell>
                       <asp:TableCell>
                           <asp:Button ID="btnBacktoPSettings" CssClass="s-btns" runat="server" OnClick="backtoPlantSettings" OnClientClick="backtoPlantSettings" Text="Back to Plant Settings" />
                       </asp:TableCell>
                 </asp:TableRow>
              </asp:Table>

          </div>

            </div>


            </div>

             </div>
    
      
         </form>
</body>
</html>
