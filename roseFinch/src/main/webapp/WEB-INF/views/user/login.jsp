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

  </head>

  <body class="center-block" cellpadding="0" cellspacing="0" marginleft="0" margintop="0" width="100%" height="100%" align="center">

	<div class="card align-middle center-block" style="width:20rem; margin:0 auto; margin-bottom:100px; text-align:center; border-radius:20px;">
		<div class="card-title center-block" style="margin-top:30px;">
			<h2 class="card-title text-center center-block" style="color:#113366;">ROSEFINCH</h2>
		</div>
		<div class="card-body">
      <form method="post" action="login">
        <label for="inputEmail" class="sr-only">Your ID</label>
        <input class="form-control" type="text" name="userId" maxlength="20" placeholder="아이디를 입력하세요." required autofocus><BR>
        <label for="inputPassword" class="sr-only">Password</label>
        <input class="form-control" type="password" name="userPwd" maxlength="20" placeholder="비밀번호를 입력하세요." required><br>
        <input class="btn btn-primary pull-right" style="width: 279px; margin-bottom: 100px; " type="submit" value="로그인">
      </form>
      <button style="width: 279px; height: 38px; margin-top: 15px; border: 1px solid #f5f5f5;"><b style="color:blue">Google</b> 로그인</button>
      <button style="width: 279px; height: 38px; margin-top: 5px; margin-bottom: 100px; border: 1px solid #f5f5f5;"><b style="color:green">Naver</b> 로그인</button>
		</div>
		<div class="center-block" style="width: 279px; height: 38px; margin-top:100px; margin:0 auto; margin-bottom:30px; border: 1px solid #ccc;">
			<span><a style="color:black"  href="#">아아디 찾기 |</a></span>
			<span><a style="color:black" href="#">비밀번호 찾기 |</a></span>
			<span><a style="color:black" href="#">회원가입</a></span>
		</div>
	</div>

	<div class="modal">
	</div>
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script> 
  </body>
</html>