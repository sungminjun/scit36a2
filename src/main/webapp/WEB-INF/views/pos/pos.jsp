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

  <!-- CSS~tab관련  Files -->
  <link href="assets/css/test.css" rel="stylesheet" />
  <link href="assets/css/posMain.css" rel="stylesheet" />
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
          <div class="col-md-12">
            <div class="card">
        <!-- 현재 로그인한 회사의 이름 -->
                <div class="row box">
                <div class="col-md-3">
                  <input type="text" class="form-control text-center" id="pos-1-1" value="호정이네 설렁탕" disabled="disabled">
                </div>
                <!-- 현재 로그인한 직원의 이름 -->
                <div class="col-md-3">
                  <input type="text" class="form-control text-center" id="pos-1-2" value="사용자: 이호정" disabled="disabled">
                </div>
                <!-- 현재 로그인한 회사의 전체 좌석수 -->
                <div class="col-md-3">
                  <input type="text" class="form-control text-center" id="pos-1-3" value="총 00 석 " disabled="disabled">
                </div>
                <!-- 현재 로그인한 회사의 가용 좌석수 -->
                <div class="col-md-3">
                  <input type="text" class="form-control text-center" id="pos-1-4" value="현재 00 석 이용중" disabled="disabled">
                </div>
                </div>
          </div>
          </div>
        </div>
        <div class="row">      
          <div class="col-md-6">
            <div class="card">
              <div class="card-header">
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
                  <div class="col-md-3 mx-auto">
                    <input type="button" value="영업개시" id="pos-2-9" data-toggle="modal" data-target="#pos_cash_open">
                  </div>
                  <!--  modal pop-up for cash-open menu -->
                  <div class="modal modal-default" id="pos_cash_open">
                   <div class="modal-dialog">
                    <div class="modal-header">
                    </div>
                    <div class="modal-content">
                     <div class="row">
                      <div class="col-md-12 text-center">
                        <h1 class="title">(영업개시) 시재를 입력하십시오.</h1>
                      </div>
                     </div>
                     <div class="row">
                      <div class="col-md-8 text-center form-group">
                        <label>5만원권</label>
                        <input type="text" class="form-control" placeholder="5만원권" style="background-color: gray; color: crimson;">
                      </div>
                      <div class="col-md-4 text-center">
                        숫자만 _js_validation_ will be placed here. 
                      </div>
                     </div>
                    </div>
                   </div>
                  </div>
                  <div class="col-md-3 mx-auto">
                    <input type="button" value="시재회수" id="pos-2-10">
                  </div>
                  <div class="col-md-3 mx-auto">
                    <input type="button" value="시재투입" id="pos-2-11">
                  </div>
                  <div class="col-md-3 mx-auto">
                    <input type="button" value="영업마감" id="pos-2-12">
                  </div>
                </div>
                <br>
                <div class="row">
                  <div class="col-md-4 mx-auto" id="pos-2-13">
                    <input type="text" class="form-control text-center" id="pos2-13-1" value="현재시재" disabled="disabled">
                  </div>
                  <div class="col-md-4 mx-auto" id="pos-2-14">
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
                  <div class="col-md-3 mx-auto">
                    <input type="button" value="결제내역조회" id="pos-2-17">
                  </div>
                  <div class="col-md-2 mx-auto form-control" id="pos-2-18">
                    <h5 class="title">버튼18</h5>
                  </div>
                  <div class="col-md-2 mx-auto form-control" id="pos-2-19">
                    <h5 class="title">버튼19</h5>
                  </div>
                  <div class="col-md-3 mx-auto">
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
    <input type="hidden" id="funcFlag" value="0">
    <input type="hidden" id="tableSeqFirst" value="0">
    <input type="hidden" id="tableSeqSecond" value="0">
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
  var funcFlag = 0;
	$(function() {
		$('ul.tab li').click(function() {
			var activeTab = $(this).attr('data-tab');
			$('ul.tab li').removeClass('current');
			$('.tabcontent').removeClass('current');
			$(this).addClass('current');
			$('#' + activeTab).addClass('current');
		})
		pos_loadseat();
		pos_setbuttons();
	});
	
    function pos_loadseat() {
        $.ajax({
          url: 'selectseat',
          method: 'POST',
          success: function(resp) {
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
            	  /* alert('alert on onclick and $this selector ' + $(this).attr('s-seatseq')) 
            	  온클릭에 부여된 $this 펑션만 제대로 작동한다.
            	  */
            	  pos_selectseat($('#funcFlag').val(), $(this).attr('s-seatseq'));
            });
          })
        }
        });


        $.ajax({
          url: 'selectCompanyOne',
          method: 'POST',
          success: function(resp) {
            $('#pos-1-1').val('업체명 : ' + resp.comp_name);
            $('#pos-1-2').val('현재사용자 : ${sessionScope.emp_id}');
          }
        });
      }
    
    function pos_selectseat(param1, param2) {
	    /* alert("alert on rcved function and $this selector " + $(this).attr('s-seatseq') + "번 table") */
	    alert('\n\nparam1: "' + param1+ '" and param2: "' + param2+ '" has selected.');
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
    		$('#tableSeqFirst').val('0');
    		$('#tableSeqSecond').val('0');
    		alert('모든 기능을 취소합니다.');
    	});
    	
    	$('#pos-2-9').on('click',pos_cash_open);
    	$('#pos-2-10').on('click',pos_cash_withdraw);
    	$('#pos-2-11').on('click',pos_cash_deposit);
    	$('#pos-2-12').on('click',pos_cash_close);
    	
    	$('#pos-2-17').on('click', function() {
    		pos_pmt_list();
    	});
    }
    
    // 기능버튼을 클릭했을때, flag=1이 된 상태에서, 좌석버튼을 클릭한다.
    // flag = 1 에서 flag = 1a로 변경하고, 좌석번호를 저장한다.
    function pos_seat_move() { 
    	$('#funcFlag').val('1a');
    }
    
    function pos_seat_move2() { // flag = 1a일때
    	alert('이동할 좌석을 선택하십시오.');
    	$('button[s-seatseq]').on('click', pos_selectseat('move2'));
    } 
    
    function pos_seat_move_exec() { // flag = 1b에서 
    	alert('param1, param2을 받아 이동시킵니다.')
    }
    
    function pos_seat_swap() {
    	
    	pos_selectseat('swap1');
    }
    
    function post_seat_swap2() {
    	alert('이동할 좌석을 선택하십시오.');
    	pos_selectseat('swap2');
    } 
    
    function pos_seat_swap_exec() {
    	alert('param1, param2을 받아 교체시킵니다.')
    }    
    
    function pos_seat_merge() {
    	alert('병합될 좌석을 선택하십시오.<br>선택한 테이블은 없어집니다.');
    	pos_selectseat('swap1');
    }
    
    function post_seat_merge2() {
    	alert('병합할 좌석을 선택하십시오.');
    	pos_selectseat('swap2');
    } 
    
    function pos_seat_merge_exec() {
    	alert('param1, param2을 받아 합칩니다.')
    }    
    
    function pos_cash_open() {}
    function pos_cash_withdraw() {}
    function pos_cash_deposit() {}
    function pos_cash_close() {}
    function pos_pmt_list() {}
    
</script>
  
</body>

</html>
