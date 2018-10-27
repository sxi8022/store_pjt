$(document).ready(function() {
	var keyword = decodeURIComponent(getUrlVars()["keyword"] || "");
	var selectCategory = decodeURIComponent(getUrlVars()["catCode"] || 0);
	var selectCompany = [];
	var selectPriceRange = [];

	searchInit();
	
	function searchFilterGoods(keyword, category, company, priceRange) {
		console.log(category, company, priceRange);
		$.ajax ({
			url:"/search/filter/goods",
			async:false,
			dataType:"html",
			type:"get",
			data:{
				keyword : keyword,
				catCode : selectCategory,
				company : company,
				priceRange : priceRange
			},
			success:function(response) {
				$(".content-area").html(response);
			}
		});
		paging();
	}
	
	function searchFilterCategory(keyword, selectCategory) {
		$.ajax ({
			url:"/search/filter/category",
			async:false,
			dataType:"html",
			type:"get",
			data:{
				keyword : keyword,
				catCode : selectCategory
			},
			success:function(response) {
				$(".category-filter").html(response);
			}
		});
	}
	
	function searchFilterCompany(selectCategory) {
		$.ajax ({
			url:"/search/filter/company",
			async:false,
			dataType:"html",
			type:"get",
			data:{
				catCode : selectCategory
			},
			success:function(response) {
				$(".company-box").html(response);
			}
		});
	}
	
	$(document).on("click", ".category, .category-path", function() {
		var filterName = $(this).data("filterName");
		var filterValue = $(this).data("filterValue");
		var title = $(this).attr("title");
		console.log("33333333333333");
		selectCategory = filterValue;
		searchFilterCategory(keyword, selectCategory);
		
		// 클릭한 카테고리가 "전체보기"가 아니라면 selected-filter-box에 추가
		if(filterValue != 0) {
			addSelectedFilter(filterName, filterValue, title);
			$(".category-path-box").show();
			$(".selected-filter-box").parent().parent().show();
		} else {
			$(".category-path-box").hide();
			$(".selected-filter-box .selected-filter").filter(function() {return $(this).data("filter-name") == filterName;}).remove();
			$(".selected-filter-box").parent().parent().hide();
		}
		
		// /search/category는 카테고리 검색이기 때문에 
		// "검색의 중점"이 되는 카테고리에 따라 브랜드를 새로 갱신함
		if($(location).attr("pathname") == "/search/category") {
			searchFilterCompany(selectCategory);
			$(".selected-filter-box .selected-filter").filter(function() {
				return $(this).data("filterName") == "company";
			}).remove();
			selectCompany = [];
		}
		
		searchFilterGoods(keyword, selectCategory, selectCompany, selectPriceRange);
		return false;
	});
	
	$(document).on("click", ".price-range-btn", function() {
		var maxPrice = $("#max-price").val() || 0
		var minPrice = $("#min-price").val() || 0
		
		if(maxPrice == 0 || minPrice == 0) {
			alert("가격을 입력해 주세요.");
		} else {
			selectPriceRange[0] = minPrice;
			selectPriceRange[1] = maxPrice;
			addSelectedFilter("price-range", "", minPrice + "원 ~ " + maxPrice + "원");
			$(".selected-filter-box").parent().parent().show();
			searchFilterGoods(keyword, selectCategory, selectCompany, selectPriceRange);
		}
		
		return false;
	});
	
	$(document).on("click", ".company", function() {
		var filterName = $(this).data("filterName");
		var filterValue = $(this).data("filterValue");
		var title = $(this).attr("title");
		
		if($(this).hasClass("on")) {
			$(".selected-filter-box .selected-filter").filter(function() {
				return $(this).data("filterValue") == filterValue;
			}).trigger("click");
		} else {
			selectCompany.push(filterValue);
			$(this).addClass("on")
			addSelectedFilter(filterName, filterValue, title);
			$(".selected-filter-box").parent().parent().show();
		}

		searchFilterGoods(keyword, selectCategory, selectCompany, selectPriceRange);
		return false;
	});
	
	$(document).on("click", ".reset-selected-filter", function() {
		location.reload();
		return false;
	});
	
	$(document).on("click", ".selected-filter", function() {
		var filterName = $(this).data("filterName"); 
		var filterValue = $(this).data("filterValue");
		var title = $(this).attr("title");
		
		if(filterName == "cat-code") {
			selectCategory = 0;
			searchFilterCategory(keyword, selectCategory);
			
			// "검색의 중점"이 되는 카테고리에 따라 브랜드를 새로 갱신함
			if($(location).attr("pathname") == "/search/category") {
				searchFilterCompany(selectCategory);
				selectCompany = [];
			}
		
			$(".category-path-box").hide();
		}
		
		if(filterName == "price-range") {
			selectPriceRange = [];
		}

		if(filterName == "company") {
			selectCompany = selectCompany.filter(function(item) {return item != filterValue;});
			$(".company-box .company").filter(function() {
				return $(this).data("filterValue") == filterValue;
			}).removeClass("on");
		}
		
		$(this).remove();
		
		// selected-filter가 0이면 selected-filter-box hide
		if($(".selected-filter-box .selected-filter").length == 0) {
			$(".selected-filter-box").parent().parent().hide();
		}
		searchFilterGoods(keyword, selectCategory, selectCompany, selectPriceRange);
	});
	
	function addSelectedFilter(filterName, filterValue, title) {
		var html = "<a " +
					"class=\"selected-filter filter-link\"" +
					"data-filter-name=\"" + filterName + "\"" +
					"data-filter-value=\"" + filterValue + "\"" +
					"title=\"" + title + "\">" +
					title +
					"<span class=\"fas fa-ban\"></span>" +
					"</a>";
		
		if(filterName == "cat-code" || filterName == "price-range") {
			$(".selected-filter-box").children().filter(function() {return $(this).data("filterName") == filterName;}).remove();
		}
		$(".selected-filter-box").append(html);
	}
	
	
	// 검색 결과 정렬
	$(document).on("click", ".data-sort a", function() {
		var filterName = $(this).data("filterName");
		var filterValue = $(this).data("filterValue");
		
		var result = $(".goods-list > ul > li").sort(function(a, b) {
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

		$(".goods-list ul").html(result);
		paging();
		return false;
	});
	
	// 검색 결과 뷰 모드를 이미지형 -> 리스트형으로 전환
	$(document).on("click", ".list-view-btn", function() {
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
	$(document).on("click", ".img-view-btn", function() {
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
});

/* 쿼리스트링 파싱 */
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

/* /search/** 페이지 초기화 */
function searchInit() {
	if($(location).attr("pathname") == "/search/category") {
		$(".category-path-box").show();		
		
		var catCode = getUrlVars()["catCode"];
		$(".category-path").filter(function() {
			return $(this).data("filterValue") == catCode;
		}).trigger("click");
	}
	paging();
}

/* 페이징 */
function paging() {
	$(".goods-list").each(function() {
		var page = getUrlVars()["page"] || 1;			
		var curGoodsList = $(".goods-list > ul > li");
		var totalCount = curGoodsList.length;

		var countList = 48;
		var countPage = 3;
		
		var totalPage = totalCount / countList;
		if(totalCount % countList != 0) { totalPage++; }
		
		if(totalPage < page) { page = totalPage; }
					
		var $list = $(this);
		var $pager = $("<ul class='pagination justify-content-center'></ul>");
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
	
		$(".pagination-box").append($pager);
		$list.trigger('repaginate');
		
	});
}