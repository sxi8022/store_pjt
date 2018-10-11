$(document).ready(function() {
	var ogGoodsList = $(".goods");
	var ogCategories = $(".category");
	var curGoodsList = ogGoodsList;
	
	var vars = getUrlVars();
	var keyword = decodeURIComponent(vars["keyword"]);
	var selectCategory = 1;
	var selectBrand = [];
	var selectPriceRange = [];

	ajax(selectCategory);
	
	function ajax(code) {
		$.ajax({
			url:"/goods/ajax",
			dataType:"json",
			type:"get",
			data:{"keyword":keyword, "catCode":code},
			success:function(data) {
				var arrGoods = data.arrGoods;
				var arrCategory = data.arrCategory;
				if(arrCategory[0] == null) {
					selectCategory = -1;
				} else {
					filterCategory(arrCategory);
					filterGoods(arrGoods);
					selectCategory = code;
				}
				console.log("ajax()에서 selectCategory 값 : " + selectCategory);
			}
		});
	}
	
	// 특정 카테고리의 하위 카테고리들로 변경
	function filterCategory(arrCategory) {
		var curCategories = ogCategories.filter(function() {
			var data = $(this).data("filterValue");
			return arrCategory.find(o => o.catCode == data)
		});
		$("#categorySummaryFilterArea").html(curCategories);
	}
	
	// 특정 카테고리에 포함되는 검색 결과들로만 변경
	function filterGoods(arrGoods) {
		curGoodsList = ogGoodsList.filter(function() {
			var data = $(this).data("code");
			return arrGoods.find(o => o.code == data);
		});
		$(".search-result span").text(curGoodsList.length); // 조회된 검색 결과 개수 수정
		$(".goods-list ul").html(curGoodsList);
		$(".img-view-btn").trigger("click");
		paging();
	}

	
	// 쿼리스트링 파싱
	function getUrlVars() {
		var vars = [], hash;
	    var hashes = window.location.href.slice(window.location.href.indexOf('?') + 1).split('&');
	    for(var i = 0; i < hashes.length; i++) {
	        hash = hashes[i].split("=");
	        vars.push(hash[0]);
	        vars[hash[0]] = hash[1];
	    }
	    return vars;
	}
		
	// 선택한 필터 옵션 추가
	function appendSelectedFilter(filterName, filterValue, filterText) {
		var $selectedFilterArea = $("#selectedFilterArea");
		var child = '<a href="#" class="' + filterName + '" ' + 
			'data-filter-name="' + filterName + '" ' +
			'data-filter-value="' + filterValue + '">' + 
			filterText + 
			'<span class="fas fa-ban"></span>' +
			'</a>';
		
		$selectedFilterArea.children(".cat-code").remove();
		$selectedFilterArea.append(child);
	}
	
	// 진입한 카테고리 경로 클릭 시 이벤트
	$(document).on("click", ".category-back", function() {
		$(this).parent().nextAll().remove();
		var code = $(this).data("filterValue");
		ajax(code);
		return false;
	});
	
	// 카테고리 클릭 시 이벤트
	$(document).on("click", ".category", function() {
		var code = $(this).data("filterValue");
		console.log("ajax() 호출 전 selectCategory 값 : " + selectCategory);
		ajax(code);
		console.log("ajax() 호출 후 selectCategory 값 : " + selectCategory);
		
		if(selectCategory != -1) {
			var filterName = $(this).data("filterName");
			var filterValue = $(this).data("filterValue");
			var filterText = $(this).text();
			var child = '<li><span>>&nbsp;</span>' +
				'<a href="#" class="category-back" ' +
				'data-filter-name="' + filterName + '" ' +
				'data-filter-value="' + filterValue + '">' +
				filterText + 
				'</a></li>';
			
			$(".finderword ul").append(child);
			appendSelectedFilter(filterName, filterValue, filterText);
		}
		return false;
	});
	
	// 브랜드 클릭 시 이벤트
	$(".brand").on("click", function() {
		return false;
	});
	
	// 가격 범위 검색 버튼 클릭 시 이벤트
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
		return false;
	});

	// 검색 결과 정렬
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
		return false;
	});
	
	// 검색 결과 뷰 모드를 이미지형 -> 리스트형으로 전환
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
		return false;
	});
	
	// 검색 결과 뷰 모드를 리스트형 -> 이미지형으로 전환
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
		return false;
	});
		
	// 검색 결과 페이징
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