<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="weatherData.aspx.cs" Inherits="NMUSolar.Stakeholders.weatherData" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Weather Data</title>
   <%--<link href="weatherStyle.css" rel="stylesheet" />--%>
</head>
<body>
    <form id="form1" runat="server">
        <asp:TextBox ID="txtCity" runat="server" Text="" />
<asp:Button Text="Get Weather Information" runat="server" OnClick="GetWeatherInfo" />

<table id="tblWeather" runat="server" border="0" cellpadding="0" cellspacing="0"
    visible="true">
    <tr>
        <th colspan="2">
            Weather Information
        </th>
    </tr>
    <tr>
        <td rowspan="3">
            <asp:Image ID="imgWeatherIcon" runat="server" />
        </td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="lblCity_Country" runat="server" />
            <asp:Image ID="imgCountryFlag" runat="server" />
            <asp:Label ID="lblDescription" runat="server" />
           
            <asp:Label ID="lblHumidity" runat="server" />
        </td>
    </tr>
    <tr>
        <td>
           
            <asp:Label ID="lblTempMin" runat="server" />
          
            <asp:Label ID="lblTempMax" runat="server" />
               
            <asp:Label ID="lblTempDay" runat="server" />
               
            <asp:Label ID="lblTempNight" runat="server" />
        </td>
    </tr>
</table>
    </form>
    <script src="../Stakeholders/weatherScript.js"></script>
    
</body>
</html>
