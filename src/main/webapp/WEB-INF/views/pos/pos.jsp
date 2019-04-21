<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
  content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="icon" type="image/png" href="imgs/favicon.png">
<title>MinnanoPOS</title>
<!--     Fonts and icons     -->
<link
  href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,600,700,800"
  rel="stylesheet" />
<link href="https://use.fontawesome.com/releases/v5.0.6/css/all.css"
  rel="stylesheet">
<!-- Nucleo Icons -->
<link href="./assets/css/nucleo-icons.css" rel="stylesheet" />
<!-- CSS Files -->
<link href="./assets/css/black-dashboard.css?v=1.0.0" rel="stylesheet" />
<!--추가한 파일 jquery ui for chartjs  -->
<link rel="stylesheet"
  href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<!-- CSS~tab관련  Files -->
<link href="assets/css/test.css" rel="stylesheet" />
<link href="assets/css/posMain.css" rel="stylesheet" />
</head>

<body class="white-content">
  <div class="wrapper">
    <div class="sidebar" data="blue">
      <div class="sidebar-wrapper">
        <div class="logo">
          <a href="${pageContext.request.contextPath}"
            class="simple-text logo-normal"> MP </a>
        </div>
        <ul class="nav">
          <li><a href="pos"> <i
              class="tim-icons icon-money-coins"
              title="포스기능 / Enter POS"></i>
          </a> <br>
          <br></li>
          <li><a href="mgr"> <i
              class="tim-icons icon-settings-gear-63"
              title="설정 / settings"></i>
          </a> <br>
          <br></li>
          <li><a href="board"> <i
              class="tim-icons icon-chat-33" title="커뮤니티 / community"></i>
          </a> <br>
          <br></li>
          <li><a href="report"> <i
              class="tim-icons icon-chart-pie-36" title="보고서 / report"></i>
          </a> <br>
          <br> <br>
          <br>
          <br></li>
          <li><a href="logout"> <i
              class="tim-icons icon-button-power" title="로그아웃 / logout"
              aria-label="logout"></i>
          </a></li>
        </ul>
      </div>
    </div>


    <div class="main-panel" data="blue">
      <div class="content">
        <div class="row">
          <div class="col-md-12">
            <div class="card">
              <!-- 현재 로그인한 회사의 이름 -->
              <div class="row box">
                <div class="col-md-3">
                  <input type="text" class="form-control text-center"
                    id="pos-1-1" value="company name"
                    disabled="disabled">
                </div>
                <!-- 현재 로그인한 직원의 이름 -->
                <div class="col-md-3">
                  <input type="text" class="form-control text-center"
                    id="pos-1-2" value="user name" disabled="disabled">
                </div>
                <!-- 현재 로그인한 회사의 전체 좌석수 -->
                <div class="col-md-3">
                  <input type="text" class="form-control text-center"
                    id="pos-1-3" value="total seats" disabled="disabled">
                </div>
                <!-- 현재 로그인한 회사의 가용 좌석수 -->
                <div class="col-md-3">
                  <input type="text" class="form-control text-center"
                    id="pos-1-4" value="occupied seats"
                    disabled="disabled">
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="row" id="pos-upper">
          <div class="col-md-6" id="seatsgrid">
            <div class="card">
              <div class="card-header"></div>
              <div class="card-body">
                <div class="row">
                  <div class="col-md-12" id="pos-1-5">
                    <!-- seats grid will be placed here -->
                  </div>
                </div>
              </div>
              <div class="card-footer"></div>
            </div>
          </div>
          <div class="col-md-6" id="pmtlog" style="display: none;">
            <div class="card">
              <div class="card-header">결제내역조회</div>
              <div class="card-body">
                <div class="row">
                  <div class="col-md-8 input-group">
                    <label>조회일자</label> <input type="text"
                      id="datepicker_pmtlist"
                      class="form-control text-center"
                      placeholder="YYYY-MM-DD">
                    <button type="button" class="btn mx-auto"
                      id="search_pmtlist">검색</button>
                  </div>
                </div>
                <div class="row">
                  <div class="table-responsive">
                    <table class="table tablesorter table-hover">
                      <thead class=" text-primary"
                        style="table-layout: fixed;">
                        <tr>
                          <th class="text-center" style="width: 30%;">일시</th>
                          <th class="text-center" style="width: 30%;">등록자</th>
                          <th class="text-center" style="width: 20%;">유형</th>
                          <th class="text-center" style="width: 20%;">금액</th>
                        </tr>
                      </thead>
                    </table>
                  </div>
                  <div class="table-responsive"
                    style="max-height: 380px; overflow: auto;">
                    <!-- <div class="col-md-12"> -->
                    <table class="table tablesorter table-hover"
                      id="pos-1-6">
                      <!-- payment log grid will be placed here -->
                    </table>
                  </div>
                </div>
              </div>
              <div class="card-footer"></div>
            </div>
          </div>
          <div class="col-md-6">
            <div class="card">
              <div class="card-header"></div>
              <div class="card-body box">
                <div class="row">
                  <div class="col-md-3 mx-auto">
                    <input type="button" value="테이블이동" id="pos-2-1">
                  </div>
                  <div class="col-md-3 mx-auto">
                    <input type="button" value="테이블교환" id="pos-2-2">
                  </div>
                  <div class="col-md-3 mx-auto">
                    <input type="button" value="테이블합치기" id="pos-2-3">
                  </div>
                  <div class="col-md-3 mx-auto">
                    <input type="button" value="기능취소" id="pos-2-4">
                  </div>
                </div>
                <br>
                <div class="row">
                  <!-- <div class="col-md-2 mx-auto form-control" id="pos-2-5">
                    <h5 class="title">버튼5</h5>
                  </div>
                  <div class="col-md-2 mx-auto form-control" id="pos-2-6">
                    <h5 class="title">버튼6</h5>
                  </div>
                  <div class="col-md-2 mx-auto form-control" id="pos-2-7">
                    <h5 class="title">버튼7</h5>
                  </div>
                  <div class="col-md-2 mx-auto form-control" id="pos-2-8">
                    <h5 class="title">버튼8</h5>
                  </div> -->
                </div>
                <br>
                <div class="row">
                  <div class="col-md-3 mx-auto">
                    <input type="button" value="영업개시" id="pos-2-9"
                      data-toggle="modal" data-target="#pos_cash_open">
                  </div>
                  <!--  modal pop-up for cash-open menu -->
                  <div class="modal modal-default" id="pos_cash_open">
                    <div class="modal-dialog">
                      <div class="modal-header"></div>
                      <div class="modal-content bg-gray">
                        <div class="row">
                          <div class="col-md-12 text-darker text-center">
                            <h2 class="title" id="coh_title_1">[영업개시금]을 입력하십시오.</h2>
                            <h2 class="title" id="coh_title_2" style="display: none;">[시재 회수 금액]을 입력하십시오.</h2>
                            <h2 class="title" id="coh_title_3" style="display: none;">[시재 투입 금액]을 입력하십시오.</h2>
                            <h2 class="title" id="coh_title_4" style="display: none;">[시재 마감 점검]을 입력하십시오.</h2>
                          </div>
                        </div>
                        <div class="row text-">
                          <div class="col-md-7 form-group text-primary mx-auto">
                            <input type="number" class="form-control text-primary" id="coh_50k" placeholder="5만원권">
                          </div>
                          <div class="col-md-7 form-group text-primary mx-auto">
                            <input type="number" class="form-control text-primary" id="coh_10k" placeholder="1만원권">
                          </div>
                          <div class="col-md-7 form-group text-primary mx-auto">
                            <input type="number" class="form-control text-primary" id="coh_5k" placeholder="5천원권">
                          </div>
                          <div class="col-md-7 form-group text-primary mx-auto">
                            <input type="number" class="form-control text-primary" id="coh_1k" placeholder="1천원권">
                          </div>
                          <div class="col-md-7 form-group text-primary mx-auto">
                            <input type="number" class="form-control text-primary" id="coh_5c" placeholder="5백원동전">
                          </div>
                          <div class="col-md-7 form-group text-primary mx-auto">
                            <input type="number" class="form-control text-primary" id="coh_1c" placeholder="1백원동전">
                          </div>
                          <div class="col-md-7 form-group text-primary mx-auto">
                            <input type="number" class="form-control text-primary" id="coh_error" placeholder="오류금액의 총액(원단위)을 입력하세요." style="display: none;">
                          </div>
                          <div class="col-md-7 text-primary mx-auto">
                            <h2 id="coh_listtotal">total: </h2>
                          </div>
                          <div class="col-md-5 text-primary mx-auto">
                            <input type="button" value="영업개시" id="pos-btn-2-9-1"> 
                            <input type="button" value="시재회수" id="pos-btn-2-10-1" style="display: none;">
                            <input type="button" value="시재투입" id="pos-btn-2-11-1" style="display: none;">
                            <input type="button" value="영업마감" id="pos-btn-2-12-1" style="display: none;">
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="col-md-3 mx-auto">
                    <input type="button" value="시재회수" id="pos-2-10" data-toggle="modal" data-target="#pos_cash_open">
                  </div>
                  <div class="col-md-3 mx-auto">
                    <input type="button" value="시재투입" id="pos-2-11" data-toggle="modal" data-target="#pos_cash_open">
                  </div>
                  <div class="col-md-3 mx-auto">
                    <input type="button" value="영업마감" id="pos-2-12" data-toggle="modal" data-target="#pos_cash_open">
                  </div>
                </div>
                <br>
                <div class="row">
                  <div class="col-md-4 mx-auto" id="pos-2-13">
                    <input type="text" class="form-control text-center" id="pos-2-13-1" value="현재시재" disabled="disabled">
                  </div>
                  <!-- 
                  <div class="col-md-2 mx-auto form-control" id="pos-2-15">
                    <h5 class="title">버튼15</h5>
                  </div>
                   -->
                  <div class="col-md-4 mx-auto" id="pos-2-14">
                    <input type="text" class="form-control text-center" id="pos-2-14-1" value="금일매출" disabled="disabled">
                  </div>
                  <!-- 
                  <div class="col-md-2 mx-auto form-control" id="pos-2-16">
                    <h5 class="title">버튼16</h5>
                  </div>
                   -->
                </div>
                <br>
                <div class="row">
                  <div class="col-md-3 mx-auto">
                    <input type="button" value="결제내역조회" id="pos-2-17">
                  </div>
                  <!-- 
                  <div class="col-md-2 mx-auto form-control" id="pos-2-18">
                    <h5 class="title">버튼18</h5>
                  </div>
                  <div class="col-md-2 mx-auto form-control" id="pos-2-19">
                    <h5 class="title">버튼19</h5>
                  </div>
                  <div class="col-md-3 mx-auto">
                    <h5 class="title">버튼20</h5>
                  </div>
                   -->
                </div>
              </div>
              <div class="card-footer"></div>
            </div>
          </div>
        </div>


        <div class="row" id="pos-lower" style="display: none;">
          <div class="col-md-6">
            <div class="card">
              <div class="card-header"></div>

              <div class="card-body">
                <div class="row">
                  <input type="text" class="form-control"
                    id="ppodseatno" value=" 번 테이블" readonly="readonly">
                  <input type="hidden" id="ppodvisitors" value="">
                  <input type="hidden" id="ppodseatseq" value="">
                  <input type="hidden" id="preparedOrder" value="">
                  <input type="hidden" id="preparedOrderMemo" value="">
                  <input type="hidden" id="tempordertype" value="new">
                  <input type="hidden" id="alodsasseq" value="">
                </div>

                <div class="col-md-12">
                  <table class="table table-hover" id="pos-3-1">
                    <!-- 주문 대기열 will be placed here -->
                  </table>

                  <div class="row box">
                    <div class="col-md-4">
                      <input type="button" id="pos-btn-3-1" value="할인">
                    </div>
                    <!-- 
                    <div class="col-md-3">
                      <input type="button" id="pos-btn-3-2" value="서비스">
                    </div>
                     -->
                    <div class="col-md-4">
                      <input type="button" id="pos-btn-3-3" value="메모등록">
                    </div>
                    <div class="col-md-4">
                      <input type="button" id="pos-btn-3-4" value="주문등록">
                    </div>
                  </div>
                </div>


                <div class="card-footer">
                </div>
              </div>
            </div>
          </div>



          <div class="col-md-6">
            <div class="card">
              <div class="card-header">
              </div>
              <div class="card-body">
                <div class="row">
                  <div class="col-md-12 ml-auto mr-auto">



                    <!-- 	<div class="col-lg-12"> -->
                    <ul class="nav nav-tabs nav-fill" id="pos-4-1">
                      <!-- menu category tabs will be placed here. -->
                    </ul>
                    <div class="tab-content col-md-12" id="pos-4-2">
                      <!-- menu lists will be placed here. -->
                      <!--  </div> -->
                    </div>


                    <hr>
                    <table class="box col-lg-12">
                      <tr>
                        <td><input type="button" value="카드결제" id="modal-cash" data-toggle="modal" data-target="#pos_payment"></td>
                        <td><input type="button" value="현금결제" id="modal-card" data-toggle="modal" data-target="#pos_payment"></td>
                        <td><input type="button" value="복합결제" data-toggle="modal" data-target="#pos_payment_complex"></td>
                      </tr>
                    </table>

                    <!--  카드/현금결제용 modal -->
                    <div class="modal modal-default" id="pos_payment">
                      <div class="modal-dialog">
                        <div class="modal-header"></div>
                        <div class="modal-content bg-alert">
                          <div class="row">
                            <div class="col-md-12 text-center">
                              <h3 class="title">[결제] 정말로 결제완료 처리 하시겠습니까?</h3>
                            </div>
                          </div>
                          <div class="row box">
                            <div class="col-md-4 form-group text-primary mx-auto">
                              <input type="button" id="pos-btn-4-3" value="카드결제">
                              <input type="button" id="pos-btn-4-4" value="현금결제">
                            </div>
                            <div class="col-md-4 text-primary">
                              <input type="button" data-dismiss="modal" value="취소">
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>


                  <!--  복합결제용 modal -->
                  <div class="modal modal-default"
                    id="pos_payment_complex">
                    <div class="modal-dialog">
                      <div class="modal-header"></div>
                      <div class="modal-content bg-alert">
                        <div class="row">
                          <div class="col-md-12 text-center">
                            <h3 class="title">[결제] 복합결제 처리 하시겠습니까?
                            </h3>
                          </div>
                        </div>
                        <div id="payment_complex">
                          <div class="row box">
                            <div class="col-md-2 form-group mx-auto">
                              <select class="pmt_cmp_type">
                                <option value="1">카드</option>
                                <option value="2">현금</option>
                              </select>
                            </div>
                            <div class="col-md-4 form-group mx-auto">
                              <input type="number"
                                class="pmt_cmp_amount"
                                placeholder="금액을 입력하세요">
                            </div>
                            <div class="col-md-4 mx-auto dropdown">
                            </div>
                          </div>

                          <div class="row box">
                            <div class="col-md-2 form-group mx-auto">
                              <select class="pmt_cmp_type">
                                <option value="1">카드</option>
                                <option value="2">현금</option>
                              </select>
                            </div>
                            <div class="col-md-4 form-group mx-auto">
                              <input type="number"
                                class="pmt_cmp_amount"
                                placeholder="금액을 입력하세요">
                            </div>
                            <div class="col-md-4 form-group mx-auto">
                              <a class="pmt_cmp_addline"><i
                                class="tim-icons icon-simple-add text-warning"></i>한줄추가</a>
                            </div>
                          </div>
                        </div>

                        <div class="row box">
                          <div class="col-md-12 mx-auto">총액검증관련
                            유효성검사 _js_ will be placed here</div>
                        </div>

                        <div class="row box">
                          <div
                            class="col-md-4 form-group text-primary mx-auto">
                            <input type="button" id="pos-btn-4-5"
                              value="복합결제">
                          </div>
                          <div class="col-md-4 text-primary">
                            <input type="button" data-dismiss="modal"
                              value="취소">
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>


                </div>
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
  <div>
    <input type="hidden" id="funcFlag" value="0"> <input
      type="hidden" id="tableSeqFirst" value=""> <input
      type="hidden" id="sasSeqFirst" value=""> <input
      type="hidden" id="tableSeqSecond" value=""> <input
      type="hidden" id="sasSeqSecond" value="">
<!--   </div> -->


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
  <!--추가한 파일 jquery ui for chartjs  -->
  <script src="//code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>

  <script>
			$(function() {
				pos_coh_hasstarted();
				$('ul.tab li').click(function() {
					var activeTab = $(this).attr('data-tab');
					$('ul.tab li').removeClass('current');
					$('.tabcontent').removeClass('current');
					$(this).addClass('current');
					$('#' + activeTab).addClass('current');
				})
				pos_loadseat();
				pos_setbuttons();
				pos_loadmenu();
				pos_loadcohexpected();
				pos_loadpaymenttoday();
			});

			function pos_loadseat() {
				$.ajax({
					url : 'selectseat',
					method : 'POST',
					success : function(resp) {
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
						
								$
										.ajax({
											url : 'seatsavailable',
											method : 'POST',
											dataType: 'text',
									        contentType: 'application/json; charset=UTF-8',
											success : function(resp2) {
												resp2 = JSON.parse(resp2);
												var totalSeats = Object
														.keys(resp).length;
												var occupiedSeats = Object
														.keys(resp2).length;

												$('#pos-1-3')
														.val(
																'총 '
																		+ totalSeats
																		+ '석');
												$('#pos-1-4').val(
														'현재 ' + occupiedSeats
																+ '석 이용중');

												var devider = 1;
												var sizer = '';
												if (totalSeats <= 4) { // 4개까지는 1row당 2개씩
													devider = 2;
													size = 'col-md-5';
												} else if (totalSeats <= 9) { // ~9개는 1row당 3개
													devider = 3;
													size = 'col-md-4';
												} else if (totalSeats <= 16) { // ~16개는 1row 당 4개
													devider = 4;
													size = 'col-md-3';
												} else { // 17개 넘어가면 1row당 6개
													devider = 6;
													size = 'col-md-2';
												}

												var output = '';
												$
														.each(
																resp,
																function(idx,
																		obj) {
																	if (idx
																			% devider == 0) {
																		output += '<div class="row">';
																	}
																	var chker = 0;
																	$
																			.each(
																					resp2,
																					function(
																							idx2,
																							ocpd) { // 손님이 자리에 앉아있을 때.. 메뉴까지 보여줄지는 검토할 것
																						if (obj.seat_seq == ocpd.seat_seq) {
																							output += '<div class="' + size + ' sqbox rounded" s-seatseq="' + obj.seat_seq + '" s-sasseq="' + ocpd.sales_state_seq + '" s-sasmemo="' + ocpd.sales_memo + '">';
																							output += '<span>'
																									+ obj.seat_id
																									+ '<br>손님 '
																									+ ocpd.sales_visitors
																									+ '명, <br>입점: '
																									+ ocpd.sales_start
																									+ '</span>';
																							chker = 1;
																						}
																					})

																	if (chker == 0) {
																		output += '<div class="' + size + ' sqbox rounded" s-seatseq="' + obj.seat_seq + '">';
																		output += '<span>'
																				+ obj.seat_id
																				+ '</span>';
																	} else {
																		chker = 0;
																	}

																	output += '</div>';
																	if (idx
																			% devider === (devider - 1)
																			|| idx == resp.length) {
																		output += '</div>';
																	}
																});
												$('#pos-1-5').html(output);

												$.each(resp, function(idx, obj) {
													var temp = 'div[s-seatseq='+ obj.seat_seq + ']';
													$(temp).on('click', function() { 
														pos_selectseat( $('#funcFlag').val(), $(this).attr('s-seatseq'), $(this).children('span:eq(0)').html(),$(this).attr('s-sasseq'),$(this).attr('s-sasmemo'));
																					});
																});
											}
										});

								$
										.ajax({
											url : 'selectCompanyOne',
											method : 'POST',
											success : function(resp) {
												$('#pos-1-1')
														.val(
																'업체명 : '
																		+ resp.comp_name);
												$('#pos-1-2')
														.val(
																'현재사용자 : ${sessionScope.emp_id}');
											}
										});
							}
						})
			}

			/*
			var totalSeats = Object.keys(resp).length;
			$('#pos-1-3').val('총 ' + totalSeats + ' 석');

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
			$('#pos-1-5').html(output);
			$.each(resp, function(idx, obj) {
			  var temp = 'button[s-seatseq=' + obj.seat_seq + ']';
			  $(temp).on('click', function() {
			    // alert('alert on onclick and $this selector ' + $(this).attr('s-seatseq')) 
			    // 온클릭에 부여된 $this 펑션만 제대로 작동한다.
			    
			    pos_selectseat($('#funcFlag').val(), $(this).attr('s-seatseq'));
			  });
			}) */

			function pos_selectseat(param1, param2, param3, param4, param5) {
				/* alert("alert on rcved function and $this selector " + $(this).attr('s-seatseq') + "번 table") */
				/* alert('\n\nparam1: "' + param1 + '" and param2: "' + param2 + '" and "' + param3 + '" and "' + param4 + '" has selected.'); */

				// param4는 seat가 occupied이면 뭔가 내용이 온다. undefined는 빈 seat라는 것.
				if (param4 == undefined) {
					// param1 이 0이면 주문을 받는다.
					if (param1 == 0) {
						var ppodvisitors = prompt('내점 인원수를 입력하세요.', 1);
						if (ppodvisitors == null || ppodvisitors < 0) {
							return false;
						}
						$('#ppodvisitors').val(ppodvisitors);

						$('#pos-upper').css('display', 'none');
						$('#pos-lower').css('display', 'flex');
						$('#ppodseatseq').val(param2);
						$('#ppodseatno').val('현재 선택한 테이블: ' + param3);
						$('#tempordertype').val('new');
						pos_ppOrderList();
					} else if (param1 == 1) {
						if ($('#tableSeqFirst').val().length != 0) {
							$('#tableSeqSecond').val(param2)
							/* alert('table_move!'); */
							pos_table_move();
						} else {
							$('#funcFlag').val('0');
							$('#tableSeqFirst').val('');
							$('#tableSeqSecond').val('');
							alert('비어있는 자리를 이동하거나 합칠 수 없습니다. 기능을 취소합니다.')
							return false;
						}
					} else if (param1 == 2 || param1 == 3) {
						$('#funcFlag').val('0');
						$('#tableSeqFirst').val('');
						$('#tableSeqSecond').val('');
						alert('비어있는 자리를 이동하거나 합칠 수 없습니다. 기능을 취소합니다.')
						return false;
					}
				} else {
					if (param1 == 0) {
						// param4가 있으면 이미 주문된 내역을 불러온다.
						$('#pos-upper').css('display', 'none');
						$('#pos-lower').css('display', 'flex');
						$('#ppodseatseq').val(param2);
						param3 = param3.substr(0, param3.indexOf('<'));
						$('#ppodseatno').val('현재 선택한 테이블: ' + param3);
						$('#alodsasseq').val(param4)
						if (param5 == 'null') {
							$('#preparedOrderMemo').val('');
						} else {
							$('#preparedOrderMemo').val(param5);
						}
						$('#tempordertype').val('replace');
						pos_alOrderList(param4);
					} else if (param1 == 1 || param1 == 2) {
						if ($('#tableSeqFirst').val().length == 0) {
							$('#tableSeqFirst').val(param2)
							$('#sasSeqFirst').val(param4)
						} else {
							$('#tableSeqSecond').val(param2)
							$('#sasSeqSecond').val(param4)
							pos_table_swap()
						}
					} else if (param1 == 3) {
						if ($('#tableSeqFirst').val().length == 0) {
							$('#tableSeqFirst').val(param2)
							$('#sasSeqFirst').val(param4)
						} else {
							$('#tableSeqSecond').val(param2)
							$('#sasSeqSecond').val(param4)
							pos_table_merge()
						}
					}
				}
			}

			function pos_setbuttons() {
				$('#pos-2-1').on('click', function() {
					$('#funcFlag').val('1');
					alert('이동시킬 주문전표를 선택하십시오.');
				});
				$('#pos-2-2').on('click', function() {
					$('#funcFlag').val('2');
					alert('교환시킬 주문전표를 선택하십시오.');
				});
				$('#pos-2-3').on('click', function() {
					$('#funcFlag').val('3');
					alert('병합시킬 주문전표를 선택하십시오.\n선택한 전표는 없어집니다.');
				});
				$('#pos-2-4').on('click', function() {
					$('#funcFlag').val('0');
					$('#tableSeqFirst').val('');
					$('#tableSeqSecond').val('');
					$('#pmtlog').css('display', 'none');
					$('#seatsgrid').css('display', 'flex');
					alert('모든 기능을 취소합니다.');
				});

				$('#pos-2-9').on('click', pos_modal_1);
				$('#pos-2-10').on('click', pos_modal_2);
				$('#pos-2-11').on('click', pos_modal_3);
				$('#pos-2-12').on('click', pos_modal_4);

				$('#pos-btn-2-9-1').on('click', pos_cash_open);
				$('#pos-btn-2-10-1').on('click', pos_cash_withdraw);
				$('#pos-btn-2-11-1').on('click', pos_cash_deposit);
				$('#pos-btn-2-12-1').on('click', pos_cash_close);

				$('#pos-2-17').on('click', function() {
					pos_pmt_list();
				});
				$('#search_pmtlist').on('click', function() {
					load_pmt_list();
				});

				btn_pmt_cmp_addline();
				$('#modal-cash').on('click', function() {
					$('#pos-btn-4-3').css('display','block');
					$('#pos-btn-4-4').css('display','none');
				})
				$('#modal-card').on('click', function() {
					$('#pos-btn-4-3').css('display','none');
					$('#pos-btn-4-4').css('display','block');
				})

				$('#pos-btn-3-1').on('click', pos_order_discount);
				$('#pos-btn-3-2').on('click', pos_order_service);
				$('#pos-btn-3-3').on('click', pos_order_memo);
				$('#pos-btn-3-4').on('click', pos_order_order);

				$('#pos-btn-4-3').on('click', pos_payment_card);
				$('#pos-btn-4-4').on('click', pos_payment_cash);
				$('#pos-btn-4-5').on('click', pos_payment_complex);
				
			}

			function btn_pmt_cmp_addline() {
				$('.pmt_cmp_addline').on('click', pmt_cmp_addline);
			}

			/* 	메뉴 목록 출력 */
			function pos_loadmenu() {
				var cat = [];
				$
						.ajax({
							url : 'selectMenu',
							method : 'POST',
							success : function(resp) {
								$.each(resp, function(i, obj) {
									if (cat.indexOf(obj.menu_category) === -1) {
										cat.push(obj.menu_category)
									}
								})

								// 여기부터 tab부분 
								var output = '';
								$
										.each(
												cat,
												function(i, obj) {
													output += ''
													if (i == 0) {
														output += '<li class="active">'
													} else {
														output += '<li>'
													}
													output += '<a data-toggle="tab" href="#' + obj + '">'
															+ obj + '</a></li>'
													output += '</li>'
												})
								$('#pos-4-1').html(output);

								// 여기부터 탭 밑의 tab-pane
								var output2 = '';
								$
										.each(
												cat,
												function(i, obj) {
													if (i === 0) {
														output2 += '<div id="' + obj + '" class="tab-pane active">';
													} else {
														output2 += '<div id="' + obj + '" class="tab-pane fade">';
													}
													// output2 += '<h3>' + obj + '</h3>';
													// 여기까지 카테고리를 기준으로 뿌린다

													// 이중포문, 여기부터 카테고리와 같은 속성일 때 목록에 올린다.
													var chker = 0;
													$
															.each(
																	resp,
																	function(
																			idx,
																			obj2) {
																		if (obj == obj2.menu_category) {
																			if (obj2.menu_sellFlag == '0') {
																			} else {
																				if (chker % 3 === 0)
																					output2 += '<div class="row">';
																				output2 += '<div class="col-md-4"><button class="menu_select_button" s-menuseq="' + obj2.menu_seq + '" s-menu-regex="' + obj + '|' + obj2.menu_name + '|' + obj2.menu_price + '|' + obj2.menu_sellFlag + '">'
																						+ obj2.menu_name
																						+ '<br><br>'
																						+ obj2.menu_price
																						+ '</button></div>';
																				if (chker % 3 === 2)
																					output2 += '</div>';
																				// 이거 의미 없고 그냥 i끝나는 시점에 div한번 더 닫음
																				// if ( chker-1 === resp.length ) output2 += '</div>'; 
																				chker++;
																			}
																		}
																	})

													output2 += '</div></div>';
												});

								$('#pos-4-2').html(output2);

								$.each(resp, function(idx, obj3) {
									var temp = 'button[s-menuseq='
											+ obj3.menu_seq + ']';
									/* $(temp).on('click', selectmenu); */
									$(temp).on('click', pos_pickmenuforppod);
								});
							}
						})
			}

			function pos_ppOrderList() {
				console.log($('#preparedOrder').val());
				var ppod = $('#preparedOrder').val();
				ppod = ppod.substr(0, ppod.length - 1);
				var ppod_arr = ppod.split('|');

				var list = [];
				var listsum = 0;
				var ppod_output = '';
				ppod_output += '<tr>';
				ppod_output += '<td style="width: 30%">품목명</td><td style="width: 20%">단가</td><td style="width: 25%">수량</td><td style="width: 25%">금액</td>'
				ppod_output += '</tr>';
				for (i = 0; i <= ppod_arr.length - 4; i += 4) {
					var objsum = ppod_arr[i + 2] * ppod_arr[i + 3];
					listsum += objsum;
					ppod_output += '<tr>';
					ppod_output += '<td><i class="tim-icons icon-simple-remove text-warning" title="한줄삭제" s-menuseq="' + ppod_arr[i] + '"></i>  '
							+ ppod_arr[i + 1]
							+ '</td><td>'
							+ ppod_arr[i + 2]
							+ '</td><td>'
							+ '<i class="tim-icons icon-simple-delete text-warning" title="줄이기" s-menuseq="' + ppod_arr[i] + '"></i>    '
							+ ppod_arr[i + 3]
							+ '    <i class="tim-icons icon-simple-add text-warning" title="늘이기" s-menuseq="' + ppod_arr[i] + '"></i>'
							+ '</td><td>' + objsum + '</td>'
					ppod_output += '</tr>';
				}
				ppod_output += '<tr><td colspan="4" class="td-total"><i class="tim-icons icon-credit-card"></i>총 금액 : '
						+ listsum + '</tr>'
				$('#pos-3-1').html(ppod_output);

				for (i = 0; i <= ppod_arr.length - 4; i += 4) {
					var temp1 = '.icon-simple-remove[s-menuseq=' + ppod_arr[i]
							+ ']';
					var temp2 = '.icon-simple-delete[s-menuseq=' + ppod_arr[i]
							+ ']';
					var temp3 = '.icon-simple-add[s-menuseq=' + ppod_arr[i]
							+ ']';
					$(temp1).on('click', pos_remove_ppod);
					$(temp2).on('click', pos_reduce_ppod);
					$(temp3).on('click', pos_add_ppod);
				}
			}

			function pos_makeOrder() {
				var list = JSON.parse($('#preparedOrder').val());
				// ajax로 무언가를 처리할 예정임.
			}

			function pos_pickmenuforppod() {
				var menu_seq = $(this).attr('s-menuseq');
				var menurgx = $(this).attr('s-menu-regex');
				var menuarr = menurgx.split('|')
				var menu_name = menuarr[1];
				var menu_price = menuarr[2];

				var pickmenu = menu_seq + '|' + menu_name + '|' + menu_price
						+ '|' + 1 + '|';

				var temp_ppod = $('#preparedOrder').val();
				var temp_arr = temp_ppod.split('|')
				var temp_arr_chk = 0;
				for (i = 0; i <= temp_arr.length; i += 4) {
					temp_arr_chk = 0;
					if (temp_arr[i] == menu_seq) {
						temp_arr[i + 3] = parseInt(temp_arr[i + 3]) + 1;
						temp_arr_chk = 1;
						break;
					}
				}
				temp_ppod = temp_arr.join('|');
				if (temp_arr_chk == 0) {
					$('#preparedOrder').val(
							$('#preparedOrder').val() + pickmenu);
				} else {
					$('#preparedOrder').val(temp_ppod);
				}
				pos_ppOrderList();
				// console.log($('#preparedOrder').val());
			}

			function pos_remove_ppod() {
				var menu_seq = $(this).attr('s-menuseq');
				var temp_ppod = $('#preparedOrder').val();
				var temp_arr = temp_ppod.split('|')
				var temp_arr_chk = 0;
				for (i = 0; i <= temp_arr.length; i += 4) {
					if (temp_arr[i] == menu_seq) {
						temp_arr_chk = i;
						break;
					}
				}
				temp_arr.splice(temp_arr_chk, 4)
				temp_ppod = temp_arr.join('|');
				$('#preparedOrder').val(temp_ppod);
				pos_ppOrderList();
			}

			function pos_reduce_ppod() {
				var menu_seq = $(this).attr('s-menuseq');
				var temp_ppod = $('#preparedOrder').val();
				var temp_arr = temp_ppod.split('|')
				var temp_arr_chk = 0;

				for (i = 0; i <= temp_arr.length; i += 4) {
					temp_arr_chk = 0;
					if (temp_arr[i] == menu_seq) {
						if (temp_arr[i + 3] >= 2) {
							temp_arr[i + 3] = parseInt(temp_arr[i + 3]) - 1;
						}
						temp_arr_chk = 1;
						break;
					}
				}
				temp_ppod = temp_arr.join('|');
				if (temp_arr_chk == 0) {
					$('#preparedOrder').val(
							$('#preparedOrder').val() + pickmenu);
				} else {
					$('#preparedOrder').val(temp_ppod);
				}
				pos_ppOrderList();
			}

			function pos_add_ppod() {
				var menu_seq = $(this).attr('s-menuseq');
				var temp_ppod = $('#preparedOrder').val();
				var temp_arr = temp_ppod.split('|')
				var temp_arr_chk = 0;

				for (i = 0; i <= temp_arr.length; i += 4) {
					temp_arr_chk = 0;
					if (temp_arr[i] == menu_seq) {
						temp_arr[i + 3] = parseInt(temp_arr[i + 3]) + 1;
						temp_arr_chk = 1;
						break;
					}
				}
				temp_ppod = temp_arr.join('|');
				$('#preparedOrder').val(temp_ppod);
				pos_ppOrderList();
			}

			function pos_order_discount() {
				var menu_seq = -1;
				var temp_ppod = $('#preparedOrder').val();
				var temp_arr = temp_ppod.split('|')
				var temp_arr_chk = 0;
				var discount = 0;

				for (i = 0; i <= temp_arr.length; i += 4) {
					temp_arr_chk = 0;
					if (temp_arr[i] == '-1') {
						discount = -1 * Math.abs(temp_arr[i + 2]);
						temp_arr_chk = 1;
						break;
					}
				}

				if (temp_arr_chk == 1) { // 여기는 이미 할인금액이 있을 때
					var prpt = prompt('할인할 총 금액을 "양수"로 입력하십시오.');
					console.log(prpt);
					if ( prpt == null || prpt.length == 0 ) {
					} else {
						discount = -1 * Math.abs(prpt);
					} 
				} else {	// 여기는 처음 할인입력할 때
					var prpt = prompt('할인할 총 금액을 "양수"로 입력하십시오.');
					console.log(prpt);
					if ( prpt == null || prpt.length == 0 ) {
					} else {
						discount = 1 * Math.abs(prpt);
					}
				}
				
				for (i = 0; i <= temp_arr.length; i += 4) {
					if (temp_arr[i] == '-1') {
						temp_arr[i + 2] = -1 * Math.abs(discount);
						break;
					}
				}

				var pickmenu = menu_seq + '|' + '할인' + '|' + (-1 * discount)
						+ '|' + 1 + '|';
				temp_ppod = temp_arr.join('|');

				if (temp_arr_chk == 0) {
					$('#preparedOrder').val(
							$('#preparedOrder').val() + pickmenu);
				} else {
					$('#preparedOrder').val(temp_ppod);
				}
				pos_ppOrderList();
			}

			function pos_order_service() {
				alert('! 할인메뉴로 처리하세요')
			}

			function pos_order_memo() {
				var ppod_memo = $('#preparedOrderMemo').val();
				if (ppod_memo.length != 0) {
					ppod_memo = prompt('메모를 입력하세요. 현재저장된 메모: ', ppod_memo);
				} else {
					ppod_memo = prompt('메모를 입력하세요.');
				}
				$('#preparedOrderMemo').val(ppod_memo);
			}

			function pos_order_order() {
				var ordertype = $('#tempordertype').val();

				var seat_seq = $('#ppodseatseq').val();
				var ppod_memo = $('#preparedOrderMemo').val();
				var sales_visitors = $('#ppodvisitors').val();
				var sales_state_seq = $('#alodsasseq').val();

				var ppod = $('#preparedOrder').val();
				ppod = ppod.substr(0, ppod.length - 1);
				var senddata_new = {
					"seat_seq" : seat_seq,
					"sales_memo" : ppod_memo,
					"ppod" : ppod,
					"sales_visitors" : sales_visitors
				}
				var senddata_replace = {
					"seat_seq" : seat_seq,
					"sales_memo" : ppod_memo,
					"ppod" : ppod,
					"sales_state_seq" : sales_state_seq
				}
				console.log(senddata_replace);

				if (ordertype == 'replace') {
					$.ajax({
						url : 'replaceorder',
						method : 'POST',
						data : JSON.stringify(senddata_replace),
						dataType : 'text',
						contentType : 'application/json; charset=UTF-8',
						success : function() {
							/* alert('!'); */
							document.location.reload();
						}
					});
				}

				if (ordertype == 'new') {
					$.ajax({
						url : 'makeorder',
						method : 'POST',
						data : JSON.stringify(senddata_new),
						dataType : 'text',
						contentType : 'application/json; charset=UTF-8',
						success : function() {
							/* alert('!'); */
							document.location.reload();
						},
						error : function(a, b, c) {
							console.log(a);
							console.log(b);
							console.log(c);
							/* alert('error'); */
						}
					});
				}

			}

			function jobdone() {
				$('#funcFlag').val('');
				$('#tableSeqFirst').val('');
				$('#tableSeqSecond').val('');
				$('#ppodseatno').val('');
				$('#ppodseatseq').val('');
				$('#alodsasseq').val('');
				$('#preparedOrder').val('');
				$('#preparedOrderMemo').val('');
				if ($('#pos-upper').css('display') == 'none') {
					$('#pos-upper').css('display', 'flex');
					$('#pos-lower').css('display', 'none');
				} else {
					$('#pos-upper').css('display', 'none');
					$('#pos-lower').css('display', 'flex');
				}
			}

			// 1카드 2현금
			function pos_payment_card() {
				pos_payment(1);
			}

			function pos_payment_cash() {
				pos_payment(2);
			}

			function pmt_cmp_addline() {
				$(this).remove();
				var output = '';
				output += '<div class="row box">'
				output += '<div class="col-md-2 form-group mx-auto">'
				output += '  <select class="pmt_cmp_type">'
				output += '    <option value="1">카드</option>'
				output += '    <option value="2">현금</option>'
				output += ' </select>'
				output += ' </div>'
				output += '  <div class="col-md-4 form-group mx-auto">'
				output += '     <input type="number" class="pmt_cmp_amount" placeholder="금액을 입력하세요">'
				output += '   </div>'
				output += '   <div class="col-md-4 form-group mx-auto">'
				output += '      <span class="pmt_cmp_addline"><i class="tim-icons icon-simple-add text-warning"></i>한줄추가</span>'
				output += '    </div>'
				output += '  </div>'
				output += ' </div>'
				$('#payment_complex').append(output);
				btn_pmt_cmp_addline();
			}

			function pos_payment_complex() {
				var list_amount = $('td.td-total').text().substr(6,
						$('td.td-total').text().length);
				var rcv_amount_arr = $('.pmt_cmp_amount');
				var rcv_type_arr = $('.pmt_cmp_type');
				var sales_state_seq = $('#alodsasseq').val();

				var rcv_amount = 0;
				$.each(rcv_amount_arr, function(idx, obj) {
					rcv_amount += obj.value * 1;
				})
				if (rcv_amount != list_amount) {
					alert('금액이 일치하지 않습니다! \n  다시 시도하십시오.');
					return false;
				}

				var senddata = sales_state_seq + '|';
				// senddata 양식 sales_state_seq | pmt_type_where_i=0 | pmt_amount_where_i=0 |pmt_type_where_i=1 | pmt_amount_where_i=1 | and so on...   
				for (i = 0; i < rcv_type_arr.length; i++) {
					senddata += rcv_type_arr[i].value + '|'
							+ rcv_amount_arr[i].value + '|';
				}
				console.log(senddata)
				senddata = {
					"pmtcmp" : senddata
				}
				$.ajax({
					url : 'makepaymentcomplex',
					method : 'POST',
					data : senddata,
					success : function() {
						alert('결제되었습니다.');
						document.location.reload();
					}
				})
			}

			function pos_payment(param) {
				var sales_state_seq = $('#alodsasseq').val();
				var payment_type = param // 1카드 2현금
				var payment_amount = $('td.td-total').text().substr(6,$('td.td-total').text().length);
				console.log(payment_amount);

				var senddata = {
					sales_state_seq : sales_state_seq,
					payment_type : payment_type,
					payment_amount : payment_amount
				}

				$.ajax({
					url : 'makepayment',
					method : 'POST',
					data : senddata,
					success : function() {
						alert('결제되었습니다.');
						document.location.reload();
					}
				})
			}

			function pos_alOrderList(sas_seq) {
				var menulist = '';
				for (i = 0; i < $('button[s-menu-regex]').length; i++) {
					menulist += $('button[s-menu-regex]').eq(i).attr(
							's-menuseq')
							+ '|';
					menulist += $('button[s-menu-regex]').eq(i).attr(
							's-menu-regex')
							+ '|';
				}
				console.log(menulist)
				var menuarr = menulist.split('|');
				console.log(menuarr)

				$.ajax({
					url : 'alOrderList',
					method : 'POST',
					data : {
						sas_seq : sas_seq
					},
					success : function(resp) {
						console.log(resp)
						var alod = '';
						$.each(resp, function(idx, obj) {
							if (obj.menu_seq == -1) {
								// 여기에 할인관련 정보
								alod += obj.menu_seq + '|' + '할인' + '|'
										+ (1 * parseInt(obj.sales_discount)) + '|' + 1 + '|';
							} else {
								// 여기에 일반주문
								for (i = 0; i < menuarr.length - 3; i += 5) {
									if (obj.menu_seq == menuarr[i]) {
										alod += obj.menu_seq + '|'
												+ menuarr[i + 2] + '|'
												+ menuarr[i + 3] + '|'
												+ obj.sales_order + '|';
									}
								}
								// 메뉴네임이 없다. menu_seq + '|' + menu_name + '|' + menu_price + '|' + 1 + '|';
							}
						})
						console.log(alod);
						$('#preparedOrder').val(alod);
						pos_ppOrderList();
					}
				})
			}

			function pos_loadcohexpected() {
				$.ajax({
					url : 'predicCash',
					method : 'POST',
					success : function(resp) {
						$('#pos-2-13-1').val('예상시재액 : ' + resp);
					}
				})
			}

			function pos_loadpaymenttoday() {
				$.ajax({
					url : 'cumulatepaymenttoday',
					method : 'POST',
					success : function(resp) {
						$('#pos-2-14-1').val('금일매출누계 : ' + resp);
					}
				})
			}

			function pos_coh_hasstarted() {
				var start_chker = 0;
				var end_chker = 0;

				$('#coh_50k').change(pos_coh_chktotal)
				$('#coh_10k').change(pos_coh_chktotal)
				$('#coh_5k').change(pos_coh_chktotal)
				$('#coh_1k').change(pos_coh_chktotal)
				$('#coh_5c').change(pos_coh_chktotal)
				$('#coh_1c').change(pos_coh_chktotal)
				$('#coh_error').change(pos_coh_chktotal)

				$
						.ajax({
							url : 'selectCashonhand',
							method : 'POST',
							success : function(resp) {
								console.log(resp);
								$.each(resp, function(idx, obj) {
									console.log(obj);
									console.log(obj.cashonhand_type);
									if (obj.cashonhand_type == 1) {
										start_chker++;
									}
									if (obj.cashonhand_type == 4) {
										end_chker++;
									}

								})
								if (start_chker == 0) {
									alert('영업개시 버튼을 눌러 시재를 입력하십시오.');
									$('#pos_cash_open').modal('show');
								}
								if (end_chker != 0) {
									alert('이미 영업을 마감하셨습니다.\n');
									document.location.replace('${pageContext.request.contextPath}');
								}
							}
						})
			}

			function pos_coh_chktotal() {
				var k50 = $('#coh_50k').val();
				var k10 = $('#coh_10k').val();
				var k5 = $('#coh_5k').val();
				var k1 = $('#coh_1k').val();
				var c5 = $('#coh_5c').val();
				var c1 = $('#coh_1c').val();
				var err = $('#coh_error').val();

				var total = k50 * 50000 + k10 * 10000 + k5 * 5000 + k1 * 1000
						+ c5 * 500 + c1 * 100 + err * 1;

				$('#coh_listtotal').html("total: " + total);
			}

			function pos_cash_open() {
				var cashonhand_type = 1;
				$('#coh_error').val('');
				var cashonhand_cash = $('#coh_listtotal').html().substr(6,
						$('#coh_listtotal').html().length)
				var senddata = {
					cashonhand_type : cashonhand_type,
					cashonhand_cash : cashonhand_cash
				}
				$.ajax({
					url : 'insertCashonhand',
					method : 'POST',
					data : senddata,
					success : function() {
						alert('등록성공')
						document.location.reload();
					}
				})
			}

			function pos_cash_withdraw() {
				var cashonhand_type = 2;
				$('#coh_error').val('');
				var cashonhand_cash = $('#coh_listtotal').html().substr(6,
						$('#coh_listtotal').html().length)
				var senddata = {
					cashonhand_type : cashonhand_type,
					cashonhand_cash : cashonhand_cash
				}
				$.ajax({
					url : 'insertCashonhand',
					method : 'POST',
					data : senddata,
					success : function() {
						alert('등록성공')
						document.location.reload();
					}
				})
			}

			function pos_cash_deposit() {
				var cashonhand_type = 3;
				$('#coh_error').val('');
				var cashonhand_cash = $('#coh_listtotal').html().substr(6,
						$('#coh_listtotal').html().length)
				var senddata = {
					cashonhand_type : cashonhand_type,
					cashonhand_cash : cashonhand_cash
				}
				$.ajax({
					url : 'insertCashonhand',
					method : 'POST',
					data : senddata,
					success : function() {
						alert('등록성공')
						document.location.reload();
					}
				})
			}

			function pos_cash_close() {
				var expected_cash = $('#pos-2-13-1').val().substr(7,
						$('#pos-2-13-1').val().length);
				console.log(expected_cash);
				var cashonhand_cash = $('#coh_listtotal').html().substr(6,
						$('#coh_listtotal').html().length)

				if (expected_cash != cashonhand_cash) {
					alert('예상금액과 현재 시재가 일치하지 않습니다. 오류금액을 입력하십시오.')
					return false;
				} else {
					var conf = prompt('마감처리하시면 오늘은 더 이상 POS기능을 사용할 수 없습니다.\n정말 마감하시겠습니까?\n마감하시려면 "마감"을 입력하십시오.')
					if (conf != '마감') {
						return false;
					}
				}

				var cashonhand_type = 4;
				var cashonhand_error = $('#coh_error').val();
				var senddata = {
					cashonhand_type : cashonhand_type,
					cashonhand_cash : cashonhand_cash
				}
				$.ajax({
					url : 'insertCashonhand',
					method : 'POST',
					data : senddata,
					success : function() {
						alert('등록성공')
						document.location.reload();
					}
				})
			}

			function pos_modal_1() {
				$('#coh_title_1').css('display', 'block');
				$('#pos-btn-2-9-1').css('display', 'block');

				$('#coh_title_2').css('display', 'none');
				$('#coh_title_3').css('display', 'none');
				$('#coh_title_4').css('display', 'none');

				$('#coh_error').css('display', 'none');

				$('#pos-btn-2-10-1').css('display', 'none');
				$('#pos-btn-2-11-1').css('display', 'none');
				$('#pos-btn-2-12-1').css('display', 'none');
			}

			function pos_modal_2() {
				$('#coh_title_2').css('display', 'block');
				$('#pos-btn-2-10-1').css('display', 'block');

				$('#coh_title_1').css('display', 'none');
				$('#coh_title_3').css('display', 'none');
				$('#coh_title_4').css('display', 'none');

				$('#coh_error').css('display', 'none');

				$('#pos-btn-2-9-1').css('display', 'none');
				$('#pos-btn-2-11-1').css('display', 'none');
				$('#pos-btn-2-12-1').css('display', 'none');
			}

			function pos_modal_3() {
				$('#coh_title_3').css('display', 'block');
				$('#pos-btn-2-11-1').css('display', 'block');

				$('#coh_title_1').css('display', 'none');
				$('#coh_title_2').css('display', 'none');
				$('#coh_title_4').css('display', 'none');

				$('#coh_error').css('display', 'none');

				$('#pos-btn-2-9-1').css('display', 'none');
				$('#pos-btn-2-10-1').css('display', 'none');
				$('#pos-btn-2-12-1').css('display', 'none');
			}

			function pos_modal_4() {
				$('#coh_title_4').css('display', 'block');
				$('#pos-btn-2-12-1').css('display', 'block');
				$('#coh_error').css('display', 'flex');

				$('#coh_title_1').css('display', 'none');
				$('#coh_title_2').css('display', 'none');
				$('#coh_title_3').css('display', 'none');

				$('#pos-btn-2-9-1').css('display', 'none');
				$('#pos-btn-2-10-1').css('display', 'none');
				$('#pos-btn-2-11-1').css('display', 'none');
			}

			function pos_pmt_list() {
				setdatepicker();
				setdatetodaydefault();
				$('#pmtlog').css('display', 'flex');
				$('#seatsgrid').css('display', 'none');
				load_pmt_list();
			}

			function load_pmt_list() {
				var ddate = $('#datepicker_pmtlist').val();
				var senddata = {
					ddate : ddate
				}
				console.log(ddate);
				$
						.ajax({
							url : 'selectpayments',
							method : 'POST',
							data : JSON.stringify(senddata),
							dataType : 'json',
							contentType : 'application/json; charset=UTF-8',
							success : function(resp) {
								console.log(resp);
								var output = '<table><tbody>';
								$
										.each(
												resp,
												function(idx, obj) {
													output += '<tr s-pmtseq="' + obj.payment_seq + '">'
													output += '   <td class="text-center" style="width: 30%;">'
															+ obj.payment_time
															+ '</td>'
													output += '   <td class="text-center" style="width: 30%;">'
															+ obj.payment_clerk
															+ '</td>'
													if (obj.payment_type == 1) {
														output += '   <td class="text-center" style="width: 20%;">'
																+ '카드'
																+ '</td>'
													} else {
														output += '   <td class="text-center" style="width: 20%;">'
																+ '현금'
																+ '</td>'
													}
													output += '   <td class="text-center" style="width: 20%;">'
															+ obj.payment_amount
															+ '</td>'
													output += '</tr>'
												})
								output += '</tbody></table>'
								$('#pos-1-6').html(output);
								$.each(resp, function(idx, obj) {
									var temp = 'tr[s-pmtseq='
											+ obj.payment_time + ']';
									$(temp).on('click', callpmts);
								})
							}
						})
			}

			function callpmts() {
				payment_seq = $(this).attr('s-pmtseq');

				alerT(payment_seq);
			}

			function setdatepicker() {
				$("#datepicker_pmtlist").datepicker({
					dateFormat : 'yy-mm-dd',
					defaultDate : 0,
					changeMonth : true,
					changeYear : true,
					showButtonPanel : true,
				});
			}

			function setdatetodaydefault() {
				var date = new Date();

				var day = date.getDate();
				var month = date.getMonth() + 1;
				var year = date.getFullYear();

				if (month < 10)
					month = "0" + month;
				if (day < 10)
					day = "0" + day;
				var today = year + "-" + month + "-" + day;
				$("#datepicker_pmtlist").val(today);
			}

			function pos_table_move() {
				var from_sasseq = $('#sasSeqFirst').val();
				var to_seatseq = $('#tableSeqSecond').val();

				$('#tableSeqFirst').val('');
				$('#sasSeqFirst').val('');
				$('#tableSeqSecond').val('');
				$('#sasSeqSecond').val('');
				$('#funcFlag').val('0');

				var map = {
					"from_sasseq" : from_sasseq,
					"to_seatseq" : to_seatseq
				};
				$.ajax({
					url : 'movetable',
					method : 'POST',
					data : JSON.stringify(map),
					dataType : 'json',
					contentType : 'application/json; charset=UTF-8',
					success : function() {
						/* alert('자리를 이동하였습니다.') */
						document.location.reload();
					}
				})
			}

			function pos_table_swap() {
				var from_seatseq = $('#tableSeqFirst').val();
				var from_sasseq = $('#sasSeqFirst').val();
				var to_seatseq = $('#tableSeqSecond').val();
				var to_sasseq = $('#sasSeqSecond').val();

				$('#tableSeqFirst').val('');
				$('#sasSeqFirst').val('');
				$('#tableSeqSecond').val('');
				$('#sasSeqSecond').val('');
				$('#funcFlag').val('0');

				var map = {
					"from_seatseq" : from_seatseq,
					"from_sasseq" : from_sasseq,
					"to_seatseq" : to_seatseq,
					"to_sasseq" : to_sasseq
				};
				$.ajax({
					url : 'swaptable',
					method : 'POST',
					data : JSON.stringify(map),
					dataType : 'json',
					contentType : 'application/json; charset=UTF-8',
					success : function() {
						/* alert('자리를 교환하였습니다.') */
						document.location.reload();
					}
				})
			}

			function pos_table_merge() {
				var from_seatseq = $('#tableSeqFirst').val();
				var from_sasseq = $('#sasSeqFirst').val();
				var to_seatseq = $('#tableSeqSecond').val();
				var to_sasseq = $('#sasSeqSecond').val();

				$('#tableSeqFirst').val('');
				$('#sasSeqFirst').val('');
				$('#tableSeqSecond').val('');
				$('#sasSeqSecond').val('');
				$('#funcFlag').val('0');

				var map = {
					"from_seatseq" : from_seatseq,
					"from_sasseq" : from_sasseq,
					"to_seatseq" : to_seatseq,
					"to_sasseq" : to_sasseq
				};

				$.ajax({
					url : 'mergetable',
					method : 'POST',
					data : JSON.stringify(map),
					dataType : 'text',
					contentType : 'application/json; charset=UTF-8',
					success : function() {
						/* alert('자리를 병합하였습니다.'); */
						document.location.reload();
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
		</script>
</body>

</html>
