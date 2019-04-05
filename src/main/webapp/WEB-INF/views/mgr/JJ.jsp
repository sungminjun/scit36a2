<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>

  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <script src="resources/jquery-3.3.1.min.js"></script>
  <title>Insert title here</title>
  <script>
    $(function() {
      UpdateInfo();
      $("#CEOUpdate").on("click", UpdateCEO);
      $("#shopUpdate").on("click", UpdateInfo);
      $("#empUpdate").on("click", UpdateEMP);

      $(".tt").delegate("#insertEMP", "click", insertEMP);
    });

    function UpdateEMP() {
      var info = "";

      info += '<input type="button" id="insertEMP" value="직원ID추가 ">';
      info += '<input type="button" id="CEOPw" value="사장님 비번 수정">';
      info += '<input type="button" id="CEOName" value="사장님 이름 수정">';
      info += '<input type="button" id="CEOTell" value="사장님 연락처 수정">';

      $(".tt").html(info);

      $("#insertEMP").on("click", EMPForm);
    }

    function UpdateCEO() {
      var info = "";

      info += '<input type="button" id="CEOId" value="사장님 id수정">';
      info += '<input type="button" id="CEOPw" value="사장님 비번 수정">';
      info += '<input type="button" id="CEOName" value="사장님 이름 수정">';
      info += '<input type="button" id="CEOTell" value="사장님 연락처 수정">';

      $(".tt").html(info);
    }

    function UpdateInfo() {
      var info = "";

      info += '<input type="button" id="CEOId" value="가게정보 수정">';
      info += '<input type="button" id="CEOPw" value="가게정보 수정">';
      info += '<input type="button" id="CEOName" value="가게정보 수정">';
      info += '<input type="button" id="CEOTell" value="가게정보 수정">';

      $(".tt").html(info);
    }

    function EMPForm() {

      var info = "";

      info += '<input type="button" id="insertEMP" value="직원ID추가 ">';
      info += '<input type="button" id="CEOPw" value="사장님 비번 수정">';
      info += '<input type="button" id="CEOName" value="사장님 이름 수정">';
      info += '<input type="button" id="CEOTell" value="사장님 연락처 수정">';
      info += '<br>'
      info += '직원 아이디 : <input type="text" class="EMPId">';
      info += '직원 비밀번호 : <input type="password" id="EMPPw" >';
      info += '직원 이름 : <input type="text" id="EMPName">';
      info += '직원 연락처 : <input type="text" id="EMPTell">';



      var ii = $("#insertEMP").val();
      $(".tt").html(info);
      $("#insertEMP").val("직원 등록");

    }

    function insertEMP() {

      var btn = $("#insertEMP").val();

      if (btn != "직원 등록") {

        return;
      }
      var EMPId = $(".EMPId").val();
      var EMPPw = $("#EMPPw").val();
      var EMPName = $("#EMPName").val();
      var EMPTell = $("#EMPTell").val();

      var emp = {
        "emp_id": EMPId,
        "emp_pw": EMPPw,
        "emp_name": EMPName,
        "emp_tel": EMPTell
      }

      $.ajax({
        url: "registMember",
        type: "post",
        data: emp,
        success: function(data) {

          if (data == 1) {
            alert("성공");
          } else
            alert("실패");
        }


      });
    }

  </script>
</head>

<body>
  <input type="button" id="shopUpdate" value="가게정보 수정">
  <input type="button" id="CEOUpdate" value="사장ID 정보 수정">
  <input type="button" id="empUpdate" value="종업원 ID 추가수정">
  <input type="button" value="가게정보 수정">
  <br>
  <br>
  <br>
  <br>
  <br>
  <br>
  <div class="tt">

  </div>

  <br>
  <br>





</body>

</html>
