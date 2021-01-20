<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ChangeAdministrator.aspx.cs" Inherits="NMUSolar.SolarAdmin.ChangeAdministrator" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
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
            <h1>Change Administrator</h1>
            <p> To change the administator, assign administrator role to an existing user. Only the current administrator can asign administrator role. 
            </p>
            
           <div id="content-table">
             

                <asp:GridView ID="GridView1" runat="server" CssClass="data-grid" AutoGenerateColumns="false" DataKeys="Users"
                   OnRowCommand="GridView1_RowCommand"
                OnRowDeleting="GridView1_RowDeleting"
                   HeaderStyle-CssClass="data-header" RowStyle-CssClass="data-row" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
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
                       <asp:TemplateField HeaderText="UserID">
                           <ItemTemplate>
                               <span><%# Eval("UserID") %></span>                            
                           </ItemTemplate>
                       </asp:TemplateField>
                       <asp:TemplateField HeaderText="Name">
                           <ItemTemplate>
                               <span><%# Eval("Name") %></span>                            
                           </ItemTemplate>
                       </asp:TemplateField>
                       <asp:TemplateField HeaderText="Surname">
                           <ItemTemplate>
                               <span><%# Eval("Surname") %></span>                            
                           </ItemTemplate>
                       </asp:TemplateField>
                       <asp:TemplateField HeaderText="Password">
                           <ItemTemplate>
                               <span><%# Eval("Password") %></span>                            
                           </ItemTemplate>
                       </asp:TemplateField>
                       <asp:TemplateField HeaderText="EmailAddress">
                           <ItemTemplate>
                               <span><%# Eval("EmailAddress") %></span>                            
                           </ItemTemplate>
                       </asp:TemplateField>
                       <asp:TemplateField HeaderText="UserRole">
                           <ItemTemplate>
                               <span><%# Eval("UserRole") %></span>                            
                           </ItemTemplate>
                       </asp:TemplateField>
                       <asp:TemplateField >
                           <ItemTemplate>
                             <asp:Button ID="Button2" runat="server" Text="Remove" CommandName="removeUser" ToolTip="RemoveUser" />                          
                           </ItemTemplate>
                       </asp:TemplateField>
                   </Columns>
               </asp:GridView>
             <asp:Button ID="btnuserSettings" Text="Back to User Settings" runat="server" OnClick="btnuserSettings_Click" />
               
           </div>
        </div>
           
          </div>  
    </form>
</body>
</html>
