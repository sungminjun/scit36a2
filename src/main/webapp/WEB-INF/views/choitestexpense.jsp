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
	init();
	$("#expensebutton").on('click',function()	{
		inexpense();		
	})
	$("#delexpense").on('click',function()	{
		deExp();
	})

	
	
})

function inexpense()	{
	
	var expense_type = $("#expense_type option:selected").val();		//int
	var expense_date = $("#expense_date").val();
	var expense_description = $("#expense_description").val();
	var expense_amount = $("#expense_amount").val();	//int */
	
	if (expense_type=="고정") {
		expense_type=1;
	}	else if (expense_type=="변동") {
		expense_type=2;
	}	else	{
		expense_type=3;
	}
	
	
	if (isNaN(expense_amount)) {
		alert("숫자로입력하세요.");
		return;
	}
	var d = {"expense_type":expense_type,"expense_date":expense_date,"expense_description":expense_description,"expense_amount":expense_amount}
	
	
	
		var expense_type = $("#expense_type option:selected").val();		//int
		var expense_date = $("#expense_date").val();
		var expense_description = $("#expense_description").val();
		var expense_amount = $("#expense_amount").val();	//int 
	
		
	$.ajax({
		url : "inexpense",
		method : "post",
		data : d,
		success : function(resp)	{
					output
		}
		
	});
	
	}
	function output(resp)	{
		
		var a ='';
		
		$.each(resp,function(index,item)	{		
			a += "<tr>";
			a +="<td>" + item.expense_seq + "</td>";
			a +="<td>" + item.comp_seq + "</td>";
			a += "<td>" + item.expense_type + "</td>";
			a += "<td>" + item.expense_date + "</td>";
			a += "<td>"	+ item.expense_description + "</td>";
			a += "<td>" + item.expense_amount + "</td>";
			a += "<td><input type='text' id='updNum' placeholder='수정할 지출번호 입력'></td><br>";
			a += "<td><input type='button' data-value=" +item.expense_seq+ " class='up' value='지출목록 수정버튼'></td>";
			a += "</tr>";		
		})
		$("#view").html(a);
		
	}
	function init()	{
		$.ajax({
			url : "selexpense",
			method : "GET",
			success : function(resp)	{
				selexpense(resp);
					$("#expensebutton").val('지출목록에 추가하기');
			}
			
		});
		
	}
	function deExp()	{
		var expense_seq = $("#expense_seq").val();
		if (isNaN(expense_seq)) {
			alert("번호만 입력");
			return;
		}
		var delnum = {"expense_seq":expense_seq};
		$.ajax({
			url : "delexpense",
			method : "post",
			data : delnum,
			success : output
		});
	}

	
	
	

	function selexpense(resp)	{
		
		var a ="";
			a += "<tr>";
			a += "<th>" + 'expense_seq' + "</th>";
			a += "<th>" + 'comp_seq' + "</th>";
			a += "<th>" + 'expense_type' +"</th>";
			a += "<th>" + 'expense_date' +"</th>";
			a += "<th>" + 'expense_description' +"</th>";
			a += "<th>" + 'expense_amount' +"</th>";
			a += "<th>" + '수정버튼' + "</th>";
			a +='</tr>';
		$.each(resp,function(index,item)	{		
			a += "<tr>";
			a +="<td>" + item.expense_seq + "</td>";
			a +="<td>" + item.comp_seq + "</td>";
			a += "<td>" + item.expense_type + "</td>";
			a += "<td>" + item.expense_date + "</td>";
			a += "<td>"	+ item.expense_description + "</td>";
			a += "<td>" + item.expense_amount + "</td>";
			a += "<td><input type='button' data-value=" +item.expense_seq+ " id='update_val' value='지출목록 수정버튼'></td>";
			a += "</tr>";																				
		})
	 	$("#view").html(a);
		$("#update_val").on('click',update);	
	}
	
	function update(){
				
		var expense_seq_origin = $(this).attr("data-value");
		console.log(expense_seq_origin);
// 		var d = {"expense_type":expense_type,"expense_date":expense_date,"expense_description":expense_description,"expense_amount":expense_amount}
// 		$("#expensebutton").val("지출목록 수정버튼");
		$.ajax({
			url : "selexpense",
			method : "GET",
			success : function(resp){
				var a ="";
				a += "<tr>";
				a += "<th>" + 'expense_seq' + "</th>";
				a += "<th>" + 'comp_seq' + "</th>";
				a += "<th>" + 'expense_type' +"</th>";
				a += "<th>" + 'expense_date' +"</th>";
				a += "<th>" + 'expense_description' +"</th>";
				a += "<th>" + 'expense_amount' +"</th>";
				a += "<th>" + '수정버튼' + "</th>";
				a +='</tr>';
				$.each(resp,function(index,item){	
					if(expense_seq_origin==item.expense_seq){
						a += "<tr>";
						a +="<td>" + item.expense_seq + "</td>";
						a +="<td>" + item.comp_seq + "</td>";
						a += "<td><input type='text' id='reexpense_type' value='"+item.expense_type+"'/></td>";
						a += "<td><input type='text' id='reexpense_date' value='"+item.expense_date+"'/></td>";
						a += "<td><input type='text' id='reexpense_description' value='"+item.expense_description+"'/></td>";
						a += "<td><input type='text' id='reexpense_amount' value='"+item.expense_amount+"'/></td>";
						a += "<td><input type='button' data-value=" +item.expense_seq+ " id='input_update' value='변경하기'></td>";
						a += "</tr>";
					}else{
						a += "<tr>";
						a +="<td>" + item.expense_seq + "</td>";
						a +="<td>" + item.comp_seq + "</td>";
						a += "<td>" + item.expense_type + "</td>";
						a += "<td>" + item.expense_date + "</td>";
						a += "<td>"	+ item.expense_description + "</td>";
						a += "<td>" + item.expense_amount + "</td>";
						a += "<td><input type='button' data-value=" +item.expense_seq+ " id='update_val' value='지출목록 수정버튼'></td>";
						a += "</tr>";
					}
				})
				$("#view").empty();
				$("#view").html(a);
				$("#input_update").on('click',input_update2);
			}
		});
	}
		
		
		function input_update2(){
			var reexpense_seq =$(this).attr("data-value"); 
			var reexpense_type =$("#reexpense_type").val();
			var reexpense_date =$("#reexpense_date").val();
			var reexpense_description =$("#reexpense_description").val();
			var reexpense_amount =$("#reexpense_amount").val();
			
			var data={
					"expense_seq" : reexpense_seq
					,"expense_type" : reexpense_type
					, "expense_date" : reexpense_date
					, "expense_description" : reexpense_description
					, "expense_amount" : reexpense_amount
			}
			$.ajax({
				url : "updateExpense",
				method : "post",
				data : data,
				success : init
			});
			
		}

	

</script>
</head>
<body>
지출 Expense.JSP
<br><br><br>


	<form id="exp">
		<tr>
			<td>
					지출유형<select id="expense_type" name="expense_type">
							<option value="고정">고정</option>
							<option value="변동">변동</option>
							<option value="기타">기타</option>
							</select>
			</td>
		</tr>
		
		<br>
		<tr>
		<td>
		지출일은 무조건 sysdate로 가야하는??아니라면 mapper에 sysdate도 수정할것.<input id="expense_date" type="date"><br>
		
		<input type="text" id="expense_description" placeholder="지출명목/내역"><br>
		</td>
		</tr>
		<tr>
		<td>
		<input type="text" id="expense_amount" placeholder="지출금액">		<input id="expensebutton" type="button" value="지출목록에 추가하기">
		</td>
		</tr>
		<br><br><br><br>
		<tr>
		<td>
		시작기간<input type="date">종료기간<input type="date"><input type="button" value="검색">
		</td>
		</tr>
		<br><br><br><br>
		<tr>
		<td>
		<input type="text" name="expense_seq" id="expense_seq" placeholder="삭제할  지출번호 입력"><input type="button" id="delexpense" value="삭제할 지출 버튼">
		</td>
		</tr>
		<br><br><br><br>
	</form>
<table id="view">
		<tr>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
		</tr>
</table>
</body>
</html>