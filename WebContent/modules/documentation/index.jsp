<%@ taglib prefix="s" uri="/struts-tags"%>
<div class="buttons">
    <a href="http://support.thinktech.sn/login" target="_blank"  class="button"><i class="fa fa-ticket"></i>Support</a>
    <a href="registration"  class="button"><i class="fa fa-user"></i>Sign up</a>
    <a href="login" class="button"><i class="fa fa-key"></i>Sign in</a>
    <a href="${referer}"  class="button"><i class="fa fa-arrow-left"></i>Back</a>
</div>
<div class="center">
   <h1 class="text-center"><i class="fa fa-book"></i>Documentation</h1>
   <div class="center bgcolor">
     <h2 class="title"><i class="fa fa-user"></i>Setup</h2>
     <ol>
       <li>Signing up for an account</li>
       <li>Confirming your registration</li>
       <li>Signing in to ${app_name}</li>
       <li>Managing your account</li>
       <li>Managing your subscription</li>
       <li>Deleting your account</li>
     </ol>
   </div>
   <s:iterator value="moduleManager.backendModules">
    <div class="center bgcolor">
     <h2 class="title"><i class="fa fa-puzzle-piece"></i>Module ${name}</h2>
     <ol>
       <li>item 1</li>
       <li>item 2</li>
       <li>item 3</li>
     </ol>
   </div>
   </s:iterator>
   <div class="center bgcolor">
     <h2 class="title"><i class="fa fa-code"></i>Developers</h2>
     <ol>
        <li>item 1</li>
       <li>item 2</li>
       <li>item 3</li>
     </ol>
   </div>
   <div class="center bgcolor">
     <h2 class="title"><i class="fa fa-handshake-o"></i>Programs</h2>
     <ol>
        <li>Become a partner</li>
       <li>Become a reseller</li>
     </ol>
   </div>
   <div class="center bgcolor">
     <h2 class="title"><i class="fa fa-sticky-note-o"></i>Site Policy</h2>
     <ol>
       <li>${app_name} Terms of Service</li>
       <li>${app_name} Privacy Policy</li>
     </ol>
   </div>
</div>