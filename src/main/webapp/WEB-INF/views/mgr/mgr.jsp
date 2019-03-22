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
          <a href="javascript:void(0)" class="simple-text logo-normal"> MP </a>
        </div>
        <ul class="nav">
          <li>
            <a href="#">
              <i class="tim-icons icon-money-coins" title="포스 / Enter POS"></i>
            </a>
            <br><br>
          </li>
          <li>
            <a href="#">
              <i class="tim-icons icon-settings-gear-63" title="설정 / settings"></i>
              <!-- <i class="material-icons">settings</i> -->
            </a>
            <br><br>
          </li>
          <li>
            <a href="#">
              <i class="tim-icons icon-chat-33" title="커뮤니티 / community"></i>
            </a>
            <br> <br>
          </li>
          <li>
            <a href="#">
              <i class="tim-icons icon-chart-pie-36" title="보고서 / reports"></i>
            </a>
            <br> <br> <br> <br> <br>
          </li>
          <li>
            <a href="#">
              <i class="tim-icons icon-button-power" title="로그아웃 / logout"></i>
              <!-- <i class="material-icons">power_settings_new</i> -->
            </a>
          </li>
        </ul>
      </div>
    </div>

    <div class="main-panel" data="blue">

      <!--  content -->
      <div class="content">

        <!--  menu1 지출관리 -->
        <div class="row">
          <div class="col-md-12">
            <div class="card">
              <div class="card-body">
                <div class="row">
                  <button type="submit" class="btn ml-auto mr-auto">지출내역 관리</button>
                  <button type="submit" class="btn ml-auto mr-auto">판매메뉴 관리</button>
                  <button type="submit" class="btn ml-auto mr-auto">점내좌석 관리</button>
                  <button type="submit" class="btn ml-auto mr-auto">업체정보 관리</button>
                </div>
              </div>
              <div class="card-footer">
                <br>아무것도 보여주지 않은 상태 (display:none)에서 버튼 클릭한 obj만 display하게 하고,
                <br>다른 obj는 모두 display:none으로 작업시킨다.
              </div>
            </div>
          </div>
        </div>

        <div class="row">
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
        <div class="row">
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



            <div class="row">
              <div class="col-md-12">
                <div class="card">
                  <div class="card-header">
                    <h5 class="title">점내좌석 관리</h5>
                  </div>
                  <div class="card-body">
                    <div class="row">
                      <div class="col-md-3">
                        <div class="form-group">
                          <input type="text" class="form-control" value="업체명: 호정이네" disabled="disabled">
                        </div>
                      </div>
                      <div class="col-md-2">
                        <div class="form-group">
                          <input type="text" class="form-control" value="좌석 수 : 5" disabled="disabled">
                        </div>
                      </div>
                      <div class="col-md-3">
                        <div class="form-group">
                          <input type="text" class="form-control" placeholder="등록할/수정할 테이블 이름">
                        </div>
                      </div>
                      <div class="col-md-2">
                        <div class="form-group">
                          <button class="btn-default">등록/수정</button>
                        </div>
                      </div>
                      <div class="col-md-2">
                        <div class="form-group">
                          <button class="btn-default btn-md">삭제</button>
                        </div>
                      </div>
                      <br>
                      <h5 class="title">
                        여기가 상부 menubar <br>클릭에 따라 정보 수정을 하는 input이나
                        등록하는 input을 띄워준다.
                      </h5>
                    </div>

                    <div class="row">
                      <div class="col-md-12">
                        <h5 class="title">
                          여기가 하부 테이블 일람,<br> 여기는 전체 table 수에 따라
                          자동으로 3*3 3*4 4*4 4*5 5*5 5*6 6*6 등의 grid계산
                        </h5>
                        <button class="btn-secondary" style="width: 70px; height: 70px">홀1</button>
                        <button class="btn-secondary" style="width: 70px; height: 70px">홀2</button>
                        <button class="btn-secondary" style="width: 70px; height: 70px">홀3</button>
                        <button class="btn-secondary" style="width: 70px; height: 70px">홀4</button>
                        <button class="btn-secondary" style="width: 70px; height: 70px">홀5</button>
                        <button class="btn-secondary" style="width: 70px; height: 70px; background: green;">+</button>
                      </div>
                    </div>

                  </div>
                  <div class="card-footer">
                    <h5 class="title">
                      관리메뉴 3-footer
                      <br>여기도 마+-찬가지로 상부 메뉴-바(header)에는 테이블 현황이 보여야 하고,
                      <br> 추가하기 버튼을 눌러서 modal 로 이름입력과 등록을 띄우고
                      <br> model이 끝나면 refresh해서 결과를 보여준다.
                      <br> 결과를 보여주면서는 눌렀을 때 작동할 수 있도록 수정삭제버튼 modal을 띄우거나 한다.
                    </h5>
                  </div>
                </div>
              </div>
            </div>
            <div class="row">
              <div class="col-md-12">
                <div class="card">
                  <div class="card-header">
                    <h5 class="title">개인정보 관리</h5>
                  </div>

                  <div class="card-body">
                    <div class="row">
                      <button type="submit" class="btn ml-auto mr-auto">업체정보 관리</button>
                      <button type="submit" class="btn ml-auto mr-auto">본인계정 관리</button>
                      <button type="submit" class="btn ml-auto mr-auto">직원계정 관리</button>
                    </div>

                    <div class="row">

                      <div class="col-md-6">
                        <div class="card" id="infomng">member list/account info/account list by ajax
                        </div>

                        <div class="table-responsive">
                          <table class="table tablesorter " id="">
                            <thead class=" text-primary">
                              <tr>
                                <th class="text-center">사업자등록번호</th>
                                <th class="text-center">무언가</th>
                                <th class="text-center">무언가</th>
                              </tr>
                            </thead>
                            <tbody>
                              <tr>
                                <td>예시1</td>
                                <td>예시1 - 모든 tr에 onclick 으로 좌측form들 내용 replace하고
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

                    </div>

                  </div>


                  <div class="card-footer">
                    <h5 class="title">
                      관리메뉴 4-footer
                      <br>여기에 가게정보 / 사장id정보 / 종업원id 관리 선택용 메뉴-바 하나 더 넣고,
                      <br>다시 밑에 창에서는 정보수정 버튼 또는 등록추가로 이동할 수 있도록 만들어내야한다.
                    </h5>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <footer class="footer"> </footer>
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
