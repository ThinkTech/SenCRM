<%@ taglib prefix="s" uri="/struts-tags"%>
<div class="buttons">
    <a href="documentation"  class="button"><i class="fa fa-book"></i><span data-element="documentation"></span></a>
    <a href="public/pricing"  class="button"><i class="fa fa-money"></i><span data-element="pricing"></span></a>
    <a href="registration"  class="button"><i class="fa fa-user"></i><span data-element="signUp"></span></a>
    <a href="login" class="button"><i class="fa fa-key"></i><span data-element="signIn"></span></a>
    <a href="${referer}"  class="button"><i class="fa fa-arrow-left"></i><span data-element="back"></span></a>
</div>
<div class="content"> 
  <div class="center">
   <h1 class="text-center faq"><i class="fa fa-question-circle"></i>Frequently Asked Questions</h1>
   <ul class="accordion">
      <li>
	    <input type="checkbox" checked>
	    <i></i>
	     <h2><i class="fa fa-question-circle"></i>General</h2>
	    <ul>
	      <li>How do I...?</li>
          <li>How do I...?</li>
	     </ul>
	  </li>
   <s:iterator value="moduleManager.backendModules">
       <li>
	    <input type="checkbox" checked>
	    <i></i>
	    <h2><img src="modules/${folder.name}/images/icon-32.png"/>${name}</h2>
	      <ul>
	      <li>How do I...?</li>
          <li>How do I...?</li>
	     </ul>
	  </li>
   </s:iterator>  
   </ul>
  </div>
</div>