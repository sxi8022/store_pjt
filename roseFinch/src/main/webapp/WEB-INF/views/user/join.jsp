<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    
    
    <title>로그인 폼</title>
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
        
		  function checkId(){
			    var user_id = $('#user_id').val();
			    $.ajax({
			        url:'/roseFinch/user/idcheck',
			        type:'post',
			        data:{user_id:user_id},
			        success:function(data){
			            if($.trim(data)==0){
			                $('#IchkMsg').html('<p style="COLOR: blue">사용가능</p>');                
			            }else{
			                $('#IchkMsg').html('<p style="COLOR: red">사용불가</p>');
			            }
			        },
			        error:function(){
			                alert("에러입니다");
			        }
			    });
			};
			
			function checkEmail(){
			    var email = $('#email').val();
			    $.ajax({
			        url:'/roseFinch/user/emailcheck',
			        type:'post',
			        data:{email:email},
			        success:function(data){
			            if($.trim(data)==0){
			                $('#EchkMsg').html('<p style="COLOR: blue">사용가능</p>');                
			            }else{
			                $('#EchkMsg').html('<p style="COLOR: red">사용불가</p>');
			            }
			        },
			        error:function(){
			                alert("에러입니다");
			        }
			    });
			};
		  
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

  </head>

  <body class="center-block" cellpadding="0" cellspacing="0" marginleft="0" margintop="0" width="100%" height="100%" align="center">

	<div class="container">
		<form method="post" action="join" onsubmit="return DosignUp()">
			<table class="table table-bordered table-hover" style="text-align: center;  border: 1px solid #dddddd">
				<thead >
					<tr >
						<th colspan="4" style= "text-align: center; margin: 0 auto;"><h4>회원 등록 양식</h4>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td style="width: 110px;"><h5>아이디</h5></td>
						<td colspan="2"><input class="form-control" id="user_id" type="text"  name="user_id" maxlength="20" placeholder="아이디를 입력하세요" oninput="checkId()"></td>
						<td><span id = "IchkMsg"></span></td>
					</tr>
					
					<tr>
						<td style="width: 110px;"><h5>비밀번호</h5></td>
						<td colspan="3"><input class="form-control" id="user_pwd" type="password" name="user_pwd" maxlength="20" placeholder="비밀번호를 입력하세요"></td>
					</tr>
					<tr>
						<td style="width: 110px;"><h5>비밀번호 재입력</h5></td>
						<td colspan="3"><input class="form-control" id="user_pwd2" type="password" name="user_pwd2" maxlength="20" placeholder="비밀번호를 입력하세요"></td>
					</tr>
					<tr>
						<td></td>
						<td><p id="pwsame" style="color:red;"></p></td>
					</tr>
					<tr>
						<td style="width: 110px;"><h5>이름</h5></td>
						<td colspan="3"><input class="form-control" id="name" type="text" name="name" maxlength="20" placeholder="이름을 입력하세요"></td>
					</tr>
					<tr>
						<td style="width: 110px;"><h5>이메일</h5></td>
						<td colspan="2"><input class="form-control" id="email" type="email" name="email" maxlength="20" placeholder="이메일을 입력하세요" oninput="checkEmail()"></td>
						<td><span id = "EchkMsg"></span></td>
					</tr>
					<tr>
						<td style="width: 110px;">휴대폰</td>
						<td colspan="3"><input class="form-control" type="text" name="phone" placeholder="-포함 13자리를 입력" maxlength="13" required /></td>
					</tr>
					<tr>
						<td>주소</td>
						<td colspan="3">
							<div>
								<input class="form-control" type="text" name="address" id="address" size="50" placeholder="주소를 검색하세요."  />
								<button class="btn pull-right" type="button" class="btnFind" onclick="zipcode()">주소검색</button>
							</div>
						</td >
					</tr>
					<tr>
						<td>▶생년월일</td>
			            <td colspan="1" >
	               		<input type="text" id="brith" name="brith" maxlength="8" class="datepicker">
	               		<td>성별</td>
						<td colspan="1">
							<input type="radio" name="gender" value="남">남
							<input type="radio" name="gender" value="여">여
						</td>
	               </td>
	                </tr>
						<tr>
						
					</tr>
					<tr>
						<td style="text-alig:left;" colspan="4">
							<input class="btn btn-primary " style="float: right; width: 150px;" id="submit " type="submit" value="등록">
						</td>
					</tr>
				</tbody>
			</table>
		</form>
	
	</div>
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script> 
  </body>
</html>