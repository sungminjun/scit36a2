<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>id,pw search</title>


<link
	href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,600,700,800"
	rel="stylesheet" />
<link href="https://use.fontawesome.com/releases/v5.0.6/css/all.css"
	rel="stylesheet">
<!-- Nucleo Icons -->
<link href="assets/css/nucleo-icons.css" rel="stylesheet" />
<!-- CSS Files -->
<link href="assets/css/black-dashboard.css?v=1.0.0" rel="stylesheet" />
<!-- CSS Just for demo purpose, don't include it in your project -->
<link href="assets/demo/demo.css" rel="stylesheet" />

<!-- CSS~tab관련  Files -->
<link href="assets/css/posMain.css" rel="stylesheet" />

<!-- CSS~tab관련  Files -->
<link href="assets/css/test.css" rel="stylesheet" />

<script src="resources/jquery-3.3.1.min.js"></script>


</head>
<body class="white-content">
	<div class="wrapper">

		<div class="sidebar" data="blue">
			<!--
        Tip 1: You can change the color of the sidebar using: data-color="blue | green | orange | red"
    -->
			<div class="sidebar-wrapper">
				<div class="logo">
					<a href="javascript:void(0)" class="simple-text logo-normal">
						MP </a>
				</div>
				<ul class="nav">
					<li><a href="#"> <i class="tim-icons icon-money-coins"
							title="포스 / Enter POS"></i>
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
			<div class="content">
				<div class="row">
					<div class="col-lg-6 col-md-12">
						<div class="card">
							<div class="card-header">
								<h4 class="card-title">Simple Table</h4>
							</div>
							<div class="card-body table">2
								<table class="box col-lg-12">
									<tr>

										<td>test1</td>
										<td>test2</td>
										<td>test3</td>
									</tr>
								</table>

								<table class="box col-lg-12">
									<tr class="data_table">
									

										<td>주문 메뉴 목록</td>
									</tr>
								</table>

								<table class="box col-lg-12">
									<tr>
										<td><input type="button" value="전체 취소"></td>
										<td><input type="button" value="라인 취소"></td>
										<td><input type="button" value="       +      "></td>
										<td><input type="button" value="       -      "></td>
									</tr>
								</table>

								<hr><p style="float: right;">총 금액 :</p><br>
								
								<table class="box col-lg-12">
									<tr>
										<td><input type="button" value="   할인   "></td>
										<td><input type="button" value="  서비스  "></td>
										<td><input type="button" value="메모 등록"></td>
										<td><input type="button" value="주문 등록"></td>
									</tr>
								</table>
							</div>


						</div>
					</div>

					<div class="col-lg-6 col-md-12">
						<div class="card">
							<div class="card-header">
								<h4 class="card-title">Simple Table2</h4>
							</div>
							<div class="card-body">

								<div class="row">
									<div class="col-md-12 ml-auto mr-auto">
										<ul class="tab">
											<li class="col-md-4 current rounded-top" data-tab="tab1"><a
												href="#">식사</a></li>
											<li class="col-md-4  rounded-top" data-tab="tab2"><a
												href="#">요리</a></li>
											<li class="col-md-4 rounded-top" data-tab="tab3"><a
												href="#">주류</a></li>
											<!--<li data-tab="tab4"><a href="#">Travel</a></li> -->
										</ul>

										<div id="tab1" class="tabcontent current rounded-bottom rounded-right" style="height:430px;">
											<form class="box">
												<h1>식사</h1>


											</form>
										</div>

										<div id="tab2" class="tabcontent rounded" style="height:430px;">
											<form class="box">
												<h1>요리</h1>

											</form>
										</div>

										<div id="tab3" class="tabcontent rounded" style="height:430px;">
											<form class="box">
												<h1>주류</h1>
												
											</form>
										</div>

										<table class="box col-lg-12">
											<tr>
												<td><input type="button" value="카드결제"></td>
												<td><input type="button" value="현금결제"></td>
												<td><input type="button" value="복합결제"></td>
												
											</tr>
										</table>

									</div>
								</div>
							</div>
						</div>

					</div>

				</div>
			</div>


		</div>
	</div>
  
    <script>
  $(function() {
    $('ul.tab li').click(function() {
      var activeTab = $(this).attr('data-tab');
      $('ul.tab li').removeClass('current');
      $('.tabcontent').removeClass('current');
      $(this).addClass('current');
      $('#' + activeTab).addClass('current');
    })
  });
</script>
  
  
</body>
</html>