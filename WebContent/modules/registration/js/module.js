app.ready(function(){
	$("form").on("submit",function(event){
		const password = $("#password");
		const confirm = $("#confirm");
		if(password.val() != confirm.val()) {
			alert("the two passwords are not identicals",function(){
				password.focus();
			});
			return false;
		}
		/*if(!grecaptcha.getResponse()) {
			alert("you must check the captcha");
			return false;
		}*/
		$("input[required]").each(function(index,element){
			const val = $(element).val();
			if(val.trim() == '') {
				$("html, body").animate({ scrollTop: $(element).offset().top }, 500);
				alert("this field is required",function(){
					$(element).focus();
					$("input[type=submit]").removeAttr("disabled");
				});
				event.preventDefault() ;
			    event.stopPropagation();
			    return false;
			}
		});
		$("input[type=submit]").attr("disabled","disabled");
		return true;
	});
	$("input[type=checkbox]").each(function(index,element){
		const checked = $(element).attr("data-checked");
		if(checked=='true') $(element).attr("checked","true");
		const disabled = $(element).attr("data-checked");
		if(disabled=='true') $(element).attr("disabled","true");
	});
	$.get("https://ipinfo.io", function(response) {
		  app.getCountries("en",response.country);
	}, "jsonp");
	$("input:first").focus();
});