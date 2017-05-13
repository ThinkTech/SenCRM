<%@ taglib prefix="s" uri="/struts-tags"%>
<div class="buttons">
    <a href="public/pricing"  class="button"><i class="fa fa-money"></i><span data-translation="pricing"></span></a>
    <a href="registration"  class="button"><i class="fa fa-user"></i><span data-translation="signUp"></span></a>
    <a href="login" class="button"><i class="fa fa-key"></i><span data-translation="signIn"></span></a>
    <a href="${referer}"  class="button"><i class="fa fa-arrow-left"></i><span data-translation="back"></span></a>
</div>
<div class="content">
<div class="center">
<h1 class="text-center"><i class="fa fa-book"></i><span data-translation="documentation"></span></h1>
  <ul class="accordion">
      <li>
	    <input type="checkbox" checked>
	    <i></i>
	    <h2><i class="fa fa-user"></i><span data-translation="setup"></span></h2>
	    <ul>
	       <li>Signing up for an account</li>
	       <li>Confirming your registration</li>
	       <li>Signing in to ${app_name}</li>
	       <li>Managing your account</li>
	       <li>Managing your subscription</li>
	       <li>Deleting your account</li>
       </ul>
	  </li>
   <s:iterator value="moduleManager.backendModules">
       <li>
	    <input type="checkbox" checked>
	    <i></i>
	    <h2><img src="modules/${folder.name}/images/icon-32.png"/><span data-translation="${id}"></span></h2>
	       <ul>
	       <li>item 1</li>
	       <li>item 2</li>
	       <li>item 3</li>
	     </ul>
	  </li>
   </s:iterator>
      <li>
	    <input type="checkbox" checked>
	    <i></i>
	    <h2><i class="fa fa-code adjust"></i><span data-translation="developers"></span></h2>
	    <ul>
	       <li>item 1</li>
	       <li>item 2</li>
	       <li>item 3</li>
	     </ul>
	  </li>
	   <li>
	    <input type="checkbox" checked>
	    <i></i>
	     <h2><i class="fa fa-handshake-o adjust"></i><span data-translation="programs"></span></h2>
	    <ul>
	       <li>item 1</li>
	       <li>item 2</li>
	       <li>item 3</li>
	     </ul>
	  </li>
   </ul>
</div>
</div>