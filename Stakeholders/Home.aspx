<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="NMUSolar.Stakeholders.Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Home</title>
    <link href="stakeStylesheet.css" rel="stylesheet" />
     <link href="../Login/jquery-ui.css" rel="stylesheet" />
     <link href="../Scripts2/jquery-ui.css" rel="stylesheet" />
    <script src="../Scripts/jquery-3.5.1.min.js"></script>
    <script src="../Scripts2/jquery-ui.js"></script>
    <script  type="text/javascript">
        $(document).ready(function () {
            $('#txtDate').datepicker({
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
                        <asp:Button ID="btnday" runat="server" Text="DAY" OnClick="btnday_Click"  BackColor="Yellow"/>
                         <asp:Button ID="btnweek" runat="server" Text="WEEK" OnClick="btnweek_Click"/>
                         <asp:Button ID="btnmonth" runat="server" Text="MONTH" OnClick="btnmonth_Click" />
                         <asp:Button ID="btnyear" runat="server" Text="YEAR" OnClick="btnyear_Click"/>
                       
                    </div>
                    <div id="chartdate-selection">
                        <h2>Day Solar Yield</h2>
                        <div id="datePicker">
                            <h3>Pick a date</h3>
                            <asp:TextBox ID="txtDate" runat="server" Text=""></asp:TextBox>
                            
                        </div>
                    </div>
                    <div id="generateChart">
                             <button id="btnCreatePieChart">Generate Chart </button>
                        </div>
                    <div id="charts">
                                <div>
                                <div id="container" style="width: 900px; height: 500px"></div>
                            </div> 
                          <h3>Detailed Solar Readings at : <span id="d"></span></h3>
                    </div>
                    <div>
                        <table>
                            <tr>
                                <td>
                                   <%-- //gridview--%>
                                    <asp:GridView ID="gvLineChart" runat="server"></asp:GridView>
                                </td>
                                <td>
                                    <div id="MyLineChart">

                                    </div>
                                </td>
                            </tr>
                        </table>
                         <script src="../Highcharts/highcharts.js">
                             
                         </script>
                     
                        <script>
                            $("#btnCreatePieChart").on('click', function (e) {
                                var pData = [];
                                pData[0] = $("#txtDate").val();

                                var jsonData = JSON.stringify({ pData: pData });

                                $.ajax({
                                    type: "POST",
                                    url: '<%=Page.ResolveUrl("~/HighCharts.asmx/getSolarDataDay")%>',
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
                                        var i = [item.PlantSectionID, item.solarYield];
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
                                        type: 'column'
                                    },
                                    title: {
                                        text: 'Population percentage city wise'
                                    },
                                   
                                    tooltip: {
                                        formatter: function () {
                                            console.log(this);
                                            return this.key +"blah:"+this.y;
                                        }
                                       
                                    },
                                    plotOptions: {
                                        column: {
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
                       
                    </div>
                   
                </div>
            </section>
           
        </div>
    </form>
</body>
</html>
