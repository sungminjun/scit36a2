<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
  <meta charset="UTF-8">
  <title>로그인</title>
  <!-- 
	Code here
	로그인 시 아이디와 비밀번호를 요구에 맞게  입력했는지 검증
	해당 아이디나 비밀번호가 없을 경우 출력메시지
 -->
  <script src="resources/jquery-3.3.1.min.js"></script>
  <script>
    // loginbtn에 onclick 속성부여
    $(document).ready(function() {
      $('#loginbtn').on('click', loginRequest);
    });

    // 유효성 검증 및 이상 없는경우 submit처리
    function loginRequest() {
      var rcvId = $('#userid').val();
      var rcvPw = $('#userpwd').val();

      if (rcvId.length < 3 || rcvId.length > 10 || rcvPw.length < 3 || rcvPw.length > 10) {
        alert('id/pw는 3자리 이상 10자리 이하입니다.');
        return false;
      } else {
        $('#loginForm').submit();
        return true;
      }
    }

  </script>

  <style>
    div#message {
      color: red;
    }

  </style>
</head>

<body>
  <h2>[ 로그인 ]</h2>
  <div id="message">${message }</div>
  <form id="loginForm" action="login" method="post">
    <table>
      <tr>
        <td>아이디</td>
        <td><input type="text" id="userid" name="emp_id" placeholder="3~10 자리 ID 입력" /></td>
      </tr>
      <tr>
        <td>비밀번호</td>
        <td><input type="password" id="userpwd" name="emp_pw" placeholder="3~10자리 비밀번호 입력"></td>
      </tr>
      <tr>
        <td colspan="2"><input id="loginbtn" type="button" value="로그인" />
        </td>
    </table>
  </form>
</body>
