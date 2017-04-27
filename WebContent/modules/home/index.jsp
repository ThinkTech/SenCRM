<%@ taglib prefix="s" uri="/struts-tags"%>
<div class="buttons">
    <a href="http://support.thinktech.sn/login" target="_blank"  class="button"><i class="fa fa-ticket"></i>Support</a>
    <a href="documentation"  class="button"><i class="fa fa-book"></i>Documentation</a>
    <a href="registration"  class="button"><i class="fa fa-user"></i>Sign up</a>
    <a href="login" class="button"><i class="fa fa-key"></i>Sign in</a>
</div>
<div class="aside">
  <a class="title">News</a>
  <a class="title">Blog</a>
  <a class="title">FAQ</a>
  <div class="socials">
    <a><i class="fa fa-facebook"></i></a>
    <a><i class="fa fa-twitter"></i></a>
    <a><i class="fa fa-youtube"></i></a>
  </div>
</div>
<div>
<ul class="rslides">
  <li>
  <div class="center">
        <h1>Welcome To ${app_name}</h1>
              <p>
				We offer a modular and extensible Cloud-based <b>CRM Solution</b> to deliver a seamless user experience across management, manufacturing, marketing, sales, commerce, service, and social.
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
   <li>
    <div class="center">
       <h1>PC, Mobile & Tablet Friendly</h1>
              <p>
				 <b>SenCRM</b> is tailored to be responsive to maximize the user experience and you can use it anywhere with any device. All that you need is an internet connection and a compliant browser.
			  </p>
    </div>
  </li>
  <li>
    <div class="center">
       <h1>Secure, Powerful & Reliable</h1>
              <p>
				  With our dedicated servers, you can be assured that we are providing properly setup and user ready hardware which would deliver the highest level quality of service, performance and reliability.
			  </p>
    </div>
  </li>
</ul>
</div>
<div class="block">
<div class="video">
  <div class="video-container">
     <iframe id="player" src="https://www.youtube.com/embed/xn0vCV_fxNM"  frameborder="0" allowfullscreen></iframe>
  </div>
</div>
<div class="testimonials">
    <div class="testimonial">
		<p class="content">SenCRM brought me more customers than I thought, which is a given, and it is working well with my business. I really love the product and the people behind it.</p>
		<div class="sign">
			<a href="#"><b>John Doe - CEO of LiveBusiness</b></a>
		</div>
	</div>
	<div class="testimonial">
		<p class="content">I recommend SenCRM to every business due to the amount of time saved. The product is elegant and powerful and it covers all of my needs.</p>
		<div class="sign">
			<a href="#"><b>Marsha Wright - CEO of TechOnFire</b></a>
		</div>
	</div>
	<div class="testimonial">
		<p class="content">Rethinking how nowadays, we manage our businesses was crucial to my adoption of SenCRM and I'm delighted to be among the users of such great product. Looking forward to more amazing features.</p>
		<div class="sign">
			<a href="#"><b>Mansour Fall - CEO of ThinkBig</b></a>
		</div>
	</div>
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