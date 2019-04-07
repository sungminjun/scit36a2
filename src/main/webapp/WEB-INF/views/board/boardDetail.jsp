<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>글 자세히 보기</title>

  <link href="assets/css/boardDetail.css" rel="stylesheet" />

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
  <script src="resources/jquery-3.3.1.min.js"></script>


  <script>
    function boardDelete() {
      location.href = "boardDelete?board_seq=${board.board_seq}";
    }

    function boardUpdate() {
      location.href = "boardUpdate?board_seq=${board.board_seq}";
    }

  </script>
</head>

<body>
  <div id="wrapper">
    <h2>[ 게시판 글보기 ]</h2>
    <table border="1">
      <tr>
        <th>제목</th>
        <td>${board.board_title}</td>
      </tr>
      <tr>
        <th>글쓴날</th>
        <td>${board.board_regdate}</td>
      </tr>
      <tr>
        <th>글 쓴이</th>
        <td>${board.emp_seq }</td>
      </tr>
      <tr>
        <th>첨부 파일</th>
        <td>
          <a href="download?board_seq=${board.board_seq}">${board.board_orgname}</a>
          <c:if test="${not empty mime}">
            <img src="download?board_seq=${board.board_seq}" style="width:100px;height:100px" />
          </c:if>
        </td>
      </tr>
      <tr>
        <th>글내용</th>
        <td>
          <pre>${board.board_content}</pre>
        </td>
      </tr>
      <tr>
        <td colspan="2">
          <input type="button" value="글수정" onclick="boardUpdate();" />
          <input type="button" value="글삭제" onclick="boardDelete();" />
          <a href="boardList">목록으로</a>
        </td>
      </tr>
    </table>
    <br />

    <!-- 댓글 입력 -->

    <!-- 댓글 출력 -->
  </div>
</body>

</html>
