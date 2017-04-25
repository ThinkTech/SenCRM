<%@ taglib prefix="s" uri="/struts-tags"%>
<div class="buttons">
    <a href="http://support.thinktech.sn/login" target="_blank"  class="button"><i class="fa fa-ticket"></i>Support</a>
    <a href="documentation"  class="button"><i class="fa fa-book"></i>Documentation</a>
    <a href="registration"  class="button"><i class="fa fa-user"></i>Sign up</a>
    <a href="login" class="button"><i class="fa fa-key"></i>Sign in</a>
</div>
<div>
<ul class="rslides">
  <li>
  <div class="center">
        <h1>Welcome To ${app_name}</h1>
              <p>
				We offer a modular and extensible Cloud-based <b>CRM Solution</b> to deliver a seamless customer experience across marketing, sales, commerce, service, and social.
			 </p>
  </div>
  </li>
  <li>
  <div class="center">
     <h1>Beautiful, Clear & Flexible</h1>
              <p>
 				Today's mobile salesforce needs a <b>CRM System</b> that is easy to use and provides the relevant information they need to make sales faster.
 				</p>
  </div>
  </li>
  <li>
    <div class="center">
       <h1>Dynamic, Fast & Scalable</h1>
              <p>
				 A modern, integrated <b>CRM</b> leverages a multichannel environment to provide better service at a reduced cost for an efficient business.
			  </p>
    </div>
  </li>
</ul>
</div>
<div class="video">
  <div class="video-container">
     <iframe id="player" src="https://www.youtube.com/embed/I7byNZC8umQ"  frameborder="0" allowfullscreen></iframe>
  </div>
</div>
<div class="center">
<h1><i class="fa fa-puzzle-piece"></i>Available Modules</h1>

<section class="ac-container center">
<s:iterator value="moduleManager.backendModules">
<div>
	<input id="${id}" name="${id}" type="checkbox" />
	<label class="text-right" for="${id}"><i class="fa fa-puzzle-piece"></i>${name}</label>
	<article class="ac-small module">
	    <div>
	 	<img src="modules/${folder.name}/images/icon-32.png"/>
	 	<span>${description}</span>
  		</div>
		<p>${details}</p>
	</article>
</div>
</s:iterator>
				
</section>


</div>
<div class="center">
<div class="center">
<p>
<h2>${app_name} is tested with the following browser</h2>
    <ul class="list">
      <li>Internet Explorer 6,7,8,9</li>
      <li>Firefox 3,6,8,11</li>
      <li>Safari 5,5.1</li>
      <li>Chrome 15,20</li>
      <li>Opera 11,11.6</li>
      <li>iOS Safari</li>
      <li>Symbian 3 Webkit</li>
      <li>Opera Mobile 10.1</li>
      <li>Opera Mini for iOS</li>
      <li>IE7, IE9 Mobile</li>
      <li>Firefox Mobile</li>
      <li>Android 2.3+</li>
      <li>Kindle browser</li>
    </ul>
</p>
</div>
</div>