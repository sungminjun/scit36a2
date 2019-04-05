<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link rel="apple-touch-icon" sizes="76x76" href="assets/img/apple-icon.png">
  <link rel="icon" type="image/png" href="assets/img/favicon.png">
  <title>MinnanoPOS by MANEKINEKO@SCIT36A</title>
  <!--     Fonts and icons     -->
  <link href="https://use.fontawesome.com/releases/v5.0.6/css/all.css" rel="stylesheet">
  <!-- Nucleo Icons -->
  <link href="assets/css/nucleo-icons.css" rel="stylesheet" />
  <!-- CSS Files -->
  <link href="assets/css/black-dashboard.css?v=1.0.0" rel="stylesheet" />
  <!-- CSS Just for demo purpose, don't include it in your project -->
  <link href="assets/demo/demo.css" rel="stylesheet" />
  <!-- google material.io -->
  <!-- 	
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
 -->
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
          <li><a href="#"> <i class="tim-icons icon-money-coins" title="포스 / Enter POS"></i>
            </a> <br> <br></li>
          <li><a href="#"> <i class="tim-icons icon-settings-gear-63" title="설정 / settings"></i>
              <!-- <i class="material-icons">settings</i> -->
            </a> <br> <br></li>
          <li><a href="#"> <i class="tim-icons icon-chat-33" title="커뮤니티 / community"></i>
            </a> <br> <br></li>
          <li><a href="#"> <i class="tim-icons icon-chart-pie-36" title="보고서 / reports"></i>
            </a> <br> <br> <br> <br> <br></li>
          <li><a href="#"> <i class="tim-icons icon-button-power" title="로그아웃 / logout" aria-label="logout"></i> <!-- <i class="material-icons">power_settings_new</i> -->
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
                <p style="size: 20em;">민나노매점</p1>
                  <button type="submit" class="btn-default ml-auto mr-auto" id="day">일기준</button>
                  <button type="submit" class="btn-default ml-auto mr-auto" id="week">주기준</button>
                  <button type="submit" class="btn-default ml-auto mr-auto" id="month">월기준</button>
                  <p1>시작</p1><input type="text" id="datepicker1" placeholder="yy-mm-dd" style="width: 100px">
                  <p1>종료</p1><input type="text" id="datepicker2" placeholder="yy-mm-dd" style="width: 100px">
                  <button type="submit" class="btn ml-auto mr-auto" id="search">검색</button>
              </div>
              <div class="card-body">
                <div class="row">
                  <button type="submit" class="btn-default pull-right justify-content-end ml-auto mr-auto" name="1" style="width: 15%;">
                    매출조회</button>
                  <button type="submit" class="btn-default pull-right justify-content-end ml-auto mr-auto" name="2" style="width: 15%;">
                    고객통계</button>
                  <button type="submit" class="btn-default pull-right justify-content-end ml-auto mr-auto" name="3" style="width: 15%;">
                    메뉴통계</button>
                  <button type="submit" class="btn-default pull-right justify-content-end ml-auto mr-auto" name="4" style="width: 15%;">현/카
                    조회</button>
                  <button type="submit" class="btn-default pull-right justify-content-end ml-auto mr-auto" name="5" style="width: 15%;">수지보고서
                  </button>
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
                <div class="tableTest">

                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <footer class="footer"> </footer>
  </div>
  </div>
  <!--추가한 파일-->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
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
  <script src="assets/demo/demo.js">

  </script>
  <script>
    var chart;
    //날짜 찝기
    $(function() {
      $("#datepicker1, #datepicker2").datepicker({
        dateFormat: 'yy-mm-dd',
      });
    });
    //날짜 유효성 검사
    $(function() {
      $("#search").on('click', function() {
        var start = $("#datepicker1").val();
        var end = $("#datepicker2").val();
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
          url: 'search-date',
          type: 'get',
          data: {
            startDate: start,
            endDate: end
          },
          success: function(resp) {
            alert(resp);
          }
        })
      });
    });
    //기본값 그래프 (일일매출  현재일부터 1일까지의 매출)
    var data = [];
    var labels = [];
    var label = "매출액";
    //map 형식 index 번호 세는용
    var temp = 0;
    var test = {
      1: "100",
      2: "300",
      3: "300",
      4: "300",
      5: "300",
      6: "300",
      7: "300",
      8: "300",
      9: "300",
      10: "300"
    }
    $(function() {
      $.each(test, function(key, value) {
        labels[temp] = key + "일";
        data[temp] = value;
        newchart.update();
        temp++;
      });
    });
    //기본값 테이블(표) 매출
    $(function() {
      var output = '';
      output += '<table class="table table-hover ">';
      output += '<th>월</th><th>판매금액</th><th>비고</th>';
      $.each(test, function(key, value) {
        output += '<tr><td>' + key + '일</td><td>' + value + '원</td><td></td></tr>'
      })
      $('.tableTest').html(output);
    });
    //그래프 보여주기
    var card = false;
    $(function() {
      $("button[name=1]").on('click', function() {
        data = [23, 22, 43, 25, 122, 5, 25];
        newchart.data.datasets[0].data = data;
        newchart.data.datasets[0].label = '매출액';
        newchart.data.labels = labels;
        newchart.update();


      });
      $("button[name=2]").on('click', function() {
        data = [12, 32, 55, 25, 53, 33, 76];
        newchart.data.datasets[0].data = data;
        newchart.data.datasets[0].label = '고객수';
        newchart.data.labels = labels;
        newchart.update();
      });
      $("button[name=3]").on('click', function() {
        data = [62, 73, 33, 13, 52, 31, 25];
        newchart.data.datasets[0].data = data;
        newchart.data.datasets[0].label = '메뉴통계';
        newchart.data.labels = labels;
        newchart.update();
      });
      $("button[name=4]").on('click', function() {
        newchart.clear();
      });
      $("button[name=5]").on('click', function() {
        data = [52, 22, 4, 43, 12, 52, 25];
        newchart.data.datasets[0].data = data;
        newchart.data.datasets[0].label = '이익률 ';
        newchart.data.labels = labels;
        newchart.update();
      });
      $("#day").on('click', function() {
        labels = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31];
        newchart.data.labels = labels;
        newchart.update();

      });
      $("#week").on('click', function() {
        labels = ["1주차", "2주차", "3주차", "3주차", "5주차"];
        newchart.data.labels = labels;
        newchart.update();
      });
      $("#month").on('click', function() {
        labels = ["1月", "2月", "3月", "4月", "5月", "6月", "7月", "8月", "9月", "10月", "11月", "12月", ];
        newchart.data.labels = labels;
        newchart.update();
      });
    });
    ctx = document.getElementById('myChart').getContext('2d');
    var newchart = new Chart(ctx, {
      type: 'bar', //차트모양
      data: {
        labels: labels,
        datasets: [{
          label: label,
          backgroundColor: 'rgb(111, 111, 102)',
          borderColor: 'rgb(111, 111, 102)',
          data: data,
        }]
      }
    });

  </script>
</body>

</html>
