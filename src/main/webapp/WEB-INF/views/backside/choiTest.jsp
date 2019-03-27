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
     /*  $(".up_val").on('click', function() {
        upd();
     }) */
      
    })

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
        success: output
      });
    }


    function output(resp) {

      var a = "";
		
      $.each(resp, function(index,item) {
    	a += "<tr>";
        a += "<td>" + item.seat_seq + "</td>";
        a += "<td>" + item.comp_seq + "</td>";
        a += "<td>" + item.seat_id + "</td>";
        //a += "<td><input type='button' data-value=" + item.seat_seq + "id='update_val' value='수정'></td>";
        a += "</tr>";
      })
      $("#addtable").html(a);
     
    }

    function init() { // 테이블 목록을 가져오는 함수
      $.ajax({
        url: "selectseat",
        method: "POST",
        success: function(resp) {
        	selectSeat(resp);
          	//console.log(resp.stringify());
        }
      });
    }
   
    function del() {
        var seat_seq = $("#seat_seq").val();

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
        });
      }
    
    function selectSeat(resp)	{
    	  var a = "";
		  a +="<tr>";
		  a +="<th>" + 'seat_seq' + "</th>";
		  a +="<th>" + 'comp_seq' + "</th>";
		  a +="<th>" + 'seat_id' + "</th>";
		  a +="<th>" + '수정버튼' + "</th>";
		  a +="</tr>";
		  $.each(resp, function(index, item) {
		    	a += "<tr>";
		        a += "<td>" + item.seat_seq + "</td>";
		        a += "<td>" + item.comp_seq + "</td>";
		        a += "<td>" + item.seat_id + "</td>";
		        a += "<td><input type='button' data-value=" + item.seat_seq + "id='up_val' value='좌석수정버튼'></td>";
		        a += "</tr>";
		      })
		  $("#addtable").html(a);
		 // $("#up_val").on('click',upd);	///////////////////////////
		//  $(".up_val").on('click',input_update2);
    }
      

    function upd() {
    	var upVal = $(this).attr("data-value");
   		alert("text1"); 
    	console.log(upVal);
    		$.ajax({
    			url : "selectseat",
    			method : "POST",
    			success : function(resp)	{
    				 var a = "";
    				  a +="<tr>";
    				  a +="<th>" + 'seat_seq' + "</th>";
    				  a +="<th>" + 'comp_seq' + "</th>";
    				  a +="<th>" + 'seat_id' + "</th>";
    				  a +="<th>" + '수정버튼' + "</th>";
    				  a +="</tr>";
    				$.each(resp,function(index,item)	{
    					if (upVal==item.seat_seq) {
							a += "<tr>";
    						a += "<td>" + item.seat_seq + "</td>";
    						a += "<td>" + item.comp_seq + "</td>";
    						a += "<td><input type='text' id='seat_id' value='" + item.seat_id + "'/></td>";
    						a += "<td><input type='button' data-value=" +item.seat_seq+ " id='input_update' value='변경하기'></td>";
    						a += "</tr>";
						}	else	{
							a += "<tr>";
							a +="<td>" + item.seat_seq + "</td>";
							a +="<td>" + item.comp_seq + "</td>";
							a += "<td>" + item.seat_id + "</td>";
							a += "<td><input type='button' data-value=" +item.seat_seq+ " class='up_val' value='테이블 수정버튼'></td>";
							a += "</tr>";
						}
       				})
    			$("#addtable").empty();
    			$("#addtable").html(a);
    			//$(".up_val").on('click',input_update2);
    			}
    		});
    }  
   		 function input_update2()	{
   			 var reseat_seq = $(this).attr("data-value");
   			 var seat_id = $("#seat_id").val();
   			alert("text2222");
   		 	var d = {"reseat_seq":reseat_seq,"seat_id":seat_id};
   		 
   		 $.ajax({
   			url : "updateseat",
   			 method : "POST",
   			 data : d,
   			 success : init
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
  
  <br><br><br><br><br>


  <tr>
    <td>
      <input type="text" id="seat_seq" placeholder="삭제할 테이블 넘버 입력">
    </td>
  </tr>
  <tr>
    <td>
      <input type="button" value="테이블 삭제" id="delete">
    </td>
  </tr>
<table id="addtable">
</table>
</body>

</html>
