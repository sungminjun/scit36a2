<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link rel="icon" type="image/png" href="./imgs/favicon.png">
  <title>
    MinnanoPOS
  </title>
  <!--     Fonts and icons     -->
  <link href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,600,700,800" rel="stylesheet" />
  <link href="https://use.fontawesome.com/releases/v5.0.6/css/all.css" rel="stylesheet">
  <!-- Nucleo Icons -->
  <link href="./assets/css/nucleo-icons.css" rel="stylesheet" />
  <!-- CSS Files -->
  <link href="./assets/css/black-dashboard.css?v=1.0.0" rel="stylesheet" />

  <!-- test -->
  <link href="./assets/css/test.css" rel="stylesheet" />

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
      <div class="content">
        <div class="row">
          <div class="col-md-8 ml-auto mr-auto">
            <div class="card" style="top: 20%">
              <div class="card-header">
                <h5 class="title">LOGIN</h5>
              </div>
              <form id="loginForm" action="login" method="post">
                <div class="card-body">
                  <div class="row justify-content-center">
                    <div class="col-md-5">
                      <div class="form-group">
                        <input type="text" class="form-control" placeholder="UserID" name="emp_id">
                      </div>
                    </div>
                    <div class="col-md-5">
                      <div class="form-group">
                        <input type="password" class="form-control" placeholder="UserPassword" name="emp_pw">
                      </div>
                    </div>
                  </div>
                  <div class="row justify-content-center">
                    <div class="col-md-10 pull-right justify-content-end">
                      <button type="submit" class="btn-default pull-right justify-content-end">Login</button>
                    </div>
                  </div>
                </div>
                <div class="card-footer">
                  <div class="row pull-right justify-content-center">
                    <div class="col-12">
                      <a href="join" class="simple-text">회원가입</a><br>
                      <a href="find" class="simple-text">ID/PW 찾기</a>
                    </div>
                  </div>
                </div>
              </form>

            </div>
          </div>
        </div>
      </div>
    </div>
  </div>

  <!--   Core JS Files   -->
  <script src="./assets/js/core/jquery.min.js"></script>
  <script src="./assets/js/core/popper.min.js"></script>
  <script src="./assets/js/core/bootstrap.min.js"></script>
  <script src="./assets/js/plugins/perfect-scrollbar.jquery.min.js"></script>
  <!-- Chart JS -->
  <script src="./assets/js/plugins/chartjs.min.js"></script>
  <!--  Notifications Plugin    -->
  <script src="./assets/js/plugins/bootstrap-notify.js"></script>
  <!-- Control Center for Black Dashboard: parallax effects, scripts for the example pages etc -->
  <script src="./assets/js/black-dashboard.min.js?v=1.0.0"></script>
</body>

</html>
