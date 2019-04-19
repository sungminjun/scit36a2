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
  <!-- CSS~join.css -->
  <link href="./assets/css/member/join.css" rel="stylesheet" />
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
            </a> <br> <br></li>
          <li><a href="mgr"> <i class="tim-icons icon-settings-gear-63" title="설정 / settings"></i>
            </a> <br> <br></li>
          <li><a href="board"> <i class="tim-icons icon-chat-33" title="커뮤니티 / community"></i>
            </a> <br> <br></li>
          <li><a href="report"> <i class="tim-icons icon-chart-pie-36" title="보고서 / report"></i>
            </a> <br> <br> <br> <br> <br></li>
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
                        <label for="comp_id" id="comp_id">사업자 등록번호</label>
                        <input type="text" class="form-control" name="comp_id" id="company_Id">
                      </div>
                    </div>
                    <div class="col-md-4" id="company_IdResult"></div>
                  </div>

                  <div class="row justify-content-center">
                    <div class="col-md-6">
                      <div class="form-group">
                        <label for="comp_name">가게 이름</label>
                        <input id="company_name" type="text" class="form-control" name="comp_name">
                        <!--  
                          <br>
                          <span class="error_box" id="company_name_Msg" style role="alert"></span> -->
                      </div>
                    </div>
                    <div class="col-md-4"></div>
                  </div>

                  <div class="row justify-content-center">
                    <div class="col-md-6">
                      <div class="form-group">
                        <label for="comp_tel">가게 전화번호</label>
                        <input type="text" class="form-control" name="comp_tel">
                      </div>
                    </div>
                    <div class="col-md-4"></div>
                  </div>

                  <div class="row justify-content-center">
                    <div class="col-md-6">
                      <div class="form-group">
                        <label for="comp_address">주소</label>
                        <input type="text" class="form-control" name="comp_address" id="search_button" value="">
                      </div>
                    </div>
                    <div class="col-md-4"></div>
                  </div>

                  <div class="row justify-content-center">
                    <div class="col-md-6">
                      <div class="form-group">
                        <label for="comp_address">세부주소</label>
                        <input type="text" class="form-control" name="comp_address2">
                      </div>
                    </div>
                    <div class="col-md-4"></div>
                  </div>
                  <hr>

                  <div class="row justify-content-center">
                    <div class="col-md-6">
                      <div class="form-group">
                        <label for="emp_id">ID</label>
                        <input type="text" class="form-control" name="emp_id" id="emp_id">
                      </div>
                    </div>
                    <div class="col-md-4" id="chkidresult"></div>
                  </div>

                  <div class="row justify-content-center">
                    <div class="col-md-6">
                      <div class="form-group">
                        <label for="emp_pw">PASSWORD</label>
                        <input type="password" class="form-control" name="emp_pw" id="emp_pw">
                      </div>
                    </div>
                    <div class="col-md-4" id="chkpw1result"></div>
                  </div>

                  <div class="row justify-content-center">
                    <div class="col-md-6">
                      <div class="form-group">
                        <label for="emp_pw2">PASSWORD 재확인</label>
                        <input type="password" class="form-control" name="emp_pw2" id="emp_pw2">
                      </div>
                    </div>
                    <div class="col-md-4" id="chkpw2result"></div>
                  </div>

                  <div class="row justify-content-center">
                    <div class="col-md-6">
                      <div class="form-group">
                        <label for="emp_name">이름</label>
                        <input type="text" class="form-control" name="emp_name">
                      </div>
                    </div>
                    <div class="col-md-4"></div>
                  </div>

                  <div class="row justify-content-center">
                    <div class="col-md-6">
                      <div class="form-group">
                        <label for="emp_tel">전화번호</label>
                        <input type="text" class="form-control" name="emp_tel">
                      </div>
                    </div>
                    <div class="col-md-4"></div>
                  </div>

                  <div class="row justify-content-center">
                    <div class="col-md-6">
                      <div class="form-group">
                        <label for="emp_quiz">비밀번호 찾기 질문</label><br />
                        <select id="emp_quiz" name="emp_quiz">
                          <option class="question_select" selected="selected" disabled>질문을 골라주세요</option>
                          <option class="question_select">민트초코 호? 불호?</option>
                          <option class="question_select">부먹입니까? 찍먹입니까?</option>
                          <option class="question_select">육개장 큰사이즈 먹는 사람은 뭐다?</option>
                          <option class="question_select">아이즈원 장원영 VS 레드벨벳 아이린</option>
                        </select>
                      </div>
                    </div>
                    <div class="col-md-4"></div>
                    <!--
											<div class="form-group">
												<label for="emp_quiz">비밀번호 찾기 질문</label> <input type="text"
													class="form-control" name="emp_quiz">
											</div>
										</div>
										<div class="col-md-4">quiz는 dropdown목록에서 선택하는 것은 어떨지
											생각해볼 것</div>
                      -->
                  </div>

                  <div class="row justify-content-center">
                    <div class="col-md-6">
                      <label for="emp_quiz_answer">비밀번호 찾기 답</label>
                    </div>
                    <div class="col-md-4"></div>
                  </div>

                  <div class="row justify-content-center">
                    <div class="col-md-6">
                      <input type="text" class="form-control" name="emp_quiz_answer">
                    </div>
                    <div class="col-md-4"></div>
                  </div>

                  <div class="row justify-content-center" id="join_footer">
                    <div class="col-md-4">
                      <input type="reset" id="join_cancel_btn" value="취소">
                    </div>
                    <div class="col-md-4">
                      <input type="submit" id="join_enroll_button" value="회원가입">
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
  <!-- <script src="resources/jquery-3.3.1.min.js"></script> -->
  <script>
    $("#postcodify").postcodify();
    $("#search_button").postcodifyPopUp({
      insertAddress: "#search_button"
    })

  </script>

  <script>
    $(function() {
      $("#company_Id").on("focusout", company_Idcheck);
      $("#emp_id").on("focusout", chkid); // chkidresult
      $("#emp_pw").keyup(chkpw1); // chkpw1result
      $("#emp_pw2").keyup(chkpw2); // chkpw2result
    });

    function company_Idcheck() {
      var comp_id = $("#company_Id").val();
      var regexp = /^[0-9]+$/;

      if (!regexp.test(comp_id)) {
        $("#company_IdResult").text("아이디는 숫자만 입력가능합니다.");
        /* $("#company_IdResult").attr("style","color:#f00; position: relative; vertical-align: middle;  background: #f9f28e"); */
        $("#company_Id").css("background-color", "#FFCECE");
        var replac = exp_amount.replace(/[^0-9]+$/g, '')
        $('#company_Id').val(replac);

        return false;
      }
      if (comp_id.length != 10) {
        $("#company_Id").css("background-color", "#FFCECE");
        $("#company_IdResult").text("사업자 등록번호 10자리를 입력해주세요");
        $("#company_IdResult").attr("style", "color:#f00");
        return false;
      }

      $.ajax({
        data: {
          comp_id: comp_id
        },
        url: "checkComp_id",
        method: "POST",
        success: function(data) {
        	console.log(data);
        	if (data == 'fail') {
        		$("#company_Id").css("background-color", "#FFCECE")/* .css("color", "red") */;
                $("#company_IdResult").text("중복되는 ID 입니다").css("color", "red");
        	} else {
          $("#company_Id").css("background-color", "#B0F6AC").css("color", "black")/* .attr('readonly', 'readonly') */;
          $("#company_IdResult").text("사용 가능한 아이디 입니다.").attr("style","color:#00f");
        	}
        }
      });
    }

    function chkid() {
      var emp_id = $("#emp_id").val();

      if (emp_id.length < 4 || emp_id.length > 10) {
        $("#chkidresult").text("id는 4자 이상, 10자 이하만 가능합니다.").css('color', 'red');
      } else {
        $.ajax({
          url: 'chk_emp_id',
          data: {
            emp_id: emp_id
          },
          method: 'POST',
          success: function() {
            $("#chkidresult").text("사용 가능한 아이디 입니다.").css("color", "green");
          },
          failure: function() {
            $("#chkidresult").text("이미 사용중인 아이디입니다.").css("color", "red");
          }
        })
      }
    }

    function chkpw1() {
      var pw1 = $("#emp_pw").val();
      if (pw1.length < 4 || pw1.length > 20) {
        $("#chkpw1result").text("비밀번호는 최소 4자, 최대 20자입니다").css('color', 'red');
      } else {
        $("#chkpw1result").text("이 비밀번호를 사용하셔도 좋습니다.").css('color', 'green');
      }
    }

    function chkpw2() {
      var pw1 = $("#emp_pw").val();
      var pw2 = $("#emp_pw2").val();

      if (pw1 == pw2) {
        if (pw1.length < 4 || pw1.length > 20 || pw2.length < 4 || pw2.length > 20) {
          $("#chkpw2result").text("비밀번호를 다시한번 확인해주세요.").css("color", "red");
        } else {
          $("#chkpw2result").text("비밀번호 확인이 완료되었습니다.").css("color", "green");
        }
      } else {
        $("#chkpw2result").text("비밀번호를 다시한번 확인해주세요.").css("color", "red");
      }
    }

  </script>


</body>

</html>
