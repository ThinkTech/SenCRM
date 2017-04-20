app.ready(function(){
	$("form").on("submit",function(event){
		const password = $("#password");
		const confirm = $("#confirm");
		if(password.val() != confirm.val()) {
			$("html, body").animate({ scrollTop: password.offset().top }, 500);
			alert("the two passwords are not identicals",function(){
				password.focus();
			});
			return false;
		}
		var valid = true;
		$("input[required]").each(function(index,element){
			const val = $(element).val();
			if(val.trim() == '') {
				$("html, body").animate({ scrollTop: $(element).offset().top }, 500);
				alert("this field is required",function(){
					$(element).focus();
				});
				event.preventDefault() ;
			    event.stopPropagation();
			    return valid = false;
			}
		});
		if(!valid) return false;
		/*if(!grecaptcha.getResponse()) {
			alert("you must check the captcha");
			return false;
		}*/
		$("input,a").attr("disabled","disabled");
		$("body").css("opacity","0.6");
		var url = $(this).attr("action");
		var data = $(this).serialize();
		app.post(url,data, function(response) {
			window.location.href = response.url;
		}, function(error) {
			alert("error during the registration, please try again", function() {
				$("input,a").removeAttr("disabled");
				$("body").css("opacity","1");
				$("input[name='user.firstName']").focus();
			});
		});
		$("html, body").animate({ scrollTop: 0 }, 500);
		return false;
	});
	var amount = 0;
	$("input[type=checkbox]").each(function(index,element){
		const checked = $(element).attr("data-checked");
		if(checked=='true') {
			$(element).attr("checked","true").on('change', function() {
			    this.checked=!this.checked?!alert('this module is mandatory'):true;
			});
			const price = parseInt($(this).attr("data-amount"));
			amount += price;
		}else {
			$(element).on('change', function() {
				const price = parseInt($(this).attr("data-amount"));
			    amount = this.checked ? amount + price : amount - price;
			    $("#amount").html(amount);
			});
		}
		
	});
	$("#amount").html(amount);
	$("input[name='registration.hosting']").on('change', function() {
		const val = $(this).val();
	    amount = val == 'private' ? amount + 2500 : amount - 2500;
	    $("#amount").html(amount);
	});
	$.get("https://ipinfo.io", function(response) {
		  app.getCountries("en",response.country);
	}, "jsonp");
	$("input:first").focus();
});