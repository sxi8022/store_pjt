<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>






<h2>판매물품 등록</h2>



<form method="post" action="/ProductregistrationProcess">

<table border="1" style="margin-top: 30px;">

	<tr>
		<td><label>카테고리 </label></td>
		<td>
			<select name="name">
				<option value = "">카테고리</option>
			</select>
			>
			<select name="name">
				<option value = "">세부 카테고리</option>
			</select>
		</td>

	</tr>
	<tr>
		<td><label>상품명</label></td>
		<td ><input type="text" name="name"></td>
	</tr>
	<tr>
		<td><label>제작회사/출판사</label></td>
		<td ><input type="text" name="company"></td>
	</tr>
	<tr>
		<td><label>가격</label></td>
		<td><input type="number" name="price"></td>
	</tr>
	<tr>
		<td><label>재고</label></td>
		<td ><input type="number" name="cnt"></td>
	</tr>
<!-- 	<tr>
		<td><label>상품옵션설정</label></td>
		<td>
			 <input type="radio" name = "option_yn" value = "y">사용함
        	 <input type="radio" name = "option_yn" value = "n">사용안함
		</td>
	</tr> -->
	<tr>
		<td><label>상품판매가능여부</label></td>
		<td>
			 <input type="radio" name = "sel_yn" value = "y">판매가능
        	 <input type="radio" name = "sel_yn" value = "n">판매불가능
		</td>
	</tr>
	<tr>
		<td><label>배송방법</label></td>
		<td>
			<input type="radio" name="free">무료배송
			<input type="radio" name="No_free">착불 <input type = "text" value ="5000">원

		</td>
	</tr>
	<tr>
		<td>상품이미지등록</td>
		<td><button type= button>등록+</button>&nbsp;<button type= button>등록+</button>&nbsp;<button type= button>등록+</button></td>
	</tr>
<!-- 	<tr>
		<td>상품상세설명</td>
		<td colspan="2"><textarea rows="20" cols="40" name=""></textarea></td>
	</tr> -->
	<tr>
		<td colspan="2"><input type="submit" value="상품등록하기"></td>
	</tr>














</table>

</form>
