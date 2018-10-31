<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="path" value="${pageContext.request.contextPath}"/>

<!-- 
[ 필요 사항 ]
1. 각 행의 주문 버튼 누르면 주문 페이지로
2. 전체 주문 버튼 누르면 주문 페이지로
3. 페이징
5. 판매 불가능 상품일 경우 주문 알 수 없도록 
-->

<div class="container basket-container">
<div class="basket-header">장바구니</div>
<table class="table table-bordered">
  <tbody>
    <tr>
      <td><input type="checkbox" checked class="basket-check-all" autocomplete="off"></td>
      <td>상품명</td>
      <td>판매가</td>
      <td>수량</td>
 	  <td>소계금액</td>
 	  <td>배송비</td>
 	  <td>무이자할부</td>
 	  <td>주문/삭제</td>
 	  <td>찜하기</td>
    </tr>
  </tbody>
</table>

 <c:choose> 
 	 	
  	<c:when test="${itemNum>0}">
  		<table class="table table-bordered" id="basket-item-list">
  		<tbody>
  		
  		<c:forEach items="${itemList}" var="item">
    		<tr data-gds-code="${item.gdsCode}">
     			<td><input type="checkbox" checked class="basket-check-input" autocomplete="off"></td>
      			<td class="basket-item-name"><img src="${item.gdsImgUrl}"><span>${item.gdsName}</span></td>
      			<td class="basket-price"><span><fmt:formatNumber value="${item.gdsPrice}"/></span>원</td>
      			<td class="basket-item-count"><input type="number" value="1" step="1" min="1" max="10" autocomplete="off"></td>
      			<td class="basket-price-sum"><span><fmt:formatNumber value="${item.gdsPrice}"/></span>원</td>
      			<td class="basket-delivery">4,000원</td>
      			<td class="basket-credit-divide">없음</td>
      			<td>
      				<button type="button" class="btn btn-danger btn-sm basket-order-btn ${(item.gdsSelYn==0) ? 'disabled' : ''} ">주문</button>
      				<button type="button" class="btn btn-light btn-sm basket-del-btn">삭제</button>
      			</td>
      			<td><button type="button" class="btn btn-light btn-sm basket-fav-btn">찜하기</button></td>
    		</tr>
   		</c:forEach>
   		
   		</tbody>
   		</table>
   	</c:when>
   
    <c:otherwise>
    	<table class="table table-bordered">
    		<tbody>
    			<tr><td>장바구니에 담긴 상품이 없습니다</td></tr>
    		</tbody>
    	</table>
    </c:otherwise>
    
</c:choose>
  

	<div>
		<table class="table table-bordered">
		<tbody>
		<tr>
    	<td style="width:5%"><input type="checkbox" checked class="basket-check-all" autocomplete="off"></td>
    	<td style="width:10%">전체선택</td>
    	<td style="width:65%">총 주문금액 :
    		<span class="basket-red"> (상품가격합계)
    			<span class="basket-total-price"></span>원 + (배송비) <span class="basket-total-delivery"></span>원 = <span class="basket-total-cost"></span>원
    		</span>
    	</td>
    	<td style="width:10%"><button type="button" class="btn btn-danger btn-sm basket-order-all-btn" >주문하기</button></td>
  		<td style="width:10%"><button type="button" class="btn btn-light btn-sm basket-del-all-btn" >삭제</button></td>
  		</tr>
  		</tbody>
  		</table>
    </div>

</div>

<link rel="stylesheet" href="/css/basket.css">

<script>
$(document).ready(function(){
	
	var emptyMsg = '<table class="table table-bordered"><tbody><tr><td>장바구니에 담긴 상품이 없습니다</td></tr></tbody></table>';
	var contextPath = "${path}";
	var userCode = ${user.userCode};
	var checkboxes = $("input[type='checkbox']");
	var priceObj = {};
	
	(function(){
		$("tr[data-gds-code]").each(function(){
			var itemCode = $(this).attr("data-gds-code");
			var itemPrice = parseInt($(this).find(".basket-price span").text().replace(/\,/g, ""));
			priceObj[itemCode] = {
					delivery: 4000,
					price: itemPrice,
					count: 1
			};
		});
		var costObj = changeTotalPrice();
		setPrice(costObj.totalPrice, costObj.totalDelivery, costObj.totalCost);
	})();
	
	function changeTotalPrice(){
		var totalPrice = 0;
		var totalDelivery = 0;
		for(idx in priceObj){
			totalPrice += (priceObj[idx].price*priceObj[idx].count);
			totalDelivery += priceObj[idx].delivery;
		}
	
		return {
			totalPrice: totalPrice, 
			totalDelivery: totalDelivery, 
			totalCost: totalPrice+totalDelivery
		};
	}
	function setPrice(totalPrice, totalDelivery, sum){
		$(".basket-total-price").html(transformCurrency(totalPrice));
		$(".basket-total-delivery").html(transformCurrency(totalDelivery));
		$(".basket-total-cost").html(transformCurrency(sum));
	}
	
	function transformCurrency(currency){
		return (currency).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")
	}

	$(".basket-item-count").on("change", "input", function(e){
		var itemCount = parseInt($(this).get(0).value);
		var tr = e.delegateTarget.parentElement;
		
		var price = priceObj[$(tr).attr("data-gds-code")].price;
		priceObj[$(tr).attr("data-gds-code")].count = itemCount; 
		
		$(tr).find(".basket-price-sum span").html(transformCurrency(price*itemCount));
		var costObj = changeTotalPrice();
		setPrice(costObj.totalPrice, costObj.totalDelivery, costObj.totalCost);
	});
		
	$(".basket-check-all").on("click", function(){
		if($(this).is( ":checked" )){
			checkboxes.prop("checked", true);
			var costObj = changeTotalPrice();
			setPrice(costObj.totalPrice, costObj.totalDelivery, costObj.totalCost);
		}else{
			checkboxes.prop("checked", false);
			setPrice(0,0,0);
		}
	});
	
	$(".basket-check-input").on("click", function(){
		
		var totalP = parseInt($(".basket-total-price").text().replace(/\,/g, ""));
		var totalD = parseInt($(".basket-total-delivery").text().replace(/\,/g, ""));
		var totalC = parseInt($(".basket-total-cost").text().replace(/\,/g, ""));
		
		var gdsCode = $(this).parent().parent().attr("data-gds-code");
		var priceSum = priceObj[gdsCode].count*priceObj[gdsCode].price;
		var cost = priceObj[gdsCode].delivery + priceSum;
		
		if($(this).is( ":checked" )){
			$(this).prop("checked", true);
			setPrice(totalP + priceSum, totalD + priceObj[gdsCode].delivery, totalC + cost);
	
		}else{
			$(this).prop("checked", false);
			setPrice(totalP - priceSum, totalD - priceObj[gdsCode].delivery, totalC - cost);
		}
	});
	
	$(".basket-fav-btn").on("click", function(){
		
		var row = $(this).parent().parent();
		
		$.ajax({
			type: "post",
			url: contextPath+"/user/basket/fav",
			headers: {
				"Content-type": "application/json",
			},
			dataType: "json",
			data: JSON.stringify({
				userCode: userCode,
				gdsCode: row.attr("data-gds-code")
			}),
			success: function(){
				var gdsCode = row.attr("data-gds-code");
				alert("찜리스트에 추가되었습니다.");
			},
			error: function(){
				alert("찜리스트에 추가할 수 없습니다.");
			}
		});
	});
	
	
	$(".basket-del-btn").on("click", function(){

		if(confirm("해당 상품을 삭제하시겠습니까?")){
			
			var row = $(this).parent().parent();
			
			$.ajax({
				type: "post",
				url: contextPath+"/user/basket",
				headers: {
					"Content-type": "application/json",
				},
				dataType: "json",
				data: JSON.stringify([{
					userCode: userCode,
					gdsCode: row.attr("data-gds-code")
				}]),
				success: function(){
					var gdsCode = row.attr("data-gds-code");
					row.remove();
					delete priceObj[gdsCode];
					var costObj = changeTotalPrice();
					setPrice(costObj.totalPrice, costObj.totalDelivery, costObj.totalCost);
					checkEmptyRow();
					alert("정상적으로 삭제되었습니다.");
				},
				error: function(){
					alert("삭제 할 수 없습니다.");
				}
			});
		}
	});
	
	function findCheckedItems(){
		var checkedList = [];
		
		$(".basket-check-input").each(function(){
			if($(this).is( ":checked" )){
				var gdsCode = parseInt($(this).parent().parent().attr("data-gds-code"));
				var temp = {
					userCode: userCode,
					gdsCode: gdsCode
				};
				checkedList.push(temp);
			}
		});
		return checkedList;
	}
	
	function checkEmptyRow(){
		console.log($("tr[data-gds-code]").length);
		if($("tr[data-gds-code]").length === 0){
			$("#basket-item-list").html(emptyMsg);
		}
	}
	
	$(".basket-del-all-btn").on("click", function(){
		
		if(confirm("선택한 상품들을 삭제하시겠습니까?")){
			var postList = findCheckedItems();
			$.ajax({
				type: "post",
				url: contextPath+"/user/basket",
				headers: {
					"Content-type": "application/json",
				},
				dataType: "json",
				data: JSON.stringify(postList),
				success: function(){
					$("tr[data-gds-code]").each(function(){
						if($(this).find("td input[type='checkbox']").is(":checked")){
							console.log($(this));
							$(this).remove();
							delete priceObj[$(this).attr("data-gds-code")];
						}
					});

					var costObj = changeTotalPrice();
					setPrice(costObj.totalPrice, costObj.totalDelivery, costObj.totalCost);
					checkEmptyRow();
					
					alert("정상적으로 삭제되었습니다.");
				},
				error: function(){
					alert("삭제 할 수 없습니다.");
				}
			});
		}
	});
});
</script>