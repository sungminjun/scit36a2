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
      selectPOStwo();

      $(".upd").on('click', function() {
        updatePOStwo();
      })
    })



    function output(resp) {

      var a = "";
      a += "<tr>";
      a += "<th>" + "테이블일련번호" + "</th>";
      a += "<th>" + "손님수" + "</th>";
      a += "<th>" + "sales_start" + "</th>";
      a += "<th>" + "sales_end" + "</th>";
      a += "<th>" + "메모" + "</th>";
      a += "<th>" + "메뉴일련번호" + "</th>";
      a += "<th>" + "메뉴번호" + "</th>";
      a += "<th>" + "메뉴카테고리" + "</th>";
      a += "<th>" + "주문수량" + "</th>";
      a += "<th>" + "할인" + "</th>";
      a += "</tr>";

      $.each(resp, function(index, item) {
        a += "<tr>";
        a += "<td>" + item.seat_seq + "</td>";
        a += "<td>" + item.sales_visitors + "</td>";
        a += "<td>" + item.sales_start + "</td>";
        a += "<td>" + item.sales_end + "</td>";
        a += "<td>" + item.sales_memo + "</td>";
        a += "<td>" + item.menu_seq + "</td>";
        a += "<td>" + item.menu_name + "</td>";
        a += "<td>" + item.menu_category + "</td>";
        a += "<td>" + item.sales_order + "</td>";
        a += "<td>" + item.sales_discount + "</td>";
        a += "<td><input type='button' regi-value=" + item.menu_seq + " class='regi' value='주문접수버튼'></td>";
        a += "<td><input type='button' del-value=" + item.menu_seq + " class='del' name='menu_seq' value='삭제버튼'></td>";
        a += "<td><input type='button' upd-value=" + item.seat_seq + " class='upd' name='seat_seq' value='수정버튼'></td>";
        a += "</tr>";
      });
      $("#selectOrder").html(a);
      $(".regi").on('click', regi);
      $(".del").on('click', clickDel);
      $(".upd").on('click', updatePOStwo);

    }

    function regi() {
      var m_seq = $(this).attr("regi-value");
      var seat_seq = $("#seat_seq").val();
      if (isNaN(seat_seq)) {
        alert("숫자로입력");
        return;
      }
      var sales_memo = $("#sales_memo").val();
      var sales_visitors = $("#sales_visitors").val();
      if (isNaN(sales_visitors)) {
        alert("숫자로");
        return;
      }
      var menu_seq = $("#menu_seq").val();
      if (isNaN(menu_seq)) {
        alert("숫자로입력");
        return;
      }
      var sales_order = $("#sales_order").val();
      if (isNaN(sales_order)) {
        alert("숫자로입력");
        return;
      }
      var sales_discount = $("#sales_discount").val();
      if (isNaN(sales_discount)) {
        alert("숫자로입력");
        return;
      }

      var d = {
        "m_seq": m_seq,
        "seat_seq": seat_seq,
        "sales_memo": sales_memo,
        "menu_seq": menu_seq,
        "sales_order": sales_order,
        "sales_discount": sales_discount,
        "sales_visitors": sales_visitors
      };
      $.ajax({
        url: "insertSasSad",
        method: "POST",
        data: d,
        success: output
      });

    }

    function selectPOStwo() {
      $.ajax({
        url: "selectPOStwo",
        method: "POST",
        success: function(resp) {
          output(resp);
        }
      });
    }


    function clickDel() { //리스트에 있는 삭제버튼을 클릭 했을때 삭제되는 경우
      var d_seq = $(this).attr("del-value");
      alert(d_seq);
      var d = {
        "d_seq": d_seq
      };

      $.ajax({
        url: "deleteSasSadPay",
        method: "POST",
        data: d,
        success: output
      });
    }

    function updatePOStwo() {
      //alert("수정ㄱㄱ");
      var updatePOStwo = $(this).attr("upd-value");
      var upd = {
        "updatePOStwo": updatePOStwo
      };
      alert("수정1");
      $.ajax({
        url: "updatePOStwo",
        method: "POST",
        data: upd,
        success: function(resp) {
          var a = "";
          a += "<tr>";
          a += "<th>" + "테이블일련번호" + "</th>";
          a += "<th>" + "손님수" + "</th>";
          a += "<th>" + "sales_start" + "</th>";
          a += "<th>" + "sales_end" + "</th>";
          a += "<th>" + "메모" + "</th>";
          a += "<th>" + "메뉴일련번호" + "</th>";
          a += "<th>" + "메뉴번호" + "</th>";
          a += "<th>" + "메뉴카테고리" + "</th>";
          a += "<th>" + "주문수량" + "</th>";
          a += "<th>" + "할인" + "</th>";
          a += "</tr>";
          alert("수정2");
          $.each(resp, function(index, item) {
            if (upd == item.sales_state_seq) {
              a += "<tr>";
              a += "<td>" + item.sales_memo + "</td>";
              a += "<td>" + item.sales_visitors + "</td>";
              a += "<td>" + item.sales_discount + "</td>";
              a += "<td>" + item.sales_end + "</td>";
              a += "<td>" + item.sales_order + "</td>";
              a += "<td>" + item.menu_seq + "</td>";
              a += "<td>" + "메뉴이름" + "</td>";
              a += "<td>" + "메뉴카테고리" + "</td>";
              a += "<td>" + "물품수량" + "</td>";
              a += "<td>" + "할인" + "</td>";
              a += "<td><input type='button' regi-value=" + item.menu_seq + " class='regi' value='주문접수버튼'></td>";
              a += "<td><input type='button' del-value=" + item.menu_seq + " class='del' name='menu_seq' value='삭제버튼'></td>";
              a += "<td><input type='button' upd-value=" + item.seat_seq + " class='upd' name='seat_seq' value='수정버튼'></td>";
              a += "</tr>";
            } else {
              a += "<tr>";
              a += "<td>" + item.seat_seq + "</td>";
              a += "<td>" + item.sales_visitors + "</td>";
              a += "<td>" + item.sales_start + "</td>";
              a += "<td>" + item.sales_end + "</td>";
              a += "<td>" + item.sales_memo + "</td>";
              a += "<td>" + item.menu_seq + "</td>";
              a += "<td>" + item.menu_name + "</td>";
              a += "<td>" + item.menu_category + "</td>";
              a += "<td>" + item.sales_order + "</td>";
              a += "<td>" + item.sales_discount + "</td>";
              a += "<td><input type='button' regi-value=" + item.menu_seq + " class='regi' value='주문접수버튼'></td>";
              a += "<td><input type='button' del-value=" + item.menu_seq + " class='del' name='menu_seq' value='삭제버튼'></td>";
              a += "<td><input type='button' upd-value=" + item.seat_seq + " class='upd' name='seat_seq' value='수정버튼'></td>";
              a += "</tr>";
            }
          })
          $("#selectOrder").empty();
          $("#selectOrder").html(a);
          /* $(".upd").on('click',updatePOStwo);
          alert("수정3"); */
        }
      })
    }

  </script>
</head>

<body>
  <h1>POS기능 기본화면2 ( 품목명,수량,가격 등을 입력받고 주문등록을 하는 화면 )</h1><br><br><br><br><br>


  <tr>
    <td>홀 테이블,시작시간,마감시간???</td><br><br><br>
  </tr>
  <table border="1" id="selectOrder">
  </table><br><br><br>
  <tr>
    <td>추가주문 , 기존주문</td><br>
    <td><input type="reset" value="전체취소" id="reset"><input type="button" id="one" value="라인취소"></td><br>
    <td>총 금액 : 원</td><br><br>

    <td><input type="text" id="seat_seq" name="seat_seq" placeholder="자리번호"></td>
    <td><input type="text" id="sales_visitors" name="sales_visitors" placeholder="명수입력"></td><br>
    <td><input type="text" id="menu_seq" name="menu_seq" placeholder="메뉴번호"></td>
    <td><input type="text" id="sales_discount" name="sales_discount" placeholder="할인,서비스"> <input type="text" placeholder="주문수량" id="sales_order" name="sales_order"><input type="text" id="sales_memo" name="sales_memo" placeholder="메모입력">6개 입력후 위에 주문접수버튼 클릭</td><br>

  </tr>




</body>

</html>
