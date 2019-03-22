<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
  <meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
  <title>Insert title here</title>
  <script src="resources/jquery-3.3.1.min.js"></script>
  <script>
    $(function() {
      init();
      $("#insert").on('click', function() {
        addtable();

      })
      $("#delete").on('click', function() {
        alert("삭제test1");
        del();
        alert("삭제test2");
      })
      $("#updtable").on('click', function() {
        upd();

      })

    });

    function addtable() {
      var seat_id = $("#seat_id").val();
      if (seat_id.trim().length == 0) {
        alert("입력 안하면 안된다.");
        return;
      }

      var senddata = {
        "seat_id": seat_id
      }

      $.ajax({
        url: "addtable",
        method: "POST",
        data: senddata,
        success: output()
      });
    }


    function output(resp) {

      var a = "";


      $.each(resp, function(index, item) {
        a += "<tr>";
        a += "<td>" + item.seat_seq + "</td>";
        a += "<td>" + item.comp_seq + "</td>";
        a += "<td>" + item.seat_id + "</td>";
        a += "</tr>";
      });
      $("#addtable").html(a);
      init();
    }

    function init() { // 테이블 목록을 가져오는 함수
      $.ajax({
        url: "selectseat",
        method: "GET",
        success: function(resp) {
          output
          //console.log(resp.stringify());
        }
      });
    }


    function del() {
      var seat_seq = $(".seat_seq").val();

      if (seat_seq.trim().length == 0) {
        alert("삭제하려면 삭제할 테이블 넘버를 입력하세");
        return;
      }
      var sd = {
        "seat_seq": seat_seq
      }
      $.ajax({
        url: "deleteseat",
        method: "POST",
        data: sd,
        success: function(resp) {
          output
        }
      })
    }

    function upd() {
      var updseat = $("#updseat").val();
      if (updseat.trim().length == 0) {
        alert("수정하려면 삭제할 테이블 넘버를 입력하세");
        return;
      }
      var newseat = $("#newseat").val();
      if (newseat.trim().length == 0) {
        alert("뭐로바꿀지 제대로 입력")
        return;
      }

      var sd = {
        "updseat": updseat
      }
      $.ajax({
        url: "updateseat",
        method: "POST",
        data: sd,
        success: function(resp) {
          output
        }
      });


    }

  </script>


</head>

<body>
  Seat 테이블좌석<br>

  <tr>
    <td>
      <input type="text" id="seat_id" name="seat_id" placeholder="추가할 테이블 이름입력"><br>
    </td>
  </tr>
  <tr>
    <td>
      <input type="button" value="테이블 추가 등록" id="insert">
    </td>
  </tr>
  <table id="addtable">
  </table>
  <br><br><br><br><br><br><br><br><br><br>


  <tr>
    <td>
      <input type="text" class="seat_seq" placeholder="삭제할 테이블 넘버 입력">
    </td>
  </tr>
  <tr>
    <td>
      <input type="button" value="테이블 삭제" id="delete">
    </td>
  </tr>


  <div id="seats">
  </div>


  <br><br><br><br>
  <tr>
    <td>
      <input type="text" id="updseat" placeholder="수정할 테이블 넘버 입력">
      <input type="text" id="newseat" placeholder="뭐로바꿀지 입력">
    </td>
  </tr>
  <tr>
    <td>
      <input type="button" value="테이블수정" id="updtable">
    </td>

  </tr>
</body>

</html>
