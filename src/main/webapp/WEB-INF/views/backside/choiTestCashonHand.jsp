<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>

<script src="resources/jquery-3.3.1.js"></script>
<script>
$(function()	{
	//selectCashOne();		//오늘날짜이면서 cashonType이 1인것만 출력
	selectCashonhand();	//시재 전체출력
	//predicCash();	//예상시재액					
	
	$("#cashCheck").on('click',function()	{
		insertCashonhand();		
	})
	$("#delbutt").on('click',function()	{
		deleteCashonhand();
	})
	
})
function insertCashonhand()	{
	var currentMoney = $("#currentMoney").val();
	var cashonhand_error = 0;
	
	//1.분류구분 		1)개시 +  , 2)회수 -  , 3)투입 +  ,  4)마감 -
	var cashonhand_type = $("#cashonhand_type option:selected").val();
	
	//5.지금 당장 개시,투입,회수한 시제금액
	var cashonhand_cash = $("#cashonhand_cash").val();
	
	if (cashonhand_type=="개시") {
		
		cashonhand_type = 1;
		
		if (currentMoney != cashonhand_cash) {
			cashonhand_error = Number(currentMoney) - Number(cashonhand_cash);
			
			if (cashonhand_error < 0) {
				cashonhand_error = Number(cashonhand_cash) - Number(currentMoney);
			}

		}	else	{
			cashonhand_error = Number(currentMoney) - Number(cashonhand_cash);
		}
			

	
	}	else if (cashonhand_type=="회수") {
		cashonhand_type = 2;
		
		cashonhand_error = Number(currentMoney) - Number(cashonhand_cash);
	
	}	else if (cashonhand_type=="투입") {
		cashonhand_type = 3;
		cashonhand_error = Number(currentMoney) + Number(cashonhand_cash);
		
		if (currentMoney != cashonhand_cash) {
			cashonhand_error = Number(currentMoney) - Number(cashonhand_cash);
			
			if (cashonhand_error < 0) {
				cashonhand_error = Number(cashonhand_cash) - Number(currentMoney);
			}

		}	else	{
			cashonhand_error = 0;
		}
	
	}	else if (cashonhand_type=="마감") {
		cashonhand_type = 4;
		
		cashonhand_error = Number(currentMoney) - Number(cashonhand_cash);
	}
	
	
	//2.시재내역 등록자
	var cashonhand_register = $("#cashonhand_register").val();
	
	var dat = {"cashonhand_type" : cashonhand_type
				,"cashonhand_register" : cashonhand_register
				,"cashonhand_error" : cashonhand_error
				,"cashonhand_cash" : cashonhand_cash
				//,"predictCash" : predictCash
				};
					$.ajax({
						url : "insertCashonhand",
						method : "POST",
						data : dat,
						success : output	
					});
}
function output(resp) {
    var a = "";
    a += "<tr>";
    a += "<th>시재분류구분</th>";
    a += "<th>시재내역등록자</th>";
    a += "<th>결산시현금과장부상오차</th>";
    a += "<th>시재금액</th>";
    a += "</tr>";
  $.each(resp, function(index, item) {
      a += "<tr>";
      a += "<td>" + item.cashonhand_type + "</td>";
      a += "<td>" + item.cashonhand_register + "</td>";
      a += "<td>" + item.cashonhand_error + "</td>";
      a += "<td>" + item.cashonhand_cash + "</td>";
      a += "</tr>";
    })
    $("#view").html(a);
  	predicCash();	//예상시재액
  }
function selectCashonhand()	{
		$.ajax({
			url : "selectCashonhand",
			method : "POST",
			success : output
		});
	}
function selectCashOne()	{
	$.ajax({
		url : "selectCashOne",
		method : "POST",
		success : output
		
	});
}	
function deleteCashonhand()	{
		var cashonhand_seq = $("#deleteCashonhand").val();
		if (isNaN(cashonhand_seq)) {
			alert("번호만 입력");
			return;
		}
		$.ajax({
			url : "deleteCashonhand",
			method : "post",
			data : { cashonhand_seq : cashonhand_seq },
			success : output
		});
	}

function predicCash()	{//예상시재액
	$.ajax({
		url : "predicCash"
		,method : "POST"
		,success : function(resp)	{
			$("#cashonhand_cash").val("예상시재액" + resp);
		}
		
	});
}



</script>

</head>
<body>
	<h1>시재테이블</h1>
	현재시제를 입력하고  시재금액을 숫자로 입력하면 계산됩니다. 개시와 투입의 경우에는 현재시재와 시재금액이 +가 되고 회수와 마감의 경우에는 -가 됩니다.
															한번씩 연산을 한 후에는 결과값을 현재시재에 입력해야 하는 번거로움이 있습니다.   더 좋은 방법이 있겠지만 생각이 안나네요...
<br><br><br><br><br>		
<input type="text" id="currentMoney" placeholder="현재시제입력"><br>	
<tr>
	<td>시재분류구분<select id="cashonhand_type">
					<option value="개시">개시</option>
					<option value="회수">회수</option>
					<option value="투입">투입</option>
					<option value="마감">마감</option>
				 </select>
	</td>
</tr><br>
<tr>
	<td>
				<input type="text" id="cashonhand_register" placeholder="시재내역등록자">
	</td>
</tr><br>

<tr>
	<td>
		<input type="text" id="cashonhand_cash" placeholder="시재금액">
	</td>
</tr><br>
<input type="button" id="cashCheck" value="시재버튼">

<table id="view">
</table>
<input type="text" id="deleteCashonhand" placeholder="삭제할 시재번호입력">
<input type="button" id="delbutt" value="삭제버튼">
<br><br><br>	
<div id="predictCash4">${predictCash4}</div>

</body>
</html>