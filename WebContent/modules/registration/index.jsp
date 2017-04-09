<%@ taglib prefix="s" uri="/struts-tags"%>
<div class="registration">
<h1 class="text-center"><i class="fa fa-user"></i>Create your account</h1>
<form id="form" action="registration/register" method="post"> 
   
     <fieldset>
		<h1><i class="fa fa-building"></i>Structure</h1>
		
		<label class="required text-right">Name : </label>
		<input required title="Name" name="account.structure.name"  type="text"/>
		
		<label class="text-right">Sigle : </label>
		<input title="Sigle" name="account.structure.sigle" type="text"/>
		
		<label class="required text-right">Type :</label>
		<select title="Type" name="account.structure.type">
		 	<option value="1">Company</option>
		 	<option value="2">Organization</option>
		 	<option value="3">Government</option>
		</select>
		
		<label class="required text-right">Business :</label>
		<select title="Business" name="account.structure.business">
		    <option value="1">Software</option>
		 	<option value="2">Hosting</option>
		 	<option value="3">Industrial</option>
		 	<option value="4">Construction</option>
		 	<option value="5">Consulting</option>
		 	<option value="6">Provision of services</option>
		 	<option value="7">Other</option>
		</select>
		
		<label class="required text-right">State :</label>
		<select title="State" name="account.structure.state">
		 	<option value="1">rising</option>
		 	<option value="2">growing</option>
		 	<option value="3">strong</option>
		 	<option value="4">struggling</option>
		</select>
		
		<label class="required text-right">Target :</label>
		<select title="Target" name="account.structure.target">
		 	<option value="1">Companies</option>
		 	<option value="2">Governments</option>
		 	<option value="3">Communities</option>
		 	<option value="4">all</option>
		</select>
		
		<label class="required text-right"><i class="fa fa-globe"></i>Country :</label>
		<select class="country" required title="Country" name="account.structure.address.country">
		</select>
		
		<label class="text-right"><i class="fa fa-globe"></i>City :</label>
		<input   title="City" name="account.structure.address.city" type="text"/>
		
		<label class="text-right"><i class="fa fa-globe"></i>Address :</label>
		<input   title="City" name="account.structure.address.location" type="text"/>
		
	</fieldset>
	
	 <fieldset>
		<h1><i class="fa fa-user"></i>Account</h1>
		
		<label class="required text-right"><i class="fa fa-user"></i>First Name : </label>
		<input required title="First Name" name="user.firstName"  type="text"/>
		
		<label class="required text-right"><i class="fa fa-user"></i>Last Name : </label>
		<input required title="Last Name" name="user.lastName" type="text"/>
		
	    <label class="required text-right"><i class="fa fa-envelope"></i>Email :</label>
		<input required title="Email" name="user.email" type="email"/>
		
		<label class="required text-right"><i class="fa fa-language"></i>Language :</label>
		<select title="Language" name="">
		        <option value="en">English</option>
		</select>
		
		<label class="required text-right"><i class="fa fa-key"></i>Password :</label>
		<input required id="password" title="Password" name="user.password" type="password"/>
		
		<label class="required text-right"><i class="fa fa-key"></i>Confirm :</label>
		<input required id="confirm" title="Confirm"  type="password"/>
		
	</fieldset>
	
	<fieldset>
	  <h1><i class="fa fa-puzzle-piece"></i>Modules</h1>
	   <s:iterator value="subscription">
		   <label title="${description}" class="required text-right"><i class="fa fa-puzzle-piece"></i>${name}</label>
		   <input type="checkbox" data-checked="${mandatory}" data-disabled="${mandatory}"/> 
		   <span class="price">2500 XOF/Month</span>
		</s:iterator>
	</fieldset>
	<div class="captcha">
     <div class="g-recaptcha" data-sitekey="6LfcIBwUAAAAAMpRV6hzY9LHZJWbGyO4k668VXP1"></div>
    </div>    	
	<input type="submit" title="Create Account"  value="Create"/>
</form>

</div>
<script src='https://www.google.com/recaptcha/api.js' async defer></script>
<script>
document.addEventListener("DOMContentLoaded",function(){
	$("form").on("submit",function(){
		const password = $("#password");
		const confirm = $("confirm");
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
		$("input[type=submit]",this).attr("disabled","disabled");
		return true;
	});
	$("input[type=checkbox]").each(function(index,element){
		const checked = $(element).attr("data-checked");
		if(checked=='true') $(element).attr("checked","true");
		const disabled = $(element).attr("data-checked");
		if(disabled=='true') $(element).attr("disabled","true");
	});
	app.getCountries("en","SEN");
	$("input:first").focus();
});
</script>