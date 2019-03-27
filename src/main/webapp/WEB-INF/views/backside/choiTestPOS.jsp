<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>

<script src="resources/jquery-3.3.1.min.js"></script>
<script>
	$(function()	{
		alert("test1");
		selectMenu();
		alert("test2");
		output();
		alert("test3");	
	})
	


	function output(resp)	{
		var a = "";
			a += "<tr>";
			a += "<th>" + "seat_seq" +"</th>";
			a += "<th>" + "sales_visitors" +"</th>";
			a += "<th>" + "sales_start" +"</th>";
			a += "<th>" + "sales_end" +"</th>";
			a += "<th>" + "menu_seq" +"</th>";
			a += "<th>" + "menu_name" +"</th>";
			a += "<th>" + "menu_price" +"</th>";
			a += "<th>" + "sales_order" +"</th>";
			a += "<th>" + "sales_discount" +"</th>";
			a += "<th>" + "sales_memo" +"</th>";
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
			a += "<td><input type='button' regi-value=" +item.menu_seq+ " class='regi' value='주문접수버튼'></td>";
			a += "<td><input type='button' del-value=" +item.menu_seq+ " class='del' value='삭제버튼'></td>";
			a += "<td><input type='button' upd-value=" +item.menu_seq+ " class='upd' value='수정버튼'></td>";
			a +="</tr>";
			
		});
		$("#selectOrder").html(a);	
		$(".regi").on('click',regi);
	}
	
	
	function regi()	{
		var menu_seq = $(this).attr("regi-value");
		var mNum = {"menu_seq":menu_seq};
		/* var memoIn = ("#memoIn").val();
		if (memoIn.trim().length==0) {
			alert("메모입력");
			return;
		} */
		
		var data = {"mNum":mNum};
		
		alert("text3");
		$.ajax({
			 url : "insertSasSad"
			,method : "POST"
			,data : data
			,success : output
		});
		
	}
	
	
	
function selectMenu()	{
	$.ajax({
		url : "selectMenu",
		method : "POST",
		success : output
		
	});
		
	
}
	

	
	
	
	
	</script>

</head>
<body>
	<h1>POS기능 기본화면</h1><br><br><br>
	 

	<tr>
		<td>홀 테이블,시작시간,마감시간???</td><br>
		<td>추가주문 , 기존주문</td><br>
		<td><input type="reset" value="전체취소" id="reset"><input type="button" id="one" value="라인취소"></td><br>
		<td>총 금액 :    원</td><br>
		<td><input type="text" id="memoIn" placeholder="메모입력"></td><br>
		<td><input type="text" id="sales_visitors" placeholder="명수입력"></td><br>
	</tr>


<br><br>
<table id="selectOrder">
</table>
</body>
</html>