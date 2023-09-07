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
                        <h1 class="mt-4">Tables</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item"><a href="index.html">Dashboard</a></li>
                            <li class="breadcrumb-item active">Tables</li>
                        </ol>
                        <div class="card mb-4">
                            <div class="card-body">
                                DataTables is a third party plugin that is used to generate the demo table below. For more information about DataTables, please visit the
                                <a target="_blank" href="https://datatables.net/">official DataTables documentation</a>
                                .
                            </div>
                        </div>
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                DataTable Example
                            </div>
                            <div class="card-body">
                                <table id="datatablesSimple">
                                    <thead>
                                        <tr>
                                            <th>Name</th>
                                            <th>Position</th>
                                            <th>Office</th>
                                            <th>Age</th>
                                            <th>Start date</th>
                                            <th>Salary</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>Name</th>
                                            <th>Position</th>
                                            <th>Office</th>
                                            <th>Age</th>
                                            <th>Start date</th>
                                            <th>Salary</th>
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                        <tr>
                                            <td>Tiger Nixon</td>
                                            <td>System Architect</td>
                                            <td>Edinburgh</td>
                                            <td>61</td>
                                            <td>2011/04/25</td>
                                            <td>$320,800</td>
                                        </tr>
                                      
                                    </tbody>
                                </table>
                                
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
	        function drawScoreDistributionChart(){
	        	let salesRevenue = ${salesRevenue};
				console.log(salesRevenue);
	        	
	        	let dataChart = [["월", "분포율", { role:"style" }, { role:"annotation" }]];
	        	for(let i = 1; i <= 12; i++){
	        		dataChart.push([i + "월", salesRevenue[i] / 10000, "#353535", salesRevenue[i] / 10000 + "만"]); // 위 형식에 알맞게 데이터 삽입
	        	}
	        	
	        	let data = google.visualization.arrayToDataTable(dataChart);
	        	let view = new google.visualization.DataView(data);
	        	let options = {
	        		width:1100,
					height:400, // 높이를 지정해주지 않으면 ticks로 지정한 레이블 중 일부 레이블이 잘린다.
	        		bar:{ groupWidth:"60%" }, // 그래프 너비(적당하게 조절 - 어중간하게 작으면 { role:"annotation" }으로 설정한 값이 통일되지 않고, 뒤죽박죽 출력됨)
	        		annotations:{ textStyle:{ fontSize:11 } },
	        		backgroundColor:"transparent",
	        		legend:"none", // 범례 제거
	        		enableInteractivity:false, // 마우스 이벤트 제거
	        		
	        		// 세로 축
	        		vAxis:{
						ticks:[50, 100, 150, 200, 250, 300], // 원하는 단위 값들을 배열로 지정
						format:'0만', // 레이블 형식을 'decimal'로 지정
	        			
	        			gridlines:{ color:"#d8d8d8" }, // 주 눈금선
	        			minorGridlines:{ color:"none" } // 보조 눈금선
	        		},
	        		
	        		// 가로 축
	        		hAxis:{
	        			textStyle:{ bold:true }
	        		}
	        	};
	        	
	        	let chart = new google.visualization.ColumnChart(document.getElementById("monthlyChart"));
	        	chart.draw(view, options);
	        }
			
        	$(function(){
        		google.charts.load("current", { "packages":["corechart"] }); // Google Chart를 사용하기 위한 준비
        		google.charts.setOnLoadCallback(drawScoreDistributionChart); // 차트 생성
        	});
        </script>
    </body>
</html>