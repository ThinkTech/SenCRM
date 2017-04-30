var speak = function(text) {
	var msg = new SpeechSynthesisUtterance();
	msg.text = text;
	var voices = speechSynthesis.getVoices();
	msg.voice = voices[4];
	msg.lang = 'en-US';
	msg.rate = 0.8;
	msg.pitch = 0.65;
	window.speechSynthesis.speak(msg);
	function resumeInfinity() {
	    window.speechSynthesis.resume();
	    timeoutResumeInfinity = setTimeout(resumeInfinity, 1000);
	}
	msg.onstart = function(event) {
	    resumeInfinity();
	};
	msg.onend = function(event) {
	    clearTimeout(timeoutResumeInfinity);
	};
};
app.ready(function(){
	head.load("modules/home/js/responsiveslides.min.js", function() { 
		$(".rslides").responsiveSlides({
			  auto: true,             // Boolean: Animate automatically, true or false
			  speed: 400,            // Integer: Speed of the transition, in milliseconds
			  timeout: 8000,          // Integer: Time between slide transitions, in milliseconds
			  pager: true,           // Boolean: Show pager, true or false
			  pause: true          // Boolean: Pause on hover, true or false
		});
		$(".pager-placeholder").css("height","20px");
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
	if ('speechSynthesis' in window) {
		speechSynthesis.getVoices();
	} else {
		$("span.voice").hide();
	}
	$(".testimonials span.voice").click(function(){
		var text = "";
		testimonials.each(function(index,element){
			text += $("p",element).html();
			text += $(".sign a",element).text();
		});
		speak(text);
	});
	$(".pager-placeholder span.voice").click(function(){
		var text = "";
		$(".rslides p").each(function(index,element){
			text += $(element).html();
		});
		speak(text);
	});
	$("article span.voice").click(function(){
		var text = $(this).parent().parent().parent().find("p").html();
		speak(text);
	});
	$(".button.wizard").fadeIn(2000);
});