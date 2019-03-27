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
  <link href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,600,700,800" rel="stylesheet" />
  <link href="https://use.fontawesome.com/releases/v5.0.6/css/all.css" rel="stylesheet">
  <!-- Nucleo Icons -->
  <link href="./assets/css/nucleo-icons.css" rel="stylesheet" />
  <!-- CSS Files -->
  <link href="./assets/css/black-dashboard.css?v=1.0.0" rel="stylesheet" />
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
          <div class="col-md-6">
            <div class="card">
              <div class="card-header">
                <!-- 현재 로그인한 회사의 이름 -->
                <div class="row">
                <div class="col-md-3">
                  <input type="text" class="form-control text-center" id="pos1-1" value="호정이네 설렁탕" disabled="disabled">
                </div>
                <!-- 현재 로그인한 직원의 이름 -->
                <div class="col-md-3">
                  <input type="text" class="form-control text-center" id="pos1-2" value="사용자: 이호정" disabled="disabled">
                </div>
                <!-- 현재 로그인한 회사의 전체 좌석수 -->
                <div class="col-md-2">
                  <input type="text" class="form-control text-center" id="pos1-3" value="총 00 석 " disabled="disabled">
                </div>
                <!-- 현재 로그인한 회사의 가용 좌석수 -->
                <div class="col-md-3">
                  <input type="text" class="form-control text-center" id="pos1-4" value="현재 00 석 이용중" disabled="disabled">
                </div>
                </div>
              </div>
              <div class="card-body">
                <div class="row">
                  <div class="col-md-12" id="pos-1-5">
                  <!-- seats grid will be placed here -->
                  </div>
                </div>
              </div>
              <div class="card-footer">
                <h5 class="title">div1-footer혹시 모를 용도의 새로고침 버튼을 여기 둘까?</h5>
              </div>
            </div>
          </div>
          <div class="col-md-6">
            <div class="card">
              <div class="card-header">
                <h5 class="title">div2 (POS기능 메인화면 기능메뉴 버튼들..)</h5>
              </div>
              <div class="card-body">
                <div class="row">
                  <div class="col-md-2 mx-auto form-control" id="pos-2-1">
                    <h5 class="title">이동</h5>
                  </div>
                  <div class="col-md-2 mx-auto form-control" id="pos-2-2">
                    <h5 class="title">교환</h5>
                  </div>
                  <div class="col-md-2 mx-auto form-control" id="pos-2-3">
                    <h5 class="title">합치기</h5>
                  </div>
                  <div class="col-md-2 mx-auto form-control" id="pos-2-4">
                    <h5 class="title">버튼4</h5>
                  </div>
                </div>
                <br>
                <div class="row">
                  <div class="col-md-2 mx-auto form-control" id="pos-2-5">
                    <h5 class="title">버튼5</h5>
                  </div>
                  <div class="col-md-2 mx-auto form-control" id="pos-2-6">
                    <h5 class="title">버튼6</h5>
                  </div>
                  <div class="col-md-2 mx-auto form-control" id="pos-2-7">
                    <h5 class="title">버튼7</h5>
                  </div>
                  <div class="col-md-2 mx-auto form-control"  id="pos-2-8">
                    <h5 class="title">버튼8</h5>
                  </div>
                </div>
                <br>
                <div class="row">
                  <div class="col-md-2 mx-auto form-control"  id="pos-2-9">
                    <h5 class="title">영업개시</h5>
                  </div>
                  <div class="col-md-2 mx-auto form-control" id="pos-2-10">
                    <h5 class="title">시재회수</h5>
                  </div>
                  <div class="col-md-2 mx-auto form-control" id="pos-2-11">
                    <h5 class="title">시재투입</h5>
                  </div>
                  <div class="col-md-2 mx-auto form-control" id="pos-2-12">
                    <h5 class="title">영업마감</h5>
                  </div>
                </div>
                <br>
                <div class="row">
                  <div class="col-md-4 mx-auto form-control" id="pos-2-13">
                    <input type="text" class="form-control text-center" id="pos2-13-1" value="현재시재" disabled="disabled">
                  </div>
                  <div class="col-md-4 mx-auto form-control" id="pos-2-14">
                    <input type="text" class="form-control text-center" id="pos2-14-1" value="금일매출" disabled="disabled">
                  </div>
                  <div class="col-md-2 mx-auto form-control" id="pos-2-15">
                    <h5 class="title">버튼15</h5>
                  </div>
                  <div class="col-md-2 mx-auto form-control" id="pos-2-16">
                    <h5 class="title">버튼16</h5>
                  </div>
                </div>
                <br>
                <div class="row">
                  <div class="col-md-2 mx-auto form-control" id="pos-2-17">
                    <h5 class="title">결제내역</h5>
                  </div>
                  <div class="col-md-2 mx-auto form-control" id="pos-2-18">
                    <h5 class="title">버튼18</h5>
                  </div>
                  <div class="col-md-2 mx-auto form-control" id="pos-2-19">
                    <h5 class="title">버튼19</h5>
                  </div>
                  <div class="col-md-2 mx-auto form-control" id="pos-2-20">
                    <h5 class="title">버튼20</h5>
                  </div>
                </div>
              </div>
              <br><br><br><br><br><br>
              <div class="card-footer">
                <h5 class="title">div2-footer</h5>
              </div>
            </div>
          </div>
        </div>
        
        
        <div class="row">
          <div class="col-md-6">
            <div class="card">
              <div class="card-header">
                <!-- 현재 로그인한 회사의 이름 -->
                <div class="row">
                <div class="col-md-4">
                  <input type="text" class="form-control text-center" id="pos3-1" value="호정이네 설렁탕" disabled="disabled">
                </div>
                <!-- 현재 로그인한 직원의 이름 -->
                <div class="col-md-3">
                  <input type="text" class="form-control text-center" id="pos3-2" value="사용자: 이호정" disabled="disabled">
                </div>
                <!-- 현재 주문창에 해당하는 좌석 번호 -->
                <div class="col-md-4">
                  <input type="text" class="form-control text-center" id="pos3-3" value="[________] 자리 주문입력중" disabled="disabled">
                </div>
                </div>
              </div>
              <div class="card-body">
                <div class="row">
                  <div class="col-md-12" id="pos-3-5">
                  <!-- seats grid will be placed here -->
                  </div>
                </div>
              </div>
              <div class="card-footer">
                <h5 class="title">div3-footer div3 for 주문입력창</h5>
              </div>
            </div>
          </div>
          <div class="col-md-6">
            <div class="card">
              <div class="card-header">
                <h5 class="title">div4 주문용 menu 목록 불러오기 here</h5>
              </div>
              <div class="card-body">
                <div class="row">
                  <div class="col-md-3" id="pos-4-1">
                  
                  </div>
              </div>
              </div>
              <div class="card-footer">
                <h5 class="title">div4-footer</h5>
              </div>
            </div>
          </div>
        </div>
        
        
      </div>
      <footer class="footer">
      </footer>
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
  var test = {"k1" : "v1", "key2" : "val2"}
  $.each(test, function(key, value) {
	  console.log(key, value, value.key, test[key]);
  })
  $.each(test, function(idx, obj) {
	  console.log(idx, obj, test.idx, test[idx]);
  })
  
  </script>
  
</body>

</html>
