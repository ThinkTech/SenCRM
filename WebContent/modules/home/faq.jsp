<%@ taglib prefix="s" uri="/struts-tags"%>
<div class="buttons">
    <a title="Pricing"  href="public/pricing"  class="button"><i class="fa fa-money"></i>Pricing</a>
    <a title="Sign up" href="registration"  class="button"><i class="fa fa-user"></i>Sign up</a>
    <a title="Sign in" href="login" class="button"><i class="fa fa-key"></i>Sign in</a>
    <a title="Back" href="${referer}"  class="button"><i class="fa fa-arrow-left"></i>Back</a>
</div>
<div class="content"> 
  <div class="center">
   <h1 class="text-center"><i class="fa fa-question-circle"></i>Frequently Asked Questions</h1>
   <div class="faq">
     <h2><i class="fa fa-question-circle"></i>General</h2>
     <div class="faq-content">
         <ul>
           <li>How do I...?</li>
           <li>How do I...?</li>
         </ul>
     </div>
   </div>
   <s:iterator value="moduleManager.backendModules">
    <div class="faq">
     <h2><img src="modules/${folder.name}/images/icon-32.png"/>${name}</h2>
     <div class="faq-content">
         <ul>
           <li>How do I...?</li>
           <li>How do I...?</li>
         </ul>
     </div>
   </div>
   </s:iterator>
  </div>
</div>