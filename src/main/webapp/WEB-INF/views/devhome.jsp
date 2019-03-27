<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
  <script src="./resources/jquery-3.3.1.min.js"></script>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>MINNANO POS SAMPLE PAGE</title>
</head>

<body>
  <h1>MINNANO POS SAMPLE PAGE: Hello world!</h1>
  <br>
  개발용 홈페이지: 개발이 완료 된 후 root를 home으로 보내지 않고 login으로 보내게 된다.
  <br> <a href="https://docs.google.com/spreadsheets/d/186B7XnuGiBXcFaPVpChtV514L4NsYMdBy9Jgeeu2oGU/edit#gid=0" style="text-decoration: line-through;">개발진도관리표</a>포기하고 밑에 json객체로 관리하기로 함
  <br>
  <br>
  <c:if test="${sessionScope.emp_id != null}">
  <span style="color: red;">${sessionScope.comp_seq}</span> 번 회사의, <span style="color: red;">${sessionScope.emp_id}</span> 로 로그인 되어있습니다.
  </c:if>
  <br> 작업완료: 모든페이지 사이드바 링크 연결 완료. mgr페이지 서브메뉴 선택에 따라 show/hide 처리 
  <br> 작업중: 로그인, 회원가입, id/pw찾기 연결
  <br> 예정사항: mgr페이지 세부기능 연결 
  <br>
  <br>
  <table border="1" style="border-collapse: collapse;" class="progress">
    <tr>
      <th style="width: 10%;"> side 구분 </th>
      <th style="width: 10%;"> 담당자 </th>
      <th style="width: 10%;"> 페이지이동(link) </th>
      <th style="width: 30%;"> 기능구분 </th>
      <th style="width: 10%;"> 진행률 </th>
    </tr>
    <tr>
      <td> side </td>
      <td> charge </td>
      <td> page </td>
      <td> desc </td>
      <td> prog </td>
    </tr>
    <tr>
      <th colspan="5">이하 json 객체로 채워넣기, 각자 진도 추가/수정할게요.</th>
    </tr>

  </table>
  <script>
    var data = {
      "da": [{
        "side": "front",
        "charge": "프론트공통",
        "page": "basic",
        "desc": "공통양식",
        "prog": "100%"
      }, {
        "side": "front",
        "charge": "이영창,전성민",
        "page": "login",
        "desc": "로그인",
        "prog": "100%"
      }, {
        "side": "front",
        "charge": "이영창",
        "page": "join",
        "desc": "회원가입",
        "prog": "100%"
      }, {
        "side": "front",
        "charge": "이영창",
        "page": "find",
        "desc": "id/pw찾기",
        "prog": "100%"
      }, {
        "side": "front",
        "charge": "전성민",
        "page": "main",
        "desc": "로그인 후 첫 분기화면",
        "prog": "100%"
      }, {
        "side": "front",
        "charge": "전성민",
        "page": "mgr",
        "desc": "관리자메뉴",
        "prog": "50%"
      }, {
        "side": "back",
        "charge": "최철규",
        "page": "choiTest",
        "desc": "백단테스트메뉴(최철규,테이블)",
        "prog": "50%"
      }, {
        "side": "back",
        "charge": "최철규",
        "page": "choitestmenu",
        "desc": "백단테스트메뉴(최철규,메뉴)",
        "prog": "50%"
      }, {
        "side": "back",
        "charge": "김유경",
        "page": "kyk",
        "desc": "백단테스트메뉴(김유경)",
        "prog": "50%"
      }, {
        "side": "front",
        "charge": "이호정",
        "page": "report",
        "desc": "보고서 페이지",
        "prog": "50%"
      }]
    }

    function output() {
      var pr = '';
      for (var i in data.da) {
        pr += "<tr>"
        pr += "<td>" + data.da[i].side + "</td><td>" + data.da[i].charge + "</td><td>" + '<a href="' + data.da[i].page + '">' + data.da[i].page + '</a>' + "</td><td>" + data.da[i].desc + "</td><td>" + data.da[i].prog + "</td>"
        pr += "</tr>"
      }

      $('.progress').append(pr);
    }

    $(document).ready(function() {
      output();
    });

  </script>
</body>
</html>
