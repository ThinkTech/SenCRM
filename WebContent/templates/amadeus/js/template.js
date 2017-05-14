$(document).ready(function() {
	//Horizontal Tab
	$('#parentHorizontalTab_agile').easyResponsiveTabs({
		type: 'default', //Types: default, vertical, accordion
		width: 'auto', //auto or any width like 600px
		fit: true, // 100% fit in a container
		tabidentify: 'hor_1' // The tab groups identifier
	});
	$('#email').focus();
	$(".agile_form").submit(function(event){
		app.authenticate($(this));
		return false;
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
});