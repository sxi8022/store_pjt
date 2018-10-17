<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>회원가입</title>
	</head>
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.9.2/themes/base/jquery-ui.css" />
	<link rel="stylesheet"  href="css/bootstrap-4.1.0.css">
<script type="text/javascript" src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/ui/1.9.2/jquery-ui.js"></script>
<script type="text/javascript" src="js/datepicker-ko.js"></script>
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
            document.getElementById('sel_ori_addr').value = fullAddr;
        }
    }).open();
}
  function checkId(){
	    var sel_id = $('#sel_id').val();
	    $.ajax({
	        url:'/idDuplChk',
	        type:'post',
	        data:{sel_id:sel_id},
	        success:function(data){
	            if($.trim(data)==0){
	                $('#chkMsg').html('<p style="COLOR: blue">사용가능</p>');                
	            }else{
	                $('#chkMsg').html('<p style="COLOR: red">사용불가</p>');
	            }
	        },
	        error:function(){
	                alert("에러입니다");
	        }
	    });
	};
        
    </script>

<script type="text/javascript">
    
$(document).ready(function(){
	
	//id와 비밀번호의 유효성 검사
	var regExp1 = /^[a-zA-Z0-9]{4,12}$/;
	//비밀번호 유효성 체크 
	var regPwd = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$/;
	//e-mail의 유효성 검사
    var regExp2 = /[a-z0-9]{2,}@[a-z0-9-]{2,}\.[a-z0-9]{2,}/i;
  	//이름의 유효성 검사
    var regname = /^[가-힝]{2,}$/;
    
  	//아이디의 id값
    var idtext = document.getElementById("sel_id");
  	//비밀번호의 id값
    var patext = document.getElementById("sel_pwd");
  	//비밀번호확인의 id값
    var cpatext = document.getElementById("sel_pwd2");
  	//이름의 id값
    var nametext = document.getElementById("sel_name");
  	//전화번호의 id값
    var selphone = document.getElementById("sel_phone");
    //주소의 id값
    var addrtext = document.getElementById("sel_ori_addr");
	
	
	$("#seljoinBtn").on("click",function(){
		
		 var selId =$('#sel_id').val();
			if(selId==""){
				alert("아이디를 입력하세요");
				return false;
			}	
			var pw1 = $('#sel_pwd').val(); 
			if(pw1==""){
				alert(" 비밀번호를 입력하세요");
				return false;
			}
		
			var pw2 = $('#sel_pwd2').val(); 
			if(pw2==""){
				alert(" 비밀번호 확인을 입력하세요");
				return false;
			}
			var selName = $('#sel_name').val(); 
			if(selName==""){
				alert(" 이름을 입력하세요");
				return false;
			}
			var phone = $('#sel_phone').val(); 
			if(phone==""){
				alert("전화번호를 입력하세요");
				return false;
			}
			var ori_addr = $('#sel_ori_addr').val(); 
			if(ori_addr==""){
				alert("주소를 입력하세요");
				return false;
			}
			if(!regExp1.test(selId))
	            //아이디 유효성 검사 후 4~12자의 영문 대소문자와 숫자의 유효성이 안 맞다면
	            //공백을 주고 알람을 띄운다.
	            //밑에 동일한 유효성 검사
	           {
	               alert("형식에 맞춰 ID를 입력하세요");
	               idtext.value = "";
	               idtext.focus();
	               return false;
	           }
			
		  else if (!regPwd.test(pw1))
	          {
	              alert("형식에 맞춰 비밀번호를 입력하세요");
	              patext.value = "";
	              patext.focus();
	              return false;
	          } 
		  else if (!(pw2.slice(0, pw2.length) === pw1.slice(0, pw1.length))) 
	      {
	          alert("비밀번호가 동일하지 않습니다.");
	          cpatext.value = "";
	          cpatext.focus();
	          return false;
	      } 
	      else if ((pw2.slice(0, pw2.length) === selId.slice(0, selId.length))) 
	      {
	          alert("비밀번호가 ID와 동일하면 안됩니다.");
	          patext.value = "";
	          patext.focus();
	          cpatext.value = "";
	          cpatext.focus();
	          return false;
	      }
	      else if (!regname.test(selName))
	      {
	          alert("이름을 제대로 입력하세요. 한글2자이상");
	          nametext.value = "";
	          nametext.focus();
	          return false;
	      } 
		
		$("#selForm").submit();
	});
	
});   
   
   function chkselInfo() {
       
	 	
	   
	   
	    
    }
</script>
	<body>
	<section class="container common-layout-sub">
	<h2 class="hide">서브 컨텐츠</h2>
		<h3 class="sub-title">로그인</h3>
		<p class="sub-location"><span class="hide">현 위치</span>Home - 판매자 회원 가입</p>
	</section>
	<div class="container">
		<form role="form" id="selForm" method="post" action="joinProcess">
			<table class="table table-bordered table-hover" style="text-align: center;  border: 1px solid #dddddd">
				<thead >
					<tr >
						<th colspan="3" style= "text-align: center; margin: 0 auto;"><h4>회원 등록 양식</h4>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td style="width: 110px;"><h5>아이디</h5></td>
						<td><input class="form-control" id="sel_id" type="text"  name="sel_id" maxlength="20" placeholder="아이디를 입력하세요" oninput="checkId()"></td>
					</tr>
					<tr>
					<td><span id = "chkMsg"></span></td>
					</tr>
					<tr>
						<td style="width: 110px;"><h5>비밀번호</h5></td>
						<td colspan="2"><input class="form-control" id="sel_pwd" type="password" name="sel_pwd" maxlength="20" placeholder="비밀번호를 입력하세요"></td>
					</tr>
					<tr>
						<td style="width: 110px;"><h5>비밀번호 재입력</h5></td>
						<td colspan="2"><input class="form-control" id="sel_pwd2" type="password" name="sel_pwd2" maxlength="20" placeholder="비밀번호를 입력하세요"></td>
					</tr>
					<tr>
						<td></td>
						<td><p id="pwsame" style="color:red;"></p></td>
					</tr>
					<tr>
						<td style="width: 110px;"><h5>이름</h5></td>
						<td colspan="2"><input class="form-control" id="sel_name" type="text" name="sel_name" maxlength="20" placeholder="이름을 입력하세요"></td>
					</tr>
					<tr>
						<td style="width: 110px;">휴대폰</td>
						<td colspan="2"><input class="form-control" id = "sel_phone" type="text" name="sel_phone" placeholder="-포함 13자리를 입력" maxlength="13" required /></td>
					</tr>
					<tr>
						<td>주소</td>
						<td colspan="2">
							<div>
								<input class="form-control" type="text" name="sel_ori_addr" id="sel_ori_addr" size="50" placeholder="주소를 검색하세요."  />
								<button class="btn pull-right" type="button" class="btnFind" onclick="zipcode()">주소검색</button>
							</div>
						</td >
					</tr>
					<tr>
						<td style="text-alig:left;" colspan="3">
							<input class="btn btn-primary pull-right" type="button"  id="seljoinBtn" value="회원가입">
						</td>
					</tr>
				</tbody>
			</table>
		</form>
	
	</div>

	</body>
</html>
