<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="apple-touch-icon" sizes="76x76"
	href="assets/img/apple-icon.png">
<link rel="icon" type="image/png" href="assets/img/favicon.png">
<title>MinnanoPOS by MANEKINEKO@SCIT36A</title>
<!--     Fonts and icons     -->
<link href="https://use.fontawesome.com/releases/v5.0.6/css/all.css"
	rel="stylesheet">
<!-- Nucleo Icons -->
<link href="assets/css/nucleo-icons.css" rel="stylesheet" />
<!-- CSS Files -->
<link href="assets/css/black-dashboard.css?v=1.0.0" rel="stylesheet" />
<!-- CSS Just for demo purpose, don't include it in your project -->
<style type="text/css">
</style>
</head>

<body class="white-content">
	<div class="wrapper">
		<div class="sidebar" data="blue">
			<div class="sidebar-wrapper">
				<div class="logo">
					<a href="javascript:void(0)" class="simple-text logo-normal">
						MP </a>
				</div>
				<ul class="nav">
					<li><a href="posMain"> <i
							class="tim-icons icon-money-coins" title="포스 / Enter POS"></i>
					</a> <br> <br></li>
					<li><a href="#"> <i
							class="tim-icons icon-settings-gear-63" title="설정 / settings"></i>
							<!-- <i class="material-icons">settings</i> -->
					</a> <br> <br></li>
					<li><a href="#"> <i class="tim-icons icon-chat-33"
							title="커뮤니티 / community"></i>
					</a> <br> <br></li>
					<li><a href="#"> <i class="tim-icons icon-chart-pie-36"
							title="보고서 / reports"></i>
					</a> <br> <br> <br> <br> <br></li>
					<li><a href="#"> <i class="tim-icons icon-button-power"
							title="로그아웃 / logout" aria-label="logout"></i> <!-- <i class="material-icons">power_settings_new</i> -->
					</a></li>
				</ul>
			</div>
		</div>
		<div class="main-panel" data="blue">
			<!-- End Navbar -->
			<div class="content">
				<!--  menu1 지출관리 -->
				<div class="row">
					<div class="col-md-12">
						<div class="card">
							<div class="card-body">
								<p style="size: 20em;">
									민나노매점
									</p1>
								<div class="btn-group" data-toggle="buttons">
									<label class="btn btn-secondary active"> <input
										type="radio" name="options" id="option1" value="day" checked > DAY
									</label> <label class="btn btn-secondary"> <input type="radio"
										name="options" id="option2" value="week">
										WEEK
									</label> <label class="btn btn-secondary"> <input type="radio"
										name="options" id="option3" value="month">
										MONTH
									</label>
								</div>
								<p1>시작</p1>
								<input type="text" id="datepicker1" placeholder="yy-mm-dd"
									style="width: 100px">
								<p1>종료</p1>
								<input type="text" id="datepicker2" placeholder="yy-mm-dd"
									style="width: 100px">
								<button type="submit" class="btn ml-auto mr-auto" id="search">검색</button>
							</div>
							<div class="card-body">
								<div class="row">
									<!--  									<button type="submit"
										class="btn-default pull-right justify-content-end ml-auto mr-auto"
										name="1" style="width: 15%;">매출조회</button>
									<button type="submit"
										class="btn-default pull-right justify-content-end ml-auto mr-auto"
										name="2" style="width: 15%;">고객통계</button>
									<button type="submit"
										class="btn-default pull-right justify-content-end ml-auto mr-auto"
										name="3" style="width: 15%;">메뉴통계</button>
									<button type="submit"
										class="btn-default pull-right justify-content-end ml-auto mr-auto"
										name="4" style="width: 15%;">현/카 조회</button>
									<button type="submit"
										class="btn-default pull-right justify-content-end ml-auto mr-auto"
										name="5" style="width: 15%;">수지보고서</button>
										-->

									<div class="btn-group" data-toggle="buttons">
										<label class="btn btn-secondary active"> <input
											type="radio" name="options2" id="option1" checked value="sales"> 매출조회
										</label> <label class="btn btn-secondary"> <input type="radio"
											name="options2" id="option2"  value="customer">
											고객통계
										</label> <label class="btn btn-secondary"> <input type="radio"
											name="options2" id="option3"  value="menu">
											메뉴통계
										</label> <label class="btn btn-secondary"> <input type="radio"
											name="options2" id="option4"  value="card">
											현/카조회
										</label> <label class="btn btn-secondary"> <input type="radio"
											name="options2" id="option5"  value="income">
											수지보고서
										</label>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<!-- 차트부분 -->
					<div class="col-md-7">
						<div class="card">
							<div class="card-body">
								<canvas id="myChart" height="200%"></canvas>
							</div>
						</div>
					</div>
					<!-- 차트 표 부분 -->
					<div class="col-md-5">
						<div class="card">
							<div class="card-body">
								<div class="tableTest" style="width: auto;"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<footer class="footer"></footer>
	</div>
	</div>
	<!--추가한 파일-->
	<link rel="stylesheet"
		href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script
		src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
	<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
	<!--   Core JS Files   -->
	<!--  <script src="assets/js/core/jquery.min.js"></script>-->
	<script src="assets/js/core/popper.min.js"></script>
	<script src="assets/js/core/bootstrap.min.js"></script>
	<script src="assets/js/plugins/perfect-scrollbar.jquery.min.js"></script>
	<!--  Google Maps Plugin    -->
	<!-- Place this tag in your head or just before your close body tag. -->
	<!-- Chart JS -->
	<script src="assets/js/plugins/chartjs.min.js"></script>
	<!--  Notifications Plugin    -->
	<script src="assets/js/plugins/bootstrap-notify.js"></script>
	<!-- Control Center for Black Dashboard: parallax effects, scripts for the example pages etc -->
	<script src="assets/js/black-dashboard.min.js?v=1.0.0"></script>
	<!-- Black Dashboard DEMO methods, don't include it in your project! -->
		
	</script>
	<script>
		var chart;
		//날짜 찝기
		$(function() {
			$("#datepicker1, #datepicker2").datepicker({
				dateFormat : 'yy-mm-dd',
			});
		});
		//날짜 유효성 검사
		$(function() {
			$("#search").on('click', function() {
				var start = $("#datepicker1").val();
				var end = $("#datepicker2").val();
				var unit = $('input[name=options]:checked').val();
				var category = $('input[name=options2]:checked').val();
				if (start == '') {
					alert("시작일을 입력해주세요!")
					return;
				}
				if (end == '') {
					alert("종료일을 입력해주세요!")
					return;
				}
				if (start > end) {
					alert("종료일은 시작일보다 작을 수 없습니다.")
					return;
				}
				//날짜 검색
				alert("요기요");
				$.ajax({
					url : 'search_date',
					type : 'post',
					data : {
						startDate : start,
						endDate : end,
						unit : unit,
						category : category
					},
					success : function(updateData) {
						alert('그래프 업데이트 실행');
						chartUpdate(updateData);
					}
				})
			});
		});
		// 그래프 테스트 (일일매출  현재일부터 1일까지의 매출)
		var data = [];
		var labels = [];
		var label = "매출액";
		//map 형식 index 번호 세는용
		var temp = 0;
		$(function() {
			$.ajax({
				url : 'reportdefaultList',
				type : 'GET',
				success : function(resp) {
					alert('값가져오기 실행')
					output(resp);
				}
			})
		});
		//기본값 테이블(표) 매출 테스트
		var data = [];
		var labels = [];
		function output(resp) {
			alert('표만들기 실행')
			var output = '';
			output += '<table class="table table-hover">';
			output += '<thead><tr><th style="width :30%; text-align: center;">월</th><th style="width :50%; text-align: center;">판매금액</th><th style="width :20%;">비고</th></tr></thead></table></div><div class="tableTest2" style="overflow: auto;width:auto; height:500px;" ><table class="table table-hover">';
			$.each(resp, function(index, item) {
				output += '<tr><td style="width :30%;">' + item.DAYTIME
						+ '</td><td style=" text-align: center;, width :50%;">'
						+ item.PAYMENT_AMOUNT_SUM
						+ '원</td><td style="width :30%;"></td></tr>'
			})
			output += "</table>"
			$('.tableTest').html(output);

			$.each(resp, function(index, item) {
				labels[temp] = item.DAYTIME;
				data[temp] = item.PAYMENT_AMOUNT_SUM;
				temp++;
			});
			alert('데이터 집어넣기 완료');
			alert(labels + data);
			temp = 0;
			firstshow();
			//data=[];
			//labels=[];
		}
		/*
		//그래프 보여주기
		$(function() {
			$("button[name=1]").on('click', function() {
				newchart.data.datasets[0].data = data;
				newchart.data.datasets[0].label = '매출액';
				newchart.data.labels = labels;
				newchart.update();

			});
			$("button[name=2]").on('click', function() {
				newchart.data.datasets[0].data = data;
				newchart.data.datasets[0].label = '고객수';
				newchart.data.labels = labels;
				newchart.update();
			});
			$("button[name=3]").on('click', function() {
				newchart.data.datasets[0].data = data;
				newchart.data.datasets[0].label = '메뉴통계';
				newchart.data.labels = labels;
				newchart.update();
			});
			$("button[name=4]").on('click', function() {
				var newchart = new Chart(ctx, {
					type : 'horizontalBar',//차트모양
					data : {
						labels : labels,
						datasets : [ {
							label : label,
							backgroundColor : 'rgb(111, 111, 102)',
							borderColor : 'rgb(111, 111, 102)',
							data : data
						} ]
					}
				});
			});
			$("button[name=5]").on('click', function() {
				data = [ 0, 1, 3, 4, 5, 6, 7, 8 ]
				newchart.data.datasets[0].data = data;
				newchart.data.datasets[0].label = '이익률 ';
				newchart.data.labels = labels;
				newchart.update();
			});
			$("#day").on(
					'click',
					function() {
						labels = [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13,
								14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25,
								26, 27, 28, 29, 30, 31 ];
						newchart.data.labels = labels;
						newchart.update();

					});
			$("#week").on('click', function() {
				labels = [ "1주차", "2주차", "3주차", "3주차", "5주차" ];
				newchart.data.labels = labels;
				newchart.update();
			});
			var labels2 = [];
			$("#month").on('click', function() {
				data2 = [];
				labels2 = [];
				$.each(test2, function(key, value) {
					data2[temp] = value;
					labels2[temp] = key;
					temp++
				})
				newchart.data.datasets[0].data = data2;
				newchart.data.labels = labels2;
				newchart.update();
				temp = 0;
			});
		});
		*/
		ctx = document.getElementById('myChart').getContext('2d');
		function firstshow() {
			var newchart = new Chart(ctx, {
				type : 'bar',//차트모양
				data : {
					labels : labels,
					datasets : [ {
						label : label,
						backgroundColor : 'rgb(111, 111, 102)',
						borderColor : 'rgb(111, 111, 102)',
						data : data,
					} ]
				}
			});
			alert('그래프만들기 완료');
		}
		//차트 검색을 눌렀을때 업데이트 구문
		function chartUpdate(updateData){
			labels=[];
			data=[];
			alert(updateData+"새로 넣을 값 왔습니다");
			$.each(updateData, function(index, item) {
				labels[temp] = item.DAYTIME;
				data[temp] = item.PAYMENT_AMOUNT_SUM;
				temp++;
			});
			
		}
	</script>
</body>

</html>