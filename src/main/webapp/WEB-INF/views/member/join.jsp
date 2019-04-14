<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link rel="icon" type="image/png" href="./imgs/favicon.png">
  <title>MinnanoPOS</title>
  <!--     Fonts and icons     -->
  <link href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,600,700,800" rel="stylesheet" />
  <link href="https://use.fontawesome.com/releases/v5.0.6/css/all.css" rel="stylesheet">
  <!-- Nucleo Icons -->
  <link href="./assets/css/nucleo-icons.css" rel="stylesheet" />
  <!-- CSS Files -->
  <link href="./assets/css/black-dashboard.css?v=1.0.0" rel="stylesheet" />

  <!-- CSS~tab관련  Files -->
  <link href="./assets/css/test.css" rel="stylesheet" />
</head>

<body class="white-content">
  <div class="wrapper">
    <div class="sidebar" data="blue">
      <div class="sidebar-wrapper">
        <div class="logo">
          <a href="${pageContext.request.contextPath}" class="simple-text logo-normal"> MP </a>
        </div>
        <ul class="nav">
          <li><a href="pos"> <i class="tim-icons icon-money-coins" title="포스기능 / Enter POS"></i>
            </a> <br>
            <br></li>
          <li><a href="mgr"> <i class="tim-icons icon-settings-gear-63" title="설정 / settings"></i>
            </a> <br>
            <br></li>
          <li><a href="board"> <i class="tim-icons icon-chat-33" title="커뮤니티 / community"></i>
            </a> <br>
            <br></li>
          <li><a href="report"> <i class="tim-icons icon-chart-pie-36" title="보고서 / report"></i>
            </a> <br>
            <br> <br>
            <br>
            <br></li>
          <li><a href="logout"> <i class="tim-icons icon-button-power" title="로그아웃 / logout" aria-label="logout"></i>
            </a></li>
        </ul>
      </div>
    </div>



    <div class="main-panel" data="blue">
      <div class="content">
        <div class="row">
          <div class="col-md-6 ml-auto mr-auto">
            <div class="card">
              <div class="card-header">
                <h5 class="title">ENROLL USER</h5>
              </div>
              <form id="registForm" action="join" method="POST">
                <div class="card-body">
                  <div class="row justify-content-center">
                    <div class="col-md-6">
                      <div class="form-group">
                        <label for="comp_id">사업자 등록번호</label> <input type="text" class="form-control" name="comp_id">
                      </div>
                    </div>
                    <div class="col-md-3">Ajax here ~ 사업자 등록번호 Auto check</div>
                  </div>
                  <div class="row justify-content-center">
                    <div class="col-md-6">
                      <div class="form-group">
                        <label for="comp_name">가게 이름</label> <input type="text" class="form-control" name="comp_name">
                      </div>
                    </div>
                    <div class="col-md-3"></div>
                  </div>
                  <div class="row justify-content-center">
                    <div class="col-md-6">
                      <div class="form-group">
                        <label for="comp_tel">가게 전화번호</label> <input type="text" class="form-control" name="comp_tel">
                      </div>
                    </div>
                    <div class="col-md-3"></div>
                  </div>
                  <div class="row justify-content-center">
                    <div class="col-md-6">
                      <div class="form-group">
                        <label for="comp_address">주소</label>
                        <input type="text" class="form-control" name="comp_address" id="search_button" value="">
                      </div>
                    </div>
                    <div class="col-md-3">
                    </div>
                  </div>
                  <div class="row justify-content-center">
                    <div class="col-md-6">
                      <div class="form-group">
                        <label for="comp_address">세부주소</label> <input type="text" class="form-control" name="comp_address2">
                      </div>
                    </div>
                    <div class="col-md-3"></div>
                  </div>
                  <hr>
                  <div class="row justify-content-center">
                    <div class="col-md-6">
                      <div class="form-group">
                        <label for="emp_id">ID</label> <input type="text" class="form-control" name="emp_id">
                      </div>
                    </div>
                    <div class="col-md-3">Ajax here ~ ID 중복 Auto check</div>
                  </div>
                  <div class="row justify-content-center">
                    <div class="col-md-6">
                      <div class="form-group">
                        <label for="emp_pw">PASSWORD</label> <input type="password" class="form-control" name="emp_pw">
                      </div>
                    </div>
                    <div class="col-md-3">Ajax here ~ pw 제한조건 Auto check</div>
                  </div>
                  <div class="row justify-content-center">
                    <div class="col-md-6">
                      <div class="form-group">
                        <label for="emp_pw2">PASSWORD 재확인</label> <input type="password" class="form-control" name="emp_pw2">
                      </div>
                    </div>
                    <div class="col-md-3">Ajax here ~ pw1과 동일한지 Auto check</div>
                  </div>
                  <div class="row justify-content-center">
                    <div class="col-md-6">
                      <div class="form-group">
                        <label for="emp_name">이름</label> <input type="text" class="form-control" name="emp_name">
                      </div>
                    </div>
                    <div class="col-md-3"></div>
                  </div>
                  <div class="row justify-content-center">
                    <div class="col-md-6">
                      <div class="form-group">
                        <label for="emp_tel">전화번호</label> <input type="text" class="form-control" name="emp_tel">
                      </div>
                    </div>
                    <div class="col-md-3"></div>
                  </div>
                  <div class="row justify-content-center">
                    <div class="col-md-6">
                      <div class="form-group">
                        <label for="emp_quiz">비밀번호 찾기 질문</label>
                        <!-- <input type="text" class="form-control" name="emp_quiz"> -->
                        <select>
                          <option value="우리조이름은?">
                        </select>
                      </div>
                      <!--
											<div class="form-group">
												<label for="emp_quiz">비밀번호 찾기 질문</label> <input type="text"
													class="form-control" name="emp_quiz">
											</div>
										</div>
										<div class="col-md-3">quiz는 dropdown목록에서 선택하는 것은 어떨지
											생각해볼 것</div>
                      -->
                    </div>
                    <div class="row justify-content-center">
                      <div class="col-md-6">
                        <div class="form-group">
                          <label for="emp_quiz_answer">비밀번호 찾기 답</label> <input type="text" class="form-control" name="emp_quiz_answer">
                        </div>
                      </div>
                      <div class="col-md-3"></div>
                    </div>

                    <div class="row justify-content-center">
                      <div class="col-md-2">
                        <input type="reset" class="btn-default" value="취소">
                      </div>
                      <div class="col-md-1"></div>
                      <div class="col-md-3">
                        <input type="submit" class="btn-default" value="회원가입">
                      </div>
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
  <!-- 주소 api -->
  <script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
  <script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
  <script>
    $("#postcodify").postcodify();
    $("#search_button").postcodifyPopUp({
      insertAddress: "#search_button"
    })

  </script>
</body>

</html>
