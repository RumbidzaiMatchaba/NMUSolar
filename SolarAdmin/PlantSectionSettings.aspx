<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PlantSectionSettings.aspx.cs" Inherits="NMUSolar.SolarAdmin.PlantSection_Settings" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Plant Section Settings</title>
     <link href="../Login/loginStyle.css" rel="stylesheet" />
    <link href="../SweetAlert2/src/sweetalert2.scss"  rel="stylesheet"/>
   
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
                <asp:MenuItem Text="Plant Section Settings" Value="Edit" NavigateUrl="~/SolarAdmin/PlantSectionSettings.aspx"></asp:MenuItem>
                <asp:MenuItem Text="Valuation Settings" Value="View" NavigateUrl="~/SolarAdmin/ValuationSettings.aspx"></asp:MenuItem>
                <asp:MenuItem Text="Logout" Value="View" NavigateUrl="~/Login/Login.aspx"></asp:MenuItem>
                   </Items>
        </asp:Menu>
            </div>
             </div>

        <div class="content">
            <h1>Plant Settings</h1>

            <div id="content-table">
                <asp:GridView ID="PlantSectionData" runat="server" CssClass="data-grid" AutoGenerateColumns="False" DataKeys="PlantSection"
              
                   HeaderStyle-CssClass="data-header" RowStyle-CssClass="data-row" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal"  AllowSorting="True">
                   <AlternatingRowStyle BackColor="#F7F7F7" />
                    <%--gridview styling--%>
                  
                   <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />

                <HeaderStyle CssClass="data-header" BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7"></HeaderStyle>

                   <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />

                <RowStyle CssClass="data-row" BackColor="#E7E7FF" ForeColor="#4A3C8C"></RowStyle>
                   <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                   <SortedAscendingCellStyle BackColor="#F4F4FD" />
                   <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
                   <SortedDescendingCellStyle BackColor="#D8D8F0" />
                   <SortedDescendingHeaderStyle BackColor="#3E3277" />
                        <Columns>
                       <asp:TemplateField HeaderText="Plant Name">
                           <ItemTemplate>
                               <span><%# Eval("PlantName") %></span>                            
                           </ItemTemplate>
                       </asp:TemplateField>
                       <asp:TemplateField HeaderText="Azimuth">
                           <ItemTemplate>
                               <span><%# Eval("Azimuth") %></span>                            
                           </ItemTemplate>
                       </asp:TemplateField>
                       <asp:TemplateField HeaderText="Inclination">
                           <ItemTemplate>
                               <span><%# Eval("Inclination") %></span>                            
                           </ItemTemplate>
                       </asp:TemplateField>
                       <asp:TemplateField HeaderText="Invertor">
                           <ItemTemplate>
                               <span><%# Eval("Invertor") %></span>                            
                           </ItemTemplate>
                       </asp:TemplateField>
                       <asp:TemplateField HeaderText="PanelQuantity">
                           <ItemTemplate>
                               <span><%# Eval("PanelQuantity") %></span>                            
                           </ItemTemplate>
                       </asp:TemplateField>
                       
                      
                   </Columns>
               </asp:GridView>
                 <asp:Button ID="Button1"  runat="server" Text="Add Plant Section" OnClick="addPlantSection" OnClientClick="addPlantSection" />

            </div>


            </div>

             </div>
    </form>
</body>
</html>
