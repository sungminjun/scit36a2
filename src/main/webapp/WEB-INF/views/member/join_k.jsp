<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script>
function validate(){

	//userid라는 곳에서 값을 가져오라는 의미	
	//var userid = document.getElementById("userid");
	var userpw = document.getElementById("userpw");
	var upw =  document.getElementById("upw");
	var temp1=userpw.value;
	var temp2=upw.value;
	
	if(temp1 != temp2){
		alert("비밀번호와 비밀번호 확인값이 같아야 합니다.");
		userpw.select();
		
		return false;
	}
	//trim() : 문자열의 앞과 뒤의 공백을 없애주는 함수(띄어쓰기 방지)
	//if(userpw.trim().length()>=3 && userpw.trim().length()<10)
		
	if(temp1.trim().length<3 || temp1.trim().length>10){
			alert("비밀번호는 3~10자리로 입력해주세요");
			userpw.select();
			return false;
		}
	var username = document.getElementById("username");
	var temp = username.value;
	if(temp.trim().length==0){
		alert("이름은 반드시 입력하셔야 합니다");
		username.focus();
		return false;
	}
	
	var birth =  document.getElementById("birth").value;
	var gender =  document.getElementsByName("gender").selected;
	var phone1 =  document.getElementById("phone1").value;
	var phone2 =  document.getElementById("phone2");
	//phone2가 숫자인지 아닌지 체크하는 메서드. isNaN=숫자인지 아닌지 체크
	if(isNaN(phone2.value)||phone2.value.trim().length!=8){
		alert("전화번호는 8자리 숫자만 입력하세요");
		phone2.select(); 
		//select는 .value를 붙이지 않은 즉, 태그객체일 경우에만 가능. 
		//value를 붙이면 값 자체를 가져옴
		return false;
	}
	
	document.getElementById("phone").value=phone1+phone2.value;
	
	
	var addr1 =  document.getElementById("addr1").value;
	var addr2 =  document.getElementById("addr2");
	var address =  document.getElementById("address");
	
	if(addr2.value.trim().lenth==0){
		
		alert("나머지 주소를 입력해주세요")
		addr2.select();
		return false;
		}
	
	document.getElementById("address").value=addr1+" " + addr2.value;

	return true;
}

//id 중복확인 함수
function idCheck(){
	window.open("idCheck","checkWin","top=200,left=300,height=400, width=400, ");
}

</script>
</head>
<body>
<h2>[ 회원 가입 ]</h2>

<!-- 가입 폼 시작 -->
<form id="" action="joinus" method="post" >
	<table border="1">
		<tr>
			<th>사업자등록번호</th>
			<td>
				<input id="comp_id" type="text" value="" name="comp_id" readonly="readonly" />
				<input type="button" value="ID중복확인" onclick="comp_Check()"/>
			</td>
		</tr>
		<tr>
			<th>가게이름</th>
			<td>
				<input id="comp_name" type="text" value="" name="comp_name" />
			</td>
		</tr>
		<tr>
			<th>가게 전화번호</th>
			<td>
				<input id="comp_tel" type="text" value="" name="comp_tel" />
			</td>
		</tr>
		<tr>
			<th>가게 주소</th>
			<td>
				<input id="comp_address" type="text" value="" name="comp_address" />
				<input type="button" value="ID중복확인" onclick="idCheck()"/>
			</td>
		</tr>
 		<tr>
			<th>비밀번호</th>
			<td><input id="userpw" type="password" name="userpw" /></td>
		</tr>
		<tr>
			<th>비밀번호 확인</th>
			<td><input id="upw" type="password" name=""/></td>
		</tr>
		<tr>
			<th>이름</th>
			<td><input id="username" type="text" name="username" /></td>
		</tr>
		<tr>
			<th>성별</th>
			<td>
			<input class="" type="radio" name="gender" value="male" checked /> 남자
			<input class="" type="radio" name="gender" value="female" /> 여자
			</td>
		</tr>
		<tr>
			<th>생년월일</th>
			<td>
				<input id="birth" type="date" name="birth" />
			</td>
		</tr>
		<tr>
			<th>스마트폰</th>
			<td>
				<select id="phone1">
					<option value="010">010</option>
					<option value="019">019</option>
					<option value="018">018</option>
					<option value="017">017</option>
				</select>
				<input id="phone2" type="text" placeholder="-없이 숫자만 입력" />
				<input id="phone" type="hidden" name="phone" value="" />
			</td>
		</tr>
		<tr>
			<th>주소</th>
			<td>
				<select id="addr1">
					<option value="강남구">강남구</option>
					<option value="송파구">송파구</option>
					<option value="동작구">동작구</option>
					<option value="관악구">관악구</option>
					<option value="강동구">강동구</option>
				</select>
				<input id="addr2" type="text" placeholder="나머지 주소 입력" />
				<input id="address" type="hidden" name="address" value="" />
			</td>
		</tr>
		<tr>
			<th colspan="2">
				<input id="btn" type="submit" value="회원가입" onclick="return validate();"/>
				<input type="reset" value="지우기" />
			</th>
		</tr>
	</table>
	</form>
</body>
</html>