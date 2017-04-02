<%@ taglib prefix="s" uri="/struts-tags"%>
<div id="content" class="account">
<div class="buttons">
 <a title="Help" class="help-16">Help</a>
</div>
<h1 class="icon-32">Account</h1>
<div class="details">
   <span class="text-right">Structure : </span>
   <span>${loggedUser.structure.name}</span>
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
</div>
<div class="change-password">
<img src="${images}/security_64.png" width="64px" height="64px"/>
<form id="form" action="${changePassword}" method="post">
<fieldset>
   <legend>Change your password </legend>
	<label class="text-right">New : </label>
	<input type="password" required/><br/>
	<label class="text-right">Confirm : </label>
	<input type="password" required/>
	<input type="submit" value="Change"/>
	<br clear="all"/>
</fieldset>
</form>
</div>
</div>