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
				     <img src="${images}/help-support-headset-bubble.png" class="animated rollIn"/>
				     <img src="${images}/customer.png" class="animated shake"/>
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
	<span class="subscribe" data-id="${id}" title="Subscribe" style="display:${mandatory?'none':'inline-block'}"><i class="fa fa-shopping-cart"></i><span>Subscribe</span></span>
	<span class="required"  title="Required" style="display:${!mandatory?'none':'inline-block'}"><i class="fa fa-check-square-o"></i>Required</span>
	</div>
</div>
</s:iterator>
</div>
<div class="wizard">
   <a title="Sign up" class="button signup"><i class="fa fa-user"></i>CREATE YOUR ACCOUNT</a>
</div>
<div class="content">
<div class="registration">
<form id="form" action="registration/register" method="post" class="form-horizontal"> 
   <section class="step" data-step-title="Profile">
	 <fieldset>
		<h1><i class="fa fa-user"></i>Manager</h1>
		
		<label title="First Name" class="required text-right"><i class="fa fa-user"></i>First Name : </label>
		<input required title="First Name" name="user.firstName" maxlength="100"  type="text"/>
		<span class="info fa fa-info adjust"  data-info="This field is required and you must enter your first name.">&nbsp;</span>
	    <span class="voice fa fa-microphone"  data-info="This field is required and you must enter your first name." title="information">&nbsp;</span>
	   
		<label title="Last Name" class="required text-right"><i class="fa fa-user"></i>Last Name : </label>
		<input required title="Last Name" name="user.lastName" maxlength="100" type="text"/>
		<span class="info fa fa-info adjust"  data-info="This field is required and you must enter your last name.">&nbsp;</span>
	    <span class="voice fa fa-microphone"  data-info="This field is required and you must enter your last name." title="information">&nbsp;</span>
	    
	    
	    <label title="Email" class="required text-right"><i class="fa fa-envelope"></i>Email :</label>
		<input required title="Email" name="user.email" maxlength="100" type="email"/>
		<span class="info fa fa-info adjust"  data-info="This field is required and you must enter your email address.">&nbsp;</span>
	    <span class="voice fa fa-microphone"  data-info="This field is required and you must enter your email address." title="information">&nbsp;</span>
	    
	    
		<label title="Language" class="required text-right"><i class="fa fa-language"></i>Language :</label>
		<select title="Language" name="user.lang">
		        <option value="en">English</option>
		</select>
		<span class="info fa fa-info adjust"  data-info="This field is required and you must select your language.">&nbsp;</span>
	    <span class="voice fa fa-microphone"  data-info="This field is required and you must select your language." title="information">&nbsp;</span>
	    
	    
		<label title="Password" class="required text-right"><i class="fa fa-key"></i>Password :</label>
		<input required id="password" title="Password" name="user.password" maxlength="100" type="password"/>
		<span class="info fa fa-info adjust"  data-info="This field is required and you must enter your password which must be between 8 and 100 characters.">&nbsp;</span>
	    <span class="voice fa fa-microphone"  data-info="This field is required and you must enter your password which must be between 8 and 100 characters." title="information">&nbsp;</span>
	    
	    
		<label title="Confirm" class="required text-right"><i class="fa fa-key"></i>Confirm :</label>
		<input required id="confirm" title="Confirm" maxlength="100" type="password"/>
		<span class="info fa fa-info adjust"  data-info="This field is required and you must retype your password.">&nbsp;</span>
	    <span class="voice fa fa-microphone"  data-info="This field is required and you must retype your password." title="information">&nbsp;</span>
	    
	    
	</fieldset>
	
	</section>
	
	<section class="step" data-step-title="Structure">
	
	<fieldset>
		<h1><i class="fa fa-building"></i>Structure</h1>
		
		<label title="Name" class="required text-right">Name : </label>
		<input maxlength="100" required title="Name" name="account.structure.name" maxlength="100"  type="text"/>
		<span class="info fa fa-info adjust"  data-info="This field is required and you must enter the name of your structure.">&nbsp;</span>
	    <span class="voice fa fa-microphone"  data-info="This field is required and you must enter the name of your structure." title="information">&nbsp;</span>
	    
	   
		<label title="Primary Business" class="required text-right">Primary Business :</label>
		<select title="Primary Business" name="account.structure.business">
		    <option value="1">Accommodations</option>
		    <option value="2">Accounting</option>
		 	<option value="3">Advertising</option>
		 	<option value="4">Aerospace</option>
		 	<option value="5">Agriculture & Agribusiness</option>
		 	<option value="6">Air Transportation</option>
		 	<option value="7">Apparel & Accessories </option>
		 	<option value="8">Auto</option>
		 	<option value="9">Banking</option>
		 	<option value="10">Beauty & Cosmetics</option>
		 	<option value="11">Biotechnology</option>
		 	<option value="12">Chemical</option>
		 	<option value="13">Computer</option>
		 	<option value="14">Construction</option>
		 	<option value="15">Consulting</option>
		 	<option value="16">Consumer Products</option>
		 	<option value="17">Education</option>
		 	<option value="18">Electronics</option>
		 	<option value="19">Employment</option>
		 	<option value="20">Energy</option>
		 	<option value="21">Entertainment & Recreation</option>
		 	<option value="22">Fashion</option>
		 	<option value="23">Financial Services</option>
		 	<option value="24">Fine Arts</option>
		 	<option value="25">Food & Beverage</option>
		 	<option value="26">Green Technology</option>
		 	<option value="27">Government</option>
		 	<option value="28">Health</option>
		 	<option value="29">Information</option>
		 	<option value="30" selected>Information Technology</option>
		 	<option value="31">insurance</option>
		 	<option value="32">Journalism & News</option>
		 	<option value="33">Manufacturing</option>
		 	<option value="34">Media & Broadcasting</option>
		 	<option value="35">Medical Devices & Supplies</option>
		 	<option value="36">Motion Pictures & Video</option>
		 	<option value="37">Music</option>
		 	<option value="38">Pharmaceutical</option>
		 	<option value="39">Public Administration</option>
		 	<option value="40">Public Relations</option>
		 	<option value="41">Publishing</option>
		 	<option value="42">Rail</option>
		 	<option value="43">Real Estate</option>
		 	<option value="44">Retail</option>
		 	<option value="45">Service</option>
		 	<option value="46">Sports</option>
		 	<option value="47">Technology</option>
		 	<option value="48">Telecommunications</option>
		 	<option value="49">Tourism</option>
		 	<option value="50">Transportation</option>
		 	<option value="51">Travel</option>
		 	<option value="52">Utilities</option>
		 	<option value="53">Video Game</option>
		 	<option value="54">Web Services</option>
		 	<option value="55">Other</option>
		</select>
		<span class="info fa fa-info adjust"  data-info="This field is required and you must select your primary business.">&nbsp;</span>
	    <span class="voice fa fa-microphone"  data-info="This field is required and you must select your primary business." title="information">&nbsp;</span>
	    
	    
		<label title="Size" class="required text-right">Size :</label>
		<select title="Size" name="account.structure.size">
		 	<option value="1">small</option>
		 	<option value="2">medium</option>
		 	<option value="3">big</option>
		</select>
		<span class="info fa fa-info adjust"  data-info="This field is required and you must select the size of your structure.">&nbsp;</span>
	    <span class="voice fa fa-microphone"  data-info="This field is required and you must select the size of your structure." title="information">&nbsp;</span>
	    
	    
		  
		<label title="Country" class="required text-right"><i class="fa fa-globe"></i>Country :</label>
		<select class="country" required title="Country" name="account.structure.address.country">
		</select>
		<span class="info fa fa-info adjust"  data-info="This field is required and you must select the country of your structure.">&nbsp;</span>
	    <span class="voice fa fa-microphone"  data-info="This field is required and you must select the country of your structure." title="information">&nbsp;</span>
	    
	    
		<label title="City" class="text-right"><i class="fa fa-globe"></i>City :</label>
		<input title="City" name="account.structure.address.city"  maxlength="200" type="text"/>
		<span class="info fa fa-info adjust"  data-info="This field is required and you must enter the city of your structure.">&nbsp;</span>
	    <span class="voice fa fa-microphone"  data-info="This field is required and you must enter the city of your structure." title="information">&nbsp;</span>
	    
	    <label title="Address" class="text-right"><i class="fa fa-globe"></i>Address :</label>
		<input  title="Address" name="account.structure.address.location" maxlength="200" type="text"/>
		<span class="info fa fa-info adjust"  data-info="This field is not required and you must enter the address of your structure.">&nbsp;</span>
	    <span class="voice fa fa-microphone"  data-info="This field is not required and you must enter the address of your structure." title="information">&nbsp;</span>
	    
	  
	   
	</fieldset>
	
	</section>
	
	<section class="step" data-step-title="Subscription">
	
	<fieldset>
	  <h1><i class="fa fa-puzzle-piece"></i>Modules</h1>
	   <s:iterator value="moduleManager.backendModules">
		   <label title="${description}" class="${mandatory ? 'required' : ''} text-right"><i class="fa fa-puzzle-piece"></i>${name}</label>
		   <input type="checkbox" data-price="${price}" value="${id}" name="registration.subscription" data-checked="${mandatory}"/> 
		   <span class="price bgcolor"  title="${price} ${initParam.app_currency}/mo"><span>${price}</span> ${initParam.app_currency}/mo</span>
		   <span class="info fa fa-info"  data-info="${details}">&nbsp;</span>
		   <span class="voice fa fa-microphone"  data-info="${details}" title="information">&nbsp;</span>
		</s:iterator>
	</fieldset>

	
	<fieldset>
	  <h1><i class="fa fa-database"></i>Database Hosting</h1>
	     <label title="Colocation" class="text-right"><i class="fa fa-database"></i>Colocation</label>
		 <input title="Colocation" type="radio" data-price="10" value="colocation" name="registration.hosting" checked/> 
		 <span class="price bgcolor"  title="10 ${initParam.app_currency}/mo"><span>10</span> ${initParam.app_currency}/mo</span>
		 <span class="info fa fa-info"  data-info="This server is shared with other users, so all of its resources and power are not under your control and this option is available only if the size of your structure is small.">&nbsp;</span>
		 <span class="voice fa fa-microphone"  data-info="This server is shared with other users, so all of its resources and power are not under your control and this option is available only if the size of your structure is small." title="information">&nbsp;</span>
	     <label title="Dedicated Server" class="text-right"><i class="fa fa-database"></i>Dedicated Server</label>
		 <input title="Dedicated Server" type="radio"  data-price="20" value="private" name="registration.hosting"/> 
		 <span class="private price bgcolor" title="20 ${initParam.app_currency}/mo"><span>20</span> ${initParam.app_currency}/mo</span>
		 <span class="info fa fa-info"  data-info="This server is exclusively for your use (not shared with other users), so all of its resources and power are under your control and you can also change its environment topology.">&nbsp;</span>
		 <span class="voice fa fa-microphone"  data-info="This server is exclusively for your use (not shared with other users), so all of its resources and power are under your control and you can also change its environment topology." title="information">&nbsp;</span>
		 <span class="wrench fa fa-wrench" data-element="topology" title="Change environment topology">&nbsp;</span>
		 <div id="topology" class="settings">
		     <fieldset class="bgcolor">
		      <h2><i class="fa fa-wrench"></i>Topology</h2>
		      <label title="Horizontal Scaling" class="text-right"><i class="fa fa-database"></i>Nodes</label>
		      <input  title="Nodes" name="registration.nodes" min="1" max="30" data-action="setNodes" type="number" value="1"/>
		       <span class="info fa fa-info"  data-info="According to the size of your structure, you can set the maximum allowed amount of nodes.">&nbsp;</span>
		       <span class="voice fa fa-microphone"  data-info="According to the size of your structure, you can set the maximum allowed amount of nodes." title="information">&nbsp;</span>
		       <label title="Vertical Scaling per Node" class="text-right"><i class="fa fa-database"></i>Dynamic Cloudlets</label>
		      <input  title="Dynamic Cloudlets" min="1" max="70" data-action='setFlexibleCloudlets' name="registration.flexibleCloudlets"  type="number" value="4"/>
		       <span class="info fa fa-info"  data-info="Dynamic cloudlets defines the amount of resources your structure can access, based on necessity. You pay for them only in the case of real consumption.">&nbsp;</span>
		       <span class="voice fa fa-microphone"  data-info="Dynamic cloudlets defines the amount of resources your structure can access, based on necessity. You pay for them only in the case of real consumption." title="information">&nbsp;</span>
		       <h6><span>1 cloudlet = </span>&nbsp;128 MiB + 400 MHz</h6>
		       <h6><span>Power = </span>&nbsp;<span class="power">128 MiB + 400 MHz</span></h6>
		      </fieldset>
		 </div>
	</fieldset>
	
	<fieldset>
	  <h1><i class="fa fa-money"></i>Pricing</h1>
	     <label title="Amount" class="text-right"><i class="fa fa-money"></i>Amount : </label>
		 <span  class="price bgcolor"><span id="amount"></span> ${initParam.app_currency}/mo</span>
	</fieldset>
	
	</section>
	
	<section class="step" data-step-title="Confirmation">
	
	<div>
	   <p>
	      <input title="Mailing list subscription" value="true" name="registration.mailing" type="checkbox" checked/> 
		  <span class="mailing" title="Mailing list subscription">Yes, send me emails on ThinkTech Products, Services and Events.
		  <i class="info fa fa-info adjust"  data-info="Check this field to receive emails on ThinkTech Products, Services and Events.">&nbsp;</i>
	      <i class="voice fa fa-microphone adjust"  data-info="Check this field to receive emails on ThinkTech Products, Services and Events." title="information">&nbsp;</i>
		  </span> 
		  
	    
	   </p>
	</div>
	<div>
	  <p class="bgcolor">
	   By clicking on the Create button below, you understand and agree that the use of ${app_name} is subject to these <a href="registration/terms" target="_blank">Terms of Service</a> 
	   and this <a href="registration/privacy" target="_blank">Privacy Policy</a>, including the fact that ThinkTech may transfer your personal information collected in connection with your 
	   registration to its affiliates globally and to third party entities that provide services to ThinkTech.
	  </p>
	</div>
	<div class="captcha">
     <div class="g-recaptcha" data-sitekey="6LfcIBwUAAAAAMpRV6hzY9LHZJWbGyO4k668VXP1"></div>
    </div>    	
	</section>
</form>
</div>
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
<script src='https://www.google.com/recaptcha/api.js' async defer></script>