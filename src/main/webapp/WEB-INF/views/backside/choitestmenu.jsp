<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
  <meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
  <title>Insert title here</title>



  <script src="resources/jquery-3.3.1.js"></script>
  <script>
    $(function() {
      init();
      $("#insertnewmenubutton").on('click', function() {
        alert("test1");
        newmenu();
        alert("test2");
      })
      $("#deletebutton").on('click', function() {
        delmenu();
      })


    });

    function newmenu() {
      var menu_name = $("#menu_name").val();
      if (menu_name.trim().length == 0) {
        alert("메뉴이름등록하려면 입력하세요");
        return;
      }
      var menu_sellFlag = $("#menu_sellFlag option:selected").val();
      if (menu_sellFlag == "판매중") {
        return 1;
        //menu_sellFlag==1;
      } else if (menu_sellFlag == "판매중아님") {
        return 0;
        //menu_sellFlag==0;
      }

      var menu_price = $("#menu_price").val();
      if (menu_price.trim().length == 0) {
        alert("제대로 가격입력할것");
        return;
      } else if (isNaN(menu_price)) {
        alert("가격은 숫자로입력");
        return;
      }

      var menu_category = $("#menu_category option:selected").val();


      var menu = {
        "menu_name": menu_name,
        "menu_sellFlag": menu_sellFlag,
        "menu_price": menu_price,
        "menu_category": menu_category
      };

      $.ajax({
        url: "insertMenu",
        method: "POST",
        data: menu,
        success: output
      });

    }

    function output() {
      var a = "";
      a += "<tr>";
      a += "<th>메뉴이름</th>";
      a += "<th>판매중인지여부</th>";
      a += "<th>음식가격</th>";
      a += "<th>음식카테고리</th>";
      a += "</tr>";

      $.each(resp, function(index, item) {
        a += "<tr>";
        a += "<td>" + item.menu_name + "</td>";
        a += "<td>" + item.menu_sellFlag + "</td>";
        a += "<td>" + item.menu_price + "</td>";
        a += "<td>" + item.menu_category + "</td>";
        a += "</tr>";
      })
      $("#menuRegi").html(a);
    }



    function delmenu() {
      var menu_seq = $("#menu_seq").val();
      if (menu_seq.trim().length == 0) {
        alert("삭제하려면 입력하세요");
        return;
      }
      var senddata = {
        "menu_seq": menu_seq
      };
      $.ajax({
        url: "deleteMenu",
        method: "post",
        data: senddata,
        success: output
      });

    }

    function init() {
      $.ajax({
        url: "selectMenu",
        method: "POST",
        success: function(resp) {
          output
        }

      });

    }

  </script>



</head>

<body>

  <tr>
    <td>
      <input type="text" placeholder="등록할 메뉴이름 입력" id="menu_name">
      <select id="menu_sellFlag">
        <option value="판매중">판매중</option>
        <option value="판매중아님">판매중아님</option>
      </select>
      <input type="text" placeholder="품목판매가 입력" id="menu_price">
      <select id="menu_category">
        <option value="음식">음식</option>
        <option value="후식">후식</option>
        <option value="디저트">디저트</option>
        <option value="음료">음료</option>
      </select>
    </td>
    <td>
      <input type="button" value="메뉴 추가 등록확인버튼" id="insertnewmenubutton">
    </td>
  </tr>

  <br><br><br><br><br><br>
  <input type="text" placeholder="메뉴삭제할 번호입력" id="menu_seq">
  <input type="button" value="메뉴 삭제 버튼" id="deletebutton">
  <table id="menuRegi">
  </table>


</body>

</html>
