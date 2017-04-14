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
		if(!grecaptcha.getResponse()) {
			alert("you must check the captcha");
			return false;
		}
		$("input[type=submit]").attr("disabled","disabled");
		return true;
	});
	var amount = 0;
	$("input[type=checkbox]").each(function(index,element){
		const checked = $(element).attr("data-checked");
		if(checked=='true') {
			$(element).attr("checked","true").on('change', function() {
			    this.checked=!this.checked?!alert('this module is mandatory'):true;
			});
			amount += 2500;
		}else {
			$(element).on('change', function() {
			    amount = this.checked ? amount + 2500 : amount - 2500;
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