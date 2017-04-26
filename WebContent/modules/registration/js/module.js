const setFlexibleCloudlets = function(value) {
};

const setFixedCloudlets = function(value) {
};

const setNodes = function(value) {
	var radio = $("input[type='radio'][value='private']");
	var price = 20 * parseInt(value);
	radio.attr("data-price",price);
	$("span.private").find("span").html(price);
};

app.ready(function(){
	var form = $("form");
	if(form.length) {
	 app.ready(function(){
		page.wait();
		head.load("modules/registration/js/jquery.easyWizard.js", function() { 
			form.easyWizard({
				    prevButton: "Back",
				    nextButton: "Next",
				    submitButtonText: "Create",
				    before : function(wizardObj,currentStep,nextStep) {
				    	if(nextStep.index() > currentStep.index()) {
					    	var valid = true;
					        $('input[required]',currentStep).removeClass("error").each(function(index,element) {
					        	const val = $(element).val();
								if(val.trim() == '') {
									$("html, body").animate({ scrollTop: $(element).offset().top }, 500);
									alert("this field is required",function(){
										$(element).addClass("error").focus();
									});
								    return valid = false;
								}
					        });
					        if(!valid) return valid;
					        const email = $("input[type=email]",currentStep);
					        if(email.length) {
					        	var re = /\S+@\S+\.\S+/;
						        valid = re.test(email.val());
						        if(!valid) {
						        	alert("this email is invalid",function(){
										$(email).addClass("error").focus();
									});
						        }
					        }
					        if(!valid) return valid;
					        const password = $("#password",currentStep);
							const confirm = $("#confirm",currentStep);
							if(password.length && password.val() != confirm.val()) {
								$("html, body").animate({ scrollTop: password.offset().top }, 500);
								alert("the two passwords are not identicals",function(){
									password.addClass("error").focus();
								});
								valid = false;
							}
							const value = password.length ? password.val() : null;
							if(value && (value.length < 8 || value.length >= 100)) {
								$("html, body").animate({ scrollTop: password.offset().top }, 500);
								alert("Your password must be between 8 and 100 characters",function(){
									password.addClass("error").focus();
								});
								valid = false;
							}
					        return valid;
				    	}
				    },
				    after : function(wizardObj,prevStep,currentStep) {
				    	setTimeout(function(){ 
				    		var input = currentStep.find("input.error");
				    		input = input.length ? input : currentStep.find("input:first");
				    		input.focus(); 
				    		}, 1000);
				    },
				    beforeSubmit: function(wizardObj) {
				    	if(!grecaptcha.getResponse()) {
						  alert("you must check the captcha");
						  return false;
					    }
				    }
			});
			$("section",form).css("opacity","1");
			$("input:first").focus();
		 });
	});
	form.on("submit",function(event){
		var url = $(this).attr("action");
		var data = $(this).serialize();
		app.post(url,data, function(response) {
			window.location.href = response.url;
		}, function(error) {
			$("body").css("opacity","1");
			alert("error during the registration, please try again", function() {
				$("input,a,select").removeAttr("disabled");
				$("input[name='user.firstName']").focus();
			});
		});
		$("input,a,select").attr("disabled","disabled");
		$("body").css("opacity","0.5");
		$("html, body").animate({ scrollTop: 0 }, 500);
		return false;
	});
	var amount = 0;
	$("input[type=checkbox]").each(function(index,element){
		const checked = $(element).attr("data-checked");
		if(checked=='true') {
			$(element).attr("checked","true").on('change', function() {
			    this.checked=!this.checked?!alert('this option is mandatory'):true;
			});
		}else {
			$(element).on('change', function() {
				amount = 0;
				$("input[data-price][type=radio]:checked,input[data-price][type=checkbox]:checked").each(function(index,element){
					var price = parseInt($(element).attr("data-price"));
					amount+=price;
					$("#amount").html(amount.toString().formatDigits());
				});
			});
		}
	});
	$("input[type=radio]").on('change', function() {
		amount = 0;
		$("input[data-price][type=radio]:checked,input[data-price][type=checkbox]:checked").each(function(index,element){
			var price = parseInt($(element).attr("data-price"));
			amount+=price;
			$("#amount").html(amount.toString().formatDigits());
		});
    });
	$("span.price").each(function(index,element){
		$(this).html($(this).html().formatDigits());
	});
	$("span.info").click(function(){
		const info = $(this).attr("data-info");
		alert(info);
	});
	$("span.wrench").click(function(event){
		const radio = $("input[type='radio'][value='private']");
		radio.attr('checked', true).trigger('change');
		const id = $(this).attr("data-element");
		const settings = $("#"+id);
		const left = event.pageX;
		const top =  $(this).position().top +20;
		settings.css({top : top, left : 50}).toggle();
		if(!settings.is(":hidden")){
			$("input:first",settings).focus();
			$("html, body").animate({ scrollTop: top }, 500);
		}
		return false;
	});
	$(".settings input").on("change",function(event){
		const val = parseInt($(this).val());
		if(val>=0) {
			const action = $(this).attr("data-action")+"("+val+");";
			eval(action);
		}
	});
	$("select[name='account.structure.size']").on("change",function(event){
		const val = parseInt($(this).val());
		if(val==2 || val==3) {
			$("input[type='radio'][value='colocation']").attr("disabled","disabled");
			$("input[type='radio'][value='private']").attr("checked","checked").click();
		}else {
			$("input[type='radio'][value='colocation']").removeAttr("disabled");
		}
	}).val("2").trigger("change");
	$("input[data-price][type=radio]:checked,input[data-price][type=checkbox]:checked").each(function(index,element){
		var price = parseInt($(element).attr("data-price"));
		amount+=price;
		$("#amount").html(amount.toString().formatDigits());
	});
	$.get("https://ipinfo.io", function(response) {
		  app.getCountries("en",response.country);
	}, "jsonp");
	}
});