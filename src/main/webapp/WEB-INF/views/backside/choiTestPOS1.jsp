<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>POS기능 기본화면1</title>


<script src="resources/jquery-3.3.1.min.js"></script>
<script>
$(function()	{
	selectPOSone();
})

function selectPOSone(resp)	{
	
	$.ajax({
		url : "selectPOSone",
		method : "POST",
		success : output
		
	});
}
	 function output(resp)	{
			var a = "";
				a += "<tr>";
				a += "<th>" + "좌석번호" +"</th>";
				a += "<th>" + "테이블이름" + "</th>";
				a += "<th>" + "메모" + "</th>";
				a += "<th>" + "메뉴일련번호" + "</th>";
				a += "<th>" + "주문수량" + "</th>";
				a += "</tr> ";
			$.each(resp,function(index,item)	{
				a +="<tr>";
				a +="<td>" + item.SEAT_SEQ + "</td>";
				a +="<td>" + item.SEAT_ID + "</td>";
				a +="<td>" + item.SALES_MEMO + "</td>";
				a +="<td>" + item.MENU_SEQ + "</td>";
				a +="<td>" + item.SALES_ORDER + "</td>";
				//a += "<td><input type='button' regi-value=" +item.menu_seq+ " class='regi' value='주문접수버튼'></td>";
				//a += "<td><input type='button' del-value=" +item.menu_seq+ " class='del' value='삭제버튼'></td>";
				//a += "<td><input type='button' upd-value=" +item.menu_seq+ " class='upd' value='수정버튼'></td>";
				a +="</tr>";
				
				
			});
			$("#selectOrder").html(a);
			
		} 


</script>


</head>
<body>
	<h1>POS기능 기본화면1 ( 테이블화면이 뜨고 가게이름,현재로그인한 사람 ,현재예상시재액,금일매출액 등이 뜨는 POS화면 )</h1><br><br>

	가게이름<br>
	테이블이동<br>
	<br><br><br>
<table id="selectOrder">
</table>
<br><br>
	현재 시재(예상)액 : 원          금일매출액 : 원<br><br><br>
	<input type="button" id="hwesoo" value="시재회수"><input type="button" id="tuip" value="시재투입"><input type="button" id="johwe" value="결제내역조회"><input type="button" id="magam" value="영업마감"><br><br><br><br><br>
<br><br>

	<a href="choiTestPOS2">POS기능화면2</a><br><br>

	
</body>
</html>