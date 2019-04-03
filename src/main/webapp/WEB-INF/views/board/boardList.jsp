<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시글 보기</title>

<link href="assets/css/board/boardList.css" rel="stylesheet" type="text/css"/>


<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script src="resources/jquery-3.3.1.min.js"></script>

</head>

<style>

</style>

<body>
<div id="wrapper">

<div id="header">
	<h2>[ 게시판 글 목록 ]</h2>
</div>
<div class="home">
	<a href="${pageContext.request.contextPath}/"><img src="images/home.png" /></a>

	<!-- 특정 글 검색 -->
	<form id="search" action ="boardList" method="GET" >
	<select name="searchItem"> 
		<option value="title"   ${searchItem =='title'  ? 'selected' : ''} >제목</option>
		<option value="userid"  ${searchItem =='userid' ? 'selected' : ''}>작성자</option>
		<option value="content" ${searchItem =='content'? 'selected' : ''}>내용</option>
	</select>
	<input type="text" name="searchWord" value="${searchWord}" /> 
	<input class="btn" type="submit" value="검색" />
	</form>
</div>
<!-- 게시글 목록 시작 -->

<table border='1'>
	<tr>
		<th>번호</th>
		<th class="title">글제목</th>
		<th>글쓴날</th>
		<th>글쓴이</th>
		<th>조회수</th>
	</tr>
	
	<!-- 게시글 출력 반복 -->
	<c:forEach var="board" items="${boardList}" varStatus="stat">
		<tr>
			<td>${stat.count + navi.startRecord}</td>
			<td>
				<a href="boardDetail?currentPage=${page}&searchItem=${searchItem}&searchWord=${searchWord}&boardnum=${board.boardnum}">${board.title}</a>
				<c:if test="${board.originalfile != null }">
					<img src="images/attachment.png" />
				</c:if>
			</td>
			<td>${board.regdate}</td>
			<td>${board.userid }</td>
			<td>${board.hitcount}</td>
		</tr>
	</c:forEach>
</table>

<div class="write"><a class="btn" href="boardRegist">글쓰기</a></div>


<!-- Paging 출력 부분 -->
<div id="navigator">

<a href="boardList?currentPage=${navi.currentPage-navi.pagePerGroup}&searchItem=${searchItem}&searchWord=${searchWord}">
◁◁
</a>
<a href="boardList?currentPage=${navi.currentPage-1}&searchItem=${searchItem}&searchWord=${searchWord}">
◀
</a>
&nbsp;&nbsp;
<c:forEach var="page" begin="${navi.startPageGroup}" end="${navi.endPageGroup }">
 	<c:if test="${page != navi.currentPage }">
 		<a href="boardList?currentPage=${page}&searchItem=${searchItem}&searchWord=${searchWord}">${page}</a> &nbsp;
	</c:if>
 	<c:if test="${page == navi.currentPage }">
 		<span style="color:red; font-size:1.2em;">${page}</span> &nbsp;
	</c:if>	
</c:forEach>
&nbsp;&nbsp;
<a href="boardList?currentPage=${navi.currentPage+1}&searchItem=${searchItem}&searchWord=${searchWord}">
▶
</a> 
<a href="boardList?currentPage=${navi.currentPage+navi.pagePerGroup}&searchItem=${searchItem}&searchWord=${searchWord}">
▷▷
</a>
</div>
</div>
</body>
</html>