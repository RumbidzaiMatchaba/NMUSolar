<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UploadFile.aspx.cs" Inherits="NMUSolar.SolarAdmin.UploadFile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Upload Solar Data</title>
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
                 <asp:MenuItem Text="UpLoadFile" Value="View" NavigateUrl="~/SolarAdmin/UploadFile.aspx"></asp:MenuItem>
                <asp:MenuItem Text="Logout" Value="View" NavigateUrl="~/Login/Login.aspx"></asp:MenuItem>
                   </Items>
        </asp:Menu>
            </div>
             </div>
            <section id="solar-info-dataUpload">
            <div id="displaySolarData">
                <div id="dataSelection">
                    <h4>Select Plant Section to add Solar data to : </h4>
                    <asp:DropDownList runat="server" ID="solarPlants" CssClass="dropstyle" Width="150px" Font-Names="calibri" Font-Size="15px" OnSelectedIndexChanged="solarPlants_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                </div>
                <div id="Sdata">
                    <table id="sdatatable" >
                        <tr>
                            <td> <asp:Label runat="server" Text="Plant Section:"></asp:Label></td>
                            <td><asp:Label runat="server" ID="lblplantSection"></asp:Label></td> 
                        </tr>
                        <tr>
                            <td> <asp:Label runat="server" Text="Azimuth:"></asp:Label></td>
                            <td><asp:Label runat="server" ID="lblAzimuth"></asp:Label></td> 
                        </tr>
                        <tr>
                            <td> <asp:Label runat="server" Text="Inclination:"></asp:Label></td>
                            <td><asp:Label runat="server" ID="lblInclination"></asp:Label></td> 
                        </tr>
                        <tr>
                            <td> <asp:Label runat="server" Text="Invertor:"></asp:Label></td>
                            <td><asp:Label runat="server" ID="lblInvertor"></asp:Label></td> 
                        </tr>
                        <tr>
                            <td> <asp:Label runat="server" Text="Panel Quantity:"></asp:Label></td>
                            <td><asp:Label runat="server" ID="lblQuantity"></asp:Label></td> 
                        </tr>
                     
                    </table>
                </div>
            </div>
            <div id="upload-data">
                <div id="data-section">
                    <h3> Upload Data for :</h3> 
                    <asp:Label runat="server" ID="lblplant"></asp:Label>
                </div>
                <div id="upload-section">
                 <asp:FileUpload ID="Fileupload" runat="server"/>
                <asp:Button runat="server" Text="Upload File" ID="btnUpload" OnClick="btnUpload_Click"/>
                </div>
               <asp:Label ID="lblconfirm" runat="server"></asp:Label>
            </div>
                </section>
            </div>
    </form>
</body>
</html>
