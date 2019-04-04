<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
  <meta charset="UTF-8">
  <title>Insert title here</title>
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
    <h2>[ 게시판 글쓰기 ]</h2>
    <form action="boardRegist" method="post" enctype="multipart/form-data">
      <table border="1">
        <tr>
          <th>글 카테고리</th>
          <td>
            <select id="board_category" name="board_category">
              <option value="삽니다">삽니다</option>
              <option value="팝니다">팝니다</option>
              <option value="조언 부탁드립니다">조언 부탁드립니다</option>
              <option value="기타">기타</option>
            </select>
          </td>
        </tr>
        <tr>
          <th>제목</th>
          <td><input type="text" name="board_title" required /></td>
        </tr>
        <tr>
          <th>글쓴이</th>
          <td>${sessionScope.loginName}</td>
        </tr>
        <tr>
          <th>첨부파일</th>
          <td><input type="file" name="upload" value="파일첨부" /></td>
          <!-- <td><input type="file" name="board_savname" value="파일첨부" /></td> -->

        </tr>
        <tr>
          <th>글내용</th>
          <td><textarea name="board_content" cols="60" rows="10"></textarea></td>
        </tr>
        <tr>
          <td colspan="2">

            <input type="submit" value="글등록" />
            <input type="reset" value="취소" />
            <a href="boardList">목록으로</a>
          </td>
        </tr>
      </table>
    </form>
  </div>
</body>

</html>
