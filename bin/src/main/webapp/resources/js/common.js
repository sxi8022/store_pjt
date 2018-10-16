$(document).ready(function() {
	
	
	// 하단 - 맨위로 버튼
	var btnTop = $('#btnTop');
	btnTop.hide();
	$(window).scroll(function () {
		if ($(this).scrollTop() > 150) {
			btnTop.fadeIn();
		} else {
			btnTop.fadeOut();
		}
	});
    btnTop.click(function () {
		$('body,html').animate({
			scrollTop: 0
		}, 500);
		return false;
    });
});