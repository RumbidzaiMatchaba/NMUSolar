<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Valuation.aspx.cs" Inherits="NMUSolar.Stakeholders.Valuation" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Valuation</title>
    <link href="stakeStylesheet.css" rel="stylesheet" />
     <link href="../Login/jquery-ui.css" rel="stylesheet" />
     <link href="../Scripts2/jquery-ui.css" rel="stylesheet" />
    <script src="../Scripts2/jquery.js"></script>
    <script src="../Scripts2/jquery-ui.js"></script>
    <script  type="text/javascript">

        function showValuationDay() {
            var div = document.querySelector("#dayValuationGraphSection");
            if (div.style.display !== "none") {
                div.style.display = "none";       
            }
            else {
                div.style.display = "block";
              
            }
        }

        function showValuationMonth() {
            var div = document.querySelector("#monthValuationGraphSection");
            if (div.style.display !== "none") {
                div.style.display = "none";
            }
            else {
                div.style.display = "block";

            }
        }
        $(document).ready(function () {
            $('#txtDate').datepicker({
                dateFormat: 'dd mm yy'
            });
            $('#txtDate').on("change", function () {
                var selected = $(this).val();
                $('#d').empty();
                $('#d').append(selected);
            });
            $('#ddlyearone').on("click", function () {
                var selObj = document.getElementById("ddlyearone");
                var text = selObj.options[selObj.selectedIndex].text;
                document.getElementById("lblyear").innerHTML = text;

            });
            $('#ddlmonthone').on("click", function () {
                var selObj = document.getElementById("ddlmonthone");
                var text = selObj.options[selObj.selectedIndex].text;
                document.getElementById("lblMonth").innerHTML = text;

            });
        });
       

        $(document).ready(function () {
            $('#txtmonth').datepicker();
            $('#txtmonth').on("change", function () {
                var selected = $(this).val();              
                var months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sept", "Oct", "Nov", "Dec"];
                var m = months[$('#txtmonth').datepicker('getDate').getMonth()];
                var y = $('#txtmonth').datepicker('getDate').getFullYear();
                $('#lblm').empty();
                $('#lblm').append(m,'   ', y);
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
            <section id="main-valuation">

             <%--   Day Valuation Selection--%>

            <section id="dayValuation">
                <h2>Select a date to view the solar yield produced and what would have been paid for Municipal/Eskom supply.
                    The selection will provide the accumulated solar yield produced from all solar sections.
                </h2>
                <div id="day-container">
                    <div id="dayheader">
                        <h2>Day Valuation</h2>

                    </div>
                  
                    <div id="ratepick">
                        <div id="lbl-Infor">
                            <h3>Current Municipal Rate : </h3>
                            <asp:Label ID="lbldayMunipalRate" runat="server"> shdj</asp:Label>
                        </div>
                      
                        <div id="datePicker">
                            <h3>Pick a day</h3>
                            <asp:TextBox ID="txtDate" runat="server" Text="" placeholder="Pick a day"></asp:TextBox>
                            
                        </div>
                    </div>
                      <div id="DayValuation-Data">
                      
                        <asp:Button ID="dyValuation"  runat="server" Text="View Day Valuation" OnClick="dyValuation_Click"/>
                    </div>
                    <div>
                        <table id="tdata">
                            <tr>
                                <th> Date:</th>
                                <td><span id="d"> </span></td>
                            </tr>
                            <tr>
                                <th>Total Yield (KW)</th>
                                <td> <asp:Label ID="lbltotalYield" runat="server"></asp:Label></td>
                            </tr>
                            <tr>
                                <th>Municipal Purchase Price(R)</th>
                                <td> <asp:Label ID="lblMUPrice" runat="server"></asp:Label></td>
                            </tr>
                             <tr>
                                <th>Tasol Purchase Price(R)</th>
                                <td> <asp:Label ID="lblTUPrice" runat="server"></asp:Label></td>
                            </tr>
                        </table>
                    </div>
                     <div id="DayValuation-Data">
                        <button  id="btn-valuation-day-graph" onclick="showValuationDay()" type="button">View Day Valuation Graph</button>
                       
                    </div>
                </div>
            </section>

                <div id="dayValuationGraphSection">
                    <div id="day-graph-info">
                       <div>
                         <div id="daycontainer" style="width: 900px; height: 500px">

                         </div>
                    </div>
                   
                </div>
                    </div>

                  <%-- END of  Day Valuation Selection--%>

                 <%-- Month Valuation Selection--%>
            <section id="monthValuation">
                 <div id="dayheader">
                        <h2>Month Valuation</h2>

                    </div>
                    <div id="ratepick">
                        <h3>Current Rate : <asp:Label runat="server" ID="lblmonthrate"></asp:Label></h3>
                          <div id="selection-one">
                                 <div id="datePicker">
                             <div id="datePicker2">
                            <h3>Pick a month</h3>   
                            <select id="ddlmonthone" runat="server" >
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
                           <select id="ddlyearone"  runat="server">
                                <option>2019</option>
                                <option>2020</option>
                                <option>2021</option>                               
                            </select>                                                               
                        </div>
                        </div>
                       
                </div>
                    </div>
                  <div id="MonthValuation-Data">
                      
                        <asp:Button ID="Button2"  runat="server" Text="View Month Valuation" OnClick="Button2_Click" />
                    </div>
                    <div>
                        <table id="tdata">
                            <tr>
                                <th> Date:</th>
                                <td><asp:Label runat="server" ID="lblMonth"> :</asp:Label> <asp:Label id="lblyear" runat="server"></asp:Label></td>
                            </tr>
                            <tr>
                                <th>Total Yield (KW)</th>
                                <td> <asp:Label ID="lblMonthTotalYield" runat="server"></asp:Label></td>
                            </tr>
                            <tr>
                                <th>Municipal Purchase Price(R)</th>
                                <td> <asp:Label ID="lblMonthMPP" runat="server"></asp:Label></td>
                            </tr>
                             <tr>
                                <th>Tasol Purchase Price(R)</th>
                                <td> <asp:Label ID="lblMonthTPP" runat="server"></asp:Label></td>
                            </tr>
                        </table>
                    </div>
                 <div id="MonthValuation-Data">
                        <button  id="btn-valuation-month-graph" onclick="showValuationMonth()" type="button">View Month Valuation Graph</button>
                       
                    </div>
            </section>
                 <div id="monthValuationGraphSection">
                    <div id="month-graph-info">
                       <div>
                         <div id="container" style="width: 900px; height: 500px">

                         </div>
                    </div>
                    </div>
                   
                </div>
                 <%-- END of Month Valuation Selection--%>


            <section id="yearValuation">
               <%-- place graph here from highcharts--%>
                <p>kdjksj</p>
                <h1>I AM HERE!!!!</h1>
            </section>
            
           </section>
        </div>
          <script src="../Highcharts/highcharts.js">  </script>
                
                        <script>
                            $("#btn-valuation-month-graph").on('click', function (e) {
                                alert("I have been clicked!");
                                var pData = [];
                                pData[0] = $("#ddlmonthone").val();
                                pData[1] = $("#ddlyearone").val();

                                var jsonData = JSON.stringify({ pData: pData });

                                $.ajax({
                                    type: "POST",
                                    url: '<%=Page.ResolveUrl("~/ReportsHighCharts.asmx/getSolarDataValuationMonth")%>',
                                    data: jsonData,
                                    contentType: "application/json; charset=utf-8",
                                    dataType: "json",
                                    success: OnSuccess_,
                                    error: OnErrorCall_
                                });

                                function OnSuccess_(response) {
                                    alert("I have been sucessful");
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

                                    drawMonthChart(jsonArray);
                                    alert("I have been sent the data");

                                }
                                function OnErrorCall_(response) {
                                    alert("Whoops something went wrong!");
                                }
                                e.preventDefault();
                            });

                            function drawMonthChart(seriesData) {
                                alert("i am now here");

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
                                            return "Plant Section:" + this.key+" Solar Yield:"+this.y;
                                        }

                                    },

                                    plotOptions: {
                                        column: {
                                            size: '100%',
                                            allowPointSelect: true,
                                            cursor: 'pointer',
                                            dataLabels: {
                                                enabled: true,
                                                format: '<b>{point.name}</b> ',
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
        <%--day valuation graph script starts here--%>
                     <script>
                         $("#btn-valuation-day-graph").on('click', function (e) {
                                                var pData = [];
                             pData[0] = $("#txtDate").val();

                                var jsonData = JSON.stringify({ pData: pData });

                                $.ajax({
                                    type: "POST",
                                    url: '<%=Page.ResolveUrl("~/ReportsHighCharts.asmx/getSolarDataValuationDay")%>',
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
                                alert("I am here day chart");
                                $('#daycontainer').highcharts({
                                    chart: {
                                        plotBackgroundColor: null,
                                        plotBorderWidth: null,
                                        plotShadow: true,
                                        type: 'line'
                                    },
                                    title: {
                                        text: 'Population percentage city wise'
                                    },
                                    xAxis: {
                                        labels: {
                                            formatter: function () {
                                                return this.val;
                                            }
                                        },
                                        type: 'category',
                                    },
                                    tooltip: {
                                        formatter: function () {
                                            console.log(this);
                                            return "<b>Plant Section:</b>" + this.key + "\nSolar Yield:" + this.y ;
                                        }

                                    },

                                    plotOptions: {
                                        line: {
                                            size: '100%',
                                            allowPointSelect: true,
                                            cursor: 'pointer',
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
                                        data: seriesData
                                    }]
                                });
                            }

                     </script>
    </form>
</body>
</html>
