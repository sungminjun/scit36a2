<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

  <link rel="icon" type="image/png" href="imgs/favicon.png">
  <title>MinnanoPOS</title>
  <!--     Fonts and icons     -->
  <link href="https://use.fontawesome.com/releases/v5.0.6/css/all.css" rel="stylesheet">
  <!-- Nucleo Icons -->
  <link href="assets/css/nucleo-icons.css" rel="stylesheet" />
  <!-- CSS Files -->
  <link href="assets/css/black-dashboard.css?v=1.0.0" rel="stylesheet" />
  <!--추가한 파일 jquery ui for chartjs  -->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
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
              <div class="card-body">
                <div class="row">
                  <div class="col-md-3">
                    <input type="text" class="form-control text-center" id="company_name" value="company name" disabled="disabled">
                  </div>
                  <div class="btn-group" data-toggle="buttons">
                    <label class="btn btn-secondary active" id="option21">
                      <input type="radio" name="options2" checked value="sales">
                      매출조회
                    </label>
                    <label class="btn btn-secondary" id="option22">
                      <input type="radio" name="options2" value="customer">
                      고객통계
                    </label>
                    <label class="btn btn-secondary" id="option23">
                      <input type="radio" name="options2" value="menu">
                      메뉴통계
                    </label>
                    <label class="btn btn-secondary" id="option24">
                      <input type="radio" name="options2" value="card">
                      현/카조회
                    </label>
                    <label class="btn btn-secondary" id="option25">
                      <input type="radio" name="options2" value="income">
                      수지보고서
                    </label>
                    <button class="btn mx-auto" onclick="window.open('synthesize','window_name','width=900,height=1000,location=no,status=no,scrollbars=yes,top=50,left=200	')">종합보고서</button>
                  </div>
                </div>
                <div class="row">
                  <div class="col-md-4 btn-group" id="options" data-toggle="buttons">
                    <label class="btn btn-secondary active">
                      <input type="radio" name="options" id="option11" value="day" checked>
                      DAY
                    </label>
                    <label class="btn btn-secondary">
                      <input type="radio" name="options" id="option12" value="week">
                      WEEK
                    </label>
                    <label class="btn btn-secondary">
                      <input type="radio" name="options" id="option13" value="month">
                      MONTH
                    </label>
                    <div>
                      <button class="testFinal">종합보고서</button>
                    </div>
                  </div>
                  <div class="col-md-4" id="blank" style="display:none;">
                  </div>
                  <div class="col-md-4" id="blank" style="display:none;">
                  </div>
                  <div class="col-md-6 input-group">
                    <label>시작일</label>
                    <input type="text" id="datepicker1" class="form-control text-center" placeholder="YY-MM-DD">
                    <label>종료일</label>
                    <input type="text" id="datepicker2" class="form-control text-center" placeholder="YY-MM-DD">
                    <button type="submit" class="btn mx-auto" id="search">검색</button>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="row">
          <!-- 차트부분 -->
          <div class="col-md-7">
            <div class="card">
              <div class="card-body">
                <canvas id="myChart" height="200%"></canvas>
              </div>
            </div>
          </div>
          <!-- 차트 표 부분 -->
          <div class="col-md-5">
            <div class="card">
              <div class="card-body">
                <div class="tableTest" style="width: auto;"></div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <footer class="footer"></footer>

  </div>

  <!--   Core JS Files   -->
  <script src="assets/js/core/jquery.min.js"></script>
  <script src="assets/js/core/popper.min.js"></script>
  <script src="assets/js/core/bootstrap.min.js"></script>
  <script src="assets/js/plugins/perfect-scrollbar.jquery.min.js"></script>
  <!--  Google Maps Plugin    -->
  <!-- Place this tag in your head or just before your close body tag. -->
  <!-- Chart JS -->
  <script src="assets/js/plugins/chartjs.min.js"></script>
  <!--  Notifications Plugin    -->
  <script src="assets/js/plugins/bootstrap-notify.js"></script>
  <!-- Control Center for Black Dashboard: parallax effects, scripts for the example pages etc -->
  <script src="assets/js/black-dashboard.min.js?v=1.0.0"></script>
  <script src="//code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
  <!-- 
  <script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
 -->
  <script>
    // 전역변수 here
    // 그래프 테스트 (일일매출  현재일부터 1일까지의 매출)
    var data = [];
    var labels = [];
    var label = "매출액";
    //map 형식 index 번호 세는용
    var temp = 0;
    //기본값 테이블(표) 매출 테스트
    var chart;
    var ctx = document.getElementById('myChart').getContext('2d');
    var newchart;

    // call init onload
    $(document).ready(function() {
      dobutton();
      setdatepicker();
      // set default date (st = today -6months, end = today)
      setdatetodaydefault();
      init();
    })

    // 기본 페이지 로딩용 스크립트
    function init() {
      var startDate = $('#datepicker1').val();
      var endDate = $('#datepicker2').val();
      var unit = $('input[name=options]:checked').val();
      var category = $('input[name=options2]:checked').val();

      // load company name
      $.ajax({
        url: 'selectCompanyOne',
        method: 'POST',
        success: function(resp) {
          $('#company_name').val('업체명 : ' + resp.comp_name);
        }
      })

      // set default start_date and end_date (#datepicker1, #datepicker2)
      $.ajax({
        url: 'search_date',
        method: 'POST',
        data: {
          startDate: startDate,
          endDate: endDate,
          unit: unit,
          category: category
        },
        success: output
      })

      $('#option21').on('click', showtype1);
      $('#option22').on('click', showtype1);
      $('#option23').on('click', showtype2);
      $('#option24').on('click', showtype2);
      $('#option25').on('click', showtype2);
    }

    function showtype1() {
      $('#options').css('display', 'flex');
      $('#blank').css('display', 'none');
    }

    function showtype2() {
      $('#options').css('display', 'none');
      $('#blank').css('display', 'flex');
    }

    function setdatetodaydefault() {
      var date = new Date();
      var day = date.getDate();
      var month = date.getMonth() + 1;
      var year = date.getFullYear();
      if (month < 10) month = "0" + month;
      if (day < 10) day = "0" + day;
      var today = year + "-" + month + "-" + day;
      var stdate;
      if (month > 6) {
        month = date.getMonth() - 5;
      } else {
        year = date.getFullYear() - 1;
        month = date.getMonth() + 7;


      }
      stdate = year + "-" + month + "-" + day;

      $('#datepicker1').val(stdate);
      $('#datepicker2').val(today);
    }


    function output(resp) {
      var output = '';
      output += '<table class="table table-hover">';
      output += '<thead><tr><th style="width :30%; text-align: center;">일</th><th style="width :50%; text-align: center;">판매금액</th><th style="width :20%;">비고</th></tr></thead></table></div><div class="tableTest2" style="overflow: auto;width:auto; height:500px;" ><table class="table table-hover">';
      $.each(resp, function(index, item) {
        output += '<tr><td style="width :30%;">' + item.DAYTIME +
          '</td><td style=" text-align: center; width :50%;">' +
          item.PAYMENT_AMOUNT_SUM +
          '원</td><td style="width :30%;"></td></tr>'
      })
      output += "</table>"
      $('.tableTest').html(output);

      $.each(resp, function(index, item) {
        labels[temp] = item.DAYTIME;
        data[temp] = item.PAYMENT_AMOUNT_SUM;
        temp++;
      });
      temp = 0;
      firstshow();
      data = [];
      labels = [];
    }

    // initializing for output (first time output) 
    function firstshow() {
      newchart = new Chart(ctx, {
        type: 'bar', //차트모양
        data: {
          labels: labels,
          datasets: [{
            type: "bar",
            label: label,
            backgroundColor: '#3e95cd',
            borderColor: 'rgb(111, 111, 102)',
            data: data,
          }, ]
        }
      });
    }

    //날짜 찝기
    function setdatepicker() {
      $("#datepicker1, #datepicker2").datepicker({
        dateFormat: 'yy-mm-dd',
        viewMode: 'days'
      });
    }

    //날짜 유효성 검사
    function dobutton() {
      $("#search").on('click', function() {
        var start = $("#datepicker1").val();
        var end = $("#datepicker2").val();
        var unit = $('input[name=options]:checked').val();
        var category = $('input[name=options2]:checked').val();
        if (start == '') {
          alert("시작일을 입력해주세요!")
          return false;
        }
        if (end == '') {
          alert("종료일을 입력해주세요!")
          return false;
        }
        if (start > end) {
          alert("종료일은 시작일보다 작을 수 없습니다.")
          return false;
        }
        //날짜 검색
        $.ajax({
          url: 'search_date',
          method: 'post',
          data: {
            startDate: start,
            endDate: end,
            unit: unit,
            category: category
          },
          success: chartUpdate
        })
      });
    }

    //차트 검색을 눌렀을때 업데이트 구문
    // 즉, 첫번째 output이 아닌, init된 이후의 output에 대해서의 반응
    function chartUpdate(updateData) {
      console.log(updateData);
      labels = [];
      data = [];
      //@@@@@@@@@@@@@@일 &매출@@@@@@@@@@@@@@@ daily sales
      if ($('input[name=options]:checked').val() == 'day' && $('input[name=options2]:checked').val() == 'sales') {
        //그래프 값 넣기
        $.each(updateData, function(index, item) {
          labels[temp] = item.DAYTIME;
          data[temp] = item.PAYMENT_AMOUNT_SUM;
          temp++;
        });

        //그래프 업데이트
        newchart.data.datasets[0].data = data;
        newchart.data.labels = labels;
        label = '매출액'
        //그래프 업데이트
        newchart.destroy();
        newchart = new Chart(ctx, {
          type: 'bar', //차트모양
          data: {
            labels: labels,
            datasets: [{
              label: label,
              backgroundColor: "#3e95cd",
              data: data,
            }, ]
          }
        });
        temp = 0;
        var output = '';
        output += '<table class="table table-hover">';
        output += '<thead><tr><th style="width :30%; text-align: center;">일</th><th style="width :50%; text-align: center;">판매금액</th><th style="width :20%;">비고</th></tr></thead></table></div><div class="tableTest2" style="overflow: auto;width:auto; height:500px;" ><table class="table table-hover">';
        $.each(updateData, function(index, item) {
          output += '<tr><td style="width :30%;">' + item.DAYTIME +
            '</td><td style=" text-align: center; width :50%;">' +
            item.PAYMENT_AMOUNT_SUM +
            '원</td><td style="width :30%;"></td></tr>'
        })
        output += "</table>"
        $('.tableTest').html(output);
        //@@@@@@@@@@@주 &매출@@@@@@@@@@@@@@@ weekly sales
      } else if ($('input[name=options]:checked').val() == 'week' && $('input[name=options2]:checked').val() == 'sales') {
        //그래프 값 넣기
        $.each(updateData, function(index, item) {
          labels[temp] = item.STARTDATE;
          labels[temp] += "~" + item.ENDDATE;
          data[temp] = item.PAYMENT_AMOUNT_SUM;
          temp++;
        });
        //그래프 업데이트
        newchart.data.datasets[0].data = data;
        newchart.data.labels = labels;
        label = '매출액'
        //그래프 업데이트
        newchart.destroy();
        newchart = new Chart(ctx, {
          type: 'bar', //차트모양
          data: {
            labels: labels,
            datasets: [{
              label: label,
              backgroundColor: "#3e95cd",
              data: data,
            }, ]
          }
        });
        temp = 0;
        var output = '';
        output += '<table class="table table-hover">';
        output += '<thead><tr><th style="width :30%; text-align: center;">기간(주)</th><th style="width :50%; text-align: center;">판매금액</th><th style="width :20%;">비고</th></tr></thead></table></div><div class="tableTest2" style="overflow: auto;width:auto; height:500px;" ><table class="table table-hover">';
        $.each(updateData, function(index, item) {
          output += '<tr><td style="width :30%;">' + item.STARTDATE + "~" + item.ENDDATE +
            '</td><td style=" text-align: center; width :50%;">' +
            item.PAYMENT_AMOUNT_SUM +
            '원</td><td style="width :30%;"></td></tr>'
        })
        output += "</table>"
        $('.tableTest').html(output);
        //@@@@@@@@@@@@월 &매출@@@@@@@@@@@@ monthly sales
      } else if ($('input[name=options]:checked').val() == 'month' && $('input[name=options2]:checked').val() == 'sales') {
        //그래프 값 넣기
        $.each(updateData, function(index, item) {
          labels[temp] = item.MONTHTIME;
          data[temp] = item.PAYMENT_AMOUNT_SUM;
          temp++;
        });
        //그래프 업데이트
        newchart.data.datasets[0].data = data;
        newchart.data.labels = labels;
        label = '매출액'
        //그래프 업데이트
        newchart.destroy();
        newchart = new Chart(ctx, {
          type: 'bar', //차트모양
          data: {
            labels: labels,
            datasets: [{
              label: label,
              backgroundColor: "#3e95cd",
              data: data,
            }, ]
          }
        });
        temp = 0;
        var output = '';
        output += '<table class="table table-hover">';
        output += '<thead><tr><th style="width :30%; text-align: center;">월</th><th style="width :50%; text-align: center;">판매금액</th><th style="width :20%;">비고</th></tr></thead></table></div><div class="tableTest2" style="overflow: auto;width:auto; height:500px;" ><table class="table table-hover">';
        $.each(updateData, function(index, item) {
          output += '<tr><td style="width :30%;">' + item.MONTHTIME +
            '</td><td style=" text-align: center; width :50%;">' +
            item.PAYMENT_AMOUNT_SUM +
            '원</td><td style="width :30%;"></td></tr>'
        })
        output += "</table>"
        $('.tableTest').html(output);
        //@@@@@@@@@@@@@일 &고객@@@@@@@@@@@@@@   
      } else if ($('input[name=options]:checked').val() == 'day' && $('input[name=options2]:checked').val() == 'customer') {
        alert('고객 데이')
        //그래프 값 넣기
        var data1 = [];
        var data2 = [];
        var data3 = [];
        temp = 0;
        $.each(updateData, function(index, item) {
          labels[temp] = item.DAYTIME;
          /* data1[temp] = item.VISITORS; */
          data2[temp] = item.GECK;
          /* data3[temp] = item.SPIN; */
          temp++;
        });
        /* var label1 = '내점객수'; */
        var label2 = '객단가';
        var label3 = '회전';
        //그래프 업데이트
        newchart.destroy();
        newchart = new Chart(ctx, {
          type: 'line', //차트모양
          data: {
            labels: labels,
            datasets: [
              /* {
                label: label1,
                borderColor: 'rgb(111, 111, 102)',
                data: data1
              },  */
              {
                label: label2,
                borderColor: 'rgb(000, 111, 000)',
                data: data2
              }
              /* , {
                label: label3,
                borderColor: 'rgb(000, 111, 111)',
                data: data3
              } */
            ]
          }
        });
        temp = 0;
        // table용 output처리
        var output = '';
        output += '<table class="table table-hover">';
        output += '<thead><tr><th style="width :20%; text-align: center;">기준일</th>'
        output += '<th style="width :25%; text-align: center;">내점객수</th>'
        output += '<th style="width :25%;text-align: center;">객단가</th>'
        output += '<th style="width :30%; text-align: center;">회전(table TurnOver)</th></tr></thead></table>'
        output += '</div><div class="tableTest2" style="overflow: auto;width:auto; height:500px;" ><table class="table table-hover">';
        $.each(updateData, function(index, item) {
          output += '<tr><td style="width :20%;">' + item.DAYTIME + '</td>'
          output += '<td style="text-align: center; width :25%;">' + item.VISITORS + '명</td>'
          output += '<td style="text-align: center; width :25%;">' + item.GECK + '원</td>'
          output += '<td style="width :30%;">' + item.SPIN + '회전</td></tr>'
        })
        output += "</table>"
        $('.tableTest').html(output);
        //@@@@@@@@@@@@@주 &고객@@@@@@@@@@@@@@   
      } else if ($('input[name=options]:checked').val() == 'week' && $('input[name=options2]:checked').val() == 'customer') {
        alert('고객 위크')
        //그래프 값 넣기
        var data1 = [];
        var data2 = [];
        var data3 = [];
        temp = 0;
        $.each(updateData, function(index, item) {
          labels[temp] = item.STARTDATE;
          labels[temp] += "~" + item.ENDDATE;
          /* data1[temp] = item.VISITORS; */
          data2[temp] = item.GECK;
          /* data3[temp] = item.SPIN; */
          temp++;
        });
        /* var label1 = '내점객수'; */
        var label2 = '객단가';
        var label3 = '회전';
        //그래프 업데이트
        newchart.destroy();
        newchart = new Chart(ctx, {
          type: 'line', //차트모양
          data: {
            labels: labels,
            datasets: [
              /* {
                label: label1,
                borderColor: 'rgb(111, 111, 102)',
                data: data1
              },  */
              {
                label: label2,
                borderColor: 'rgb(000, 111, 000)',
                data: data2
              }
              /* , {
                label: label3,
                borderColor: 'rgb(000, 111, 111)',
                data: data3
              } */
            ]
          }
        });
        temp = 0;
        // table용 output처리
        var output = '';
        output += '<table class="table table-hover">';
        output += '<thead><tr><th style="width :30%; text-align: center;">기준주</th>'
        output += '<th style="width :25%; text-align: center;">내점객수</th>'
        output += '<th style="width :25%; text-align: center;">객단가</th>'
        output += '<th style="width :20%; text-align: center;">회전(table TurnOver)</th></tr></thead></table>'
        output += '</div><div class="tableTest2" style="overflow: auto;width:auto; height:500px;" ><table class="table table-hover">';
        $.each(updateData, function(index, item) {
          output += '<tr><td style="width :30%; text-align: center;">' + item.STARTDATE + "~" + item.ENDDATE + '</td>'
          output += '<td style="text-align: center; width :25%;">' + item.VISITORS + '명</td>'
          output += '<td style="text-align: center; width :25%;">' + item.GECK + '원</td>'
          output += '<td style="width :20%; text-align: center;">' + (item.SPIN / 7).toFixed(1) + '회전</td></tr>'
        })
        output += "</table>"
        $('.tableTest').html(output);
        //@@@@@@@@@@@@@월 &고객@@@@@@@@@@@@@@   
      } else if ($('input[name=options]:checked').val() == 'month' && $('input[name=options2]:checked').val() == 'customer') {
        alert('고객 먼쓰')
        //그래프 값 넣기
        var data1 = [];
        var data2 = [];
        var data3 = [];
        temp = 0;
        $.each(updateData, function(index, item) {
          labels[temp] = item.MONTHTIME;
          /* data1[temp] = item.VISITORS; */
          data2[temp] = item.GECK;
          /* data3[temp] = item.SPIN; */
          temp++;
        });
        /* var label1 = '내점객수'; */
        var label2 = '객단가';
        var label3 = '회전';
        //그래프 업데이트
        newchart.destroy();
        newchart = new Chart(ctx, {
          type: 'line', //차트모양
          data: {
            labels: labels,
            datasets: [
              /* {
                label: label1,
                borderColor: 'rgb(111, 111, 102)',
                data: data1
              },  */
              {
                label: label2,
                borderColor: 'rgb(000, 111, 000)',
                data: data2
              }
              /* , {
                label: label3,
                borderColor: 'rgb(000, 111, 111)',
                data: data3
              } */
            ]
          }
        });
        temp = 0;
        // table용 output처리
        var output = '';
        output += '<table class="table table-hover">';
        output += '<thead><tr><th style="width :20%; text-align: center;">기준월</th>'
        output += '<th style="width :25%; text-align: center;">내점객수</th>'
        output += '<th style="width :25%; text-align: center;">객단가</th>'
        output += '<th style="width :30%; text-align: center;">회전(table TurnOver)</th></tr></thead></table>'
        output += '</div><div class="tableTest2" style="overflow: auto;width:auto; height:500px;" ><table class="table table-hover">';
        $.each(updateData, function(index, item) {
          alert(item.MONTHTIME);
          output += '<tr><td style="width :20%;">' + item.MONTHTIME + '</td>'
          output += '<td style="text-align: center; width :25%;">' + item.VISITORS + '명</td>'
          output += '<td style="text-align: center; width :25%;">' + item.GECK + '원</td>'
          output += '<td style="width :30%; text-align: center;">' + item.SPIN + '회전</td></tr>'
        })
        output += "</table>"
        $('.tableTest').html(output);
        //@@@@@@@@@@@@@일 &메뉴@@@@@@@@@@@@@@
        //@@@@@@@@@@@@@주 &메뉴@@@@@@@@@@@@@@
        //@@@@@@@@@@@@@월&메뉴@@@@@@@@@@@@@@
      } else if ($('input[name=options]:checked').val() == 'day' && $('input[name=options2]:checked').val() == 'menu' || $('input[name=options]:checked').val() == 'week' && $('input[name=options2]:checked').val() == 'menu' || $('input[name=options]:checked').val() == 'month' && $('input[name=options2]:checked').val() == 'menu') {
        alert('메뉴 데이, 위크, 먼쓰 없고 기간만 정해서 통계내줌')
        //그래프 값 넣기
        $.each(updateData, function(index, item) {
          labels[temp] = item.MENU_NAME;
          data[temp] = item.SALES_ORDER_SUM;
          temp++;
        });
        //그래프 업데이트
        newchart.destroy();
        newchart = new Chart(ctx, {
          type: 'bar', //차트모양
          data: {
            labels: labels,
            datasets: [{
              type: "bar",
              label: label,
              backgroundColor: "#3e95cd",
              data: data,
            }, ]
          }
        });
        temp = 0;
        // table용 output처리
        var output = '';
        output += '<table class="table table-hover">';
        output += '<thead><tr><th style="width :10%; text-align: center;">순번</th>'
        output += '<th style="width :30%; text-align: center;">메뉴</th>'
        output += '<th style="width :30%; text-align: center;">판매량</th>'
        output += '<th style="width :30%; text-align: center;">매출액</th></tr></thead></table>'
        output += '</div><div class="tableTest2" style="overflow: auto;width:auto; height:500px;" ><table class="table table-hover">';
        $.each(updateData, function(index, item) {
          output += '<tr><td style="width :10%;">' + ++temp + '</td>'
          output += '<td style="text-align: center; width :30%;">' + item.MENU_NAME + '</td>'
          output += '<td style="text-align: center; width :30%;">' + item.SALES_ORDER_SUM + ' 건</td>'
          output += '<td style="width :30%;">' + item.PAYMENT_AMOUNT + ' 원</td></tr>'
        })
        temp = 0;
        output += "</table>"
        $('.tableTest').html(output);
        //@@@@@@@@@@@@@일 &현금/카드@@@@@@@@@@@@@@
      } else if ($('input[name=options2]:checked').val() == 'card') {
        alert('현금/카드 데이, 위크, 먼쓰 없고 기간만 정해서 통계내줌')
        //그래프 값 넣기
        var card = ['카드', '현금']
        //퍼센트 만들어주기
        var percent = 0;
        $.each(updateData, function(index, item) {
          labels[temp] = card[temp];
          data[temp] = item.PAYMENT_AMOUNT;
          percent += item.PAYMENT_AMOUNT;
          temp++;
        });
        alert(percent);
        //그래프 업데이트
        newchart.destroy();
        newchart = new Chart(ctx, {
          type: 'pie', //차트모양
          data: {
            labels: labels,
            datasets: [{
              label: label,
              backgroundColor: ["#3e95cd", "#8e5ea2"],
              data: data,
            }, ]
          }
        });
        temp = 0;
        // table용 output처리
        var output = '';
        output += '<table class="table table-hover">';
        output += '<thead><tr><th style="width :30%; text-align: center;">구분</th><th style="width :50%; text-align: center;">판매금액</th><th style="width :20%;">비고</th></tr></thead></table></div><div class="tableTest2" style="overflow: auto;width:auto; height:500px;" ><table class="table table-hover">';
        $.each(updateData, function(index, item) {
          output += '<tr><td style="width :30%; text-align: center;">' + labels[index] +
            '</td><td style=" text-align: center; width :50%;">' +
            item.PAYMENT_AMOUNT +
            '원</td><td style="width :30%;">' + ((item.PAYMENT_AMOUNT / percent).toFixed(2)) * 100 + '%' + '</td></tr>'
        })
        output += "</table>"
        $('.tableTest').html(output);
        //@@@@@@@@@@@@@일 &수지@@@@@@@@@@@@@@
      } else if ($('input[name=options2]:checked').val() == 'income') {
        //그래프 값 넣기
        var data2 = [];
        var data3 = [];
        $.each(updateData, function(index, item) {
          labels[temp] = item.MONTHTIME;
          data[temp] = item.PAYMENT_AMOUNT_SUM;
          data2[temp] = item.EXPENSE_AMOUNT;
          data3[temp] = (((item.PAYMENT_AMOUNT_SUM - item.EXPENSE_AMOUNT) / item.PAYMENT_AMOUNT_SUM) * 100).toFixed(2);
          temp++;
        });
        //그래프 업데이트
        newchart.destroy();
        newchart = new Chart(ctx, {
          type: 'bar',
          data: {
            labels: labels,
            datasets: [{
              type: 'bar',
              label: '매출액',
              backgroundColor: ["#3e95cd", "#8e5ea2"],
              data: data,
              yAxisID: 'A'
            }, {
              type: 'bar',
              label: '지출액',
              backgroundColor: ["#3e95cd", "#8e5ea2"],
              data: data2,
              yAxisID: 'A'

            }, {
              type: 'line',
              label: '이익률',
              backgroundColor: 'rgba(0, 0, 0, 0.1)',
              data: data3,
              yAxisID: 'B'
            }]
          },
          options: {
            scales: {
              yAxes: [{
                id: 'A',
                type: 'linear',
                position: 'left',
              }, {
                id: 'B',
                type: 'linear',
                position: 'right',


              }]
            }
          }
        });
        temp = 0;
        var output = '';
        output += '<table class="table table-hover">';
        output += '<thead><tr><th style="width :20%; text-align: center;">월</th>'
        output += '<th style="width :30%; text-align: center;">매출액</th>'
        output += '<th style="width :30%; text-align: center;">지출액</th>'
        output += '<th style="width :20%; text-align: center;">이익률</th></tr></thead></table>'
        output += '</div><div class="tableTest2" style="overflow: auto;width:auto; height:500px;" ><table class="table table-hover">';
        $.each(updateData, function(index, item) {
          output += '<tr><td style="width :20%;">' + item.MONTHTIME + '</td>'
          output += '<td style="text-align: center; width :30%;">' + item.EXPENSE_AMOUNT + '</td>'
          output += '<td style="text-align: center; width :30%;">' + item.ALLPAYMENT + ' 건</td>'
          output += '<td style="width :20%;text-align: center;">' + (((item.ALLPAYMENT - item.EXPENSE_AMOUNT) / item.ALLPAYMENT) * 100).toFixed(2) + "%" + '</td></tr>'
        })
        output += "</table>"
        $('.tableTest').html(output);
        //@@@@@@@@@@@@@주 &수지@@@@@@@@@@@@@@
      }
    }

    $('.testFinal').on('click', function() {
      $.ajax({
        url: 'totalReport',
        method: 'POST',
        success: function(resp) {
          alert(resp);
        }
      });
      $.ajax({
        url: 'totalMenuReport',
        method: 'POST',
        success: function(resp) {
          alert(resp);
        }
      });
      $.ajax({
        url: 'totalGuestReport',
        method: 'POST',
        success: function(resp) {
          alert(resp);
        }
      })
      $.ajax({
        url: 'totalIncomeReport',
        method: 'POST',
        success: function(resp) {
          alert(resp);
        }
      })
    });

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
