<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<link rel="icon" type="image/png" href="./imgs/favicon.png">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<head>
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

  <!-- CSS tab 관련 -->
  <link href="./assets/css/test.css" rel="stylesheet" />
  <script src="resources/jquery-3.3.1.min.js"></script>
  <script>
    $(function() {
      $('ul.tab li').click(function() {
        var activeTab = $(this).attr('data-tab');
        $('ul.tab li').removeClass('current');
        $('.tabcontent').removeClass('current');
        $(this).addClass('current');
        $('#' + activeTab).addClass('current');
      })

      $("#findIdForm").on("submit", function(event) {
        event.preventDefault();
        var comp_id = $('#comp_id').val();
        var emp_name = $('#emp_name').val();
        if (comp_id.length == 0 || emp_name.length == 0) {
          alert("먼저 사업자등록번호와 이름을 입력하십시오.");
        } else {
          var postData = {
            'comp_id': comp_id,
            'emp_name': emp_name
          };
          $.ajax({
            url: 'findId',
            type: 'POST',
            data: postData,
            success: function(resp) {
              console.log(resp)
              console.log(resp.emp_id)
              if ($.type(resp.emp_id) == 'undefined') {
                alert('해당하는 정보가 존재하지 않습니다.');
              } else {
                alert("id는" + resp.emp_id + "입니다.");
              }
            }
          })
        }
      })

      $("#findPwForm").on("submit", function(event) {
        event.preventDefault();
        var emp_id = $('#emp_id_4pw').val();
        var comp_id = $('#comp_id_4pw').val();
        var emp_name = $('#emp_name_4pw').val();
        if (emp_id.length == 0 || comp_id.length == 0 || emp_name.length == 0) {
          alert("먼저 조회하고자 하는 정보를 입력하십시오.");
        } else {
          var postData = {
            'emp_id': emp_id,
            'comp_id': comp_id,
            'emp_name': emp_name
          };
          $.ajax({
            url: 'findPw',
            type: 'POST',
            data: JSON.stringify(postData),
            dataType: 'json',
            contentType: 'application/json; charset=UTF-8',
            success: function(resp) {
              console.log(resp);
              console.log(resp[0].EMP_QUIZ_ANSWER);
              if ($.type(resp[0].EMP_QUIZ) == 'undefined') {
                alert('해당하는 정보가 없습니다.')
              } else {
                $('#findQuizForm').css('display', 'block');
                $('#emp_quiz').html(resp[0].EMP_QUIZ);
              }
            },
            failure: function() {
              alert('fail');
            }
          })
        }
      })

      $("#findQuizForm").on("submit", function(event) {
        event.preventDefault();
        alert('!');
        var emp_id = $('#emp_id_4pw').val();
        var emp_name = $('#emp_name_4pw').val();
        var emp_quiz_answer = $('#emp_quiz_answer').val();
        if (emp_id.length == 0 || emp_quiz_answer.length == 0 || emp_name.length == 0) {
          alert("먼저 조회하고자 하는 정보를 입력하십시오.");
        } else {
          var map = {
            'emp_id': emp_id,
            'emp_name': emp_name,
            'emp_quiz_answer': emp_quiz_answer
          };
          console.log(map);
          $.ajax({
            url: 'findQuiz',
            type: 'POST',
            data: JSON.stringify(map),
            dataType: 'text',
            contentType: 'application/json; charset=UTF-8',
            success: function(resp) {
              console.log(resp);
              if (resp.length == 0) {
                alert('해당하는 정보가 없습니다.')
              } else {
                alert('비밀번호는 ' + resp + ' 입니다.')
              }
            }
          })
        }
      })

    });

  </script>

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
          <div class="col-md-6 ml-auto mr-auto">
            <ul class="tab">
              <li class="current rounded-top" data-tab="tab1"><a href="#">ID 찾기</a></li>
              <li class="rounded-top" data-tab="tab2"><a href="#">PW 찾기</a></li>
            </ul>

            <div id="tab1" class="tabcontent current rounded-bottom rounded-right">
              <form class="box" id="findIdForm" action="findId" method="POST">
                <h1></h1>
                <p><input type="text" name="comp_id" id="comp_id" placeholder="사업자 등록번호"></p>
                <p><input type="text" name="emp_name" id="emp_name" placeholder="회원이름"></p>
                <p><input type="submit" id="findId" name="idSearch" value="ID찾기"></p>
              </form>
            </div>

            <div id="tab2" class="tabcontent rounded">
              <form class="box" id="findPwForm" action="findPw" method="POST">
                <h1></h1>
                <p><input type="text" name="emp_id_4pw" id="emp_id_4pw" placeholder="ID입력"></p>
                <p><input type="text" name="comp_id_4pw" id="comp_id_4pw" placeholder="사업자 등록번호"></p>
                <input type="text" name="emp_name_4pw" id="emp_name_4pw" placeholder="회원이름">
                <input type="submit" name="quizSearch" value="입력">
              </form>
              <form class="box" id="findQuizForm" action="findQuiz" method="POST" style="display: none;">
                <p class="instant_text" id="emp_quiz"></p>
                <p><input type="text" name="emp_quiz_answer" id="emp_quiz_answer" placeholder="질문에 대한 답을 넣어주세요"></p>
                <p><input type="submit" name="pwSearch" value="PW찾기" id="pwSearch"></p>
                <!-- data를 전송해서, ok면(quiz정답이 들어오면) 새로운 비밀번호를 입력받아서 (2번입력받아야함) 전송한다. -->
                <!-- 전송한 data를 update해서 pw를 덮어씌운다. -->
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</body>

</html>
