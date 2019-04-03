<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>POS MAIN</title>


<link href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,600,700,800"	rel="stylesheet" />
<link href="https://use.fontawesome.com/releases/v5.0.6/css/all.css"	rel="stylesheet">
<!-- Nucleo Icons -->
<link href="assets/css/nucleo-icons.css" rel="stylesheet" />
<!-- CSS Files -->
<link href="assets/css/black-dashboard.css?v=1.0.0" rel="stylesheet" />
<!-- CSS Just for demo purpose, don't include it in your project -->
<!-- <link href="assets/demo/demo.css" rel="stylesheet" /> -->

<!-- CSS~tab관련  Files -->
<link href="assets/css/posMain.css" rel="stylesheet" />

<!-- CSS~tab관련  Files -->
<link href="assets/css/test.css" rel="stylesheet" />


<link rel="stylesheet"	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
	
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script src="resources/jquery-3.3.1.min.js"></script>

<script>
	$(document).ready(function() {
		loadmenu();
	})
	
/* 	메뉴 목록 출력 */
	function loadmenu() {
        var cat = [];
        console.log(cat);
        $.ajax({
          url: 'selectMenu',
          method: 'POST',
          success: function(resp) {
        	  console.log(resp);
            $.each(resp, function(i, obj) {
              if (cat.indexOf(obj.menu_category) === -1) {
                cat.push(obj.menu_category)
              }
            })
            console.log(cat);
            
          // 여기부터 tab부분 
            var output = '';
            $.each(cat, function(i, obj) {
            	output+= ''
              if (i == 0) {
                output += '<li class="active">'
              }  else {
                output += '<li>'
              } 
              output += '<a data-toggle="tab" href="#' + obj + '">' + obj + '</a></li>'
              output += '</li>'
            })
            $('#mgr-2-8').html(output); 
	
            // 여기부터 탭 밑의 tab-pane
            var output2 = '';
            $.each(cat, function(i, obj) {
              if (i == 0) {
                output2 += '<div id="' + obj + '" class="tab-pane active">';
              } else {
                output2 += '<div id="' + obj + '" class="tab-pane fade">';
              }
              output2 += '<h3>' + obj + '</h3>';
              // 여기까지 카테고리를 기준으로 뿌린다

              // 이중포문, 여기부터 카테고리와 같은 속성일 때 목록에 올린다.
              $.each(resp, function(idx, obj2) {
            	  if (obj == obj2.menu_category) {
                  output2 += '<button class="menu_select_button" s-menuseq="' + obj2.menu_seq + '" s-menu-regex="' + obj + '|' + obj2.menu_name + '|' + obj2.menu_price + '|' + obj2.menu_sellFlag + '">' + obj2.menu_name + '<br>' + obj2.menu_price + '<br>' + obj2.menu_sellFlag + '</button>';
            	  }
              })
              output2 += '</div>';
            });
            
            $('#mgr-2-9').html(output2);

            $.each(resp, function(idx, obj3) {
                var temp = 'button[s-menuseq=' + obj3.menu_seq + ']';
                /* $(temp).on('click', selectmenu); */
            });
          }
        })
      }
	
	
	
	
	
	
	
	
	
	
</script>

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



<!-- The Modal -->
  <div class="modal fade" id="myModal">
    <div class="modal-dialog modal-sm">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">Modal Heading</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
          Modal body..
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        </div>
        
      </div>
    </div>
  </div>




		<div class="main-panel" data="blue">
			<div class="content">
				<div class="row"
					style="min-height: 100%;  max-height: calc(100vh - 705px); /* z-index: 4; position: relative; overflow: auto; */">
					<div class="col-lg-6 col-md-12">
						<div class="card">

							<div class="card-header">
								<h4 class="card-title">Simple Table</h4>
							</div>
							<div class="card-body table">
								<table class="box col-lg-12">
									<tr>

										<td>${sessionScope.emp_id}</td>
										<td>test2</td>
										<!-- <td><input id="testBtn" type="button" value="인원수 입력"></td> -->
										<td>
											<button type="button" class="btn btn-primary"
												data-toggle="modal" data-target="#myModal">Open
												modal</button>
										</td>
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

								<hr>
								<p style="float: right;">총 금액 :</p>
								<br>

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
								<h4 class="card-title">메뉴 목록</h4>
							</div>
							<div class="card-body">

								<div class="row">
									<div class="col-md-12 ml-auto mr-auto">



										<!-- 	<div class="col-lg-12"> -->
										<ul class="nav nav-tabs nav-fill" id="mgr-2-8">
											<!-- menu category tabs will be placed here. -->
										</ul>
										<div class="tab-content" id="mgr-2-9">
											<!-- menu lists will be placed here. -->
											<!--  </div> -->
										</div>


										<hr>
										<table class="box col-lg-12">
											<tr>
												<td><input type="button" value="카드결제"></td>
												<td><input type="button" value="현금결제"></td>
												<td><input type="button" value="복합결제"></td>

											</tr>
										</table>

									</div>
								</div>
								<!-- row -->
							</div>
							<!-- card body -->
						</div>
						<!-- card -->

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