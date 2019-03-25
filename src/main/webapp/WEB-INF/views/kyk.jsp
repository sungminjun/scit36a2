<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>독서노트</title>
</head>
<body>

<div id="wrapper">
<h1>[김유경 테스트 화면]</h1>

<!-- Code here -->
	<!-- 로그인 전 -->
	<c:if test="${empty sessionScope.emp_id}">
	<a href="login_k">로그인</a><br>
	<a href="join_k">회원가입</a><br>
	</c:if>
	<!-- 로그인 후 -->
	<c:if test="${not empty sessionScope.emp_id}">
	<a href="logout">로그아웃</a><br>
	<a href="choiTest">철규상 테이블 테스트</a><br>
	<a href="choitestmenu">철규상 메뉴 테스트</a><br>
	<a href="choitestexpense">철규상 지출 테스트</a><br>
	<a href="choitestpayment">철규상 결제 테스트</a><br>
	</c:if>

</div>
</body>
</html>
