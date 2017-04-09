const toggle = function() {
	const aside = $("aside");
	if(aside.hasClass("toggled")) {
		aside.removeClass("toggled");
	}else {
		aside.addClass("toggled");
	}
};
document.addEventListener("DOMContentLoaded", function() {
	$("body").click(function(event) {
		const aside = $("aside");
		if(!$("aside,aside h1, aside li").is($(event.target)) && !$("button.aside-toggle").is($(event.target)) && !$("button.aside-toggle span.icon-bar").is($(event.target))) {
			aside.removeClass("toggled");
		}
	});
});