<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
  <meta charset="UTF-8">
  <title>글 수정</title>
  <!--     Fonts and icons     -->
  <link href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,600,700,800" rel="stylesheet" />
  <link href="https://use.fontawesome.com/releases/v5.6.0/css/all.css" rel="stylesheet">
  <!-- Nucleo Icons -->
  <link href="./assets/css/nucleo-icons.css" rel="stylesheet" />
  <!-- CSS Files -->
  <link href="./assets/css/black-dashboard.css?v=1.0.0" rel="stylesheet" />
   <!-- boardUpdate용 CSS -->
  <link href="assets/css/board/boardUpdate.css" rel="stylesheet" type="text/css" />
  
</head>



<body class="white-content">
	<div id="wrapper">
		<div class="sidebar" data="blue">
			<div class="sidebar-wrapper">
				<div class="logo">
					<a href="${pageContext.request.contextPath}"
						class="simple-text logo-normal"> MP </a>
				</div>
				<ul class="nav">
					<li><a href="pos"> <i class="tim-icons icon-money-coins"
							title="포스기능 / Enter POS"></i>
					</a> <br>
					<br></li>
					<li><a href="mgr"> <i
							class="tim-icons icon-settings-gear-63" title="설정 / settings"></i>
					</a> <br>
					<br></li>
					<li><a href="board"> <i class="tim-icons icon-chat-33"
							title="커뮤니티 / community"></i>
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
					<div class="col-md-6 ml-auto mr-auto">
						<div id="titleForm">
							<h2 style="font-family: 'M PLUS 1p'; font-size: 3em;">
								<a id="boardTitle" href="${pageContext.request.contextPath}/board">[ 게시판 글 수정 ]</a>
							</h2>
						</div>
						
						<div class="card">
							<div class="card-header">
								<h5 class="title">[게시판 글수정]</h5>
							</div>
							
							
							<div class="card-body">
							
							<form action="boardUpdate" method="post" enctype="multipart/form-data">
								<input type="hidden" name="board_seq" value="${board.board_seq}" />
								
								<div>
									<label>제목</label><br>
									<input type="text" name="board_title" value="${board.board_title}" />
								</div>
								<hr>
								<div>
									<label>글쓴이</label><br>
									${sessionScope.emp_id}
								</div>
								<hr>
								<div>
								<label>글내용</label><br>
									<textarea id="board_content" name="board_content">${board.board_content}</textarea>
								</div>
								<hr>
								<div class="card_footer" style="text-align: center;">
									<input id="updateButton" type="submit" value="글수정" /> 
									<input id="cancelButton" type="reset" value="취소" />
									<a id="returnBoard" href="board">목록으로</a>
								</div>


								
							</form>
							
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>

</html>