<%@ taglib prefix="s" uri="/struts-tags"%>
<div id="content" class="account">
<h1 class="icon-32">Account <a title="Help" class="help-16">Help</a></h1>
<img src="${images}/user_64.png"/>
<fieldset>
   <legend>Info Account</legend>
   <span class="text-right">Type : </span>
   <span>${loggedUser.role}</span>
   <span class="text-right">Email : </span>
   <span>${loggedUser.email}</span>
   <span class="text-right">First Name : </span>
   <span>${loggedUser.firstName}</span>
   <span class="text-right">Last Name : </span>
   <span>${loggedUser.lastName}</span>
   <span class="text-right">Last Logon : </span>
   <span><s:date name="loggedUser.lastLogon" format="dd/MM/yyyy hh:mm:ss" /></span>
</fieldset>
<form action="${changePassword}" method="post">
<div class="change-password">
<img src="${images}/security_64.png"/>
<fieldset>
   <legend>Change your password </legend>
	<span class="text-right">New : </span>
	<input type="password" required/><br/>
	<span class="text-right">Confirm : </span>
	<input type="password" required/>
	<input type="submit" value="Change"/>
	<br clear="all"/>
</fieldset>
</div>
</form>
</div>