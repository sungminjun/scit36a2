<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link rel="icon" type="image/png" href="imgs/favicon.png">
  <title>
    MinnanoPOS
  </title>
  <!--     Fonts and icons     -->
  <link href="https://use.fontawesome.com/releases/v5.0.6/css/all.css" rel="stylesheet">
  <!-- Nucleo Icons -->
  <link href="assets/css/nucleo-icons.css" rel="stylesheet" />
  <!-- CSS Files -->
  <link href="assets/css/black-dashboard.css?v=1.0.0" rel="stylesheet" />
</head>

<body class="white-content">
  <div class="wrapper">
    <div class="sidebar" data="blue">
      <div class="sidebar-wrapper">
        <div class="logo">
          <a href="${pageContext.request.contextPath}" class="simple-text logo-normal">
            MP
          </a>
        </div>
        <ul class="nav">
          <li>
            <a href="pos">
              <i class="tim-icons icon-money-coins" title="포스기능 / Enter POS"></i>
            </a>
            <br><br>
          </li>
          <li>
            <a href="mgr">
              <i class="tim-icons icon-settings-gear-63" title="설정 / settings"></i>
            </a>
            <br><br>
          </li>
          <li>
            <a href="board">
              <i class="tim-icons icon-chat-33" title="커뮤니티 / community"></i>
            </a>
            <br><br>
          </li>
          <li>
            <a href="report">
              <i class="tim-icons icon-chart-pie-36" title="보고서 / report"></i>
            </a>
            <br><br>
            <br><br><br>
          </li>
          <li>
            <a href="logout">
              <i class="tim-icons icon-button-power" title="로그아웃 / logout" aria-label="logout"></i>
            </a>
          </li>
        </ul>
      </div>
    </div>
    <div class="main-panel" data="blue">
      <!-- 영역 시작 -->
      <div class="content">
        <div class="row">
          
        </div>
        <div class="row">
          <div class="col-md-6 mx-auto">
            <div class="card">
              <img class="main-junc" alt="main-pos-icon" src="imgs/main-pos.png">
            </div>
          </div>
          <div class="col-md-6 mx-auto">
            <div class="card">
              <h1> NOTICE </h1>
              <h3> !! 사용자 매뉴얼 링크입니다. [아직]</h3>
              <h3> !! 키보드의 화살표 버튼 <kbd>←</kbd><kbd>↑</kbd><kbd>↓</kbd><kbd>→</kbd>을 눌러서 페이지를 이동할 수 있습니다. </h3>
               <hr>
              <h1>for 0416 shiage</h1>
              shiage 작업을 위해 사용하지 않는 front단과 back단 파일들을 정리했습니다.
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>

  <!--   Core JS Files   -->
  <script src="assets/js/core/jquery.min.js"></script>
  <script src="assets/js/core/popper.min.js"></script>
  <script src="assets/js/core/bootstrap.min.js"></script>
  <script src="assets/js/plugins/perfect-scrollbar.jquery.min.js"></script>
  <!-- Chart JS -->
  <script src="assets/js/plugins/chartjs.min.js"></script>
  <!--  Notifications Plugin    -->
  <script src="assets/js/plugins/bootstrap-notify.js"></script>
  <!-- Control Center for Black Dashboard: parallax effects, scripts for the example pages etc -->
  <script src="assets/js/black-dashboard.min.js?v=1.0.0"></script>
  <script>
    $(document).keydown(function(event) {
      if (event.keyCode == '37') {
        location.href = "pos"
      } else if (event.keyCode == '39') {
        location.href = "mgr"
      } else if (event.keyCode == '38') {
        location.href = "board"
      } else if (event.keyCode == '40') {
        location.href = "report"
      }
    });

  </script>
</body>

</html>
