﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home-Year.aspx.cs" Inherits="NMUSolar.Stakeholders.Home_Year" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Home-Year</title>
     <link href="stakeStylesheet.css" rel="stylesheet" />
     <link href="../Login/jquery-ui.css" rel="stylesheet" />
     <link href="../Scripts2/jquery-ui.css" rel="stylesheet" />
    <script src="../Scripts2/jquery.js"></script>
    <script src="../Scripts2/jquery-ui.js"></script>
    <script  type="text/javascript">
        $(document).ready(function () {
            $('#ddlyear').on("click", function () {
                var selObj = document.getElementById("ddlyear");
                var text = selObj.options[selObj.selectedIndex].text;
                document.getElementById("d").innerHTML = text;
            });         
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
       <div id="main-content">
            <section id="nav-section">
                 <div id="logo-image">
                     <img src="../Images/LogoMandela.png" />
                     
            </div>
                 <asp:Menu ID="Menu1" runat="server" StaticDisplayLevels="3" Orientation="Horizontal">
              <StaticMenuItemStyle CssClass="menu-style" />
                     <StaticHoverStyle CssClass="menu-hover" />
                    
                     <Items>

                <asp:MenuItem  Text="Home" Value="File" Selected="true" NavigateUrl="~/Stakeholders/Home.aspx" >               
                </asp:MenuItem>
                <asp:MenuItem Text="Reports" Value="Edit" NavigateUrl="~/Stakeholders/Reports.aspx" ></asp:MenuItem>
                <asp:MenuItem Text="Valuation" Value="File" NavigateUrl="~/Stakeholders/Valuation.aspx"></asp:MenuItem>              
                   </Items>
        </asp:Menu>
            </section>
            <section id="chart-data">
                <div id="chart-infor">
                    <h2>Select the buttons below to view the solar yield based on day, week, month and year</h2>
                    <div id="btn-charts">
                        <asp:Button ID="btnday" runat="server" Text="DAY" OnClick="btnday_Click" />
                         <asp:Button ID="btnweek" runat="server" Text="WEEK" OnClick="btnweek_Click"/>
                         <asp:Button ID="btnmonth" runat="server" Text="MONTH" OnClick="btnmonth_Click" />
                         <asp:Button ID="btnyear" runat="server" Text="YEAR" BackColor="Yellow" />
                    </div>
                    <div id="chartdate-selection">
                        <h2>Year Solar Yield</h2>
                        <div id="datePicker">
                            <h3>Pick a year</h3>                            
                           <select id="ddlyear" >
                                <option>2019</option>
                                <option>2020</option>
                                <option>2021</option>
                                
                            </select>
                   
                  
                        </div>
                        <div id="generateChart">
                             <button id="btnCreatePieChart">Generate Chart </button>
                        </div>
                    <div id="charts">
                     <div>
                         <div id="container" style="width: 900px; height: 500px">

                         </div>
                    </div> 
                        <h3>Detailed Solar Readings at <span id="d"></span> </h3>
                        <asp:Label ID="lblyear" runat="server"></asp:Label>
                    </div>
                </div>

                </div>
            </section>
           
        </div>
         <script src="../Highcharts/highcharts.js">
                             
                         </script>
                     
                        <script>
                            $("#btnCreatePieChart").on('click', function (e) {
                                var pData = [];
                                pData[0] = $("#ddlyear").val();

                                var jsonData = JSON.stringify({ pData: pData });

                                $.ajax({
                                    type: "POST",
                                    url: '<%=Page.ResolveUrl("~/HighCharts.asmx/getSolarDataYear")%>',
                                    data: jsonData,
                                    contentType: "application/json; charset=utf-8",
                                    dataType: "json",
                                    success: OnSuccess_,
                                    error: OnErrorCall_
                                });

                                function OnSuccess_(response) {
                                    var aData = response.d;
                                    var arr = []

                                    $.map(aData, function (item, index) {
                                        var i = [item.PlantName, item.solarYield];
                                        var obj = {};
                                        obj.name = item.PlantSectionID;
                                        obj.y = item.solarYield;
                                        arr.push(obj);
                                    });
                                    var myJsonString = JSON.stringify(arr);
                                    var jsonArray = JSON.parse(JSON.stringify(arr));

                                    drawPieChart(jsonArray);

                                }
                                function OnErrorCall_(response) {
                                    alert("Whoops something went wrong!");
                                }
                                e.preventDefault();
                            });

                            function drawPieChart(seriesData) {

                                $('#container').highcharts({
                                    chart: {
                                        plotBackgroundColor: null,
                                        plotBorderWidth: null,
                                        plotShadow: true,
                                        type: 'column'
                                    },
                                    title: {
                                        text: 'Population percentage city wise'
                                    },
                                    tooltip: {
                                        formatter: function () {
                                            return +seriesData.x;
                                        }

                                    },
                                    plotOptions: {
                                        pie: {
                                            allowPointSelect: true,
                                            cursor: 'pointer',
                                            dataLabels: {
                                                enabled: true,
                                                format: '<b>{point.name}</b>: {point.percentage:.1f} %',
                                                style: {
                                                    color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
                                                }
                                            }
                                        }
                                    },
                                    series: [{
                                        name: "Plant Section",
                                        colorByPoint: true,
                                       
                                        data: seriesData
                                    }]
                                });
                            }

                        </script>
                       
    </form>
</body>
</html>
