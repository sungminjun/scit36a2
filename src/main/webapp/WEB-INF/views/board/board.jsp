<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<html>

<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>
    MinnanoPOS
  </title>
  <link rel="icon" type="image/png" href="imgs/favicon.png">
  <!--     Fonts and icons     -->
  <link href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,600,700,800" rel="stylesheet" />
  <link href="https://use.fontawesome.com/releases/v5.0.6/css/all.css" rel="stylesheet">
  <!-- Nucleo Icons -->
  <link href="./assets/css/nucleo-icons.css" rel="stylesheet" />
  <!-- CSS Files -->
  <link href="./assets/css/black-dashboard.css?v=1.0.0" rel="stylesheet" />
  <!-- boardList용 CSS -->
  <link href="assets/css/board/boardList.css" rel="stylesheet" type="text/css" />
  <link href="https://fonts.googleapis.com/earlyaccess/mplus1p.css" rel="stylesheet" />
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
        
          <div class="col-xl-10">
          
            <div id="titleForm">
              <h2 style="font-family: 'M PLUS 1p'; font-size: 3em;">
                <a id="boardTitle" href="${pageContext.request.contextPath}/board">招き猫の掲示板</a>
              </h2>
            </div>
            
          </div>
          
        </div>

        <div class="row">
          <div class="col-xl-6">
            <div id="wrapper-neck">
              <!-- 특정 글 검색 -->
              <form id="search" action="board" method="GET">
                <select name="searchItem">
                  <option value="title" ${searchItem=='title' ? 'selected' : '' }>제목</option>
                  <option value="userid" ${searchItem=='userid' ? 'selected' : '' }>작성자</option>
                  <option value="content" ${searchItem=='content' ? 'selected' : '' }>내용</option>
                </select> <input type="text" name="searchWord" value="${searchWord}" />
                &nbsp; <input class="button" type="submit" value="검색" />
              </form>
            </div>
          </div>
          <div class="col-xl-4">
            <a class="writeBtn" href="boardRegist">글쓰기</a>
          </div>
        </div>

        <div class="row">
          <div class="col-xl-10">
            <div id="wrapper-body">
              <table id="searchTable">
                <tr id="index">
                  <th>번호</th>
                  <th>카테고리</th>
                  <th class="title">글제목</th>
                  <th>글쓴날</th>
                  <th>글쓴이</th>
                  <th>조회수</th>
                </tr>
                <!-- 게시글 출력 반복 -->
                <c:forEach var="board" items="${boardList}" varStatus="stat">
                  <tr>
                    <td>${stat.count + navi.startRecord}</td>
                    <td>${board.BOARD_CATEGORY}</td>
                    <td><a href="boardDetail?board_seq=${board.BOARD_SEQ}&currentPage=${page}&searchItem=${searchItem}&searchWord=${searchWord}">${board.BOARD_TITLE}</a>
                      <c:if test="${board.board_orgname != null }">
                        ♣
                      </c:if>
                    </td>
                    <td>${board.BOARD_REGDATE}</td>
                    <td>${board.EMP_SEQ}</td>
                    <%-- <td>${board.emp_seq}</td> --%>
                    <td>${board.BOARD_HITCOUNT}</td>
                  </tr>
                </c:forEach>
              </table>
            </div>
          </div>
        </div>
        
        
        <div class="row">
          <!-- 페이지 네비게이터 -->
          <div class="col-xl-10">
          <div id="navigator" style="text-align: center;">
            <a href="board?currentPage=${navi.currentPage-navi.pagePerGroup}&searchItem=${searchItem}&searchWord=${searchWord}">
              ◁◁ </a> <a href="board?currentPage=${navi.currentPage-1}&searchItem=${searchItem}&searchWord=${searchWord}">
              ◀ </a> &nbsp;&nbsp;
            <c:forEach var="page" begin="${navi.startPageGroup}" end="${navi.endPageGroup }">
              <c:if test="${page != navi.currentPage }">
                <a href="board?currentPage=${page}&searchItem=${searchItem}&searchWord=${searchWord}">${page}</a> &nbsp;
              </c:if>
              <c:if test="${page == navi.currentPage }">
                <span style="color: red;">${page}</span>&nbsp;
              </c:if>
            </c:forEach>
            &nbsp;&nbsp; <a href="board?currentPage=${navi.currentPage+1}&searchItem=${searchItem}&searchWord=${searchWord}">
              ▶ </a> <a href="board?currentPage=${navi.currentPage+navi.pagePerGroup}&searchItem=${searchItem}&searchWord=${searchWord}">
              ▷▷ </a>
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
</body>

</html>
