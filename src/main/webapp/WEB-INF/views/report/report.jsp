<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link rel="icon" type="image/png" href="./imgs/favicon.png">
  <title>MinnanoPOS by MANEKINEKO@SCIT36A</title>
  <!--     Fonts and icons     -->
  <link href="https://use.fontawesome.com/releases/v5.0.6/css/all.css" rel="stylesheet">
  <!-- Nucleo Icons -->
  <link href="./assets/css/nucleo-icons.css" rel="stylesheet" />
  <!-- CSS Files -->
  <link href="./assets/css/black-dashboard.css?v=1.0.0" rel="stylesheet" />

  <!--추가한 파일-->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" />
  <script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
  <script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>

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
          <li><a href="#"> <i class="tim-icons icon-money-coins" title="포스 / Enter POS"></i>
            </a> <br> <br></li>
          <li><a href="#"> <i class="tim-icons icon-settings-gear-63" title="설정 / settings"></i>
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
      <div class="content">
        <!--  menu1 지출관리 -->
        <div class="row">
          <div class="col-md-12">
            <div class="card">
              <div class="card-body">
                <span>민나노매점</span>
                <button type="submit" class="btn-default ml-auto mr-auto" id="day" style="width: 10%;">일기준</button>
                <button type="submit" class="btn-default ml-auto mr-auto" id="week" style="width: 10%;">주기준</button>
                <button type="submit" class="btn-default ml-auto mr-auto" id="month" style="width: 10%;">월기준</button>
                <button type="submit" class="btn-default  " style="width: 10%;">기간설정</button>
                <input type="text" id="datepicker1" placeholder="yy-mm-dd" style="width: 100px">
                <input type="text" id="datepicker2" placeholder="yy-mm-dd" style="width: 100px">
                <button type="submit" class="btn ml-auto mr-auto">검색</button>
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
          <div class="col-md-12">
            <div class="card">
              <div class="card-body" style="height: auto">
                <canvas id="myChart"></canvas>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <footer class="footer"> </footer>
  </div>

  <!--   Core JS Files   -->
  <!--  <script src="./assets/js/core/jquery.min.js"></script>-->
  <script src="./assets/js/core/popper.min.js"></script>
  <script src="./assets/js/core/bootstrap.min.js"></script>
  <script src="./assets/js/plugins/perfect-scrollbar.jquery.min.js"></script>
  <!-- Chart JS -->
  <script src="./assets/js/plugins/chartjs.min.js"></script>
  <!--  Notifications Plugin    -->
  <script src="./assets/js/plugins/bootstrap-notify.js"></script>
  <!-- Control Center for Black Dashboard: parallax effects, scripts for the example pages etc -->
  <script src="./assets/js/black-dashboard.min.js?v=1.0.0"></script>

  <script>
    $(function() {
      $("#datepicker1, #datepicker2").datepicker({
        dateFormat: 'yy-mm-dd',
      });
    });
    //다중 그래프
    var data;
    var labels = ["1월", "2월", "3월", "4월", "5월", "6월", "7월"];
    $(function() {
      $("button[name=1]").on('click', function() {
        data = [23, 22, 43, 25, 122, 5, 25];
        $('canvas').removeAttr('class');
        good();
      });
      $("button[name=2]").on('click', function() {
        data = [12, 32, 55, 25, 53, 33, 76];
        $('canvas').removeAttr('class');
        good();
      });
      $("button[name=3]").on('click', function() {
        data = [62, 73, 33, 13, 52, 31, 25];
        $('canvas').removeAttr('class');
        good();
      });
      $("button[name=4]").on('click', function() {
        data = [42, 22, 13, 20, 22, 4, 25];
        $('canvas').removeAttr('class');
        good();
      });
      $("button[name=5]").on('click', function() {
        data = [52, 22, 4, 43, 12, 52, 25];
        $('canvas').removeAttr('class');
        good();
      });
      $("#day").on('click', function() {
        labels = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31];
      });
      $("#week").on('click', function() {
        labels = ["1주차", "2주차", "3주차", "3주차", "5주차"];
      });
      $("#month").on('click', function() {
        labels = ["1月", "2月", "3月", "4月", "5月", "6月", "7月", "8月", "9月", "10月", "11月", "12月", ];
      });
    });

    $(function() {
      good();
    });

    function good() {

      var ctx;
      ctx = document.getElementById('myChart').getContext('2d');
      var chart;
      chart = new Chart(ctx, {
        // The type of chart we want to create

        type: 'bar',
        // The data for our dataset
        data: {
          labels: labels,
          datasets: [{
            label: "평균매출액",
            backgroundColor: 'rgb(111, 111, 102)',
            borderColor: 'rgb(111, 111, 102)',
            data: data,
          }]
        }
        // Configuration options go here
      });
    };

  </script>
</body>

</html>
