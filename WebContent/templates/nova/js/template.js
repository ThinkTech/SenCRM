const toggle = () => {
	const aside = $("aside");
	if(aside.hasClass("toggled")) {
		aside.removeClass("toggled");
	}else {
		aside.addClass("toggled");
	}
};
document.addEventListener("DOMContentLoaded", () => {
	$("body").click(function(event) {
		const aside = $("aside");
		if(!$("aside,aside h1, aside li").is($(event.target)) && !$("button.aside-toggle").is($(event.target)) && !$("button.aside-toggle span.icon-bar").is($(event.target))) {
			aside.removeClass("toggled");
		}
	});
	$(window).scroll(function(){
	    if ($(this).scrollTop() > 300) {
	      $('.scrollToTop').fadeIn();
	    } else {
	      $('.scrollToTop').fadeOut();
	    }
	});
	$('.scrollToTop').click(function(){
	    $('html, body').animate({scrollTop : 0},800);
	    return false;
	});
});