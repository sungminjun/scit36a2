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
	selectAll();
})


function selectAll()	{
	$.ajax({
		url : "selectAll",
		method : "POST",
		success : output
		
	});
}
	 function output(resp)	{
			var a = "";
				a += "<tr>";
				a += "<th>" + "좌석번호" +"</th>";
				a += "<th>" + "방문자 수" +"</th>";
				a += "<th>" + "시작시간" +"</th>";
				a += "<th>" + "마감시간" +"</th>";
				a += "<th>" + "메뉴번호" +"</th>";
				a += "<th>" + "메뉴이름" +"</th>";
				a += "<th>" + "메뉴가격" +"</th>";
				a += "<th>" + "수량" +"</th>";
				a += "<th>" + "서비스,할인" +"</th>";
				a += "<th>" + "메모" +"</th>";
				a += "<th>" + "판매중여부" + "</th>";
				a += "</tr>";
			$.each(resp,function(index,item)	{
				a +="<tr>";
				a +="<td>" +item.seat_seq+"</td>";
				a +="<td>" +item.sales_visitors+"</td>";
				a +="<td>" +item.sales_start+"</td>";
				a +="<td>" +item.sales_end+"</td>";
				a +="<td>" +item.menu_seq+"</td>";
				a +="<td>" +item.menu_name+"</td>";
				a +="<td>" +item.menu_price+"</td>";
				a +="<td>" +item.sales_order+"</td>";
				a +="<td>" +item.sales_discount+"</td>";
				a +="<td>" +item.sales_memo+"</td>";
				a +="<td>" +item.menu_sellFlag+"</td>";
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
	<br><br><br><br><br>
	현재 시재(예상)액 : 원          금일매출액 : 원<br><br><br>
	<input type="button" id="hwesoo" value="시재회수"><input type="button" id="tuip" value="시재투입"><input type="button" id="johwe" value="결제내역조회"><input type="button" id="magam" value="영업마감"><br><br><br><br><br>

	<a href="choiTestPOS2">POS기능화면2</a><br><br><br><br>
<table id="selectOrder">
</table>

</body>
</html>