<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Tables - SB Admin</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
        <link href="/resources/css/admin/styles.css" rel="stylesheet" />
        <link href="/resources/css/admin/salesRevenue.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    </head>
    <body class="sb-nav-fixed">
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <!-- Navbar Brand-->
            <a class="navbar-brand ps-3" href="main">AdminHome</a>
            
            
        </nav>
        <div id="layoutSidenav">
            <div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                    <div class="sb-sidenav-menu">
                        <div class="nav">
                            <a class="nav-link" href="salesRevenue">
                                <div class="sb-nav-link-icon"><i class="fas fa-chart-area"></i></div>
                                매출
                            </a>
                            <a class="nav-link" href="memberManagement">
                                <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                회원관리
                            </a>
                            <a class="nav-link" href="/product/add">
                                <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                상품등록
                            </a>

                        </div>
                        <div class="sb-sidenav-footer">
                            <div class="small">Logged in as:</div>
                            ${member.id}

                        </div>
                    </nav>
                </div>
                <div id="layoutSidenav_content">
                    <main>
                        <div class="container-fluid px-4">
                           <h2 class="mt-4" style="font-weight:bold; margin-bottom:20px;">매출 관리</h2>
                        <div class="card mb-4">
                            <div class="card-body">
								술담화 서비스의 2023년도 월별 매출 현황 기록표입니다.
                            </div>
                        </div>
                            <div class="card mb-4">
                                <div class="card-header">
                                    <i class="fas fa-table me-1"></i>
                                    매출
                                </div>
                                <div class="card-body">
                                    <select name="year" id="year" data-year="${year}">
                                        <option value="2023" id="2023"> 2023년

                                        <option value="2022" id="2022"> 2022년

                                        <option value="2021" id="2021"> 2021년
                                    </select>
                                    <select name="month2" id="month2" data-month="${month2}">
                                        <option value="1" id="1"> 1월

                                        <option value="2" id="2"> 2월

                                        <option value="3" id="3"> 3월
                                        <option value="4" id="4"> 4월

                                        <option value="5" id="5"> 5월

                                        <option value="6" id="6"> 6월
                                        <option value="7" id="7"> 7월

                                        <option value="8" id="8"> 8월

                                        <option value="9" id="9"> 9월
                                        <option value="10" id="10"> 10월

                                        <option value="11" id="11"> 11월

                                        <option value="12" id="12"> 12월
                                    </select>
                                    <button type="button" id="dailySalesBtn">Click</button>
                                    <div id="a">
                                        <c:if test="${dailyList==1}">
                                            <table id="datatablesSimple">
                                                <thead>
                                                    <tr>
                                                        <th>년(Year)</th>
                                                        <th>월(Month)</th>
                                                        <th>일(Day)</th>
                                                        <th>매출</th>
                                                    </tr>
                                                </thead>
                                                <tfoot>
                                                    <tr>
                                                        <th>년(Year)</th>
                                                        <th>월(Month)</th>
                                                        <th>일(Day)</th>
                                                        <th>매출</th>
                                                    </tr>
                                                </tfoot>
                                                <tbody>
                                                    <c:forEach items="${dailySales}" var="dailySales" varStatus="i">
                                                        <tr>
                                                            <td>${dailySales.year}</td>
                                                            <td>${dailySales.month2}</td>
                                                            <td>${dailySales.day}</td>
                                                            <td class="sales" id="sales${i.index}">
                                                                ${dailySales.salesRevenue}</td>

                                                        </tr>
                                                    </c:forEach>
                                                </tbody>
                                            </table>
                                        </c:if>
                                        <c:if test="${dailyList==0}">
                                            <p>선택한 날짜의 매출이 없습니다.</p>
                                        </c:if>
                                    </div>
                                    <div id="monthlyChartWrap">
                                        <!-- <img src=""> -->
                                        <div>
                                            <p>매출 현황</p>
                                            <p>이번년도 월별 매출 현황(단위 : 만원)</p>
                                        </div>
                                        <div id="monthlyChart">

                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </main>
                    <footer class="py-4 bg-light mt-auto">
                        <div class="container-fluid px-4">
                            <div class="d-flex align-items-center justify-content-between small">
                                <div class="text-muted">Copyright &copy; Your Website 2023</div>
                                <div>
                                    <a href="#">Privacy Policy</a>
                                    &middot;
                                    <a href="#">Terms &amp; Conditions</a>
                                </div>
                            </div>
                        </div>
                    </footer>
                </div>
            </div>

            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
            <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
            <script src="/resources/js/table/datatables-simple-demo.js"></script>

            <script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
            <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
            <script type="text/javascript">

                //일별매출
                for (let i = 0; i < $(".sales").length; i++) {
                    $("#sales" + i).text('$' + Number($("#sales" + i).text()).toLocaleString());
                }

                $("#" + $("#year").attr("data-year")).prop("selected", true)
                $("#" + $("#month2").attr("data-month")).prop("selected", true)


                $("#dailySalesBtn").click(function () {
                    let year = $("#year option:selected").val();
                    let month = $("#month2 option:selected").val();
                    console.log(year);
                    console.log(month);
                    $.ajax({
                        type: "get",
                        url: "/admin/salesRevenue?year=" + year + "&month2=" + month,
                        dataType: 'html',
                        success: function (data) {
                            $("#a").html($(data).find("#a").html());
                            for (let i = 0; i < $(".sales").length; i++) {
                                $("#sales" + i).text('$' + Number($("#sales" + i).text()).toLocaleString());
                            }
                        }
                    })
                })
                ///////////////////////////////////////////////////////////////

                function drawScoreDistributionChart(){
	        	let salesRevenue = ${salesRevenue};
	        	
	        	let dataChart = [["월", "매출", { role:"style" }, { role:"annotation" }]];
	        	for(let i = 1; i <= 12; i++){
	        		dataChart.push([i + "월", salesRevenue[i] / 10000, "#353535", salesRevenue[i] / 10000 + "만"]);
	        	}
	        	
	        	let data = google.visualization.arrayToDataTable(dataChart);
	        	let view = new google.visualization.DataView(data);
	        	let options = {
	        		width:1100,
					height:400,
	        		bar:{ groupWidth:"65%" },
	        		annotations:{ textStyle:{ fontSize:11 } },
	        		backgroundColor:"transparent",
	        		legend:"none",
	        		
	        		hAxis:{
	        			title:"이번년도 월별 매출 현황",
	        			titleTextStyle:{ italic:false, fontSize:13, bold:true },
	        			textStyle:{ bold:false }
	        		},
	        		
	        		vAxis:{
						ticks:[50, 100, 150, 200, 250, 300],
						format:'0만',
	        			
	        			gridlines:{ color:"#d8d8d8" },
	        			minorGridlines:{ color:"none" }
	        		}
	        	};
	        	
	        	let chart = new google.visualization.ColumnChart(document.getElementById("monthlyChart"));
	        	chart.draw(view, options);
	        }
			
        	$(function(){
        		google.charts.load("current", { "packages":["corechart"] });
        		google.charts.setOnLoadCallback(drawScoreDistributionChart);
        	});
        </script>
    </body>
</html>

