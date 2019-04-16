<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link rel="icon" type="image/png" href="imgs/favicon.png">
  <title>
    MinnanoPOS - BoardRegist
  </title>
  <!--     Fonts and icons     -->
  <link href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,600,700,800" rel="stylesheet" />
  <link href="https://use.fontawesome.com/releases/v5.0.6/css/all.css" rel="stylesheet">
  <!-- Nucleo Icons -->
  <link href="./assets/css/nucleo-icons.css" rel="stylesheet" />
  <!-- CSS Files -->
  <link href="./assets/css/black-dashboard.css?v=1.0.0" rel="stylesheet" />
  <!-- boardRegist용 CSS -->
  <link href="assets/css/board/boardRegist.css" rel="stylesheet" type="text/css" />

  <script src="resources/jquery-3.3.1.min.js"></script>
  <script type="text/javascript">
    $(function() {
      // code here : 각 이벤트에 맞게 함수 호출
      $('#registButton').on('click', boardRegist);
      $('#cancelButton').on('click', goBoard);
    });



    function boardRegist() {
      var board_title = $("#board_title").val();
      var board_category = $("#board_category").val();
      var board_content = $("#board_content").val();
      var board_orgname = 'yes';
      var board = {};
      if ( $('#share_report').is(':checked') ) {
        board = {
      	        "board_title" : board_title,
      	        "board_category" : board_category,
      	        "board_content" : board_content,
      	        "board_orgname" : board_orgname
      	      }
      } else {
        board = {
          "board_title": board_title,
          "board_category": board_category,
          "board_content": board_content
        }
      }


      $.ajax({
        type: 'POST',
        url: 'boardRegist',
        data: board,
        success: function(resp) {
          if (resp == 1) {
            alert('등록에 성공했습니다.');
            goBoard();
          } else {
            alert('등록실패');
            return;
          }

        }
      });
    }

    function goBoard() {
      location.href = "/minnano/board";
    }

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

            <div id="titleForm">
              <h2 style="font-family: 'M PLUS 1p'; font-size: 3em;">
                <a id="boardTitle" href="${pageContext.request.contextPath}/board">[ 게시판 글쓰기 ]</a>
              </h2>
            </div>

            <div class="card">
              <div class="card-header">
                <h5 class="title">[게시판 글쓰기]</h5>
              </div>
              
              <div class="card-body">
                <div class="row">
                <div class="col-md-3">
                  <label>글쓴이</label><br>
                  ${sessionScope.emp_id}
                </div>
                <hr>
                <div class="col-md-5">
                  <label>카테고리 선택</label><br>
                  <div id="category-choice">
                    <select id="board_category" name="board_category">
                      <option value="삽니다">삽니다</option>
                      <option value="팝니다">팝니다</option>
                      <option value="조언 부탁드립니다">조언 부탁드립니다</option>
                      <option value="기타">기타</option>
                    </select>
                  </div><br>
                </div>
                <div class="col-md-4">
                  <label>통계자료를 공유하시겠습니까?</label><br>
                  예<input type="checkbox" value="share_report" id="share_report">
                </div>
                </div>
                <hr>
                <div class="row">
                  <div class="col-md-12">
                    <label>제목</label><br>
                    <input id="board_title" type="text" name="board_title">
                  </div>
                </div>
                <hr>
                <div>
                  <label>글내용</label><br>
                  <textarea id="board_content" name="board_content"></textarea>
                </div>
                <hr>
              </div>
              <div class="card_footer" style="text-align:center;">
                <input id="registButton" type="button" value="글등록" />
                <input id="cancelButton" type="button" value="취소" />
              </div>
            </div>

          </div>



        </div>

      </div>
      <footer class="footer">
      </footer>
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
