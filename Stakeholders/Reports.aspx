<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Reports.aspx.cs" Inherits="NMUSolar.Stakeholders.Reports" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Reports</title>
    <link href="stakeStylesheet.css" rel="stylesheet" />
   
    <link href="../Login/jquery-ui.css" rel="stylesheet" />
     <link href="../SweetAlert2/dist/sweetalert2.css" rel="stylesheet" />
    
    <link href="../Scripts2/jquery-ui.css" rel="stylesheet" />
    <script src="../Scripts2/jquery.js"></script>
    <script src="../Scripts2/jquery-ui.js"></script>
    <script  type="text/javascript">
       
        function showhideDay() {
          

            var div = document.getElementById("daySelectionDates");
            if (div.style.display !== "none") {
                div.style.display = "none";
                document.getElementById("btnmonthSelection").disabled = false;
                document.getElementById("btnmonthSelection").style.backgroundColor = "white";
                document.getElementById("btnmonthSelection").style.borderColor = "gold";
                document.getElementById("btnyearSelection").disabled = false;
                document.getElementById("btnyearSelection").style.backgroundColor = "white";
                document.getElementById("btnyearSelection").style.borderColor = "gold";
               
            }
            else {
                div.style.display = "block";
                document.getElementById("btnmonthSelection").disabled = true;
                document.getElementById("btnmonthSelection").style.backgroundColor = "lightgrey";
                document.getElementById("btnmonthSelection").style.borderColor = "black";
                document.getElementById("btnyearSelection").disabled = true;
                document.getElementById("btnyearSelection").style.backgroundColor = "lightgrey";
                document.getElementById("btnyearSelection").style.borderColor = "black";
            }
        }  
        function showhideYear() {
            var div = document.getElementById("yearSelectionDates");
            if (div.style.display !== "none") {
                div.style.display = "none";
                document.getElementById("btnmonthSelection").disabled = false;
                document.getElementById("btnmonthSelection").style.backgroundColor = "white";
                document.getElementById("btnmonthSelection").style.borderColor = "gold";
                document.getElementById("btndaySelection").disabled = false;
                document.getElementById("btndaySelection").style.backgroundColor = "white";
                document.getElementById("btndaySelection").style.borderColor = "gold";

            }
            else {
                div.style.display = "block";
                document.getElementById("btnmonthSelection").disabled = true;
                document.getElementById("btnmonthSelection").style.backgroundColor = "lightgrey";
                document.getElementById("btnmonthSelection").style.borderColor = "black";
                document.getElementById("btndaySelection").disabled = true;
                document.getElementById("btndaySelection").style.backgroundColor = "lightgrey";
                document.getElementById("btndaySelection").style.borderColor = "black";
            }
        }  
        function showhideMonth() {
            var div = document.getElementById("monthSelectionDates");
            if (div.style.display !== "none") {
                div.style.display = "none";
                document.getElementById("btndaySelection").disabled = false;
                document.getElementById("btndaySelection").style.backgroundColor = "white";
                document.getElementById("btndaySelection").style.borderColor = "gold";

                document.getElementById("btnyearSelection").disabled = false;
                document.getElementById("btnyearSelection").style.backgroundColor = "white";
                document.getElementById("btnyearSelection").style.borderColor = "gold";
              
            }
            else {
                div.style.display = "block";
                document.getElementById("btndaySelection").disabled = true;
                document.getElementById("btndaySelection").style.backgroundColor = "lightgrey";
                document.getElementById("btndaySelection").style.borderColor = "black";
                document.getElementById("btnyearSelection").disabled = true;
                document.getElementById("btnyearSelection").style.backgroundColor = "lightgrey";
                document.getElementById("btnyearSelection").style.borderColor = "black";
            }
        } 

        $(document).ready(function () {
            $('#txtDate').datepicker({
                dateFormat: 'dd mm yy'

            });

            $('#txtDate2').datepicker({
                dateFormat: 'dd mm yy'

            });


            $('#txtDate').on("change", function () {
                var selected = $(this).val();
                $('#d').empty();
                $('#d').append(selected);
            });
        });
       
    </script>
</head>
<body>
     <form id="form1" runat="server" onsubmit="false">
        <div id="main-content">
            <section id="nav-section">
                 <div id="logo-image">
                     <img src="../Images/LogoMandela.png" />
                     
            </div>
                 <asp:Menu ID="Menu1" runat="server" StaticDisplayLevels="3" Orientation="Horizontal">
              <StaticMenuItemStyle CssClass="menu-style" />
                     <StaticHoverStyle CssClass="menu-hover" />
                     <Items>
                <asp:MenuItem  Text="Home" Value="File" Selected="true" NavigateUrl="~/Stakeholders/Home.aspx"  ></asp:MenuItem>
                <asp:MenuItem Text="Reports" Value="Edit" NavigateUrl="~/Stakeholders/Reports.aspx" ></asp:MenuItem>
                <asp:MenuItem Text="Valuation" Value="File" NavigateUrl="~/Stakeholders/Valuation.aspx"></asp:MenuItem>              
                   </Items>
        </asp:Menu>
            </section>

              <%-- Day Solar Selection--%>
            <section id="date-selection">
                <h2 style="font-family:Calibri">Select Report</h2>
                <h3>Select a report to view solar yield comparisons based to selected dates</h3>
                <div id="daySection">
                    <button id="btndaySelection" onclick="showhideDay()" type="button" >Select Day Report</button>
                    <div id="daySelectionDates">
                        <section id="dDates"> 
                        <div id="selection-one">
                        <div id="datePicker">
                            <h3>Pick a date</h3>
                            <asp:TextBox ID="txtDate" runat="server" Text=""></asp:TextBox>                           
                        </div>
                            </div>
                        <div id="selection-two">
                        <div id="datePicker">
                            <h3>Pick a date</h3>
                            <asp:TextBox ID="txtDate2" runat="server" Text=""></asp:TextBox>                           
                        </div>
                            </div>

                            </section> 
                          <div id="generateChart">
                             <button id="btnCreateDayReportChart">Generate Chart </button>
                        </div>
                    </div>
                </div>
              <%--  End of Day Solar Selection--%>


               <%-- Month Solar Selection--%>
                 <div id="monthSection">
                    <button id="btnmonthSelection" onclick="showhideMonth()" type="button" >Select Month Report</button>
                    <div id="monthSelectionDates">
                        <section id="mDates"> 
                            <div id="selection-one">
                                 <div id="datePicker">
                             <div id="datePicker2">
                            <h3>Pick a month</h3>   
                            <select id="ddlmonth-one" >
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
                           <select id="ddlyear-one" >
                                <option>2019</option>
                                <option>2020</option>
                                <option>2021</option>                               
                            </select>                                                               
                        </div>
                        </div>
                       
                </div>
                         <div id="selection-two">
                                 <div id="datePicker">
                             <div id="datePicker2">
                            <h3>Pick a month</h3>   
                            <select id="ddlmonth-two" >
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
                           <select id="ddlyear-two" >
                                <option>2019</option>
                                <option>2020</option>
                                <option>2021</option>                               
                            </select>                                                               
                        </div>
                        </div>
                    </div>

                        </section>
                       
                         <div id="generateChart">
                             <button id="btnCreatePieChartMonth">Generate Chart </button>
                        </div>
                        </div>
                    
                 </div>
                        <div id="yearSection">
                            
                    <button id="btnyearSelection" onclick="showhideYear()" type="button" >Select Year Report</button>
                    <div id="yearSelectionDates">
                       <section id="yDates"> 
                     <div id="selection-one">
                          <div id="datePicker">
                            <h3>Pick a year</h3>                            
                           <select id="ddlyear" >
                                
                                <option>2020</option>
                                <option>2021</option>                               
                            </select>                                   
                        </div>
                     </div>
                             <div id="selection-two">
                          <div id="datePicker">
                            <h3>Pick a year</h3>                            
                           <select id="ddlyear" >
                               
                                <option>2020</option>
                                <option>2021</option>                               
                            </select>                                   
                        </div>
                     </div>
                       </section>
                          <div id="generateChart">
                             <button id="btnCreatePieChart">Generate Chart </button>
                        </div>
                    </div>
                </div>
                              
            </section>
             <section id="graph-reports">
                 <h2 style="font-family:Calibri">Select Graph Report</h2>
                <h3>The graph shows the accumulated amount of solar yield based on the dates selected</h3>
                 <div>
                         <div id="container" style="width: 900px; height: 500px">

                         </div>
                     </div>
           </section>
           
        </div>
          <script src="../Highcharts/highcharts.js"></script>
         <script src="../Highcharts/modules/drilldown.js"> </script>
         <script src="../SweetAlert2/dist/sweetalert2.js"> </script>
        <script src="../SweetAlert2/dist/sweetalert2.min.js"> </script>
        
           <script src="../Highcharts/modules/drilldown.src.js"></script>
                    <%-- Getting Month Data--%>
                        <script>
                            $("#btnCreatePieChartMonth").on('click', function (e) {
                                alert("Pie Shit");
                                var pData = [];
                                
                                pData[0] = $("#ddlmonth-one").val();
                                pData[1] = $("#ddlyear-one").val();
                                pData[2] = $("#ddlmonth-two").val();
                                pData[3] = $("#ddlyear-two").val();

                                var jsonData = JSON.stringify({ pData: pData });

                                $.ajax({
                                    type: "POST",
                                    url: '<%=Page.ResolveUrl("~/ReportsHighCharts.asmx/getSolarDataReportMonth")%>',
                                    data: jsonData,
                                    contentType: "application/json; charset=utf-8",
                                    dataType: "json",
                                    success: OnSuccess_,
                                    error: OnErrorCall_
                                });

                                function OnSuccess_(response) {
                                    var aData = response.d;
                                    var arr = [];          

                                    for (var i in aData)
                                    {
                                        var series = {
                                            name: aData[i].dateName, y: aData[i].solarYield, drilldown: aData[i].drilldown
                                        };
                                        arr.push(series);
                                       

                                     }
                                   
                                    var myJsonString = JSON.stringify(arr);
                                    var jsonArray = JSON.parse(JSON.stringify(arr));

                                    drawPieChart(jsonArray);

                                }
                                function OnErrorCall_(response) {
                                    Swal.fire(
                                        'Unavailable data!',
                                        'No data for selected dates yet, try other dates!',
                                        'error'
                                    )
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
                                            drilldown: function (e) {
                                            
                                                if (!e.seriesOptions) {
                                                    var chart = this;
                                                    console.log(chart)
                                                 
                                                    chart.showLoading('Loading Solar Yield by Month ...');


                                                    var dataArr = CallChildMonth(e.point.options.name, $("#ddlyear-one").val());
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
                                        }

                                    },
                                    title: {
                                        text: 'Population percentage city wise'
                                    },
                                    tooltip: {
                                        pointFormat: '{point.name}: <b>{point.y}</b>',
                                        valueSuffix: ' KW',
                                    },                                       
                                     plotOptions: {
                                            column: {
                                                point: {
                                                    event: {
                                                        click: function () {
                                                            alert(point.name);
                                                        }
                                                    }
                                                },
                                                size: '80%',
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
                                                dataLabels: {
                                                    enabled: true,
                                                    format: '<b>{point.name}</b>',
                                                    style: {
                                                        color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
                                                    }
                                                }
                                            }
                                        },
                                        series: [{
                                            name: "Plant Section",
                                            colorByPoint: true,
                                            allowPointSelect: true,
                                            data: seriesData,
                                            event: {
                                                click: function () {
                                                    console.log(this);
                                                }

                                            },
                                        }],
                                        drilldown: {
                                            series: []
                                        }
                                    
                                });
                            }

                            function CallChildMonth(name, year) {

                                var pData = [];
                                pData[0] = name;
                                pData[1] = year;
                               

                                var jsonData = JSON.stringify({ pData: pData });
                                var Drilldowndata = [];
                                $.ajax({
                                    type: "POST",
                                    contentType: "application/json; charset=utf-8",
                                    url: '<%=Page.ResolveUrl("~/ReportsHighCharts.asmx/getSolarDataMonth")%>',
                                    data: jsonData,
                                    dataType: "json",
                                    success: function (Result) {
                                        Result = Result.d;
                                        for (var i in Result) {
                                            var serie = { name: Result[i].PlantName, y: Result[i].solarYield };
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

                     <%--End of getting Month Data--%>

                   <%-- Getting Day Data--%>
              <script>
                  $("#btnCreateDayReportChart").on('click', function (e) {
                      alert("Pie Shit");
                      var pData = [];

                      pData[0] = $("#txtDate").val();
                      pData[1] = $("#txtDate2").val();
                     

                      var jsonData = JSON.stringify({ pData: pData });

                      $.ajax({
                                      type: "POST",
                                      url: '<%=Page.ResolveUrl("~/ReportsHighCharts.asmx/getSolarDataReportDay")%>',
                                     data: jsonData,
                                    contentType: "application/json; charset=utf-8",
                                    dataType: "json",
                                    success: OnSuccess_,
                                    error: OnErrorCall_
                                });

                                function OnSuccess_(response) {
                                    var aData = response.d;
                                    var arr = [];

                                    for (var i in aData) {
                                        var series = {
                                            name: aData[i].dateName, y: aData[i].solarYield, drilldown: aData[i].drilldown
                                        };
                                        arr.push(series);


                                    }

                                    var myJsonString = JSON.stringify(arr);
                                    var jsonArray = JSON.parse(JSON.stringify(arr));

                                    drawDayReportChart(jsonArray);

                                }
                                function OnErrorCall_(response) {
                                    Swal.fire(
                                        'Unavailable data!',
                                        'No data for selected dates yet, try other dates!',
                                        'error'
                                    )
                                }
                                e.preventDefault();
                            });

                  function drawDayReportChart(seriesDataDay) {

                      $('#container').highcharts({
                          chart: {
                              plotBackgroundColor: null,
                              plotBorderWidth: null,
                              plotShadow: true,
                              type: 'column',
                              cursor: 'pointer',
                              events: {
                                  drilldown: function (e) {
                                      console.log(e);
                                      console.log(e.point.options.name);



                                      if (!e.seriesOptions) {
                                          var chart = this;
                                          console.log(chart)

                                          chart.showLoading('Loading Solar Yield by Day ...');


                                          var dataArr = CallChild(e.point.options.name);
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
                              }

                          },
                          title: {
                              text: 'Population percentage city wise'
                          },
                          tooltip: {
                              pointFormat: '{point.name}: <b>{point.y}</b>',
                              valueSuffix: ' KW',
                          },
                          plotOptions: {
                              column: {
                                  point: {
                                      event: {
                                          click: function () {
                                              alert(point.name);
                                          }
                                      }
                                  },
                                  size: '80%',
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
                                  dataLabels: {
                                      enabled: true,
                                      format: '<b>{point.name}</b>',
                                      style: {
                                          color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
                                      }
                                  }
                              }
                          },
                          series: [{
                              name: "Plant Section",
                              colorByPoint: true,
                              allowPointSelect: true,
                              data: seriesDataDay,
                              event: {
                                  click: function () {
                                      console.log(this);
                                  }

                              },
                          }],
                          drilldown: {
                              series: []
                          }

                      });
                  }

                  function CallChild(name) {

                      var pData = [];
                      pData[0] = name;
                     


                      var jsonData = JSON.stringify({ pData: pData });
                      var Drilldowndata = [];
                      $.ajax({
                          type: "POST",
                          contentType: "application/json; charset=utf-8",
                          url: '<%=Page.ResolveUrl("~/ReportsHighCharts.asmx/getSolarDataDayDrilldown")%>',
                                    data: jsonData,
                                    dataType: "json",
                                    success: function (Result) {
                                        Result = Result.d;
                                        for (var i in Result) {
                                            var serie = { name: Result[i].PlantName, y: Result[i].solarYield };
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
