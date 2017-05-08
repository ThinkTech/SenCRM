<%@ taglib prefix="s" uri="/struts-tags"%>
<div class="buttons">
    <a title="Pricing"   href="public/pricing" class="button"><i class="fa fa-money"></i>Pricing</a>
    <a title="Sign up" href="registration"  class="button"><i class="fa fa-user"></i>Sign up</a>
    <a title="Sign in" href="login" class="button"><i class="fa fa-key"></i>Sign in</a>
    <a title="Back" href="${referer}"  class="button"><i class="fa fa-arrow-left"></i>Back</a>
</div>
<div class="content">
<div class="center">
   <h1 class="text-center"><i class="fa fa-book"></i>Documentation</h1>
   <div class="center doc">
     <i class="fa fa-user adjust"></i>
     <label class="title">Setup</label>
     <ul>
       <li>Signing up for an account</li>
       <li>Confirming your registration</li>
       <li>Signing in to ${app_name}</li>
       <li>Managing your account</li>
       <li>Managing your subscription</li>
       <li>Deleting your account</li>
     </ul>
   </div>
   <s:iterator value="moduleManager.backendModules">
    <div class="center doc">
     <img src="modules/${folder.name}/images/icon-32.png"/>
     <label class="title" title="${description}">${name}</label>
     <ul>
       <li>item 1</li>
       <li>item 2</li>
       <li>item 3</li>
     </ul>
   </div>
   </s:iterator>
   <div class="center doc">
     <i class="fa fa-code adjust"></i>
     <label class="title">Developers</label>
     <ul>
        <li>item 1</li>
       <li>item 2</li>
       <li>item 3</li>
     </ul>
   </div>
   <div class="center doc">
     <i class="fa fa-handshake-o"></i>
     <label class="title">Programs</label>
     <ul>
        <li>Become a partner</li>
       <li>Become a reseller</li>
     </ul>
   </div>
</div>
</div>