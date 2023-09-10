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
                                
                                <div id="monthlyChart">
                                	
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