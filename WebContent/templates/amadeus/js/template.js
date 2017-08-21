$(document).ready(function() {
	$('#email').focus();
	$(".agile_form").submit(function(event){
		app.authenticate($(this));
		return false;
	});
	$(".change-password").submit(function(event){
		var valid = true;
        $('input',this).each(function(index,element) {
        	const val = $(element).val();
			if(val.trim() == '') {
				const message = $(this).prev().prev().attr("data-info");
				alert(message,function(){
					$(element).focus();
				});
			    return valid = false;
			}
        });
        if(!valid) return valid;
        const password = $("#password",this);
		const confirm = $("#confirm",this);
		if(password.length && password.val() != confirm.val()) {
			alert(i18n("password-mismatch"),function(){
				password.focus();
			});
			valid = false;
			if(!valid) return valid;
		}
		const value = password.length ? password.val() : null;
		if(value && (value.length < 8 || value.length >= 100)) {
			alert(i18n("password-length"),function(){
				password.focus();
			});
			valid = false;
		}
		if(!valid) return valid;
	});
	$(".reset-password").submit(function(event){
		const email = $("input[type=email]",this);
	    if(email.length) {
	        if(!email.val().trim()) {
	        	alert(i18n("enter-email"),function(){
					$(email).focus();
				});
	            return false;
	        }
	    }
	});
	$("#contact").click(function(event){
		const div = $("#contact-form");
		if(div.is(":hidden")) {
		  var top = $(this).offset().top+60;
		  top = top < window.innerHeight ? top : top-300;
		  div.css("top",top);
		  div.show();
		  $("html, body").animate({ scrollTop: div.position().top }, 500);
		  $("input:first",div).focus();
		}else {
			div.hide();
		}
	});
	const contactForm = $("#contact-form > form");
	contactForm.submit(function(event){
		event.preventDefault();
		var valid = true;
        $('input,textarea',contactForm).each(function(index,element) {
        	const val = $(element).val();
			if(val.trim() == '') {
				const message = $(this).next().attr("data-info");
				alert(message,function(){
					$(element).focus();
				});
			    return valid = false;
			}
        });
        if(!valid) return valid;
		$.ajax({
			url: contactForm.attr('action'),
			type : 'POST',
			data : contactForm.serialize(),
			beforeSend: function(){
				$("#contact-form").addClass("animated infinite pulse");
			}
		}).done(function(data){
			$("#contact-form").removeClass("animated infinite pulse").fadeOut();
			$("input[type=text],input[type=email],textarea",contactForm).val("");
		});
	});
	$("#contact-form img").click(function(){
		$(this).parent().fadeOut();
	});
	$("div.language select").on("change",function(){
		var language = $(this).val();
		page.retranslate(language);
	}).val(page.language);
	
	$("#contact-form .voice,.w3_agile_login .voice").click(function(){
		var prev = $(this).prev();
		const info = prev.attr("data-info");
		prev.prev().focus();
		page.speak(info);
	});
	
	const subscribeForm = $(".newsletter form");
	subscribeForm.submit(function(event){
		event.preventDefault();
		var valid = true;
        $('input',subscribeForm).each(function(index,element) {
        	const val = $(element).val();
			if(val.trim() == '') {
				const message = $(this).next().attr("data-info");
				alert(message,function(){
					$(element).focus();
				});
			    return valid = false;
			}
        });
        if(!valid) return valid;
		$.ajax({
			url: subscribeForm.attr('action'),
			type : 'POST',
			data : subscribeForm.serialize(),
			beforeSend: function(){
				subscribeForm.addClass("animated infinite pulse");
			}
		}).done(function(data){
			subscribeForm.removeClass("animated infinite pulse").fadeOut();
			$("input[type=email]",subscribeForm).val("");
		}).fail(function(data){
			subscribeForm.removeClass("animated infinite pulse");
		});
	});
	
	$(window).scroll(function(){
		  const div = $("#contact-form");
		  if($(this).scrollTop() > div.offset().top || div.offset().top > $(this).scrollTop()) {
				if(!div.is(":hidden")) {
				  var top = $(this).scrollTop()+20;
				  div.css("top",top);
				}
		  }
	});
	if('speechSynthesis' in window) {
		speechSynthesis.getVoices();
	}else {
		$(".voice").hide();
	}
});