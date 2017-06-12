<%@ taglib prefix="s" uri="/struts-tags"%>
<div id="content" class="account">
<div class="buttons">
 <a href="${referer}" title="Back" class="back-16">Back</a>
 <a title="Help" class="help-16">Help</a>
</div>
<h1 class="icon-32">Account</h1>
<div class="details">
   <span class="text-right">First Name : </span>
   <span>${loggedUser.firstName}</span>
   <span class="text-right">Last Name : </span>
   <span>${loggedUser.lastName}</span>  
   <span class="text-right">Email : </span>
   <span>${loggedUser.email}</span>
   <span class="text-right">Language : </span>
   <span>en</span>
</div>
<div class="change-password">
<img src="${images}/security_64.png" width="64px" height="64px"/>
<form id="form" action="users/changePassword" method="post">
<fieldset>
   <legend>Change your password </legend>
	<label class="text-right">New : </label>
	<input id="password" name="user.password" type="password" required/><br/>
	<label class="text-right">Confirm : </label>
	<input id="confirm" type="password" required/>
	<input type="submit" value="Change"/>
	<br clear="all"/>
</fieldset>
</form>
</div>
</div>
<script>
document.addEventListener("DOMContentLoaded",function(){
	$("form").on("submit",function(){
		const password = $("#password",this).val();
		const confirm = $("#confirm",this).val();
		if(password != confirm) {
			alert("the two passwords are not identical");
			return false;
		}
		$("input[type=submit]",this).attr("disabled","disabled");
	});
});
</script>