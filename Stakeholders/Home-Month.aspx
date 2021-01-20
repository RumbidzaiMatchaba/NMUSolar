<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home-Month.aspx.cs" Inherits="NMUSolar.Stakeholders.Home_Month" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Home-Month</title>
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
            $('#ddlmonth').on("click", function () {
                var selObj = document.getElementById("ddlmonth");
                var text = selObj.options[selObj.selectedIndex].text;
                document.getElementById("c").innerHTML = text;

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
                <asp:MenuItem  Text="Home" Value="File" Selected="true" NavigateUrl="~/Stakeholders/Home.aspx" ></asp:MenuItem>
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
                         <asp:Button ID="btnmonth" runat="server" Text="MONTH"   BackColor="Yellow"/>
                         <asp:Button ID="btnyear" runat="server" Text="YEAR" OnClick="btnyear_Click"/>
                    </div>
                    <div id="chartdate-selection">
                        <h2>Month Solar Yield</h2>
                        <div id="datePicker">
                             <div id="datePicker2">
                            <h3>Pick a month</h3>   
                            <select id="ddlmonth" >
                                <option>January</option>
                                <option>February</option>
                                <option>March</option> 
                                 <option>April</option>
                                <option>May</option>
                                <option>June</option>       
                                 <option>July</option>
                                <option>August</option>
                                <option>September</option>  
                                <option>October</option>
                                <option>November</option>
                                <option>December</option>       
                             
                            </select>  
                        </div>
                         <div id="datePicker1">
                            <h3>Pick a year</h3>                            
                           <select id="ddlyear" >
                                <option>2019</option>
                                <option>2020</option>
                                <option>2021</option>                               
                            </select>                                                               
                        </div>
                        </div>
                       
                         <div id="generateChart">
                             <button id="btnCreatePieChart">Generate Chart </button>
                        </div>
                   <div id="charts">
                        <div>
                         <div id="container" style="width: 900px; height: 500px">

                         </div>
                    </div>
                     
                        <h3>Detailed Solar Readings for  <span id="c"></span> <span id="d"></span> </h3>
                    </div>
                </div>
            </section>
           
        </div>
        <script src="../Highcharts/highcharts.js"> </script>
                        
         <script src="../Highcharts/modules/drilldown.src.js"></script>
          <script src="../Highcharts/modules/drilldown.js"> </script>
                     
                        <script>
                            $("#btnCreatePieChart").on('click', function (e) {
                                var pData = [];
                                pData[0] = $("#ddlmonth").val();
                                pData[1] = $("#ddlyear").val();

                                var jsonData = JSON.stringify({ pData: pData });

                                $.ajax({
                                    type: "POST",
                                    url: '<%=Page.ResolveUrl("~/HighCharts.asmx/getSolarDataMonth")%>',
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
                                        obj.name = item.PlantName;
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
                                        type: 'column',
                                        cursor: 'pointer',
                                        events: {
                                           click: function (e) {
                                                console.log(e);
                                                if (!e.seriesOptions) {
                                                    var chart = this;
                                                    console.log(chart)

                                                    chart.showLoading('Loading Solar Yield by Month ...');


                                                    var dataArr = CallChildMonth(e.point.options.name, $("#ddlmonth").val() ,$("#ddlyear-one").val());
                                                    chart.setTitle({
                                                        text: 'Solar Yield as per month'
                                                    });
                                                    data = {
                                                        name: e.point.options.name,
                                                        data: dataArr
                                                    },
                                                        setTimeout(function () {
                                                            chart.hideLoading();
                                                            chart.addSeriesAsDrilldown(e.point, data);
                                                        }, 1000);
                                                }
                                            }
                                        },
                                    },
                                    title: {
                                        text: 'Population percentage city wise'
                                    },
                                    xAxis: {
                                        labels: {
                                            formatter: function () {
                                                return this.key;
                                            }
                                        },
                                        type: 'category',
                                    },
                                    tooltip: {
                                        formatter: function () {
                                            return "<b>SolarPlant:  </b>" + this.key +" <b>Solar Yield</b>" +this.y;
                                        }

                                    },
                                   
                                    plotOptions: {
                                        column: {
                                            point: {
                                                event: {
                                                    click: function () {
                                                        alert(point.name);
                                                    }
                                                },
                                                size: '100%',
                                                allowPointSelect: true,
                                                series: {
                                                    cursor: 'pointer',
                                                    allowPointSelect: true,

                                                    kdNow: true,
                                                    borderWidth: 0,
                                                    dataLabels: {
                                                        enabled: true
                                                    }
                                                },
                                                cursor: 'pointer',
                                                dataLabels: {
                                                    enabled: true,
                                                    format: '<b>{point.name}</b>',
                                                    style: {
                                                        color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
                                                    }
                                                }
                                            }
                                        }
                                    },
                                    series: [{
                                        name: "Plant Section",
                                        colorByPoint: true,
                                        data: seriesData
                                        }],
                                    drilldown: {
                                            series: []
                                        }
                                });
                            }
                            function CallChildMonth(name, month, year) {

                                var pData = [];
                                pData[0] = name;
                                pData[1] = month;
                                pData[2] = year;


                                var jsonData = JSON.stringify({ pData: pData });
                                var Drilldowndata = [];
                                $.ajax({
                                    type: "POST",
                                    contentType: "application/json; charset=utf-8",
                                    url: '<%=Page.ResolveUrl("~/ReportsHighCharts.asmx/getDrillDownSolarMonth")%>',
                                    data: jsonData,
                                    dataType: "json",
                                    success: function (Result) {
                                        Result = Result.d;
                                        for (var i in Result) {
                                            var serie = { name: Result[i].yieldDate, y: Result[i].solarYield };
                                            Drilldowndata.push(serie);
                                        }
                                    },
                                    error: function (Result) {
                                        alert("Error");
                                    }
                                });
                                return Drilldowndata;
                            }  

                        </script>
    </form>
</body>
</html>
