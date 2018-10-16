$(document).ready(function() {
	var ogGoodsList = $(".goods-list > ul > li");
	var ogCategories = $(".category");
	var curGoodsList = ogGoodsList;
	
	var keyword = decodeURIComponent(getUrlVars()["keyword"]);
	var selectCategory = 1;
	var selectCompany = [];
	var selectPriceRange = [];

	ajaxGoodsCode();
	ajaxCategoryCode(selectCategory);
	
	function ajaxGoodsCode() {
		$.ajax({
			async: false,
			url:"/goods/ajax/goodsListFilter",
			dataType:"json",
			type:"get",
			data:{
				keyword:keyword, 
				catCode:selectCategory,
				company:selectCompany,
				priceRange:selectPriceRange
			},
			success:function(data) {
				filterGoods(data);
			},
		});
	}
	
	function ajaxCategoryCode(code) {
		var isSuccess;
		
		$.ajax({
			async: false,
			url:"/category/ajax/categoryFilter",
			dataType:"json",
			type:"get",
			data: {
				keyword:keyword,
				catCode:code
			},
			success:function(data) {
				if(data.length > 0) {
					filterCategory(data);
					isSuccess = true;
				} else {
					isSuccess = false;
				}
			},
		});
		
		return isSuccess;
	}
	
	// 카테고리 목록을 클릭한 카테고리의 하위 카테고리들로 변경
	function filterCategory(arrCategory) {
		var curCategories = ogCategories.filter(function() {
			var data = $(this).data("filterValue");
			return arrCategory.find(o => o.catCode == data);
		});
		curCategories.removeClass("on");
		$("#category-list").html(curCategories);
	}
	
	// 카테고리경로에 카테고리 추가
	function appendSummaryCategoryBack(name, value, text) {
		var child = '<span>>&nbsp;</span>' +
		'<a href="#" class="category-back" ' +
		'data-filter-name="' + name + '" ' +
		'data-filter-value="' + value + '">' +
		text + '</a>';
		$("#summaryCategoryBack").append(child);
		
		if(selectCategory == 1) {
			$("#summaryCategoryBack").hide();
		} else {
			$("#summaryCategoryBack").show();
		}
	}
	
	// 특정 카테고리에 포함되는 검색 결과들로만 변경
	function filterGoods(arrGoods) {
		curGoodsList = ogGoodsList.filter(function() {
			var data = $(this).data("code");
			return arrGoods.find(o => o.code == data);
		});
		
		if(curGoodsList.length == 0) {
			$(".noResult").show();
			$("#contentArea").hide();
		} else {
			$(".noResult").hide();
			$("#contentArea").show();
			
			$(".search-result span").text(curGoodsList.length); // 조회된 검색 결과 개수 수정
			$(".goods-list ul").html(curGoodsList);
			$(".img-view-btn").trigger("click");
			paging();
		}
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
	
	// 카테고리경로에 있는 카테고리 클릭 시 이벤트
	$(document).on("click", ".category-back", function() {
		var filterName = $(this).data("filterName");
		var filterValue = $(this).data("filterValue");
		var filterText = $(this).text();

		selectCategory = filterValue;
		ajaxGoodsCode();
		
		var isSuccessGetCategoryFilter = ajaxCategoryCode(filterValue);
		if(isSuccessGetCategoryFilter) {
			appendSummaryCategoryBack(filterName, filterValue, filterText);
		}
		
		if(selectCategory == 1) {
			$("#selectedFilterArea li").children().filter(function() {return $(this).data("filterName") == "cat-code";}).remove();
		}
		appendSelectedFilter(filterName, filterValue, filterText);
		
		$(this).nextAll().remove();
		return false;
	});
	
	// 카테고리 클릭 시 이벤트
	$(document).on("click", ".category", function() {
		var filterName = $(this).data("filterName");
		var filterValue = $(this).data("filterValue");
		var filterText = $(this).text();

		selectCategory = filterValue;
		ajaxGoodsCode();
		
		var isSuccessGetCategoryFilter = ajaxCategoryCode(filterValue);
		if(isSuccessGetCategoryFilter) {
			appendSummaryCategoryBack(filterName, filterValue, filterText);
		} else {
			$(this).addClass("on");
		}
		
		appendSelectedFilter(filterName, filterValue, filterText);
		return false;
	});
	
	// 브랜드 클릭 시 이벤트
	$(".company").on("click", function() {
		var filterName = $(this).data("filterName");
		var filterValue = $(this).data("filterValue");
		var filterText = $(this).text();
		
		if($(this).hasClass("on")) {
			$(this).removeClass("on");
			selectCompany = selectCompany.filter(function(item) {
				return item != filterValue;
			});
		} else {
			$(this).addClass("on");
			selectCompany.push(filterValue);
		}
		
		ajaxGoodsCode();
		appendSelectedFilter(filterName, filterValue, filterText);
		return false;
	});
	
	// 가격 범위 검색 버튼 클릭 시 이벤트
	$(".range-input-btn").on("click", function() {
		var maxPrice = $("#max-price").val() || 0;
		var minPrice = $("#min-price").val() || 0;

		if(maxPrice == 0 || minPrice == 0) {
			alert("가격을 입력해 주세요.");
		} else {
			selectPriceRange[0] = minPrice;
			selectPriceRange[1] = maxPrice;
		}
		
		ajaxGoodsCode();
		appendSelectedFilter("priceRange", "", minPrice + "원 ~ " + maxPrice + "원");
		return false;
	});
	
	// 적용중인 검색결과필터를 클릭 시 이벤트
	$(document).on("click", "#selectedFilterArea a", function() {
		if($(this).hasClass("resetFilter")) {
			location.reload();
		}
			
		var filterName = $(this).data("filterName");
		var filterValue = $(this).data("filterValue");
		var filterText = $(this).text();
			
		if(filterName == "cat-code") {
			$(".category-back").first().trigger("click");
		} else if(filterName == "priceRange") {
			selectPriceRange = [];
			$(".price-range input").val("");
			ajaxGoodsCode();
		} else {
			$(".company").filter(function() {return $(this).data("filterValue") == filterValue;}).trigger("click");
		}
			
		$(this).remove();
		
		return false;
	});

	// 선택한 필터 옵션 추가
	function appendSelectedFilter(filterName, filterValue, filterText) {
		var $selectedFilterArea = $("#selectedFilterArea li");
		var child = '<a href="#" class="filter ' + filterName + '" ' + 
			'data-filter-name="' + filterName + '" ' +
			'data-filter-value="' + filterValue + '">' + 
			filterText + 
			'<span class="fas fa-ban"></span>' +
			'</a>';
		
		if(filterName == "cat-code") {
			if(selectCategory != 1) {
				$selectedFilterArea.children().filter(function() {return $(this).data("filterName") == filterName;}).remove();
				$selectedFilterArea.append(child);
			}
		} else if(filterName == "priceRange") {
			$selectedFilterArea.children().filter(function() {return $(this).data("filterName") == filterName;}).remove();
			$selectedFilterArea.append(child);
		} else {
			var result = $selectedFilterArea.children().filter(function() {return $(this).data("filterValue") == filterValue;});

			if(result.length > 0) {
				result.remove();
			} else {
				$selectedFilterArea.append(child);
			}
		}
		
		if($("#selectedFilterArea li a").length == 1) {
			$("#selectedFilterArea").hide();
		} else {
			$("#selectedFilterArea").show();
		}
	}
	
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
		$(".goods-list .card").addClass("list");
		$(".goods-list .card .card-img-box").addClass("list-img-box");
		$(".goods-list .card .card-img-box .card-img").addClass("list-img");
		$(".goods-list .card .card-img-box .card-img .card-img-top").addClass("list-img-top");
		$(".goods-list .card .card-body").addClass("list-body");
		$(".goods-list .card .card-body .card-title").addClass("list-title");

		$(".goods-list .card .card-body .card-title").removeClass("card-title");
		$(".goods-list .card .card-body").removeClass("card-body");
		$(".goods-list .card .card-img-box .card-img .card-img-top").removeClass("card-img-top");
		$(".goods-list .card .card-img-box .card-img").removeClass("card-img");
		$(".goods-list .card .card-img-box").removeClass("card-img-box");
		$(".goods-list .card").removeClass("card");
		$(".goods-list").removeClass("img-view-type");
		return false;
	});
	
	// 검색 결과 뷰 모드를 리스트형 -> 이미지형으로 전환
	$(".img-view-btn").on("click", function() {
		$(".goods-list ul").addClass("row");
		$(".goods-list ul li").addClass("col-md-3");
		
		$(".goods-list").addClass("img-view-type");
		$(".goods-list .list").addClass("card");
		$(".goods-list .list .list-img-box").addClass("card-img-box");
		$(".goods-list .list .list-img-box .list-img").addClass("card-img");
		$(".goods-list .list .list-img-box .list-img .list-img-top").addClass("card-img-top");
		$(".goods-list .list .list-body").addClass("card-body");
		$(".goods-list .list .list-body .list-title").addClass("card-title");

		$(".goods-list .list .list-body .list-title").removeClass("list-title");
		$(".goods-list .list .list-body").removeClass("list-body");
		$(".goods-list .list .list-img-box .list-img .list-img-top").removeClass("list-img-top");
		$(".goods-list .list .list-img-box .list-img").removeClass("list-img");
		$(".goods-list .list .list-img-box").removeClass("list-img-box");
		$(".goods-list .list").removeClass("list");
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