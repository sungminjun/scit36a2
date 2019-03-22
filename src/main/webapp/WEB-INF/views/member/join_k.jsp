<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<style>
	label{
		display : inline-block;
		width:100px;
	}
	input[type=password], #comp_id {
		display : inline-block;
		width   : 300px;
	}
	span#comp_idcheck {
		color : red;
	}
</style>
<script src="resources/jquery-3.3.1.js"></script>
<script>
var message = "${not empty message ? message : ''}";
$(function(){
	if(message != '') {
		alert(message);
		location.href="${pageContext.request.contextPath}/"
	}

	$("#Regist").on('click', function() {
		var comp_id = $("#comp_id").val();
		var comp_name = $("#comp_name").val();
		var comp_tel = $("#comp_tel").val();
		var comp_address = $("#comp_address").val();
		var comp_address2 = $("#comp_address2").val();
		var emp_id = $("#emp_id").val();
		var emp_pw = $("#emp_pw").val();
		var emp_name = $("#emp_name").val();
		var emp_tel = $("#emp_tel").val();
		var emp_quiz = $("#emp_quiz").val();
		var emp_quiz_answer = $("#emp_quiz_answer").val();
		
		
		$("#regist").submit();
	});
	$("#comp_id").on('keyup', function() {
	/* 	$("#comp_idcheck").css('color', 'red');
		$('#regist').attr('disabled', 'disabled'); */
		var comp_id = $("#comp_id").val();
		/* if(comp_id.length < 3) {
			$("#comp_idcheck").text("길이는 3~10 사이입니다.");
		} */ 
			/* $("#comp_idcheck").text(""); */
			$.ajax({
				method : 'post'
				, url  : 'checkComp_id'
				, data : {
					
					comp_id : comp_id
					
				}
				, success : function(resp) {
					/* if(resp == 0) {
						$("#comp_idcheck").css('color', 'blue');
						$('#Regist').removeAttr('disabled');
						$("#comp_idcheck").text("사용 가능한 사업자 등록번호 입니다.");
					} else {
						$("#comp_idcheck").css('color', 'red');
						$('#Regist').attr('disabled', 'disabled');
						$("#comp_idcheck").text("이미 등록된 사업자 등록번호 입니다.");
					} */
					
					if(resp == "lengthFail"){
						$("#idchecked").attr('style', 'color:red');
						$("#idchecked").text("등록번호는 3~10글자 사이로 입력해 주세요.");
						return;
					}else if (resp == "fail"){
						$("#idchecked").attr('style', 'color:red');
						$("#idchecked").text("이미 사용중인 사업자등록 번호 입니다.");
						return;
					}else if(resp =="success"){
						$("#idchecked").attr('style', 'color:blue');
						$("#idchecked").text("사용가능한 사업자등록 번호 입니다.");
					}
					
				}
			}); 
		
	});
})
</script>
</head>
<body>
<div id="wrapper">
	<h2>[ 학생 등록 ]</h2>
	<form id="regist" action="regist" method="POST">
		<p><label for="comp_id">사업자 등록 번호 : </label>
			<input class="owner" id="comp_id" type="text" name="comp_id" />
			<span id="idcheck"></span><p id="idchecked"></p>
		</p>
		<p><label for="comp_name">가게명: </label>
			<input class="owner" type="text" name="comp_name" />
		</p>
		<p><label for="comp_tel">가게 전화번호 : </label>
			<input class="owner" type="text" name="comp_tel" />
		</p>
		<p><label for="comp_address">가게 주소 : </label>
			<input class="owner" type="text" name="comp_address"/>
		</p>
		<p><label for="comp_address2">가게 주소 : </label>
			<input class="owner" type="text" name="comp_address2"/>
		</p>
		<p><label for="emp_id">아이디 : </label>
			<input class="owner" type="text" name="emp_id"  />
		</p>
		<p><label for="emp_pw">비밀번호 : </label>
			<input class="owner" type="password" name="emp_pw" />
		</p>
		<p><label for="emp_name">이름 : </label>
			<input class="owner" type="text" name="emp_name" />
		</p>
		<p><label for="emp_tel">전화번호 : </label>
			<input class="owner" type="text" name="emp_tel" />
		</p>
		<p><label for="emp_quiz">비밀번호 확인용 질문 : </label>
			<input class="owner" type="text" name="emp_quiz" />
		</p>
		<p><label for="emp_quiz_answer">이름 : </label>
			<input class="owner" id="emp_quiz_answer" type="text" name="emp_quiz_answer" placeholder="이름 입력" />
		</p>
		
		<input id="Regist" type="button" value="가입"  />
	</form>
</div>
</body>
</html>