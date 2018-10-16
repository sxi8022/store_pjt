function setGoodsList(goodsList) {
	var parent = $(".goods-list");
	var html = "";
	
	for(var i=0; i<goodsList.length; i++) {
		html += "<li class=\"col-md-3\">";
		html += "<div class=\"goods card\">";
		html += "<div class=\"card-img-box\">";
		html += "<a href=\"/goods/goods-view?gdsCode=" + goodsList[i].categoryCode + "\" class=\"card-img\">";
		html += "<div class=\"rank-flag\">";
		html += "<span>" + (i + 1) + "</span>";
		html += "</div>"
		html += "<img class=\"card-img-top\" src=\"/img/" + goodsList[i].imgUrl + "\" alt=\"Card image cap\">";
		html +=	"</a>";
		html += "</div>";
		html +=	"<div class=\"card-body\">"
		html +=	"<div>";
		html += "<a href=\"/goods/goods-view?gdsCode=" + goodsList[i].categoryCode + "\">";
		html +=	"<h5 class=\"text-title\">";
		if(goodsList[i].company != null)
		html += "<span class=\"text-company\">[" + goodsList[i].company + "]&nbsp;</span>"
		html += goodsList[i].name + "</h5>";
		html +=	"</a>";
		html +=	"</div>";
		html += "<div class=\"more-info\">";
		html += "카테고리 : " + goodsList[i].categoryName + "<br>";
		html +=	"등록일 :" + goodsList[i].startDate;
		html +=	"<br>";
		html +=	"</div>";
		html +=	"<div>";
		html +=	"<strong>" + goodsList[i].price + "</strong>";
		html +=	"</div>";
		html +=	"<div>";
		html +=	"<span>판매자 : </span>";
		html +=	"<span>" + goodsList[i].sellerName + "</span>";
		html +=	"</div>";
		html +=	"</div>";
		html +=	"</div>";
		html +=	"</li>";
	}
	
	parent.html(html);
}

function ajaxNewGoodsList(catCode) {
	$.ajax({
		url:"/goods/ajax/newGoodsList",
		async:false,
		dataType:"json",
		type:"get",
		data:{catCode : catCode},
		success:function(data) {
			setGoodsList(data);
		}
	});
}

/*$(document).ready(function() {
	ajaxNewGoodsList(1); // 1: 카테고리(전체목록) 코드번호
	$(".category a").on("click", function() {
		var catCode = $(this).data("code");
		ajaxNewGoodsList(catCode);
	});
});*/