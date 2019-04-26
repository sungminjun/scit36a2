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
  <style>
  .btn-file {
    position: relative;
    overflow: hidden;
}
.btn-file input[type=file] {
    position: absolute;
    top: 0;
    right: 0;
    min-width: 100%;
    min-height: 100%;
    font-size: 100px;
    text-align: right;
    filter: alpha(opacity=0);
    opacity: 0;
    outline: none;
    background: white;
    cursor: inherit;
    display: block;
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
      <!-- 영역 시작 -->
      <div class="content">
        <div class="row">
          <div class="col-md-12">
            <div class="row">
              <div class="card">
                <div class="col-md-12" style="font-size: 1.3em;">
                  <a href="https://www.cardsales.or.kr/" style="color: indigo; font-weight: 900;">여신금융협회 홈페이지</a>에서
                  <br>"기간별 승인내역(세부내역)"을 다운로드 받아 파일을 업로드 하시기 바랍니다.
                  <br>* 전송된 자료는 분석 후 바로 삭제되며, 보관하지 않습니다.
                  <br>
                  <form id="multiform" action="cvtupload" method="POST" enctype="multipart/form-data" style="display: inline-block;">
                     <label class="input-group-btn" style="display: block;">
                     <span class="btn btn-default btn-file"  style="display: inline-block;">파일찾기<input type="file" name="file" data-display-target="attachFile"></span>
                     <input type="text" class="form-control" readonly="" id="attachFile" placeholder="엑셀 파일을 첨부하십시오." style="display: inline-block;">
                     <label class="input-group-btn"><button type="submit" class="btn btn-default" id="search">전송</button></label><br />
                     </label>
                  </form>
                </div>
              </div>
            </div>
            <div class="row">
              <div class="card">
                <div class="col-md-12">
                  <div id="cvtresult"></div>
                </div>
              </div>
            </div>
            <div class="row">
              <div class="card">
                <div class="col-md-12" id="cvtdetail1" style="display: none;">
                </div>
              </div>
            </div>
            <div class="row">
              <div class="card">
                <div class="col-md-12" id="cvtdetail2" style="display: none;">
                </div>
              </div>
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
  <script>
    $(document).ready(function() {
      $("#multiform").on('submit', function(event) {
        event.preventDefault();
        $('#cvtdetail1').css('display', 'none');
        $('#cvtdetail2').css('display', 'none');
        var formObj = $(this);
        var formURL = formObj.attr("action");
        var formData = new FormData(this);

        $.ajax({
          url: formURL,
          type: 'POST',
          data: formData,
          mimeType: 'multipart/form-data; charset=UTF-8',
          dataType: 'JSON',
          contentType: false,
          processData: false,
          cache: false,
          success: function(resp) {
            console.log(resp)
            output(resp);
          }
        });
      })
    });

    function output(resp) {
      var prout = '';
      var prout_detail_1 = '';
      var prout_detail_2 = '';


      prout += '업로드한 엑셀파일 내의 카드승인 건수는 <strong>' + resp.matome.countXls + '</strong>건 이며, 합계금액은 <strong>' + resp.matome.sumXls + '</strong>원 입니다.<br>';
      prout += 'POS기의 카드매출 내역에 저장된 카드승인 건수는 <strong>' + resp.matome.countDb + '</strong>건 이며, 합계금액은 <strong>' + resp.matome.sumDb + '</strong>원 입니다.<br>';
      prout += '<br>';
      prout += '총 <strong>' + resp.matome.eqCnt + '</strong>건이 정상으로 확인 되었으며, <br>';
      prout += '카드 매출 내역에는 있지만, 승인내역이 조회되지 않는 경우가 <strong>' + resp.matome.errCntXls + '</strong>건 있습니다.<br>';
      prout += '카드 승인내역에는 있지만, POS기 매출내역에서 조회되지 않는 경우가 <strong>' + resp.matome.errCntDb + '</strong>건 있습니다.<br>';
      prout += '<br>';
      console.log(resp.matome.errCntXls)
      console.log(resp.matome.errCntDb)
      console.log(resp.matome.errCntXls === 0)
      console.log(resp.matome.errCntDb === 0)
      if (resp.matome.errCntXls !== 0 || resp.matome.dbCntXls !== 0) {
        prout += '자세한 내역은 <span id="showdetail" style="color: red;">여기를 클릭</span>하여 확인하시기 바랍니다.<br>';
      }
      prout += '감사합니다.';

      $('#cvtresult').html(prout);

      if (Object.keys(resp.xlserr).length != 0) {
        prout_detail_1 += '카드승인 내역에는 있으나, POS기 자료에서 확인되지 않는 경우: <br>';
        prout_detail_1 += '[POS기에서 카드매출을 현금매출로 잘못 입력한 경우가 많습니다.]<br>';
        $.each(resp.xlserr, function(xlsidx, xlsobj) {
          prout_detail_1 += '<br>승인내역: 시간:' + xlsobj.dtime + ', 금액: ' + xlsobj.amount + '원';
        })
      }

      $('#cvtdetail1').html(prout_detail_1);

      if (Object.keys(resp.dberr).length != 0) {
        prout_detail_2 += 'POS기 자료에 있지만, 카드승인내역이 확인되지 않는 경우: <br>';
        prout_detail_2 += '[카드단말기 이상으로 인해 승인이 나지 않았을 가능성, 또는 승인취소 되었을 가능성이 있습니다.]<br>';
        $.each(resp.dberr, function(dbidx, dbobj) {
          prout_detail_2 += '<br>POS기 내 카드매출: 시간:' + dbobj.dtime + ', 금액: ' + dbobj.amount + '원';
        })
      }

      $('#cvtdetail2').html(prout_detail_2);

      $('#showdetail').on('click', function() {
        $('#cvtdetail1').css('display', 'block');
        $('#cvtdetail2').css('display', 'block');
      })

    }

  </script>
  <script>
  $(document).ready(function() {
	  $("input[type='file']").on('change', function() {
	   var input = $(this);
	   var label = input.val().replace(/\\/g, '/').replace(/.*\//, '');  
	   $("#" + input.data("display-target")).val(label);
	  });
	 });
  </script>
</body>

</html>
