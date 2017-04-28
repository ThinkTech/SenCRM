app.ready(function(){
	head.load("modules/home/js/responsiveslides.min.js", function() { 
		$(".rslides").responsiveSlides({
			  auto: true,             // Boolean: Animate automatically, true or false
			  speed: 400,            // Integer: Speed of the transition, in milliseconds
			  timeout: 8000,          // Integer: Time between slide transitions, in milliseconds
			  pager: true,           // Boolean: Show pager, true or false
			  pause: true,          // Boolean: Pause on hover, true or false
		});
	 });
	const testimonials = $(".testimonial");
	const length = testimonials.length;
	var index = 0;
	setInterval(function(){
		index = index +1;
		if(index >= length) index = 0;
		testimonials.hide();
		$(".testimonial").eq(index).fadeIn(600);
	},9000);
});