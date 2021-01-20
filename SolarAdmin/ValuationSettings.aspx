<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ValuationSettings.aspx.cs" Inherits="NMUSolar.SolarAdmin.ValuationSettings" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Valuation Settings</title>
     <link href="../Login/loginStyle.css" rel="stylesheet" />
     <link href="../Login/jquery-ui.css" rel="stylesheet" />
     <link href="../Scripts2/jquery-ui.css" rel="stylesheet" />
    <script src="../Scripts2/jquery.js"></script>
    <script src="../Scripts2/jquery-ui.js"></script>
    <script src="scripts/jquery-ui.js"></script>
   <script  type="text/javascript">
       $(document).ready(function () {
           $('#txtDatePicker').datepicker({
               changeMonth: true,
               changeYear: true,
               dateFormat: 'MM yy',

               onClose: function () {
                   var iMonth = $("#ui-datepicker-div .ui-datepicker-month :selected").val();
                   var iYear = $("#ui-datepicker-div .ui-datepicker-year :selected").val();
                   $(this).datepicker('setDate', new Date(iYear, iMonth, 1));
               },

               beforeShow: function () {
                   if ((selDate = $(this).val()).length > 0) {
                       iYear = selDate.substring(selDate.length - 4, selDate.length);
                       iMonth = jQuery.inArray(selDate.substring(0, selDate.length - 5), $(this).datepicker('option', 'monthNames'));
                       $(this).datepicker('option', 'defaultDate', new Date(iYear, iMonth, 1));
                       $(this).datepicker('setDate', new Date(iYear, iMonth, 1));
                   }
               }
           });
       });
   </script>
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
                     <StaticHoverStyle CssClass="menu-hover" />
                     
                     <Items>
               <asp:MenuItem  Text="User Settings" Value="File" NavigateUrl="~/SolarAdmin/SupposedMasterFile.aspx"></asp:MenuItem>
                <asp:MenuItem Text="Plant Section Settings" Value="Edit" NavigateUrl="~/SolarAdmin/PlantSection Settings.aspx.cs"></asp:MenuItem>
                <asp:MenuItem Text="Valuation Settings" Value="View" NavigateUrl="~/SolarAdmin/ValuationSettings.aspx"></asp:MenuItem>
                <asp:MenuItem Text="Logout" Value="View" NavigateUrl="~/Login/Login.aspx"></asp:MenuItem>
                   </Items>
        </asp:Menu>
            </div>
             </div>
       
        <div class="content">
            <h1>Valuation Settings</h1>
          <%--  update section--%>
            <div id="container-one">
                <asp:Table runat="server" ID="u">
                    <asp:TableRow >
                       
                         <asp:TableCell><h2>Update Unit Price</h2> </asp:TableCell>
                        <asp:TableCell Width="50px"> <asp:Label runat="server"></asp:Label></asp:TableCell>
                         <asp:TableCell> <asp:TextBox runat="server"></asp:TextBox></asp:TableCell>
                        <asp:TableCell>  <asp:Button ID="Button1" runat="server" Text="Update" /> </asp:TableCell> 
                           
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell> <asp:Label runat="server"> *Only the Administrator can update the valuation details</asp:Label></asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow Height="50px"></asp:TableRow>
                    <asp:TableRow>
                         <asp:TableCell><h2>Update Municipal Unit Price</h2> </asp:TableCell>
                        <asp:TableCell Width="20px"> <asp:Label runat="server"></asp:Label></asp:TableCell>
                         <asp:TableCell> <asp:TextBox runat="server"></asp:TextBox></asp:TableCell>
                        <asp:TableCell>  <asp:Button ID="btnUpdate" runat="server" Text="Update" /> </asp:TableCell> 
                    </asp:TableRow>
                     <asp:TableRow>
                        <asp:TableCell> <asp:Label runat="server"> *Only the Administrator can update the valuation details</asp:Label></asp:TableCell>
                    </asp:TableRow>
                </asp:Table>
            </div>
            <%--Viewing valuation details --%>
            <div id="container-two">
                <div id="valLabels">
                    <h2> Select a month to view and compare the Tasol Unit Price and the Municipal Unit price on the month selected</h2>

                <div id="date-picker">
                    <h1>Pick a month</h1>
                   <p><input  id="txtDatePicker" type="text" value="now"/></p>
                </div>
                </div>
                
                <div id="valuation-section">
                    <table>
                        <tr>
                            <th>Date(Month)</th>
                            <th> Produced(KW)</th>
                            <th>Tasol Unit Price(R)</th>
                            <th>Purchase Price (R)</th>
                            <th> Municipal Unit Price (R)</th>
                            <th>Municipal Purchase Price(R)</th>
                        </tr>
                        <tr>
                            <td><asp:Label runat="server" ID="solarDate"></asp:Label></td>
                             <td><asp:Label runat="server" ID="solarProduced"></asp:Label></td>
                             <td><asp:Label runat="server" ID="solarTasolUP"></asp:Label></td>
                             <td><asp:Label runat="server" ID="solarTasolPP"></asp:Label></td>
                             <td><asp:Label runat="server" ID="solarMunicipalUP"></asp:Label></td>
                            <td><asp:Label runat="server" ID="solarMunicipalPP"></asp:Label></td>
                        </tr>
                    </table>
                </div>
            </div>

            </div>

           </div>
             
    </form>
   

    
<%--<script src="scripts/jquery-1.11.3.min.js"></script>  --%>

  </body>
</html>
