app.ready(function(){
	head.load("modules/home/js/responsiveslides.min.js", function() { 
		$(".rslides").responsiveSlides({
			  auto: true,             // Boolean: Animate automatically, true or false
			  speed: 400,            // Integer: Speed of the transition, in milliseconds
			  timeout: 8000,          // Integer: Time between slide transitions, in milliseconds
			  pager: false,           // Boolean: Show pager, true or false
			  pause: true,          // Boolean: Pause on hover, true or false
		});
	 });
});