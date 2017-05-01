<%@ taglib prefix="s" uri="/struts-tags"%>
<div class="buttons">
    <a title="Documentation" href="documentation"  class="button"><i class="fa fa-book"></i>Documentation</a>
    <a title="Pricing"  target="_blank"  class="button"><i class="fa fa-money"></i>Pricing</a>
    <a title="Sign up" href="registration"  class="button"><i class="fa fa-user"></i>Sign up</a>
    <a title="Sign in" href="login" class="button"><i class="fa fa-key"></i>Sign in</a>
</div>
<div class="content">
<ul class="rslides">
  <li>
  <div class="center">
        <h1><i class="fa fa-user"></i>Welcome To ${app_name}</h1>
              <p>
				<span>We offer a modular and extensible cloud-based <b>CRM Solution</b> to deliver a seamless user experience across management, manufacturing, business intelligence, marketing, sales, commerce and social.</span>
				<div class="images">
				     <img src="${images}/help-support-headset-bubble.png"/>
				     <img src="${images}/customer.png"/>
				  </div>
			 </p>
  </div>
  </li>
  <li>
  <div class="center">
     <h1><i class="fa fa-adjust"></i>Beautiful, Clear & Flexible</h1>
              <p>
 				<span>Today's mobile salesforce needs a <b>CRM System</b> that is easy to use and provides the relevant information needed to make sales faster,
 				to convert the market understanding into tools and tactics.</span>
 				<div class="images">
				     <img src="${images}/marketing-1.png"/>
				     <img src="${images}/marketing-2.png"/>
				  </div>
 				</p>
  </div>
  </li>
  <li>
    <div class="center">
       <h1><i class="fa fa-bolt"></i>Dynamic, Fast & Scalable</h1>
              <p>
				 <span>An <b>integrated CRM</b> leverages a multichannel environment for an efficient business to provide better service at a reduced cost,
				 to build relationships and develop leads.</span>
				 <div class="images">
				     <img src="${images}/dynamic-2.png"/>
				     <img src="${images}/dynamic-1.png"/>
				  </div>
			  </p>
    </div>
  </li>
   <li>
    <div class="center">
       <h1><i class="fa fa-mobile"></i>PC, Mobile & Tablet Friendly</h1>
              <p>
				 <span><b>${app_name}</b> is tailored to be responsive to maximize the user experience and you can use it anywhere with any device. All that you need is an internet connection and a compliant browser.</span>
				 <div class="images">
				     <img src="${images}/computer.png"/>
				     <img src="${images}/mobile.png"/>
				  </div>
			  </p>
    </div>
  </li>
  <li>
    <div class="center">
       <h1><i class="fa fa-code"></i>Modern & Fully Customizable</h1>
              <p>
				 <span><b>Templates</b> allow you to change the look and feel of <b>${app_name}</b> to fit that of your structure. You can use those contributed by our community of web designers or you can create and upload your own.</span>
				 <div class="images">
				     <img src="${images}/theme-1.png"/>
				     <img src="${images}/theme-2.png"/>
				  </div>
			  </p>
    </div>
  </li>
  <li>
    <div class="center">
       <h1><i class="fa fa-key"></i>Secure, Powerful & Reliable</h1>
              <p>
				  <span>With <b>our dedicated servers</b>, you can be well assured that we are providing properly setup and user ready hardware which would deliver the highest level quality of service, performance and reliability.</span>
				  <div class="images">
				     <img src="${images}/server-2.png"/>
				     <img src="${images}/server-1.png"/>
				  </div>
			  </p>
    </div>
  </li>
  <li>
    <div class="center">
       <h1><i class="fa fa-server"></i>Jelastic based SaaS</h1>
              <p>
				  <span>You can manually provision resources for your <b>dedicated database server</b> to fit the needs of your structure. A cloudlet which is 128 MiB of memory and 400 MHz processor is used for measure.</span>
				  <div class="images">
				     <img src="${images}/mysql.png"/>
				     <img src="${images}/cloudlet.png"/>
				  </div>
			  </p>
    </div>
  </li>
  <li>
    <div class="center">
       <h1><i class="fa fa-drivers-license"></i>Get Started</h1>
              <p>
				  <span>By creating your account, you are just four steps to take your business to the next level and to leverage an ecosystem of services well-designed for your success and your growth.</span>
				  <div class="images">
				     <img src="${images}/start-1.png"/>
				     <img src="${images}/start-2.png"/>
				  </div>
			  </p>
    </div>
  </li>
</ul>
</div>
<div class="slider-audio">
<span class="voice fa fa-microphone" title="information">&nbsp;</span>
</div>
<a title="Try it Now" class="button wizard">TRY IT NOW<i class="fa fa-play"></i></a>
<div class="block">
<div class="video">
  <div class="video-container">
     <iframe id="player" src="https://www.youtube.com/embed/xn0vCV_fxNM"  frameborder="0" allowfullscreen></iframe>
  </div>
</div>
<div class="testimonials">
    <div class="testimonial">
		<p>${app_name} brought me more customers than I thought, which is a given, and it is working well with my business. I really love the product and the people behind it.</p>
		<div class="sign">
			<a href="#"><i class="fa fa-user"></i><b>John Doe - CEO of LiveBusiness<span class="voice fa fa-microphone" title="information">&nbsp;</span></b></a>
		</div>
	</div>
	<div class="testimonial">
		<p>I recommend ${app_name} to every business due to the amount of time saved. The product is elegant and powerful and it covers all of my needs.</p>
		<div class="sign">
			<a href="#"><i class="fa fa-user"></i><b>Marsha Wright - CEO of TechOnFire<span class="voice fa fa-microphone" title="information">&nbsp;</span></b></a>
		</div>
	</div>
	<div class="testimonial">
		<p>Rethinking how nowadays, we manage our businesses was crucial to my adoption of ${app_name} and I'm delighted to be among the users of such great product. Looking forward to more amazing features.</p>
		<div class="sign">
			<a href="#"><i class="fa fa-user"></i><b>Mansour Fall - CEO of ThinkBig<span class="voice fa fa-microphone" title="information">&nbsp;</span></b></a>
		</div>
	</div>
</div>
</div>
<div class="modules">
<div class="center">
<h1><i class="fa fa-puzzle-piece"></i>Available Modules</h1>
<s:iterator value="moduleManager.backendModules">
<div class="module bgcolor">
	<img src="modules/${folder.name}/images/icon-32.png"/>
	<label>${name}<span class="voice fa fa-microphone" title="information">&nbsp;</span></label>
	<p>${details}</p>
	<div>
	<span class="price"  title="${price} ${initParam.app_currency}/mo"><span>${price}</span> ${initParam.app_currency}/mo</span>
	<span class="subscribe"  title="Subscribe" style="display:${mandatory?'none':'inline-block'}"><i class="fa fa-shopping-cart"></i>Purchase</span>
	<span class="required"  title="Mandatory" style="display:${!mandatory?'none':'inline-block'}"><i class="fa fa-check-square-o"></i>Mandatory</span>
	</div>
</div>
</s:iterator>
</div>
</div>
<div class="center">
<div class="center browser">
<p>
<h2>${app_name} is tested with the following browser</h2>
    <ul class="list">
      <li>Chrome 54,55,56</li>
      <li>Firefox 49,50,51</li>
      <li>IE 9,10,11</li>
      <li>Opera 41,42,43</li>
      <li>Edge 12,13,14</li>
    </ul>
</p>
</div>
</div>