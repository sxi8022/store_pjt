$(document).ready(function() {
	$(".opt-tit").on("click", function() {
		$(".opt").removeClass("open");
		$(this).parent().siblings(".opt").children(".opt-items").hide();
		
		$(this).parent().toggleClass("open");
		$(this).siblings(".opt-items").toggle();
		return false;
	});
	
	$(".pur-btn").on("click", function() {
		if($(".tot-price span").text() == 0) {
			alert("상품을 선택해주세요");
			return false;
		}
		
		/***************************************/
		// 선택한상품들을데이터로 JSON생성
		var ordInfoJson = new Object();
		ordInfoJson.gdsTitle = $(".deal-gdsname").data("gdsname");
		
		var optJsonArray = new Array();
		$(".cart-item").each(function() {
			var itemInfoJson = new Object();
			var $item = $(this).children(".item-tit");
			itemInfoJson.optCode = $item.data("optcode");
			itemInfoJson.optName = $item.data("optname");
			itemInfoJson.optPrice = $item.data("optprice");
			itemInfoJson.optCnt = $(this).find(".cnt").val();
			itemInfoJson.rsltPrice = $(this).find(".rsltprice").data("rsltprice");
			optJsonArray.push(itemInfoJson);
		});
		ordInfoJson.ordlist = optJsonArray;
		
		ordInfoJson.gdsDev = $(".deal-delivery .deal-info-value").data("gdsdev");
		ordInfoJson.selName = $(".deal-selname").data("selname");
		
		var finalJsonData = JSON.stringify(ordInfoJson);
		/***************************************/
		var $form = $("<form></form>");
		$form.attr("action", "/order");
		$form.attr("method", "post");
		$form.appendTo("body");
		
		var tmpordlist = $("<input type='hidden' name='tmpordlist' value='" + finalJsonData + "'/>");
		$form.append(tmpordlist);
		$form.submit();
		/***************************************/
		
		return false;
	});
	
	$(".opt-link").on("click", function() {
		$(".opt").removeClass("open");
		$(".opt").children(".opt-items").hide();
		
		createCartItem($(this).data("optcode"));
		return false;
	});
	
	function createCartItem(optCode) {
		$.ajax({
			url:"/goodsView/create/cartItem",
			async:false,
			dataType:"html",
			type:"get",
			data: {
				optCode : optCode
			},
			success:function(data) {
				$(".deal-prch-cart").append(data);
				calcTotPrice();
			}
		});
	};
	
	$(document).on("click", ".up-btn", function() {
		var $cnt = $(this).siblings(".cnt");
		$cnt.val(parseInt($cnt.val()) + 1);
		validateCnt($cnt);
		
		var $price = $(this).parent().siblings(".item-price").children(".rsltprice");
		var rsltprice = $cnt.val() * $price.data("price");
		$price.html(rsltprice + "<span>원</span>");
		$price.attr("data-rsltprice", rsltprice);		
		
		calcTotPrice();
	});
	
	$(document).on("click", ".down-btn", function() {
		var $cnt = $(this).siblings(".cnt");
		$cnt.val(parseInt($cnt.val()) - 1);
		validateCnt($cnt);
		
		var $price = $(this).parent().siblings(".item-price").children(".rsltprice");
		var rsltprice = $cnt.val() * $price.data("price"); 
		$price.html(rsltprice + "<span>원</span>");
		$price.attr("data-rsltprice", rsltprice);
		
		calcTotPrice();
	});
	
	function calcTotPrice() {
		var totPrice = 0; 
		$(".cart-item").each(function(i, element) {
			totPrice += parseInt($(element).find(".rsltprice").attr("data-rsltprice"));
		});
		$(".tot-price").html("<span>" + totPrice + "</span>원");
	}
	
	function validateCnt($cnt) {
		if($cnt.val() == $cnt.data("maxcnt")) {
			$cnt.siblings(".up-btn").attr("disabled", "disabled");
		}
		if($cnt.val() != $cnt.data("maxcnt")) {
			$cnt.siblings(".up-btn").removeAttr("disabled");
		}
		if($cnt.val() == 1) {
			$cnt.siblings(".down-btn").attr("disabled", "disabled");
		}
		if($cnt.val() != 1) {
			$cnt.siblings(".down-btn").removeAttr("disabled");
		}
	}
	
	$(document).on("click", ".close-btn", function() {
		$(this).closest(".cart-item").remove();
		calcTotPrice();
	});
});