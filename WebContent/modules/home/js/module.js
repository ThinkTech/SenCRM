app.ready(function(){
	$("html, body").animate({ scrollTop: 0 }, 0);
	const slides = $(".rslides");
	if(slides.length) {	
		    page.wait();
		    page.translate("modules/registration/i18n/module");
			head.load("modules/registration/css/module.css","modules/registration/js/module.js","modules/home/js/responsiveslides.min.js","css/animate.min.css",function() {
			 const items = ['rotateIn','flipInX','lightSpeedIn','rotateIn','rollIn','zoomIn','slideInUp','bounceInUp','pulse','rubberBand','shake','headshake'
			               ,'jackInTheBox','flash','swing','fadeInUpBig','rotateInDownLeft','rotateInDownRight','rotateInUpLeft','rotateInUpRight',
			               'zoomInDown','zoomInLeft','zoomInRight','zoomInUp','bounceIn','bounceInDown',
			               'bounceInLeft','bounceInRight','bounceInUp'];
			 slides.responsiveSlides({
				  auto: true,             // Boolean: Animate automatically, true or false
				  speed: 400,            // Integer: Speed of the transition, in milliseconds
				  timeout: 8000,          // Integer: Time between slide transitions, in milliseconds
				  pager: true,           // Boolean: Show pager, true or false
				  nav: true,             // Boolean: Show navigation, true or false
				  pause: true,          // Boolean: Pause on hover, true or false
				  prevText: "<",   // String: Text for the "previous" button
				  nextText: ">",       // String: Text for the "next" button
				  before : function() {
					  $(".rslides img:visible").removeAttr('class');
					  var item =  items[Math.floor(Math.random()*items.length)];
					  $(".rslides img:visible").each(function(index,element){
						  item = items[Math.floor(Math.random()*items.length)];
						  $(element).addClass("animated "+item);
					  });
				  }
			});
			$(".rslides img").addClass("animated "+items[Math.floor(Math.random()*items.length)]);
			slides.animate({opacity : 1 }, 1);
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
				text += $(element).text();
			});
			page.speak(text);
		});
		$(".module span.voice").click(function(){
			const text = $(this).parent().find("p").text();
			page.speak(text);
		});
		$(".button.wizard").fadeIn(2000).click(function(){
			const div = $(".modules");
			$("html, body").animate({ scrollTop: div.offset().top }, 500);
		});
		var clicked = false;
		$(window).scroll(function(){
			  var div = $(".modules");
			  if($(this).scrollTop() >= div.offset().top-50) {
			    $('.module').css("opacity","0.3").addClass("animated fadeIn rotateIn");
			    $('.module[data-required=true] span.required').addClass("animated infinite pulse");
			  }
			  const button = $("div.wizard .signup");
			  if($(this).scrollTop() >= button.offset().top-300) {
				if(!clicked) {
					button.click();
					clicked = true;
				}
			  }
			  div = $(".users");
			  if($(this).scrollTop() >= div.offset().top-550) {
			    div.addClass("animated zoomIn");
			  }
		});
		$("div.registration input,div.registration select").attr("disabled","disabled");
		$("div.wizard .signup").one("click",function(){
			$("div.registration").animate({opacity : 1 }, 1000);
			$("div.registration input,div.registration select").removeAttr("disabled");
			$("select[name='account.structure.size']").val("small").trigger("change");
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
				$("span",span).html(i18n("subscribed")).attr("data-translation","subscribed");
			}else {
				span.removeAttr('class').addClass("animated pulse subscribe");
				$("i",span).removeAttr('class').addClass("fa fa-shopping-cart");
				$("span",span).html(i18n("subscribe")).attr("data-translation","subscribe");;
			}
		});
	}
});