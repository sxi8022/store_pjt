$(document).ready(function() {
	var ogGoodsList = $(".goods");
	var curGoodsList = ogGoodsList;
	var goodsList = $(".goods");	// 검색 또는 필터링 적용된 상품리스트
	paging();
	
	// 카테고리로 상품리스트 필터
	$(".word").on("click", function() {
		var filterName = $(this).data("filterName");	// 필터적용된 상품을 저장하고
		var filterValue = $(this).data("filterValue");

		curGoodsList = ogGoodsList.filter(function() {
			if(filterName == "cat-id") {
				return $(this).data("categoryCode") == filterValue;
			}
			if(filterName == "company") {
				return $(this).data("company") == filterValue;
			}
		});

		$(".search-result span").text(curGoodsList.length); // 조회된 상품 개수 수정해주고
		$(".goods-list ul").html(curGoodsList);
		$(".img-view-btn").trigger("click");
		paging();	// curGoodsList 범위의 페이징 갱신
	});
	
	// 가격으로 상품리스트 필터
	$(".range-input-btn").on("click", function() {
		var maxPrice = $("#max-price").val() || 0;
		var minPrice = $("#min-price").val() || 0;
			
		if(maxPrice == 0 || minPrice == 0) {
			alert("가격을 입력해 주세요.");
		} else {
			curGoodsList = ogGoodsList.filter(function() {
				var compare = $(this).data("price");
				return compare >= minPrice && compare <= maxPrice;
			});
			
			$(".search-result span").text(curGoodsList.length);
			$(".goods-list ul").html(curGoodsList);
			$(".img-view-btn").trigger("click");
			paging();
		}
	});

	
	$(".data-sort a").on("click", function() {
		var filterName = $(this).data("filterName");
		var filterValue = $(this).data("filterValue");
		
		curGoodsList.sort(function(a, b) {
			if(filterValue == "price-asc") {
				return $(a).data("price") - $(b).data("price");
			}
			if(filterValue == "price-desc") {
				return $(b).data("price") - $(a).data("price");
			}
			if(filterValue == "code-desc") {
				return $(b).data("code") - $(a).data("code");
			}
		});

		$(".goods-list ul").html(curGoodsList);
		paging();
	});
	
	$(".list-view-btn").on("click", function() {
		$(".goods-list ul").removeClass("row");
		$(".goods-list ul li").removeClass("col-md-3");
		
		$(".goods-list").addClass("list-view-type");
		$(".goods-list .goods .card").addClass("list");
		$(".goods-list .goods .card .card-img-box").addClass("list-img-box");
		$(".goods-list .goods .card .card-img-box .card-img").addClass("list-img");
		$(".goods-list .goods .card .card-img-box .card-img .card-img-top").addClass("list-img-top");
		$(".goods-list .goods .card .card-body").addClass("list-body");
		$(".goods-list .goods .card .card-body .card-title").addClass("list-title");

		$(".goods-list .goods .card .card-body .card-title").removeClass("card-title");
		$(".goods-list .goods .card .card-body").removeClass("card-body");
		$(".goods-list .goods .card .card-img-box .card-img .card-img-top").removeClass("card-img-top");
		$(".goods-list .goods .card .card-img-box .card-img").removeClass("card-img");
		$(".goods-list .goods .card .card-img-box").removeClass("card-img-box");
		$(".goods-list .goods .card").removeClass("card");
		$(".goods-list").removeClass("img-view-type");
	});
	
	$(".img-view-btn").on("click", function() {
		$(".goods-list ul").addClass("row");
		$(".goods-list ul li").addClass("col-md-3");
		
		$(".goods-list").addClass("img-view-type");
		$(".goods-list .goods .list").addClass("card");
		$(".goods-list .goods .list .list-img-box").addClass("card-img-box");
		$(".goods-list .goods .list .list-img-box .list-img").addClass("card-img");
		$(".goods-list .goods .list .list-img-box .list-img .list-img-top").addClass("card-img-top");
		$(".goods-list .goods .list .list-body").addClass("card-body");
		$(".goods-list .goods .list .list-body .list-title").addClass("card-title");

		$(".goods-list .goods .list .list-body .list-title").removeClass("list-title");
		$(".goods-list .goods .list .list-body").removeClass("list-body");
		$(".goods-list .goods .list .list-img-box .list-img .list-img-top").removeClass("list-img-top");
		$(".goods-list .goods .list .list-img-box .list-img").removeClass("list-img");
		$(".goods-list .goods .list .list-img-box").removeClass("list-img-box");
		$(".goods-list .goods .list").removeClass("list");
		$(".goods-list").removeClass("list-view-type");
	});
		
	function getUrlVars() {
		var vars = [], hash;
	    var hashes = window.location.href.slice(window.location.href.indexOf('?') + 1).split('&');
	    for(var i = 0; i < hashes.length; i++) {
	        hash = hashes[i].split('=');
	        vars.push(hash[0]);
	        vars[hash[0]] = hash[1];
	    }
	    return vars;
	}
	
	function paging() {
		$(".goods-list").each(function() {
			var page = getUrlVars()["page"] || 1;			
			
			var totalCount = curGoodsList.length;

			var countList = 48;
			var countPage = 3;
			
			var totalPage = totalCount / countList;
			if(totalCount % countList != 0) { totalPage++; }
			
			if(totalPage < page) { page = totalPage; }
						
			var $list = $(this);
			var $pager = $("<ul class='pagination pagination-lg justify-content-center'></ul>");
			if($(".pagination").length) {  $(".pagination").remove(); }
			
			// if(iCount == page)	   ==> page색 강조 
			// if(startPage > 1) 	   ==> [처음] 
			// if(page > 1) 		   ==> [이전] 
			// for(int iCount = startPage; iCount<=endPage; iCount++) ==> [1, 2, 3, 4 ,5] 
			// if(page < totalPage)    ==> [다음] 
			// if(endPage < totalPage) ==> [맨끝] 
			$list.unbind('repaginate').bind('repaginate', function(e) {
				curGoodsList.hide().slice((page-1) * countList, page * countList).show();
				$pager.html("");
				
				var startPage = parseInt((page - 1) / countPage) * countPage + 1;
				var endPage = startPage + countPage - 1;
				if(endPage > totalPage) { endPage = totalPage; }
				
				// [이전]
				if(startPage > 1) {
				    $('<li class="page-item"></li>').html("<a class='page-link' href='#'><span aria-hidden='true'>&laquo;</span><span class='sr-only'>Previous</span></a>")
				    .bind('click', {newPage: startPage - countPage},function(event) {
				    	page = event.data['newPage'];
				    	$list.trigger('repaginate');
				    }).appendTo($pager);
				}
				
				// [1,2,3,4,5]
			    for (var p = startPage; p<=endPage; p++) {
			    	var active = "";
			    	if(page == p) { active = "active"; }
				    $('<li class="page-item ' +  active + '"></li>').html("<a class='page-link' href='#'>" + p + "</a>").bind('click', {newPage: p}, function(event) {
				    	page = event.data['newPage'];
				    	$list.trigger('repaginate');
				    }).appendTo($pager);
			    }
				
				// [다음]
			    if(startPage + countPage <= totalPage) {
			    	$('<li class="page-item"></li>').html("<a class='page-link' href='#'><span aria-hidden='true'>&raquo;</span><span class='sr-only'>Next</span></a>")
			    	.bind('click', {newPage: startPage + countPage},function(event) {
			    		page = event.data['newPage'];
			    		$list.trigger('repaginate');
			    	}).appendTo($pager);
			    }
			    
			});
		
			$(".pagination-container").append($pager);
			$list.trigger('repaginate');
			
		});
	}
});