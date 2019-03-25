<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">

<script src="resources/jquery-3.3.1.min.js"></script>
<script>
$(function()	{
	$("#inPay").on('click',function()	{
		alert("test1");
		inPay();	
		alert("test2");
	})
})
	function inPay()	{
		var payType = $("#payType select:option").val();
				
		var payAmount = $("#payAmount").val();	
		if (payAmount.trim().length==0) {
			alert("금액입력할것");
			return;
		}	else if (isNaN(payAmount)) {
			alert("금액은 숫자로");
			return;
		}	
		var payTime = $("#payTime").val();
		
		var send = {"payAmount":payAmount, "payType":payType, "payTime":payTime};
		
		$.ajax({
			url : "inPay",
			method : "POST",
			data : send ,
			success : output
		});
}

function output()	{
	
}



</script>

<title>Insert title here</title>
</head>
<body>
<h1>결제내역</h1>


결제종별(카드/현금)
<select id="payType">
	<option value="카드">카드</option>
	<option value="현금">현금</option>
</select>
<br><br>

결제금액
<input type="text" id="payAmount" placeholder="결제금액입력">
<br><br>
결제 시각
<input type="date" id="payTime"><br>
<input type="button" id="inPay" value="결제">






</body>
</html>