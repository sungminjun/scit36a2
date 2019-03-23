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
      <div class="content">

        <div class="row">
          <div class="col-md-12">
            <div class="card">
              <div class="card-body">
                <div class="row">
                  <button class="btn ml-auto mr-auto" id="mgr-btn-1">지출내역 관리</button>
                  <button class="btn ml-auto mr-auto" id="mgr-btn-2">판매메뉴 관리</button>
                  <button class="btn ml-auto mr-auto" id="mgr-btn-3">점내좌석 관리</button>
                  <button class="btn ml-auto mr-auto" id="mgr-btn-4">업체정보 관리</button>
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

                      <div class="col-md-10">
                        <div class="form-group">
                          <label>form1</label>
                          <input type="text" class="form-control" placeholder="form1">
                        </div>
                      </div>
                      <div class="col-md-10">
                        <div class="form-group">
                          <label>form2</label>
                          <input type="text" class="form-control" placeholder="form2">
                        </div>
                      </div>
                      <div class="col-md-10">
                        <div class="form-group">
                          <label>form3</label>
                          <input type="text" class="form-control" placeholder="form3">
                        </div>
                      </div>
                      <div class="col-md-10">
                        <div class="form-group">
                          <label>form4</label>
                          <input type="text" class="form-control" placeholder="form4">
                        </div>
                      </div>
                      <div class="col-md-10">
                        <div class="form-group">
                          <button class="btn-default pull-right justify-content-end">등록/수정/삭제</button>
                        </div>
                      </div>

                    </div>
                  </div>

                  <div class="col-md-6">
                    <div class="card" id="explist">expense list by ajax
                    </div>

                    <div class="table-responsive">
                      <table class="table tablesorter " id="">
                        <thead class=" text-primary">
                          <tr>
                            <th class="text-center">일시</th>
                            <th class="text-center">명세</th>
                            <th class="text-center">금액</th>
                          </tr>
                        </thead>
                        <tbody>
                          <tr>
                            <td>예시1</td>
                            <td>예시1 - 모든 tr에 onclick 으로 좌측 form들 내용 replace하고
                              <br> 버튼 이름 바꿀 수 있어야한다.
                            </td>
                            <td>$36,738</td>
                          </tr>
                          <tr>
                            <td>예시2</td>
                            <td>예시2 - hover일때 음영지게 하는 것도 필요할 것 같다.</td>
                            <td>$23,789</td>
                          </tr>
                        </tbody>
                      </table>
                    </div>

                  </div>

                  <!--  row end below /div -->
                </div>

                <!--  card-body end below /div -->
              </div>

              <div class="card-footer">
                <h5 class="title">
                  관리메뉴 1-footer <br>여기는 2단형식으로, 좌측에는 지출관리 기능 <br>
                  우측에는 지출 내역을 보여주는 모듈이 들어가야한다. <br> 지출을 보여주는 모듈에는,
                  클릭 시 선택한 지출 정보가 좌측 모듈로 표시되어야한다.
                </h5>
              </div>

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

                      <div class="col-md-10">
                        <div class="form-group">
                          <label>form1</label>
                          <input type="text" class="form-control" placeholder="form1">
                        </div>
                      </div>
                      <div class="col-md-10">
                        <div class="form-group">
                          <label>form2</label>
                          <input type="text" class="form-control" placeholder="form2">
                        </div>
                      </div>
                      <div class="col-md-10">
                        <div class="form-group">
                          <label>form3</label>
                          <input type="text" class="form-control" placeholder="form3">
                        </div>
                      </div>
                      <div class="col-md-10">
                        <div class="form-group">
                          <label>form4</label>
                          <input type="text" class="form-control" placeholder="form4">
                        </div>
                      </div>
                      <div class="col-md-10">
                        <div class="form-group">
                          <button class="btn-default pull-right justify-content-end">등록/수정/삭제</button>
                        </div>
                      </div>

                    </div>
                  </div>

                  <div class="col-md-6">
                    <div class="card" id="explist">expense list by ajax
                    </div>

                    <div class="card-body">
                      <ul class="nav nav-tabs nav-fill">
                        <li class="active">
                          <a data-toggle="tab" href="#">Category1 // </a>
                        <li>
                          <a data-toggle="tab" href="#">Cate2 // </a>
                        <li>
                          <a data-toggle="tab" href="#">Cate3 // </a>
                        <li>
                          <a data-toggle="tab" href="#">Cate4 // </a>
                      </ul>
                      <div class="tab-content">
                        <div id="cat1" class="tab-pane active">
                          <h3>Cat 1</h3>
                          <p>- 카테고리명은 select distinct 로 카테고리를 불러와서 뿌려준다.</p>
                          <button class="btn-secondary">짜장면<br>4,000원<br>판매중</button>
                          <button class="btn-secondary">짬뽕<br>4,000원<br>판매중</button>
                          <button class="btn-secondary">울면<br>3,500원<br>판매중</button>
                          <button class="btn-secondary">기스면<br>4,000원<br>판매중</button>
                          <button class="btn-secondary">볶음밥<br>5,000원<br>판매중</button>
                          <button class="btn-secondary">수정방<br>100,000원<br>판매중</button>
                          <button class="btn-secondary">빼갈<br>3,000원<br>판매중</button>
                          <button class="btn-secondary">소주<br>3,000원<br>판매중</button>
                          <button class="btn-secondary">맥주<br>4,000원<br>판매중</button>
                        </div>
                        <div id="cat2" class="tab-pane fade">
                          <h3>Cat 2</h3>
                          <p>Some content in cat2.</p>
                        </div>
                        <div id="cat3" class="tab-pane fade">
                          <h3>Cat 3</h3>
                          <p>Some content in cat3.</p>
                        </div>
                        <div id="cat4" class="tab-pane fade">
                          <h3>Cat 4</h3>
                          <p>Some content in cat4.</p>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>

              <div class="card-footer">
                <h5 class="title">
                  관리메뉴 2-footer <br>여기는 2단형식으로 좌측에는 메뉴관리 기능 <br>우측에는
                  메뉴 판을 보여주는 모듈이 들어가야한다. <br>메뉴를 보여주는 모듈에는, 클릭
                  시 선택한 메뉴의 상세정보가 좌측 모듈로 들어간다.
                </h5>
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
                  <div class="col-md-3">
                    <div class="form-group">
                      <input type="text" class="form-control" id="mgr-3-3" placeholder="등록할 테이블 이름" name="seat_id">
                    </div>
                  </div>
                  <div class="col-md-2">
                    <div class="form-group">
                      <button class="btn-default" id="mgr-btn-3-4">등록</button>
                      <button class="btn-default" id="mgr-btn-3-5" style="display: none;">수정</button>
                    </div>
                  </div>
                  <div class="col-md-2">
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
                      <div class="col-md-4">
                        길이제한 유효성검사 _js_ will be placed here.
                      </div>

                      <div class="col-md-8">
                        <div class="form-group">
                          <label>가게전화번호</label>
                          <input type="text" class="form-control" id="mgr-4-1-comp_tel" name="comp_tel">
                        </div>
                      </div>
                      <div class="col-md-4">
                        길이제한 유효성검사 _js_ will be placed here.
                      </div>

                      <div class="col-md-8">
                        <div class="form-group">
                          <label>가게주소</label>
                          <input type="text" class="form-control" id="mgr-4-1-comp_address" name="comp_address">
                          <input type="hidden" class="form-control" id="mgr-4-1-comp_address2" name="comp_address2" value="test">
                        </div>
                      </div>
                      <div class="col-md-4">
                        도로명주소API will be placed here.
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
                          <label>사장ID</label>
                          <input type="text" class="form-control" id="mgr-4-2-emp_id" name="emp_id" readonly="readonly">
                        </div>
                      </div>
                      <div class="col-md-8">
                        <div class="form-group">
                          <label>이름</label>
                          <input type="text" class="form-control" id="mgr-4-2-emp_name" name="emp_name">
                        </div>
                      </div>
                      <div class="col-md-4">
                        난또까노 유효성검사 _js_ will be placed here.
                      </div>

                      <div class="col-md-8">
                        <div class="form-group">
                          <label>비밀번호</label>
                          <input type="password" class="form-control" id="mgr-4-2-emp_pw" name="emp_pw">
                        </div>
                      </div>
                      <div class="col-md-4">
                        *정보수정을 위해서는 최소한 비밀번호가 입력되어야 한다.
                        난또까노 유효성검사 _js_ will be placed here.
                      </div>

                      <div class="col-md-8">
                        <div class="form-group">
                          <label>새로운 비밀번호</label>
                          <input type="password" class="form-control" id="mgr-4-2-emp_new_pw" name="emp_new_pw">
                        </div>
                      </div>
                      <div class="col-md-4">
                        *비밀번호 변경을 위해서는 검사를 거쳐야 한다.
                        비밀번호 doublecheck _js_ will be placed here.
                      </div>

                      <div class="col-md-8">
                        <div class="form-group">
                          <label>비밀번호 확인</label>
                          <input type="password" class="form-control" id="mgr-4-2-emp_new_pw2" name="emp_new_pw2">
                        </div>
                      </div>
                      <div class="col-md-4">
                        *비밀번호 변경을 위해서는 검사를 거쳐야 한다.
                        비밀번호 doublecheck _js_ will be placed here.
                      </div>

                      <div class="col-md-8">
                        <div class="form-group">
                          <label>전화번호</label>
                          <input type="text" class="form-control" id="mgr-4-2-emp_tel" name="emp_tel">
                        </div>
                      </div>
                      <div class="col-md-4">
                        난또까노 유효성검사 _js_ will be placed here.
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

                        <div class="col-md-8">
                          <div class="form-group">
                            <label>비밀번호</label>
                            <input type="password" class="form-control" id="mgr-4-3-emp_pw" name="emp_pw">
                          </div>
                        </div>
                        <div class="col-md-4">
                          난또까노 유효성검사 _js_ will be placed here.
                        </div>

                        <div class="col-md-8">
                          <div class="form-group">
                            <label>비밀번호 확인</label>
                            <input type="password" class="form-control" id="mgr-4-3-emp_pw2" name="emp_pw2">
                          </div>
                        </div>
                        <div class="col-md-4">
                          비밀번호 doublecheck _js_ will be placed here.
                        </div>

                        <div class="col-md-8">
                          <div class="form-group">
                            <label>이름</label>
                            <input type="text" class="form-control" id="mgr-4-3-emp_name" name="emp_name">
                          </div>
                        </div>
                        <div class="col-md-4">
                          난또까노 유효성검사 _js_ will be placed here.
                        </div>

                        <div class="col-md-8">
                          <div class="form-group">
                            <label>전화번호</label>
                            <input type="text" class="form-control" id="mgr-4-3-emp_tel" name="emp_tel">
                          </div>
                        </div>
                        <div class="col-md-4">
                          난또까노 유효성검사 _js_ will be placed here.
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


  <script>
    $(document).ready(function() {
      $("button[id=mgr-btn-1]").on('click', function() {
        mgrshow('1')
      });
      $("button[id=mgr-btn-2]").on('click', function() {
        mgrshow('2')
      });
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

    })

    function mgrshow(param) {
      if (param == 1) $('.mgr-1').css('display', 'flex');
      else $('.mgr-1').css('display', 'none');
      if (param == 2) $('.mgr-2').css('display', 'flex');
      else $('.mgr-2').css('display', 'none');
      if (param == 3) {
        $('.mgr-3').css('display', 'flex');
        loadseat();
      } else {
        $('.mgr-3').css('display', 'none');
      }
      if (param == 4) $('.mgr-4').css('display', 'flex');
      else $('.mgr-4').css('display', 'none');
    }

    function loadseat() {
      $.ajax({
        url: 'selectseat',
        method: 'POST',
        success: function(resp) {
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
              output += '<td>' + obj.emp_id + '</td><td>' + obj.emp_name + '</td><td>' + obj.emp_tel + '</td>';
              output += '</tr>';
              $('.mgr-4-3-table').append(output);
              var temp = 'tr[s-empseq=' + obj.emp_seq + ']';
              $(temp).on('click', callModifyMember);
            })
          }
        });
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

  </script>
</body>

</html>
