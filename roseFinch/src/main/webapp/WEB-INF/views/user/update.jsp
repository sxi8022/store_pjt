<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
<title>회원정보 페이지</title>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.9.2/themes/base/jquery-ui.css" />
	<script type="text/javascript" src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="http://code.jquery.com/ui/1.9.2/jquery-ui.js"></script>
	<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/i18n/datepicker-ko.js"></script>
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
    <script>
        //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
		  function zipcode() {
		    new daum.Postcode({
		        oncomplete: function(data) {
		            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
		            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
		            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
		            var fullAddr = ''; // 최종 주소 변수
		            var extraAddr = ''; // 조합형 주소 변수
		            // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
		            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
		                fullAddr = data.roadAddress;
		            } else { // 사용자가 지번 주소를 선택했을 경우(J)
		                fullAddr = data.jibunAddress;
		            }
		            // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
		            if(data.userSelectedType === 'R'){
		                //법정동명이 있을 경우 추가한다.
		                if(data.bname !== ''){
		                    extraAddr += data.bname;
		                }
		                // 건물명이 있을 경우 추가한다.
		                if(data.buildingName !== ''){
		                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
		                }
		                // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
		                fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
		            }
		            // 우편번호와 주소 정보를 해당 필드에 넣는다.
		            document.getElementById('address').value = fullAddr;
		        }
		    }).open();
		}      
		  
		  $(document).ready(function(){
				//아이디 중복
				$('#IdCheckButton').click(function(){
					
					var request = $.ajax({
						url: "/roseFinch/user/idcheck", //호출 경로
						method: "POST",	//전송방식
						data: { 'userid' : $('input[name=user_id]').val() }, //전송해줄값
						dataType: "text" //결과값 타입 (리턴)
						
					});	
					
					request.done(function( msg ) {
						msg = msg.trim();
						
						
						if(msg == 1){	
							//아이디가 중복될때 메시지
							//alert("아이디가 중복되었습니다.")
							$("#idcheckresult").text("사용불가").css('color','red');
							id.focus();
							
						}else{ //아이디가 중복 안될떄 메시지	
							//alert("사용가능한 아이디입니다.")
							$("#idcheckresult").text("사용가능").css('color','blue');
						}		
					});
					
				});				
				//닉네임 중복체크버튼
				$('#EmailCheckButton').click(function(){	
					var request = $.ajax({
						  url: "/roseFinch/user/emailcheck", //호출 경로
						  method: "POST",	//전송방식
						  data: { 'useremail' : $('input[name=email]').val() }, //전송해줄값
						  dataType: "text" //결과값 타입 (리턴)
					
					});	
					request.done(function( msg ) {
						msg = msg.trim();
						
						
							if(msg == 1){	//별명 중복될때 메시지
								//alert("이메일이 중복되었습니다.")
								$("#emailcheckresult").text("사용불가")
								nick.focus();
							}else{ //별명이 중복 안될떄 메시지
								//alert("사용가능한 이메일입니다.")
								$("#emailcheckresult").text("사용가능")
							}
					});				
				});		
				
				
				
			});
		  
		    </script>

		<script type="text/javascript">
		function DosignUp() {
			var id = $("#user_id").val();
			var pwd = $("#user_pwd").val();
			var pwd2 = $("#user_pwd2").val();
			var name = $("#name").val();
			var email = $("#email").val();
			var phone = $("phone").val();
			var address = $("#address").val();
			var brith = $("#brith").val();
			if(id.length == 0){
					alert("아이디를 입력해 주세요");
					$("id").focus();
					return false;
			}
			if(pwd.length == 0){
					alert("비밀번호를 입력해 주세요");
					$("pwd").focus();
					return false;
			}
			if(pwd != pwd2){
					alert("비밀번호가 서로 다릅니다. 비밀번호를 확인해 주세요.");
					$("pwd2").focus();
					return false;
			}
			if(name.length == 0){
					alert("이름을 입력해주세요");
					$("name").focus();
					return false;
			}
			if(email.length == 0){
					alert("이메일을 입력해주세요");
					$("email").focus();
					return false;
			}
			if(address.length == 0){
					alert("주소를 입력해주세요");
					$("address").focus();
					return false;
			}
			if(brith.length == 0){
					alert("이메일을 입력해주세요");
					$("brith").focus();
					return false;
			}
			if(phone.length == 0){
					alert("이메일을 입력해주세요");
					$("phone").focus();
					return false;
			}
		    }
        
	</script>
<script>
	$(document).ready(function(){
		$("#btnUpdate").click(function(){
			if(confirm("수정하시겠습니까?"))
			document.form1.action = "${path}/user/update";
			document.form1.submit();
		});
	});
	$(document).ready(function(){
		$("#btnDelete").click(function(){
			if(confirm("삭제하시겠습니까?"))
			document.form1.action = "${path}/user/delete";
			document.form1.submit();
		});
	});
</script>
</head>
<body>
	<div class="container">
		<form method="post" name="form1">
			<table class="table table-bordered table-hover" style="text-align: center;  border: 1px solid #dddddd">
				<thead >
					<tr >
						<th colspan="3" style= "text-align: center; margin: 0 auto;"><h4>회원 등록 양식</h4>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td style="width: 110px;"><h5>${user.user_id}</h5></td>
						<td><input class="form-control" id="user_id" name="user_id" maxlength="20" readonly="readonly"></td>
						<td style="width: 110px;"><button class="btn btn-primary"
								id="IdCheckButton" name="IdCheckButton" type="button">중복체크</button><span id="idcheckresult"></span></td>
					</tr>
					
					<tr>
						<td style="width: 110px;"><h5>비밀번호</h5></td>
						<td colspan="2"><input class="form-control" id="user_pwd" type="password" name="user_pwd" maxlength="20" placeholder="비밀번호를 입력하세요"></td>
					</tr>
					<tr>
						<td style="width: 110px;"><h5>비밀번호 재입력</h5></td>
						<td colspan="2"><input class="form-control" id="user_pwd2" type="password" name="user_pwd2" maxlength="20" placeholder="비밀번호를 입력하세요"></td>
					</tr>
					<tr>
						<td></td>
						<td><p id="pwsame" style="color:red;"></p></td>
					</tr>
					<tr>
						<td style="width: 110px;"><h5>${user.name}</h5></td>
						<td colspan="2"><input class="form-control" id="name" type="text" name="name" maxlength="20" placeholder="이름을 입력하세요"></td>
					</tr>
					<tr>
						<td style="width: 110px;"><h5>${user.email}</h5></td>
						<td><input class="form-control" id="email" type="email" name="email" maxlength="20" placeholder="이메일을 입력하세요"></td>
						<td style="width: 110px;"><button class="btn btn-primary"
								id="EmailCheckButton" type="button">중복체크</button><span id="emailcheckresult"></span></td>
					</tr>
					<tr>
						<td style="width: 110px;">${user.phone}</td>
						<td colspan="2"><input class="form-control" type="text" name="phone" placeholder="-포함 13자리를 입력" maxlength="13" required /></td>
					</tr>
					<tr>
						<td>주소</td>
						<td colspan="2">
							<div>
								<input class="form-control" type="text" name="address" id="address" size="50" value="${user.address}"  />
								<button class="btn pull-right" type="button" class="btnFind" onclick="zipcode()">주소검색</button>
							</div>
						</td >
					</tr>
					<tr>
					<td>▶생년월일</td>
	               <td colspan="2" >
	               		<input type="text" id="brith" name="brith" maxlength="8" class="datepicker" value="${user.brith}">
	               </td>
					<tr>
						<td colspan="2" align="center">
							<input type="button" value="수정" id="btnUpdate">
							<input type="button" value="삭제" id="btnDelete">
							<div style="color:red;">${message}</div>
						</td>
					</tr>
				</tbody>
			</table>
		</form>
	
	</div>
</body>
</html>