<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
  <meta charset="UTF-8">
  <title>글 수정</title>
  <style>
    div#wrapper {
      width: 800px;
      margin: 0 auto;

    }

    div#wrapper>h2 {
      text-align: center;
    }

    th {
      width: 100px;
    }

    td {
      width: 600px;
    }

    div#wrapper table {
      margin: 0 auto;
    }

  </style>
</head>

<body>
  <div id="wrapper">
    <h2>[ 게시판 글 수정 ]</h2>
    <form action="boardUpdate" method="post" enctype="multipart/form-data">
      <input type="hidden" name="board_seq" value="${board.board_seq}" />
      <table border="1">
        <tr>
          <th>제목</th>
          <td><input type="text" name="board_title" value="${board.board_title}" /></td>
        </tr>
        <tr>
          <th>글쓴이</th>
          <td>${sessionScope.loginName}</td>
        </tr>
        <%-- <tr>
          <th>첨부파일</th>
          <td>
            <input type="file" name="upload" value="그림선택" />
            <br />
            <c:if test="${board.originalfile != null}">
              ${board.originalfile}
              <span style="color:red">
                <a href="deleteFile?board_seq=${board.board_seq}">X</a>
              </span>
            </c:if>
          </td>
        </tr> --%>
        <tr>
          <th>글내용</th>
          <td><textarea name="board_content" cols="60" rows="10">${board.board_content}</textarea></td>
        </tr>
        <tr>
          <td colspan="2">
            <input type="submit" value="글수정" />
            <input type="reset" value="취소" />
            <a href="board">목록으로</a>
          </td>
        </tr>
      </table>
    </form>
  </div>
</body>

</html>
