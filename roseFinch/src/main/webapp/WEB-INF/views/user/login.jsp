<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<section class="container common-layout-sub">
	<h2 class="hide">서브 컨텐츠</h2>

	<section class="common-sub sub-login">
		<h3 class="sub-title">로그인</h3>
		<p class="sub-location"><span class="hide">현 위치</span>Home - 회원 - 로그인</p>
<div class="container">
		<form method="post" action="login">
			<table class="table table-bordered table-hover" style="matext-align: center; margin-top:180px; margin-bottom:200px; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th colspan="2"><h4>로그인 양식</h4>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td style="width: 110px;"><h5>아이디</h5></td>
						<td><input class="form-control" type="text" name="user_id" maxlength="20" placeholder="아이디를 입력하세요."></td>
					</tr>
					<tr>
						<td style="width: 110px;"><h5>비밀번호</h5></td>
						<td><input class="form-control" type="password" name="user_pwd" maxlength="20" placeholder="비밀번호를 입력하세요."></td>
					</tr>
					<tr>
						<td style="text-align: left" colspan="2"><input class="btn btn-primary pull-right" type="submit" value="로그인"></td>		
					</tr>
				</tbody>
				
			</table>
		</form>
	</div>
	</section>
</section>
	