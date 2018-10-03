<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>회원가입</title>
	</head>
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.9.2/themes/base/jquery-ui.css" />
<script type="text/javascript" src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/ui/1.9.2/jquery-ui.js"></script>
<script type="text/javascript" src="jquery.ui.datepicker-ko.js"></script>
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
    </script>

<script type="text/javascript">
    function tocheckpw2() {
        var pw = document.getElementById("user_pwd").value;
        var pwck = document.getElementById("user_pwd2").value;
 
        if (pw != pwck) {
            document.getElementById('pwsame').innerHTML = '비밀번호가 틀렸습니다. 다시 입력해 주세요';
            return false;
        }
    }
</script>
	<body>
		<section class="container common-layout-sub">
	<h2 class="hide">서브 컨텐츠</h2>

	<section class="common-sub sub-login">
		<h3 class="sub-title">로그인</h3>
		<p class="sub-location"><span class="hide">현 위치</span>Home - 회원 가입</p>
		
		
		<div class="container">
		<form method="post" action="/roseFinch/user/join" onsubmit="return tocheckpw2()">
			<table class="table table-bordered table-hover" style="text-align: center;  border: 1px solid #dddddd">
				<thead >
					<tr >
						<th colspan="3" style= "text-align: center; margin: 0 auto;"><h4>회원 등록 양식</h4>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td style="width: 110px;"><h5>아이디</h5></td>
						<td><input class="form-control" id="user_id" type="text"  name="user_id" maxlength="20" placeholder="아이디를 입력하세요"></td>
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
						<td style="width: 110px;"><h5>이름</h5></td>
						<td colspan="2"><input class="form-control" id="name" type="text" name="name" maxlength="20" placeholder="이름을 입력하세요"></td>
					</tr>
					<tr>
						<td style="width: 110px;"><h5>이메일</h5></td>
						<td colspan="2"><input class="form-control" id="email" type="email" name="email" maxlength="20" placeholder="이메일을 입력하세요"></td>
					</tr>
					<tr>
						<td style="width: 110px;">휴대폰</td>
						<td colspan="2"><input class="form-control" type="text" name="phone" placeholder="-포함 13자리를 입력" maxlength="13" required /></td>
					</tr>
					<tr>
						<td>주소</td>
						<td colspan="2">
							<div>
								<input class="form-control" type="text" name="address" id="address" size="50" placeholder="주소를 검색하세요."  />
								<button class="btn pull-right" type="button" class="btnFind" onclick="zipcode()">주소검색</button>
							</div>
						</td >
					</tr>
					<tr>
					<td>▶생년월일3</td>
	               <td>
	               		<input type="text" id="brith" name="brith" maxlength="8">
	               </td>
	                </tr>
						<tr>
						<td>성별</td>
						<td>
							<input type="radio" name="gender" value="남">남
							<input type="radio" name="gender" value="여">여
						</td>
					</tr>
					<tr>
						<td style="text-alig:left;" colspan="3">
							<input id="submit " type="submit" value="등록">
						</td>
					</tr>
				</tbody>
			</table>
		</form>
	
	</div>
	</section>
</section>
	</body>
</html>
