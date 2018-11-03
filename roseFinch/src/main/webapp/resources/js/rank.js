function setGoodsList(goodsList) {
	var parent = $(".goods-list");
	var html = "";
	
	for(var i=0; i<goodsList.length; i++) {
		html += 
		"<li class=\"col-md-3\">"+
			"<div class=\"goods card\">"+
				"<div class=\"card-img-box\">"+
					"<a href=\"/goods/goodsView/" + goodsList[i].code + "\" class=\"card-img\">"+
						"<div class=\"rank-flag\">"+
							"<span>" + (i + 1) + "</span>"+
						"</div>"+
						"<img class=\"card-img-top\" src=\"/img/" + goodsList[i].imgUrl + "\" alt=\"Card image cap\">"+
					"</a>"+
				"</div>"+
				"<div class=\"card-body\">"+
					"<div class=\"title\">"+
						"<a href=\"/goods/goodsView/" + goodsList[i].code + "\">"+
							"<h5>";
							if(goodsList[i].company != null) {
								html += "<span class=\"text-company\">[" + goodsList[i].company + "]&nbsp</span>";
							}
							 html+= goodsList[i].name + "</h5>"+
						"</a>"+
						"</div>"+
					"<div class=\"more-info\">"+
						"카테고리 : " + goodsList[i].categoryName + "<br>"+
						"등록일 :" + goodsList[i].startDate+
						"<br>"+
					"</div>"+
					"<div>"+
					 	"<strong>" + goodsList[i].price + "</strong>"+
					"</div>"+
					"<div>"+
						"<span>판매자 : </span>"+
						"<span>" + goodsList[i].sellerName + "</span>"+
					"</div>"+
				"</div>"+
			"</div>"+
		"</li>";
	}
	
	parent.html(html);
}

function ajaxRankGoodsList(topic, catCode) {
	$.ajax({
		url:"/goods/ajax/rankGoodsList",
		async:false,
		dataType:"json",
		type:"get",
		data:{topic : topic, catCode : catCode},
		success:function(data) {
			if(data.length == 0) {
				$(".container .content .no-result").show();
				$(".container .content .goods-list").hide();
			} else {
				$(".container .content .no-result").hide();
				$(".container .content .goods-list").show();
				setGoodsList(data);
			}
		}
	});
}
