<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<section class="container common-layout-sub">
	<h2 class="hide">서브 컨텐츠</h2>

	<section class="common-sub sub-login">
		<h3 class="sub-title">마이페이지</h3>
		<p class="sub-location"><span class="hide">현 위치</span>Home - 회원 - 마이페이지</p>

		<!--마이페이지 사이드바 -->
		<div class="sidebar row">
			<!-- accordion 기능 구현 예정 -->
			<div class="mypage_side col-md-3">
				<div class="sidebar_header m-1">
					<h6 class="sidebar_header_text">마이페이지</h6>
					<p><span class="bold">홍길동</span>님의 쇼핑정보</p>
					<ul class="sidebar_header_content">
						<li>
							<p>등급 : 브론즈회원</p>
						</li>
						<li>
							<p>포인트 : 0원</p>
						</li>
						<li>
							<p>쿠폰 : 0개</p>
						</li>
						<li>
							<p>장바구니 : 0개</p>
						</li>
					</ul>
				</div>
				
				<div class="sidebar_content">
					<div class="sidebar_content_header">
						<p><span class="bold">개인정보</span></p>
					</div>
					<div class="sidebar_content_body">
						<ul>
							<li>
								<p><span>-</span>회원 정보 수정</p>
							</li>
							<li>
								<p><span>-</span>나의 배송지 관리</p>
							</li>
							<li>
								<p><span>-</span>회원 탈퇴</p>
							</li>
						</ul>	
					</div>
				</div>
				
				<div class="sidebar_content">
					<div class="sidebar_content_header">
						<p><span class="bold">내 쇼핑정보</span></p>
					</div>
					<div class="sidebar_content_body">
						<ul>
							<li>
								<p><span>-</span>주문내역/배송조회</p>
							</li>
							<li>
								<p><span>-</span>적립금 내역</p>
							</li>
							<li>
								<p><span>-</span>할인쿠폰 내역</p>
							</li>
							<li>
								<p><span>-</span>상품보관함</p>
							</li>
						</ul>	
					</div>
				</div>

				<div class="sidebar_content">
					<div class="sidebar_content_header">
						<p><span class="bold">1:1 문의 게시판</span></p>
					</div>
					<div class="sidebar_content_body">
						<ul>
							<li>
								<p><span></span></p>
							</li>
							<li>
								<p><span></span></p>
							</li>
							<li>
								<p><span></span></p>
							</li>
						</ul>
					</div>
				</div>

				<div class="sidebar_content">
					<div class="sidebar_content_header">
						<p><span class="bold">나의 상품 후기</span></p>
					</div>
					<div class="sidebar_content_body">
						<ul>
							<li>
								<p><span></span></p>
							</li>
							<li>
								<p><span></span></p>
							</li>
							<li>
								<p><span></span></p>
							</li>
						</ul>
					</div>
				</div>

				<div class="sidebar_content">
					<div class="sidebar_content_header">
						<p><span class="bold">나의 상품 문의</span></p>
					</div>
					<div class="sidebar_content_body">
						<ul>
							<li>
								<p><span></span></p>
							</li>
							<li>
								<p><span></span></p>
							</li>
							<li>
								<p><span></span></p>
							</li>
						</ul>
					</div>
				</div>

				<div class="sidebar_content">
					<div class="sidebar_content_header">
						<p><span class="bold">최근 본 상품 목록</span></p>
					</div>
					<div class="sidebar_content_body">
						<ul>
							<li>
								<p><span></span></p>
							</li>
							<li>
								<p><span></span></p>
							</li>
							<li>
								<p><span></span></p>
							</li>
						</ul>
					</div>
				</div>
			</div>
			
			<!-- 마이페이지 메인섹션 -->
			<div class="mypage_main col-md-9">
				<div class="mypage_main_header">
					<h6>진행 중인 주문</h6>
					<button class="btn">자세히 보기</button>
				</div>
				<div class="mypage_main_body">
					<table class="table text-center">
						<thead>
							<tr>
								<th>입금대기중</th>
								<th>결제완료</th>
								<th>배송준비중</th>
								<th>배송중</th>
								<th>배송완료</th>
								<th>취소/교환/반품</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>0건</td>
								<td>0건</td>
								<td>0건</td>
								<td>0건</td>
								<td>0건</td>
								<td>0건</td>
							</tr>
						</tbody>
					</table>
				</div>
	
				<div class="mypage_main_header">
					<h6>최근 주문 정보</h6>
					<button class="btn">자세히 보기</button>
				</div>
				<div class="mypage_main_body">
					<table class="table text-center">
						<thead>
							<tr>
								<th>주문일시</th>
								<th>주문번호</th>
								<th>결제방법</th>
								<th>주문금액</th>
								<th>취소금액</th>
								<th>주문상태</th>
								<th>수령확인</th>
								<th>상세보기</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td colspan="8">최근 주문 정보가 없습니다.</td>
							</tr>
						</tbody>
					</table>
				</div>
	
				<div class="mypage_main_header">
					<h6>1:1 문의 내역</h6>
					<button class="btn">자세히 보기</button>
				</div>
				<div class="mypage_main_body">
					<table class="table text-center">
						<thead>
							<tr>
								<th>번호</th>
								<th>질문유형</th>
								<th>제목</th>
								<th>작성자</th>
								<th>작성일</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td colspan="5">1:1 문의 내역이 없습니다.</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			
		</div>



	</section>
</section>