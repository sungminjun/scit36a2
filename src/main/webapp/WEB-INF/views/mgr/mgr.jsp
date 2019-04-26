<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link rel="icon" type="image/png" href="imgs/favicon.png">
  <title>MinnanoPOS</title>
  <!--     Fonts and icons     -->
  <link href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,600,700,800" rel="stylesheet" />
  <link href="https://use.fontawesome.com/releases/v5.0.6/css/all.css" rel="stylesheet">
  <!-- Nucleo Icons -->
  <link href="./assets/css/nucleo-icons.css" rel="stylesheet" />
  <!-- CSS Files -->
  <link href="./assets/css/black-dashboard.css?v=1.0.0" rel="stylesheet" />
  <!--추가한 파일 jquery ui for chartjs  -->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <!-- CSS~tab관련  Files -->
  <link href="assets/css/test.css" rel="stylesheet" />
  <link href="assets/css/posMain.css" rel="stylesheet" />
  <!--  style for monthpicker show -->
  <style>
    .ui-datepicker-calendar {
      display: none;
    }

  </style>

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

      <!--  content -->
      <div class="content" style="max-height: 70%">

        <div class="row">
          <div class="col-md-12">
            <div class="card">
              <div class="card-body">
                <div class="row">
                  <button class="btn ml-auto mr-auto" id="mgr-btn-1">지출내역 관리</button>
                  <button class="btn ml-auto mr-auto" id="mgr-btn-2">판매메뉴 관리</button>
                  <button class="btn ml-auto mr-auto" id="mgr-btn-3">점내좌석 관리</button>
                  <button class="btn ml-auto mr-auto" id="mgr-btn-4">기본정보 관리</button>
                  <button class="btn ml-auto mr-auto" id="mgr-btn-6">카드매출검증</button>
                  <button class="btn ml-auto mr-auto" id="mgr-btn-5">영업마감 취소</button>
                </div>
              </div>
              <!-- 
              <div class="card-footer">
                <br>아무것도 보여주지 않은 상태 (display:none)에서 버튼 클릭한 obj만 display하게 하고,
                <br>다른 obj는 모두 display:none으로 작업시킨다.
              </div>
 -->
            </div>
          </div>
        </div>

        <div class="row mgr-1" style="display: none;">
          <div class="col-md-12">
            <div class="card">
              <div class="card-header">
                <h5 class="title">지출내역 관리</h5>
              </div>
              <div class="card-body">
                <div class="row">

                  <div class="col-md-6">
                    <div class="row">

                      <div class="col-md-8">
                        <div class="form-group">
                          <label>유형</label>
                          <select class="form-control" id="mgr-1-1" name="expense_type">
                            <option value="0" selected="selected">고정지출</option>
                            <option value="1">변동지출</option>
                            <option value="2">기타</option>
                          </select>
                        </div>
                      </div>
                      <div class="col-md-8">
                        <div class="form-group">
                          <label>날짜</label>
                          <input type="date" class="form-control" id="mgr-1-2" name="expense_date">
                        </div>
                      </div>
                      <div class="col-md-4" id="mgr-1-2-1">
                      </div>
                      <div class="col-md-8">
                        <div class="form-group">
                          <label>설명</label>
                          <input type="text" class="form-control" id="mgr-1-3" name="expense_description">
                        </div>
                      </div>
                      <div class="col-md-4" id="mgr-1-3-1">
                      </div>
                      <div class="col-md-8">
                        <div class="form-group">
                          <label>금액</label>
                          <input type="text" class="form-control" id="mgr-1-4" name="expense_amount">
                        </div>
                      </div>
                      <div class="col-md-4" id="mgr-1-4-1">
                      </div>
                      <div class="col-md-8">
                        <div class="form-group">
                          <button class="btn-default pull-right justify-content-end" id="mgr-btn-1-5" style="display: flex;">등록</button>
                          <button class="btn-default pull-right justify-content-end" id="mgr-btn-1-6" style="display: none;">수정</button>
                          <button class="btn-default pull-right justify-content-end" id="mgr-btn-1-7" style="display: none;">삭제</button>
                        </div>
                      </div>

                    </div>
                  </div>

                  <div class="col-md-6">
                    <div class="row">
                      <div class="col-md-8 input-group">
                        <label>해당월</label>
                        <input type="text" id="datepicker_exp" class="form-control text-center" placeholder="YYYY-MM">
                        <button type="button" class="btn mx-auto" id="search_exp">검색</button>
                      </div>
                    </div>
                    <div class="table-responsive">
                      <table class="table tablesorter table-hover" id="mgr-1-8">
                        <!-- expense list by ajax will be placed here -->
                      </table>
                    </div>
                    <div class="table-responsive" style="max-height: 380px; overflow: auto;">
                      <table class="table tablesorter table-hover" id="mgr-1-8-2">
                        <!-- expense list by ajax will be placed here -->
                      </table>
                    </div>
                  </div>
                </div>
              </div>
              <!-- 
              <div class="card-footer">
                <h5 class="title">
                  관리메뉴 1-footer <br>여기는 2단형식으로, 좌측에는 지출관리 기능 <br>
                  우측에는 지출 내역을 보여주는 모듈이 들어가야한다. <br> 지출을 보여주는 모듈에는,
                  클릭 시 선택한 지출 정보가 좌측 모듈로 표시되어야한다.
                </h5>
              </div> 
-->
            </div>
          </div>
        </div>

        <!--  menu2 메뉴관리 -->
        <div class="row mgr-2" style="display: none;">
          <div class="col-md-12">
            <div class="card">
              <div class="card-header">
                <h5 class="title">판매메뉴 관리</h5>
              </div>

              <div class="card-body">
                <div class="row">

                  <div class="col-md-6">
                    <div class="row">

                      <div class="col-md-8">
                        <div class="form-group">
                          <label>분류</label>
                          <input type="text" class="form-control" id="mgr-2-1" name="menu_category" placeholder="e.g. 식사, 주류, 요리">
                        </div>
                      </div>
                      <div class="col-md-4" id="mgr-2-1-1">
                      </div>

                      <div class="col-md-8">
                        <div class="form-group">
                          <label>이름</label>
                          <input type="text" class="form-control" id="mgr-2-2" name="menu_name" placeholder="e.g. 짜장면, 짬뽕, 탕수육">
                        </div>
                      </div>
                      <div class="col-md-4" id="mgr-2-2-1">
                      </div>

                      <div class="col-md-8">
                        <div class="form-group">
                          <label>가격</label>
                          <input type="text" class="form-control" id="mgr-2-3" name="menu_price" placeholder="가격을 입력하세요.">
                        </div>
                      </div>
                      <div class="col-md-4" id="mgr-2-3-1">
                      </div>

                      <div class="col-md-8">
                        <div class="form-group">
                          <label>판매중</label>
                          <select class="form-control" id="mgr-2-4" name="menu_sellFlag">
                            <option value="1" selected="selected">판매</option>
                            <option value="0">판매중지</option>
                          </select>
                        </div>
                      </div>

                      <div class="col-md-8">
                        <div class="form-group">
                          <button class="btn-default pull-right justify-content-end" id="mgr-btn-2-5" style="display: flex;">등록</button>
                          <button class="btn-default pull-right justify-content-end" id="mgr-btn-2-6" style="display: none;">수정</button>
                          <button class="btn-default pull-right justify-content-end" id="mgr-btn-2-7" style="display: none;">삭제</button>
                        </div>
                      </div>

                    </div>
                  </div>

                  <div class="col-md-6">
                    <ul class="nav nav-tabs nav-fill" id="mgr-2-8">
                      <!-- menu category tabs will be placed here. -->
                    </ul>
                    <div class="tab-content" id="mgr-2-9">
                      <!-- menu lists will be placed here. -->
                    </div>
                  </div>
                </div>
              </div>

            </div>
          </div>
        </div>


        <div class="row mgr-3" style="display: none;">
          <div class="col-md-12">
            <div class="card">
              <div class="card-header">
                <h5 class="title">점내좌석 관리</h5>
              </div>
              <div class="card-body">
                <div class="row">
                  <div class="col-md-3">
                    <div class="form-group">
                      <input type="text" class="form-control" id="mgr-3-1" value="" disabled="disabled">
                    </div>
                  </div>
                  <div class="col-md-2">
                    <div class="form-group">
                      <input type="text" class="form-control" id="mgr-3-2" value="" disabled="disabled">
                    </div>
                  </div>
                  <div class="col-md-2">
                    <div class="form-group">
                      <input type="text" class="form-control" id="mgr-3-3" placeholder="테이블 이름" name="seat_id">
                    </div>
                  </div>
                  <div class="col-md-2">
                    <p id="mgr-3-3-1"></p>
                  </div>
                  <div class="col-md-1">
                    <div class="form-group">
                      <button class="btn-default" id="mgr-btn-3-4">등록</button>
                      <button class="btn-default" id="mgr-btn-3-5" style="display: none;">수정</button>
                    </div>
                  </div>
                  <div class="col-md-1">
                    <div class="form-group">
                      <button class="btn-default" id="mgr-btn-3-6" style="display: none;">삭제</button>
                    </div>
                  </div>
                  <br>
                </div>

                <div class="row">
                  <div class="col-md-6" id="mgr-3-6">

                  </div>
                </div>


              </div>

            </div>

          </div>
        </div>


        <div class="row mgr-4" style="display: none;">
          <div class="col-md-12">
            <div class="card">
              <div class="card-header">
              </div>
              <div class="card-body">
                <div class="row">
                  <button class="btn ml-auto mr-auto" id="mgr-btn-4-1">업체정보 관리</button>
                  <button class="btn ml-auto mr-auto" id="mgr-btn-4-2">본인계정 관리</button>
                  <button class="btn ml-auto mr-auto" id="mgr-btn-4-3">직원계정 관리</button>
                </div>
              </div>
            </div>
          </div>

          <div class="col-md-12">
            <div class="card">
              <div class="card-header">
              </div>

              <div class="card-body">
                <div class="row mgr-4-1" style="display: none;">

                  <form id="mgr-4-1-form" action="updateCompany" method="POST">
                    <div class="col-md-12">
                      <div class="row">
                        <div class="col-md-8">
                          <div class="form-group">
                            <label>사업자등록번호</label>
                            <input type="text" class="form-control" id="mgr-4-1-comp_id" name="comp_id" readonly="readonly">
                          </div>
                        </div>
                        <div class="col-md-8">
                          <div class="form-group">
                            <label>가게이름</label>
                            <input type="text" class="form-control" id="mgr-4-1-comp_name" name="comp_name">
                          </div>
                        </div>
                        <div class="col-md-4" id="mgr-4-1-comp_name_chk">
                        </div>

                        <div class="col-md-8">
                          <div class="form-group">
                            <label>가게전화번호</label>
                            <input type="text" class="form-control" id="mgr-4-1-comp_tel" name="comp_tel">
                          </div>
                        </div>
                        <div class="col-md-4" id="mgr-4-1-comp_tel_chk">
                        </div>

                        <div class="col-md-8">
                          <div class="form-group">
                            <label>가게주소</label>
                            <input type="text" class="form-control" id="mgr-4-1-comp_address" name="comp_address">
                            <!-- <input type="hidden" class="form-control" id="mgr-4-1-comp_address2" name="comp_address2" value="test"> -->

                          </div>
                        </div>
                        <div class="col-md-8">
                          <div class="form-group">
                            <label for="comp_address">세부주소</label>
                            <input type="text" class="form-control" id="mgr-4-1-comp_address2" name="comp_address2">
                          </div>
                        </div>

                        <div class="col-md-8">
                          <div class="form-group">
                            <input type="submit" class="btn-default pull-right justify-content-end" value="수정">
                          </div>
                        </div>

                      </div>
                    </div>
                  </form>

                </div>

                <div class="row mgr-4-2" style="display: none;">

                  <form id="mgr-4-2-form" action="updateOwner" method="POST">
                    <div class="col-md-12">
                      <div class="row">
                        <div class="col-md-8">
                          <div class="form-group">
                            <label>대표자ID</label>
                            <input type="text" class="form-control" id="mgr-4-2-emp_id" name="emp_id" readonly="readonly">
                          </div>
                        </div>
                        <div class="col-md-8">
                          <div class="form-group">
                            <label>이름</label>
                            <input type="text" class="form-control" id="mgr-4-2-emp_name" name="emp_name">
                          </div>
                        </div>
                        <div class="col-md-4" id="mgr-4-2-emp_name_chk">
                        </div>

                        <div class="col-md-8">
                          <div class="form-group">
                            <label>비밀번호</label>
                            <input type="password" class="form-control" id="mgr-4-2-emp_pw" name="emp_pw">
                          </div>
                        </div>
                        <div class="col-md-4" id="mgr-4-2-emp_pw_chk">
                          정보를 수정하시려면 이전 비밀번호를 꼭 입력하십시오.
                        </div>

                        <div class="col-md-8">
                          <div class="form-group">
                            <label>새로운 비밀번호</label>
                            <input type="password" class="form-control" id="mgr-4-2-emp_new_pw" name="emp_new_pw">
                          </div>
                        </div>
                        <div class="col-md-4" id="mgr-4-2-emp_new_pw_chk">
                        </div>

                        <div class="col-md-8">
                          <div class="form-group">
                            <label>비밀번호 확인</label>
                            <input type="password" class="form-control" id="mgr-4-2-emp_new_pw2" name="emp_new_pw2">
                          </div>
                        </div>
                        <div class="col-md-4" id="mgr-4-2-emp_new_pw2_chk">
                        </div>

                        <div class="col-md-8">
                          <div class="form-group">
                            <label>전화번호</label>
                            <input type="text" class="form-control" id="mgr-4-2-emp_tel" name="emp_tel">
                          </div>
                        </div>
                        <div class="col-md-4" id="mgr-4-2-emp_tel_chk">
                        </div>

                        <div class="col-md-8">
                          <div class="form-group">
                            <input type="submit" class="btn-default pull-right justify-content-end" value="수정">
                          </div>
                        </div>

                      </div>
                    </div>
                  </form>

                </div>


                <div class="row mgr-4-3" style="display: none;">

                  <div class="col-md-6">
                    <div class="card" id="infomng">직원관리
                    </div>

                    <div class="table-responsive">
                      <table class="table tablesorter table-hover" id="">
                        <thead class=" text-primary">
                          <tr>
                            <th class="text-center" style="width: 20%">id</th>
                            <th class="text-center" style="width: 30%">이름</th>
                            <th class="text-center" style="width: 30%">연락처</th>
                          </tr>
                        </thead>
                        <tbody class="mgr-4-3-table">
                        </tbody>
                      </table>
                    </div>

                  </div>
                  <div class="col-md-6">

                    <form id="mgr-4-3-form" action="registMember" method="POST">
                      <div class="col-md-12">
                        <div class="row">
                          <div class="col-md-8">
                            <div class="form-group">
                              <label>ID</label>
                              <input type="text" class="form-control" id="mgr-4-3-emp_id" name="emp_id">
                            </div>
                          </div>
                          <div class="col-md-4" id="mgr-4-3-emp_id_chk">
                          </div>


                          <div class="col-md-8">
                            <div class="form-group">
                              <label>비밀번호</label>
                              <input type="password" class="form-control" id="mgr-4-3-emp_pw" name="emp_pw">
                            </div>
                          </div>
                          <div class="col-md-4" id="mgr-4-3-emp_pw_chk">
                          </div>

                          <!-- <div class="col-md-8">
                            <div class="form-group">
                              <label>비밀번호 확인</label>
                              <input type="password" class="form-control" id="mgr-4-3-emp_pw2" name="emp_pw2">
                            </div>
                          </div>
                          <div class="col-md-4" id="mgr-4-3-emp_pw2_chk">
                          </div> -->

                          <div class="col-md-8">
                            <div class="form-group">
                              <label>이름</label>
                              <input type="text" class="form-control" id="mgr-4-3-emp_name" name="emp_name">
                            </div>
                          </div>
                          <div class="col-md-4" id="mgr-4-3-emp_name_chk">
                          </div>

                          <div class="col-md-8">
                            <div class="form-group">
                              <label>전화번호</label>
                              <input type="text" class="form-control" id="mgr-4-3-emp_tel" name="emp_tel">
                            </div>
                          </div>
                          <div class="col-md-4" id="mgr-4-3-emp_tel_chk">
                          </div>

                          <div class="col-md-8">
                            <div class="form-group">
                              <input type="submit" class="btn-default pull-right justify-content-end" id="mgr-4-3-btn-submit" value="등록">
                            </div>
                          </div>

                        </div>
                      </div>
                    </form>

                  </div>




                </div>


                <div class="card-footer">
                </div>
              </div>
            </div>
          </div>


        </div>
        <footer class="footer"> </footer>
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
  <!--추가한 파일 jquery ui for chartjs  -->
  <script src="//code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
  <!-- <script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script> -->
  <script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
  <script>
    $("#postcodify").postcodify();
    $("#mgr-4-1-comp_address").postcodifyPopUp({
      insertAddress: "#mgr-4-1-comp_address"
    })

  </script>

  <script>
    $(document).ready(function() {
      $("button[id=mgr-btn-1]").on('click', function() {
        mgrshow('1');
      });
      $("button[id=search_exp]").on('click', function() {
        loadexps()
      });
      $("button[id=mgr-btn-1-5]").on('click', addexps);
      $("button[id=mgr-btn-1-6]").on('click', modifyexps);
      $("button[id=mgr-btn-1-7]").on('click', deleteexps);

      $("button[id=mgr-btn-2]").on('click', function() {
        mgrshow('2')
      });
      $("button[id=mgr-btn-2-5]").on('click', addmenu);
      $("button[id=mgr-btn-2-6]").on('click', modifymenu);
      $("button[id=mgr-btn-2-7]").on('click', deletemenu);

      $("button[id=mgr-btn-3]").on('click', function() {
        mgrshow('3')
      });
      $("button[id=mgr-btn-3-4]").on('click', addseat);
      $("button[id=mgr-btn-3-5]").on('click', modifyseat);
      $("button[id=mgr-btn-3-6]").on('click', deleteseat);

      $("button[id=mgr-btn-4]").on('click', function() {
        mgrshow('4')
      });
      $("button[id=mgr-btn-4-1]").on('click', function() {
        mgr4show('1')
      });
      $("button[id=mgr-btn-4-2]").on('click', function() {
        mgr4show('2')
      });
      $("button[id=mgr-btn-4-3]").on('click', function() {
        mgr4show('3')
      });
      $("button[id=mgr-btn-5]").on('click', function() {
        cancel_close();
      });
      $("button[id=mgr-btn-6]").on('click', function() {
        document.location.href = 'cardverify';
      });
    })

    function setdatepicker() {
      $("#datepicker_exp").datepicker({
        dateFormat: 'yy-mm',
        defaultDate: 0,
        changeMonth: true,
        changeYear: true,
        showButtonPanel: true,
        onClose: function(dateText, inst) {
          $(this).datepicker('setDate', new Date(inst.selectedYear, inst.selectedMonth, 1));
        }
      });
    }

    function mgrshow(param) {
      if (param == 1) {
        $('.mgr-1').css('display', 'flex');
        setdatepicker();
        setdatetodaydefault();
        loadexps();
      } else {
        $('.mgr-1').css('display', 'none');
      }

      if (param == 2) {
        $('.mgr-2').css('display', 'flex');
        loadmenu();
      } else {
        $('.mgr-2').css('display', 'none');
      }

      if (param == 3) {
        $('.mgr-3').css('display', 'flex');
        loadseat();
      } else {
        $('.mgr-3').css('display', 'none');
      }

      if (param == 4) $('.mgr-4').css('display', 'flex');
      else $('.mgr-4').css('display', 'none');

    }

    function loadexps() {
      var month = $('#datepicker_exp').val();
      senddata = {
        month: month
      }
      $.ajax({
        url: 'selectExpense',
        method: 'POST',
        data: senddata,
        success: function(resp) {
          $('#mgr-1-8').html('');
          $('#mgr-1-8-2').html('');
          var output = '';
          var output2 = '';
          output += '<thead class=" text-primary" style="table-layout:fixed;"><tr><th class="text-center" style="width: 30%;">일시</th><th class="text-center" style="width: 45%;">명세</th><th class="text-center" style="width: 25%;">금액</th></tr></thead>';
          $('#mgr-1-8').html(output);
          output2 += '<tbody>'
          $.each(resp, function(idx, obj) {
            output2 += '<tr s-expseq="' + obj.expense_seq + '" s-exptype="' + obj.expense_type + '" s-exp-regex="' + obj.expense_date + '|' + obj.expense_description + '|' + obj.expense_amount + '">';
            output2 += '<td style="width: 30%;">' + obj.expense_date + '</td><td style="width: 45%;">' + obj.expense_description + '</td><td style="width: 25%;">' + obj.expense_amount + '</td>';
            output2 += '</tr>';
          })
          output2 += '</tbody>'
          $('#mgr-1-8-2').html(output2);
          $.each(resp, function(idx, obj) {
            var temp = 'tr[s-expseq=' + obj.expense_seq + ']';
            $(temp).on('click', callexps);
          })

          $('#mgr-1-1').val('0');
          setdatetodaydefault();
          $('#mgr-1-3').val('');
          $('#mgr-1-4').val('');

        }
      });
    }

    var expense_seq;
    // 일단 점내 좌석관리에서 선택한 seat_seq를 공유하기 위해 이렇게 전역변수로 넣었지만,
    // class에 selected같이 보이지 않는 임의의 속성을 부여해서 선택자로 가져오는 방법도 있을 듯 하다.

    function callexps() {
      expense_seq = $(this).attr('s-expseq');
      var expregex = $(this).attr('s-exp-regex');
      var exparr = expregex.split('|')

      console.log(exparr)

      $('#mgr-1-1').val($(this).attr('s-exptype'));
      $('#mgr-1-2').val(exparr[0]);
      $('#mgr-1-3').val(exparr[1]);
      $('#mgr-1-4').val(exparr[2]);

      $("button[id=mgr-btn-1-5]").css('display', 'none');
      $("button[id=mgr-btn-1-6]").css('display', 'flex');
      $("button[id=mgr-btn-1-7]").css('display', 'flex');
    }

    function addexps() {
      if (chk_exp() == 'dont') {
        return false;
      }
      var expense_type = $('#mgr-1-1').val();
      var expense_date = $('#mgr-1-2').val()
      var expense_description = $('#mgr-1-3').val()
      var expense_amount = $('#mgr-1-4').val()
      var senddata = {
        expense_type: expense_type,
        expense_date: expense_date,
        expense_description: expense_description,
        expense_amount: expense_amount
      };
      console.log(senddata);

      $.ajax({
        url: 'insertExpense',
        method: 'POST',
        data: {
          expense_type: expense_type,
          expense_date: expense_date,
          expense_description: expense_description,
          expense_amount: expense_amount
        },
        success: loadexps
      });
    }

    function modifyexps() {
      if (chk_exp() == 'dont') {
        return false;
      }
      var expense_type = $('#mgr-1-1').val();
      var expense_date = $('#mgr-1-2').val()
      var expense_description = $('#mgr-1-3').val()
      var expense_amount = $('#mgr-1-4').val()

      $.ajax({
        url: 'updateExpense',
        method: 'POST',
        data: {
          'expense_seq': expense_seq,
          'expense_type': expense_type,
          'expense_date': expense_date,
          'expense_description': expense_description,
          'expense_amount': expense_amount
        },
        success: function() {
          $("button[id=mgr-btn-1-5]").css('display', 'flex');
          $("button[id=mgr-btn-1-6]").css('display', 'none');
          $("button[id=mgr-btn-1-7]").css('display', 'none');
          loadexps();
        }
      });
    }

    function deleteexps() {
      $.ajax({
        url: 'deleteExpense',
        method: 'POST',
        data: {
          'expense_seq': expense_seq
        },
        success: function() {
          $("button[id=mgr-btn-3-4]").css('display', 'flex');
          $("button[id=mgr-btn-3-5]").css('display', 'none');
          $("button[id=mgr-btn-3-6]").css('display', 'none');
          loadexps();
        }
      });
    }



    function loadmenu() {
      var cat = [];
      $.ajax({
        url: 'selectMenu',
        method: 'POST',
        success: function(resp) {
          $.each(resp, function(i, obj) {
            if (cat.indexOf(obj.menu_category) === -1) {
              cat.push(obj.menu_category)
            }
          })

          // 여기부터 tab부분 
          var output = '';
          $.each(cat, function(i, obj) {
            output += ''
            if (i == 0) {
              output += '<li class="active">'
            } else {
              output += '<li>'
            }
            output += '<a data-toggle="tab" href="#' + obj + '">' + obj + '</a></li>'
            output += '</li>'
          })
          $('#mgr-2-8').html(output);

          // 여기부터 탭 밑의 tab-pane
          var output2 = '';
          $.each(cat, function(i, obj) {
            if (i === 0) {
              output2 += '<div id="' + obj + '" class="tab-pane active">';
            } else {
              output2 += '<div id="' + obj + '" class="tab-pane fade">';
            }
            // output2 += '<h3>' + obj + '</h3>';
            // 여기까지 카테고리를 기준으로 뿌린다

            // 이중포문, 여기부터 카테고리와 같은 속성일 때 목록에 올린다.
            var chker = 0;
            $.each(resp, function(idx, obj2) {
              if (obj == obj2.menu_category) {
                var sellstat = (obj2.menu_sellFlag == 0) ? '*판매중단*' : '판매중';
                if (chker % 3 === 0) output2 += '<div class="row">';
                output2 += '<div class="col-md-4"><button class="menu_select_button" s-menuseq="' + obj2.menu_seq + '" s-menu-regex="' + obj + '|' + obj2.menu_name + '|' + obj2.menu_price + '|' + obj2.menu_sellFlag + '">' + obj2.menu_name + '<br>' + obj2.menu_price + '<br>' + sellstat + '</button></div>';
                if (chker % 3 === 2) output2 += '</div>';
                // 이거 의미 없고 그냥 i끝나는 시점에 div한번 더 닫음
                // if ( chker-1 === resp.length ) output2 += '</div>'; 
                chker++;
              }
            })

            output2 += '</div></div>';
          });

          $('#mgr-2-9').html(output2);

          $.each(resp, function(idx, obj3) {
            var temp = 'button[s-menuseq=' + obj3.menu_seq + ']';
            $(temp).on('click', selectmenu);
          });
        }
      })
    }

    function addmenu() {
      var menu_category = $('#mgr-2-1').val();
      var menu_name = $('#mgr-2-2').val();
      var menu_price = $('#mgr-2-3').val();
      var menu_sellFlag = $('#mgr-2-4').val();

      $.ajax({
        url: 'insertMenu',
        method: 'POST',
        data: {
          menu_category: menu_category,
          menu_name: menu_name,
          menu_price: menu_price,
          menu_sellFlag: menu_sellFlag
        },
        success: loadmenu
      });

      $('#mgr-2-1').val('');
      $('#mgr-2-2').val('');
      $('#mgr-2-3').val('');
      $('#mgr-2-4').val('1');
    }

    var menu_seq;
    // 일단 점내 좌석관리에서 선택한 seat_seq를 공유하기 위해 이렇게 전역변수로 넣었지만,
    // class에 selected같이 보이지 않는 임의의 속성을 부여해서 선택자로 가져오는 방법도 있을 듯 하다.

    function selectmenu() {
      menu_seq = $(this).attr('s-menuseq');
      var menu = $(this).attr('s-menu-regex');
      var menuarr = menu.split('|')

      console.log(menu_seq + ', ' + menu + ', ' + menuarr[0] + ', ' + menuarr[1] + ', ' + menuarr[2] + ', ' + menuarr[3]);
      $('#mgr-2-1').val(menuarr[0]);
      $('#mgr-2-2').val(menuarr[1]);
      $('#mgr-2-3').val(menuarr[2]);
      $('#mgr-2-4').val(menuarr[3]);

      $("button[id=mgr-btn-2-5]").css('display', 'none');
      $("button[id=mgr-btn-2-6]").css('display', 'flex');
      $("button[id=mgr-btn-2-7]").css('display', 'flex');
    }

    function modifymenu() {
      var menu_category = $('#mgr-2-1').val();
      var menu_name = $('#mgr-2-2').val();
      var menu_price = $('#mgr-2-3').val();
      var menu_sellFlag = $('#mgr-2-4').val();

      $.ajax({
        url: 'updateMenu',
        method: 'POST',
        data: {
          'menu_seq': menu_seq,
          'menu_category': menu_category,
          'menu_name': menu_name,
          'menu_price': menu_price,
          'menu_sellFlag': menu_sellFlag
        },
        success: function() {
          $("button[id=mgr-btn-2-5]").css('display', 'flex');
          $("button[id=mgr-btn-2-6]").css('display', 'none');
          $("button[id=mgr-btn-2-7]").css('display', 'none');
          loadmenu();
        }
      });
    }

    function deletemenu() {
      $.ajax({
        url: 'deleteMenu',
        method: 'POST',
        data: {
          'menu_seq': menu_seq
        },
        success: function() {
          $("button[id=mgr-btn-3-4]").css('display', 'flex');
          $("button[id=mgr-btn-3-5]").css('display', 'none');
          $("button[id=mgr-btn-3-6]").css('display', 'none');
          loadmenu();
        }
      });
    }



    function loadseat() {
      $.ajax({
        url: 'selectseat',
        method: 'POST',
        success: function(resp) {
          var rmbr = [];
          $.each(resp, function(idx, obj) {
            if (obj.seat_id.substr(0, 3) == '[X]') {
              rmbr.push(idx);
            }
          })
          console.log(rmbr);
          for (i = rmbr.length - 1; i >= 0; i--) {
            resp.splice(rmbr[i], 1);
          }
          console.log(resp);

          $('#mgr-3-3').val('');
          var totalSeats = Object.keys(resp).length;
          $('#mgr-3-2').val('총 좌석 수 : ' + totalSeats);

          var devider = 2;
          var size = '150px';

          if (totalSeats <= 9) {
            devider = 3;
            size = '125px';
          } else if (totalSeats <= 16) {
            devider = 4;
            size = '100px';
          } else if (totalSeats <= 25) {
            devider = 5;
            size = '75px';
          } else {
            devider = 6;
            size = '60px';
          }

          var output = '';
          $.each(resp, function(idx, obj) {
            if ((idx % devider) == 0) {
              if (idx != 0) {
                output += '</div>';
              }
              output += '<div class="row">';
            }
            output += '<button class="btn-default seatseq" style="width: ' + size + '; height:' + size + '; margin: 5px;" s-seatseq=' + obj.seat_seq + '>' + obj.seat_id + '</button>'
          });
          if (output.substr(output.length - 6, 6) != '</div>') {
            output += '</div>';
          }
          $('#mgr-3-6').html(output);
          $.each(resp, function(idx, obj) {
            var temp = 'button[s-seatseq=' + obj.seat_seq + ']';
            $(temp).on('click', selectseat);
          });
        }
      });


      $.ajax({
        url: 'selectCompanyOne',
        method: 'POST',
        success: function(resp) {
          $('#mgr-3-1').val('업체명 : ' + resp.comp_name);
        }
      });

    }

    function addseat() {
      if (chk_seat() == 'dont') {
        return false;
      }

      var seat_id = $('#mgr-3-3').val();
      $.ajax({
        url: 'addtable',
        method: 'POST',
        data: {
          'seat_id': seat_id
        },
        success: loadseat
      });
    }

    var seat_seq = '';
    // 일단 점내 좌석관리에서 선택한 seat_seq를 공유하기 위해 이렇게 전역변수로 넣었지만,
    // class에 selected같이 보이지 않는 임의의 속성을 부여해서 선택자로 가져오는 방법도 있을 듯 하다.

    function selectseat() {
      seat_seq = $(this).attr('s-seatseq');
      var seat_id = $(this).text();
      console.log(seat_id);
      $('#mgr-3-3').val(seat_id)
      $("button[id=mgr-btn-3-4]").css('display', 'none');
      $("button[id=mgr-btn-3-5]").css('display', 'flex');
      $("button[id=mgr-btn-3-6]").css('display', 'flex');
    }

    function modifyseat() {
      if (chk_seat() == 'dont') {
        return false;
      }
      var seat_id = $('#mgr-3-3').val();
      $.ajax({
        url: 'updateseat',
        method: 'POST',
        data: {
          'seat_seq': seat_seq,
          'seat_id': seat_id
        },
        success: function() {
          $("button[id=mgr-btn-3-4]").css('display', 'flex');
          $("button[id=mgr-btn-3-5]").css('display', 'none');
          $("button[id=mgr-btn-3-6]").css('display', 'none');
          loadseat();
        }
      });
    }


    function deleteseat() {
      $.ajax({
        url: 'deleteseat',
        method: 'POST',
        data: {
          'seat_seq': seat_seq
        },
        success: function() {
          $("button[id=mgr-btn-3-4]").css('display', 'flex');
          $("button[id=mgr-btn-3-5]").css('display', 'none');
          $("button[id=mgr-btn-3-6]").css('display', 'none');
          loadseat();
        }
      });
    }

    function mgr4show(param) {
      if (param == 1) {
        $('.mgr-4-1').css('display', 'flex');
        $.ajax({
          url: 'selectCompanyOne',
          method: 'POST',
          success: function(resp) {
            $('#mgr-4-1-comp_id').val(resp.comp_id);
            $('#mgr-4-1-comp_name').val(resp.comp_name);
            $('#mgr-4-1-comp_tel').val(resp.comp_tel);
            $('#mgr-4-1-comp_address').val(resp.comp_address);
            $('#mgr-4-1-comp_address2').val(resp.comp_address2);
          }
        })
      } else {
        $('.mgr-4-1').css('display', 'none');
      }

      if (param == 2) {
        $('.mgr-4-2').css('display', 'flex');
        $.ajax({
          url: 'selectOwner',
          method: 'POST',
          success: function(resp) {
            $('#mgr-4-2-emp_id').val(resp.emp_id);
            $('#mgr-4-2-emp_name').val(resp.emp_name);
            $('#mgr-4-2-emp_tel').val(resp.emp_tel);
            $('#mgr-4-2-emp_pw').attr('placeholder', '정보를 수정하시려면 비밀번호를 입력하십시오.');
            $('#mgr-4-2-emp_new_pw').attr('placeholder', '비밀번호를 확인하십시오.');
            $('#mgr-4-2-emp_new_pw2').attr('placeholder', '비밀번호를 확인하십시오.');
          }
        });
      } else {
        $('.mgr-4-2').css('display', 'none');
      }

      if (param == 3) {
        $('.mgr-4-3').css('display', 'flex');
        $.ajax({
          url: 'selectEmployeeList',
          method: 'POST',
          success: function(resp) {
            $('.mgr-4-3-table').html('');
            $.each(resp, function(idx, obj) {
              var output = '';
              output += '<tr s-empseq="' + obj.emp_seq + '">';
              output += '<td class="text-center">' + obj.emp_id + '</td><td class="text-center">' + obj.emp_name + '</td><td class="text-center">' + obj.emp_tel + '</td>';
              output += '</tr>';
              $('.mgr-4-3-table').append(output);
              var temp = 'tr[s-empseq=' + obj.emp_seq + ']';
              $(temp).on('click', callModifyMember);
            })
          }
        })
      } else {
        $('.mgr-4-3').css('display', 'none');
      }
    }

    function callModifyMember() {
      var chk = $(this).attr('s-empseq');
      $.ajax({
        url: 'selectEmployee',
        method: 'POST',
        data: {
          'emp_seq': chk
        },
        success: function(resp) {
          console.log(resp);
          $('#mgr-4-3-emp_id').val(resp.emp_id).attr('readonly', 'readonly');
          $('#mgr-4-3-emp_name').val(resp.emp_name);
          $('#mgr-4-3-emp_tel').val(resp.emp_tel);
          $('#mgr-4-3-emp_pw').val(resp.emp_pw);
          $('#mgr-4-3-emp_pw2').attr('placeholder', '수정하려면 새로운 비밀번호를 입력하십시오.');
          $('#mgr-4-3-btn-submit').val('수정');
          $('#mgr-4-3-form').attr('action', 'updateEmployee')
        }
      });
    }

    function deleteMember() {

    }

    function setdatetodaydefault() {
      var date = new Date();

      var day = date.getDate();
      var month = date.getMonth() + 1;
      var year = date.getFullYear();

      if (month < 10) month = "0" + month;
      if (day < 10) day = "0" + day;
      var today = year + "-" + month + "-" + day;
      var thismonth = year + "-" + month;
      $("#mgr-1-2").val(today);
      $('#datepicker_exp').val(thismonth);
    }

    function cancel_close() {
      var str = '';
      var senddata = '';
      var chker = 0;
      $.ajax({
        url: 'selectCashonhand',
        method: 'post',
        success: function(resp) {
          console.log(resp)
          $.each(resp, function(idx, obj) {
            if (obj.cashonhand_type == 4) {
              str = obj.cashonhand_register + '님이 ' + obj.cashonhand_regdate + '에 등록한 마감정보(마감금액: ' + obj.cashonhand_cash + ', 오차금액' + obj.cashonhand_error + ')를 삭제하시고 마감을 취소하시겠습니까?';
              senddata = {
                "cashonhand_seq": obj.cashonhand_seq
              }
              var conf = confirm(str);
              if (conf == true) {
                $.ajax({
                  url: 'deleteCashonhand',
                  method: 'post',
                  data: senddata,
                  success: function(resp) {
                    alert('영업 마감정보를 삭제하고 마감을 취소합니다.');
                  }
                })
              } else {
                alert('영업마감 요청을 취소합니다.');
                return false;
              }
              chker++;
            } else if (idx == resp.length - 1 && chker == 0) {
              alert('영업 마감정보가 존재하지 않습니다.');
              return false;
            }
          })
        }
      })
    }

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

    //최철규 지출관련 유효성검사
    $(document).ready(function() {
      // addexp/modifyexp 에 넣어둠 chk_exp 연결해둠
      // 지출관련 2 
      $("#mgr-1-3").keyup(chk_exp_desc);
      $("#mgr-1-4").keyup(chk_exp_amount);
      // 메뉴관련 3
      $("#mgr-2-1").keyup(chk_menu_cate);
      $("#mgr-2-2").keyup(chk_menu_name);
      $("#mgr-2-3").keyup(chk_menu_price);
      // 좌석관련 1
      $("#mgr-3-3").keyup(chk_seat_id);
      // 업체정보관련 2
      $("#mgr-4-1-comp_name").keyup(comp_name_chk);
      $("#mgr-4-1-comp_tel").keyup(comp_tel_chk);
      // 사장정보관련
      $("#mgr-4-2-emp_name").keyup(repr_name_chk);
      $("#mgr-4-2-emp_new_pw").keyup(repr_new_pw_chk);
      $("#mgr-4-2-emp_new_pw2").keyup(repr_new_pw2_chk);
      $("#mgr-4-2-emp_tel").keyup(repr_tel_chk);
      // 사장정보 submit 방지
      $("#mgr-4-2-form").on("submit", function(event) {
        event.preventDefault();
        repr_submit_chk();
      })

      $("#mgr-4-3-emp_id").keyup(emp_id_chk);
      $("#mgr-4-3-emp_pw").keyup(emp_pw_chk);
      $("#mgr-4-3-emp_pw2").keyup(emp_pw2_chk);
      $("#mgr-4-3-emp_name").keyup(emp_name_chk);
      $("#mgr-4-3-emp_tel").keyup(emp_tel_chk);

      $("#mgr-4-3-form").on("submit", function(event) {
        event.preventDefault();
        if ($("#mgr-4-3-form").attr('action') == 'registMember') {
          emp_submit_chk(1);
        } else if ($("#mgr-4-3-form").attr('action') == 'updateEmployee')
          emp_submit_chk(2);
      })

    })

    function chk_exp() {
      var exp_desc = $('#mgr-1-3').val();
      var exp_amount = $('#mgr-1-4').val()
      var regexp = /^[0-9]+$/;
      if (exp_desc.length > 25 || exp_desc.trim().length == 0 || !regexp.test(exp_amount) || exp_amount.trim().length == 0) {
        return 'dont';
      }
      return 'do';
    }

    function chk_exp_desc() {
      var exp_desc = $('#mgr-1-3').val();
      if (exp_desc.length > 25) {
        $('#mgr-1-3-1').html('내용이 너무 깁니다.').css('color', 'red');
      } else if (exp_desc.length < 3) {
        $('#mgr-1-3-1').html('내용이 너무 짧습니다. 3글자 이상 입력해주세요.').css('color', 'red');
      } else if (exp_desc.trim().length == 0) {
        $('#mgr-1-3-1').html('내용을 입력해주세요').css('color', 'red');
      } else {
        $('#mgr-1-3-1').html('').css('color', 'blue');
      }
    }

    function chk_exp_amount() {
      var exp_amount = $('#mgr-1-4').val()
      console.log(exp_amount)
      var regexp = /^[0-9]+$/g;
      if (!regexp.test(exp_amount)) {
        $('#mgr-1-4-1').html('금액은 숫자만 입력가능합니다.').css('color', 'red');
        var new_amount = exp_amount.replace(/[^0-9]+$/g, '')
        $('#mgr-1-4').val(new_amount);
        return false;
      } else if (exp_amount.trim().length == 0) {
        $('#mgr-1-4-1').html('금액을 입력해주세요').css('color', 'red');
        return false;
      } else {
        $('#mgr-1-4-1').html('').css('color', 'blue');
      }
    }

    function chk_menu_cate() {
      var menu_cate = $('#mgr-2-1').val();
      if (menu_cate.length > 25) {
        $('#mgr-2-1-1').html('내용이 너무 깁니다.').css('color', 'red');
      } else if (menu_cate.length < 2) {
        $('#mgr-2-1-1').html('내용이 너무 짧습니다. 2글자 이상 입력해주세요.').css('color', 'red');
      } else if (menu_cate.trim().length == 0) {
        $('#mgr-2-1-1').html('내용을 입력해주세요').css('color', 'red');
      } else {
        $('#mgr-2-1-1').html('').css('color', 'blue');
      }
    }

    function chk_menu_name() {
      var menu_name = $('#mgr-2-2').val();
      if (menu_name.length > 25) {
        $('#mgr-2-2-1').html('내용이 너무 깁니다.').css('color', 'red');
      } else if (menu_name.length < 2) {
        $('#mgr-2-2-1').html('내용이 너무 짧습니다. 2글자 이상 입력해주세요.').css('color', 'red');
      } else if (menu_name.trim().length == 0) {
        $('#mgr-2-2-1').html('내용을 입력해주세요').css('color', 'red');
      } else {
        $('#mgr-2-2-1').html('').css('color', 'blue');
      }
    }

    function chk_menu_price() {
      var menu_price = $('#mgr-2-3').val()
      console.log(menu_price)
      var regexp = /^[0-9]+$/g;
      if (!regexp.test(menu_price)) {
        $('#mgr-2-3-1').html('금액은 숫자만 입력가능합니다.').css('color', 'red');
        var replac = menu_price.replace(/[^0-9]+$/g, '')
        $('#mgr-2-3').val(replac);
        return false;
      } else if (menu_price.trim().length == 0) {
        $('#mgr-2-3-1').html('금액을 입력해주세요').css('color', 'red');
        return false;
      } else {
        $('#mgr-2-3-1').html('').css('color', 'blue');
      }
    }

    function chk_seat() {
      var seat_id = $('#mgr-3-3').val();
      if (seat_id.length < 2 || seat_id.trim().length == 0 || seat_id.length > 10) {
        return 'dont';
      }
      return 'do';
    }

    function chk_seat_id() {
      var seat_id = $('#mgr-3-3').val();
      if (seat_id.length > 10) {
        $('#mgr-3-3-1').html('좌석 이름이 너무 깁니다.').css('color', 'red');
      } else if (seat_id.length < 2) {
        $('#mgr-3-3-1').html('너무 짧습니다. 2글자 이상 입력해주세요.').css('color', 'red');
      } else if (seat_id.trim().length == 0) {
        $('#mgr-3-3-1').html('내용을 입력해주세요').css('color', 'red');
      } else {
        $('#mgr-3-3-1').html('').css('color', 'blue');
      }
    }

    function comp_name_chk() {
      var comp_name = $('#mgr-4-1-comp_name').val();
      if (comp_name.length > 10) {
        $('#mgr-4-1-comp_name_chk').html('좌석 이름이 너무 깁니다.').css('color', 'red');
      } else if (comp_name.length < 2) {
        $('#mgr-4-1-comp_name_chk').html('너무 짧습니다. 2글자 이상 입력해주세요.').css('color', 'red');
      } else if (comp_name.trim().length == 0) {
        $('#mgr-4-1-comp_name_chk').html('내용을 입력해주세요').css('color', 'red');
      } else {
        $('#mgr-4-1-comp_name_chk').html('').css('color', 'blue');
      }
    }

    function comp_tel_chk() {
      var comp_tel = $('#mgr-4-1-comp_tel').val();
      var regexp = /^[0-9-]+$/g;
      if (!regexp.test(comp_tel)) {
        $('#mgr-4-1-comp_tel_chk').html('숫자만 입력하세요.').css('color', 'red');
        var replac = comp_tel.replace(/[^0-9]+$/g, '')
        $('#mgr-4-1-comp_tel').val(replac);
        return false;
      } else if (comp_tel.trim().length == 0) {
        $('#mgr-4-1-comp_tel_chk').html('전화번호를 입력해주세요').css('color', 'red');
        return false;
      } else {
        $('#mgr-4-1-comp_tel_chk').html('').css('color', 'blue');
      }
    }

    function repr_name_chk() {
      var emp_name = $('#mgr-4-2-emp_name').val();
      var regexp = /^[가-힣]*$/g;
      if (!regexp.test(emp_name)) {
        $('#mgr-4-2-emp_name_chk').html('한글만 입력하세요.').css('color', 'red');
        var replac = emp_name.replace(/[^가-힣]*$/g, '')
        console.log(replac)
        $('#mgr-4-2-emp_name').val(replac);
        return false;
      } else if (emp_name.trim().length == 0) {
        $('#mgr-4-2-emp_name_chk').html('대표자 이름을 입력해주세요').css('color', 'red');
        return false;
      } else {
        $('#mgr-4-2-emp_name_chk').html('').css('color', 'blue');
      }
    }

    function repr_new_pw_chk() {
      var pw1 = $("#mgr-4-2-emp_new_pw").val();
      if (pw1.length < 4 || pw1.length > 20) {
        $("#mgr-4-2-emp_new_pw_chk").text("비밀번호는 최소 4자, 최대 20자입니다").css('color', 'red');
      } else {
        $("#mgr-4-2-emp_new_pw_chk").text("이 비밀번호를 사용하셔도 좋습니다.").css('color', 'green');
      }
    }

    function repr_new_pw2_chk() {
      var pw1 = $("#mgr-4-2-emp_new_pw").val();
      var pw2 = $("#mgr-4-2-emp_new_pw2").val();

      if (pw1 == pw2) {
        if (pw1.length < 4 || pw1.length > 20 || pw2.length < 4 || pw2.length > 20) {
          $("#mgr-4-2-emp_new_pw2_chk").text("비밀번호를 다시한번 확인해주세요.").css("color", "red");
        } else {
          $("#mgr-4-2-emp_new_pw2_chk").text("비밀번호 확인이 완료되었습니다.").css("color", "green");
        }
      } else {
        $("#mgr-4-2-emp_new_pw2_chk").text("비밀번호를 다시한번 확인해주세요.").css("color", "red");
      }
    }

    function repr_tel_chk() {
      var emp_tel = $('#mgr-4-2-emp_tel').val();
      var regexp = /^[0-9-]+$/g;
      if (!regexp.test(emp_tel)) {
        $('#mgr-4-2-emp_tel_chk').html('숫자만 입력하세요.').css('color', 'red');
        var replac = emp_tel.replace(/[^0-9]+$/g, '')
        $('#mgr-4-2-emp_tel').val(replac);
        return false;
      } else if (emp_tel.trim().length == 0) {
        $('#mgr-4-2-emp_tel_chk').html('전화번호를 입력해주세요').css('color', 'red');
        return false;
      } else {
        $('#mgr-4-2-emp_tel_chk').html('').css('color', 'blue');
      }
    }

    function repr_submit_chk() {
      var emp_pw = $("#mgr-4-2-emp_pw").val();
      var emp_name = $('#mgr-4-2-emp_name').val();
      var emp_tel = $('#mgr-4-2-emp_tel').val();
      var emp_new_pw = $("#mgr-4-2-emp_new_pw").val();
      var pw2 = $("#mgr-4-2-emp_new_pw2").val();

      if (emp_pw.length == 0) {
        alert("먼저 이전 비밀번호를 입력하고 정보를 수정하십시오.");
        return false;
      }
      if (emp_new_pw.length < 4 || emp_new_pw.length > 20 || pw2.length < 4 || pw2.length > 20 || emp_new_pw != pw2) {
        alert("변경하려는 비밀번호를 다시 한번 확인해주십시오.");
        return false;
      } else {

        var map = {
          "emp_name": emp_name,
          "emp_pw": emp_pw,
          "emp_tel": emp_tel,
          "emp_new_pw": emp_new_pw
        }

        $.ajax({
          url: 'updateOwner',
          type: 'POST',
          data: JSON.stringify(map),
          dataType: 'text',
          contentType: 'application/json; charset=UTF-8',
          success: function(resp) {
            if (resp == 'success') {
              document.location.reload();
            } else {
              $('#mgr-4-2-emp_pw_chk').text('비밀번호가 틀렸습니다. 정보를 수정할 수 없습니다.').css('color', 'red');
            }
          }
        })
      }
    }

    function emp_id_chk() {
      var emp_id = $("#mgr-4-3-emp_id").val();

      if (emp_id.length < 4 || emp_id.length > 10) {
        $("#mgr-4-3-emp_id_chk").text("id는 4자 이상, 10자 이하만 가능합니다.").css('color', 'red');
      } else {
        $.ajax({
          url: 'chk_emp_id',
          data: {
            emp_id: emp_id
          },
          method: 'POST',
          success: function(resp) {
            if (resp == 'success') {
              $("#mgr-4-3-emp_id_chk").text("사용 가능한 아이디 입니다.").css("color", "green");
            } else {
              $("#mgr-4-3-emp_id_chk").text("이미 사용중인 아이디입니다.").css("color", "red");
            }
          }
        })
      }
    }

    function emp_pw_chk() {
      var emp_pw = $("#mgr-4-3-emp_pw").val();
      if (emp_pw.length < 4 || emp_pw.length > 20) {
        $("#mgr-4-3-emp_pw_chk").text("비밀번호는 최소 4자, 최대 20자입니다").css('color', 'red');
      } else {
        $("#mgr-4-3-emp_pw_chk").text("이 비밀번호를 사용하셔도 좋습니다.").css('color', 'green');
      }
    }

    function emp_pw2_chk() {
      var emp_pw = $("#mgr-4-3-emp_pw").val();
      var emp_pw2 = $("#mgr-4-3-emp_pw2").val();

      if (emp_pw == emp_pw2) {
        if (emp_pw.length < 4 || emp_pw.length > 20 || emp_pw2.length < 4 || emp_pw2.length > 20) {
          $("#mgr-4-3-emp_pw2_chk").text("비밀번호를 다시한번 확인해주세요.").css("color", "red");
        } else {
          $("#mgr-4-3-emp_pw2_chk").text("비밀번호 확인이 완료되었습니다.").css("color", "green");
        }
      } else {
        $("#mgr-4-3-emp_pw2_chk").text("비밀번호를 다시한번 확인해주세요.").css("color", "red");
      }
    }

    function emp_name_chk() {
      var emp_name = $("#mgr-4-3-emp_name").val();
      var regexp = /^[가-힣]*$/g;
      if (!regexp.test(emp_name)) {
        $('#mgr-4-3-emp_name_chk').html('한글만 입력하세요.').css('color', 'red');
        var replac = emp_name.replace(/[^가-힣]*$/g, '')
        console.log(replac)
        $('#mgr-4-3-emp_name').val(replac);
        return false;
      } else if (emp_name.trim().length == 0) {
        $('#mgr-4-3-emp_name_chk').html('이름을 한글로 입력해주세요').css('color', 'red');
        return false;
      } else {
        $('#mgr-4-3-emp_name_chk').html('').css('color', 'blue');
      }

    }

    function emp_tel_chk() {
      var emp_tel = $("#mgr-4-3-emp_tel").val();
      var regexp = /^[0-9-]+$/g;
      if (!regexp.test(emp_tel)) {
        $('#mgr-4-3-emp_tel_chk').html('숫자만 입력하세요.').css('color', 'red');
        var replac = emp_tel.replace(/[^0-9]+$/g, '')
        $('#mgr-4-3-emp_tel').val(replac);
        return false;
      } else if (emp_tel.trim().length == 0) {
        $('#mgr-4-3-emp_tel_chk').html('전화번호를 입력해주세요').css('color', 'red');
        return false;
      } else {
        $('#mgr-4-3-emp_tel_chk').html('').css('color', 'blue');
      }
    }

    function emp_submit_chk(param) {
      var emp_id = $("#mgr-4-3-emp_id").val();
      var emp_pw = $("#mgr-4-3-emp_pw").val();
      var emp_pw2 = $("#mgr-4-3-emp_pw2").val();
      var emp_name = $("#mgr-4-3-emp_name").val();
      var emp_tel = $("#mgr-4-3-emp_tel").val();
      var senddata = {
        emp_id: emp_id,
        emp_pw: emp_pw,
        emp_name: emp_name,
        emp_tel: emp_tel
      };

      if (param == 1) {
        $.ajax({
          url: 'registMember',
          method: 'POST',
          data: senddata,
          success: function(resp) {
            if (resp == 'success') {
              document.location.reload();
            } else {
              alert('가입이 정상적으로 진행되지 않았습니다. 확인하고 다시 시도하여 주십시오.')
            }
          }
        })
      } else {
        $.ajax({
          url: 'updateEmployee',
          method: 'POST',
          data: senddata,
          success: function(resp) {
            if (resp == 'success') {
              document.location.reload();
            } else {
              alert('정보수정이 정상적으로 처리되지 않았습니다. 확인하고 다시 시도하여 주십시오.')
            }
          }
        })
      }
    }

  </script>
</body>

</html>
