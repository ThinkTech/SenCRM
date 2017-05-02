app.ready(function(){
	$("html, body").animate({ scrollTop: 0 }, 500);
	page.wait();
	head.load("modules/home/js/responsiveslides.min.js","modules/home/css/animate.min.css", 
			"modules/registration/css/module.css","modules/registration/js/module.js",function() {
		const items = ['rotateIn','flipInX','lightSpeedIn','rotateIn','rollIn','zoomIn','slideInUp','bounceInUp','pulse','rubberBand','shake','headshake'
		               ,'jackInTheBox','flash','swing','fadeInUpBig','rotateInDownLeft','rotateInDownRight','rotateInUpLeft','rotateInUpRight',
		               'zoomInDown','zoomInLeft','zoomInRight','zoomInUp','bounceIn','bounceInDown',
		               'bounceInLeft','bounceInRight','bounceInUp'];
		$(".rslides").responsiveSlides({
			  auto: true,             // Boolean: Animate automatically, true or false
			  speed: 400,            // Integer: Speed of the transition, in milliseconds
			  timeout: 8000,          // Integer: Time between slide transitions, in milliseconds
			  pager: true,           // Boolean: Show pager, true or false
			  pause: true,          // Boolean: Pause on hover, true or false
			  before : function() {
				  $(".rslides img:visible").removeAttr('class');
				  var item =  items[Math.floor(Math.random()*items.length)];
				  $(".rslides img:visible").each(function(index,element){
					  item = items[Math.floor(Math.random()*items.length)];
					  $(element).addClass("animated "+item);
				  });
			  }
		});
		$(".rslides img").addClass("animated "+items[0]);
		page.release();
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
		page.speak(text);
		return false;
	});
	$(".slider-audio span.voice").click(function(){
		var text = "";
		$(".rslides p").each(function(index,element){
			text += $(element).html();
		});
		page.speak(text);
	});
	$(".module span.voice").click(function(){
		var text = $(this).parent().parent().find("p").html();
		page.speak(text);
	});
	$(".button.wizard").fadeIn(2000).click(function(){
		const div = $(".modules");
		$("html, body").animate({ scrollTop: div.offset().top }, 500);
	});
	var clicked = false;
	$(window).scroll(function(){
		  const div = $(".modules");
		  if($(this).scrollTop() >= div.offset().top-50) {
		    $('.module').css("opacity","0.3").addClass("animated fadeIn rotateIn");
		  }
		  const button = $("div.wizard .signup");
		  if($(this).scrollTop() >= button.offset().top-300) {
			if(!clicked) {
				button.click();
				clicked = true;
			}
		  }
	});
	$("div.registration input,div.registration select").attr("disabled","disabled");
	$("div.wizard .signup").one("click",function(){
		head.load("modules/registration/css/module.css","modules/registration/js/module.js",function() {
			$("div.registration").css("opacity","0.3").addClass("animated fadeIn jackInTheBox");
			$("div.registration input,div.registration select").removeAttr("disabled");
			$("select[name='account.structure.size']").val("2").trigger("change");
		});
	});
	$("div.wizard .signup").click(function(){
		$("div.registration input:first").focus();
	});
	$(".module .subscribe").click(function(){
		const input = $("input[type=checkbox][value="+$(this).attr("data-id")+"]");
		input[0].checked = !input.is(":checked") ? true : false;
	    input.trigger("change");
	});
	
	$("input[type=checkbox]").on("change",function(){
		const val = $(this).val();
		const span = $(".module span[data-id="+val+"]");
		if(span.hasClass("subscribe")) {
			span.removeAttr('class').addClass("animated flash subscribed");
			$("i",span).removeAttr('class').addClass("fa fa-check-square-o");
			$("span",span).html("Subscribed");
		}else {
			span.removeAttr('class').addClass("animated pulse subscribe");
			$("i",span).removeAttr('class').addClass("fa fa-shopping-cart");
			$("span",span).html("Subscribe");
		}
	});
});