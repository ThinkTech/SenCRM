<%@ taglib prefix="s" uri="/struts-tags"%>
<div class="buttons">
    <a  href="documentation"  class="button"><i class="fa fa-book"></i><span data-translation="documentation"></span></a>
    <a  href="public/pricing"  class="button"><i class="fa fa-money"></i><span data-translation="pricing"></span></a>
    <a  href="registration"  class="button"><i class="fa fa-user"></i><span data-translation="signUp"></span></a>
    <a  href="login" class="button"><i class="fa fa-key"></i><span data-translation="signIn"></span></a>
</div>
<div class="content">
<ul class="rslides">
  <li>
  <div class="center">
        <h1><i class="fa fa-globe"></i><span data-translation="slide-1-title"></span></h1>
              <p>
				<span data-translation="slide-1-content"></span>
				<div class="images">
				     <img src="${images}/help-support-headset-bubble.png" class="animated rollIn"/>
				     <img src="${images}/connection.png" class="animated shake"/>
				  </div>
			 </p>
  </div>
  </li>
  <li>
  <div class="center">
     <h1><i class="fa fa-adjust"></i><span data-translation="slide-2-title"></span></h1>
              <p>
 				<span data-translation="slide-2-content"></span>
 				<div class="images">
				     <img src="${images}/marketing-1.png"/>
				     <img src="${images}/marketing-2.png"/>
				  </div>
 				</p>
  </div>
  </li>
   <li>
    <div class="center">
       <h1><i class="fa fa-mobile"></i><span data-translation="slide-3-title"></span></h1>
              <p>
				 <span data-translation="slide-3-content"></span>
				 <div class="images">
				     <img src="${images}/computer.png"/>
				     <img src="${images}/mobile.png"/>
				  </div>
			  </p>
    </div>
  </li>
  <li>
    <div class="center">
       <h1><i class="fa fa-code"></i><span data-translation="slide-4-title"></span></h1>
              <p>
				 <span data-translation="slide-4-content"></span>
				 <div class="images">
				     <img src="${images}/theme-1.png"/>
				     <img src="${images}/theme-2.png"/>
				  </div>
			  </p>
    </div>
  </li>
  <li>
    <div class="center">
       <h1><i class="fa fa-key"></i><span data-translation="slide-5-title"></span></h1>
              <p>
				  <span data-translation="slide-5-content"></span>
				  <div class="images">
				     <img src="${images}/server-2.png"/>
				     <img src="${images}/server-1.png"/>
				  </div>
			  </p>
    </div>
  </li>
  <li>
    <div class="center">
       <h1><i class="fa fa-server"></i><span data-translation="slide-6-title"></span></h1>
              <p>
				  <span data-translation="slide-6-content"></span>
				  <div class="images">
				     <img src="${images}/mysql.png"/>
				     <img src="${images}/cloudlet.png"/>
				  </div>
			  </p>
    </div>
  </li>
   <li>
    <div class="center">
       <h1><i class="fa fa-industry"></i><span data-translation="slide-7-title"></span></h1>
              <p>
				  <span data-translation="slide-7-content"></span>
				  <div class="images">
				     <img src="${images}/multicloud.png" style="width: 80%;margin:auto"/>
				  </div>
			  </p>
    </div>
  </li>
  <li>
    <div class="center">
       <h1><i class="fa fa-bolt"></i><span data-translation="slide-8-title"></span></h1>
              <p>
				 <span data-translation="slide-8-content"></span>
				 <div class="images">
				     <img src="${images}/dynamic-2.png"/>
				     <img src="${images}/dynamic-1.png"/>
				  </div>
			  </p>
    </div>
  </li>
  <li>
    <div class="center">
       <h1><i class="fa fa-money"></i><span data-translation="slide-9-title"></span></h1>
              <p>
				  <span data-translation="slide-9-content"></span>
				  <div class="images">
				     <img src="${images}/business1.png"/>
				     <img src="${images}/business2.png"/>
				  </div>
			  </p>
    </div>
  </li>
  <li>
    <div class="center">
       <h1><i class="fa fa-drivers-license"></i><span data-translation="slide-10-title"></span></h1>
              <p>
				  <span data-translation="slide-10-content"></span>
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
<a class="button wizard"> <span data-translation="try-it"></span><i class="fa fa-play"></i></a>
<div class="block">
<div class="video">
  <div class="video-container">
     <iframe id="player" src="https://www.youtube.com/embed/xn0vCV_fxNM"  frameborder="0" allowfullscreen></iframe>
  </div>
</div>
<div class="testimonials">
    <div class="testimonial">
		<p data-translation="testimonial-1-content"></p>
		<div class="sign">
			<a href="#"><i class="fa fa-user"></i><b><span data-translation="testimonial-1-author"></span><span class="voice fa fa-microphone" title="information">&nbsp;</span></b></a>
		</div>
	</div>
	<div class="testimonial">
		<p data-translation="testimonial-2-content"></p>
		<div class="sign">
			<a href="#"><i class="fa fa-user"></i><b><span data-translation="testimonial-2-author"></span><span class="voice fa fa-microphone" title="information">&nbsp;</span></b></a>
		</div>
	</div>
	<div class="testimonial">
		<p data-translation="testimonial-3-content"></p>
		<div class="sign">
			<a href="#"><i class="fa fa-user"></i><b><span data-translation="testimonial-3-author"></span><span class="voice fa fa-microphone" title="information">&nbsp;</span></b></a>
		</div>
	</div>
</div>
</div>
<div class="modules">
<div class="center">
<h1><i class="fa fa-puzzle-piece"></i><span data-translation="available-modules"></span></h1>
<s:iterator value="moduleManager.backendModules">
<div class="module" data-required="${mandatory}">
    <div>
    <span class="voice fa fa-microphone" title="information">&nbsp;</span>
	<img src="modules/${folder.name}/images/icon-32.png"/>
	<label data-translation="${id}"></label>
	<p data-translation="${id}_details"></p>
	<div>
	<span class="price"><span data-translation="${id}_price"></span> ${initParam.app_currency}/mo</span>
	<span class="subscribe" data-id="${id}"  style="display:${mandatory?'none':'inline-block'}"><i class="fa fa-shopping-cart"></i><span data-translation="subscribe"></span></span>
	<span class="required"  style="display:${!mandatory?'none':'inline-block'}"><i class="fa fa-check-square-o"></i><span data-translation="required"></span></span>
	</div>
	</div>
</div>
</s:iterator>
</div>
<div class="content">
<div class="browser">
<div class="wizard">
   <a title="Sign up" class="button signup"><i class="fa fa-user"></i><span data-translation="create-account"></span></a>
</div>
<div>
<div class="registration">
<form id="form" action="registration/register" method="post"> 
   <section class="step" data-step-title="profile">
	 <fieldset>
		<h1><i class="fa fa-user"></i>Manager</h1>
		
		<label class="required text-right"><i class="fa fa-user"></i><span data-translation="firstName"></span></label>
		<input required data-translation="firstName" name="user.firstName" maxlength="100"  type="text"/>
		<span class="info fa fa-info adjust"  data-info="info-firstName">&nbsp;</span>
	    <span class="voice fa fa-microphone">&nbsp;</span>
	   
		<label  class="required text-right"><i class="fa fa-user"></i><span data-translation="lastName"></span></label>
		<input required data-translation="lastName" name="user.lastName" maxlength="100" type="text"/>
		<span class="info fa fa-info adjust"  data-info="info-lastName">&nbsp;</span>
	    <span class="voice fa fa-microphone">&nbsp;</span>
	    
	    
	    <label class="required text-right"><i class="fa fa-envelope"></i><span data-translation="email"></span></label>
		<input required data-translation="email" name="user.email" maxlength="100" type="email"/>
		<span class="info fa fa-info adjust"  data-info="info-email">&nbsp;</span>
	    <span class="voice fa fa-microphone">&nbsp;</span>
	    
	    
		<label class="required text-right"><i class="fa fa-language"></i><span data-translation="language"></span></label>
		<select data-translation="Language" name="user.lang">
		       <option id="english" value="en" data-translation="english"></option>
	    		<option id="french" value="fr" data-translation="french"></option>
		</select>
		<span class="info fa fa-info adjust"  data-info="info-language">&nbsp;</span>
	    <span class="voice fa fa-microphone">&nbsp;</span>
	    
	    
		<label  class="required text-right"><i class="fa fa-key"></i><span data-translation="password"></span></label>
		<input required  data-translation="password" id="password"  name="user.password" maxlength="100" type="password"/>
		<span class="info fa fa-info adjust"  data-info="info-password">&nbsp;</span>
	    <span class="voice fa fa-microphone">&nbsp;</span>
	    
	    
		<label class="required text-right"><i class="fa fa-key"></i><span data-translation="confirm"></span></label>
		<input required id="confirm" data-translation="confirm" maxlength="100" type="password"/>
		<span class="info fa fa-info adjust"  data-info="info-confirm">&nbsp;</span>
	    <span class="voice fa fa-microphone">&nbsp;</span>
	    
	    
	</fieldset>
	
	</section>
	
	<section class="step" data-step-title="structure">
	
	<fieldset>
		<h1><i class="fa fa-building"></i>Structure</h1>
		
		<label class="required text-right"><i class="fa fa-building-o"></i><span data-translation="name"></span></label>
		<input maxlength="100" required data-translation="name" name="account.structure.name" maxlength="100"  type="text"/>
		<span class="info fa fa-info adjust"  data-info="info-name">&nbsp;</span>
	    <span class="voice fa fa-microphone">&nbsp;</span>
	    
	   
		<label  class="required text-right"><i class="fa fa-money"></i><span data-translation="business"></span></label>
		<select data-translation="business" name="account.structure.business">
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
		<span class="info fa fa-info adjust"  data-info="info-business">&nbsp;</span>
	    <span class="voice fa fa-microphone">&nbsp;</span>
	    
	    
		<label  class="required text-right"><i class="fa fa-level-up"></i><span data-translation="size"></span></label>
		<select data-translation="size" name="account.structure.size">
		    <option value="1">micro</option>
		 	<option value="2">small</option>
		 	<option value="3">medium</option>
		 	<option value="4">big</option>
		</select>
		<span class="info fa fa-info adjust"  data-info="info-size">&nbsp;</span>
	    <span class="voice fa fa-microphone">&nbsp;</span>
	    
	    
		  
		<label  class="required text-right"><i class="fa fa-globe"></i><span data-translation="country"></span></label>
		<select data-translation="country" class="country" required  name="account.structure.address.country">
		</select>
		<span class="info fa fa-info adjust"  data-info="info-country">&nbsp;</span>
	    <span class="voice fa fa-microphone">&nbsp;</span>
	    
	    
		<label  class="text-right"><i class="fa fa-globe"></i><span data-translation="city"></span></label>
		<input data-translation="city" name="account.structure.address.city"  maxlength="200" type="text"/>
		<span class="info fa fa-info adjust"  data-info="info-city">&nbsp;</span>
	    <span class="voice fa fa-microphone">&nbsp;</span>
	    
	    <label  class="text-right"><i class="fa fa-globe"></i><span data-translation="address"></span></label>
		<input  data-translation="address" name="account.structure.address.location" maxlength="200" type="text"/>
		<span class="info fa fa-info adjust"  data-info="info-address">&nbsp;</span>
	    <span class="voice fa fa-microphone">&nbsp;</span>
	     
	   
	</fieldset>
	
	
	</section>
	
	<section class="step" data-step-title="subscription">
	
	<fieldset>
	  <h1><i class="fa fa-puzzle-piece"></i><span data-translation="modules"></span></h1>
	    <s:iterator value="moduleManager.backendModules">
		   <label title="${description}" class="${mandatory ? 'required' : ''} text-right"><i class="fa fa-puzzle-piece"></i><span data-translation="${id}"></span></label>
		   <input type="checkbox" data-price="${price}" value="${id}" name="registration.subscription" data-checked="${mandatory}"/> 
		   <span class="price bgcolor"><span data-translation="${id}_price"></span> ${initParam.app_currency}/mo</span>
		   <span class="info fa fa-info"  data-info="${id}_details">&nbsp;</span>
		   <span class="voice fa fa-microphone">&nbsp;</span>
		</s:iterator>
	</fieldset>

	
	<fieldset>
	  <h1><i class="fa fa-database"></i><span data-translation="hosting"></span></h1>
	     <label  class="required text-right"><i class="fa fa-industry"></i><span data-translation="provider"></span></label>
		 <select data-translation="provider" name="registration.provider">
		    <option value="1">MIRhosting</option>
		 </select>
		 <span class="info fa fa-info adjust"  data-info="info-provider">&nbsp;</span>
		  <span class="voice fa fa-microphone">&nbsp;</span>
	     <label  class="text-right"><i class="fa fa-database"></i><span data-translation="colocation"></span></label>
		 <input data-translation="colocation" type="radio" data-price="10" value="colocation" name="registration.hosting" checked/> 
		 <span class="price bgcolor"  title="10 ${initParam.app_currency}/mo"><span>10</span> ${initParam.app_currency}/mo</span>
		 <span class="info fa fa-info"  data-info="info-colocation">&nbsp;</span>
		 <span class="voice fa fa-microphone">&nbsp;</span>
	     <label  class="text-right"><i class="fa fa-database"></i><span data-translation="server"></span></label>
		 <input data-translation="server" type="radio"  data-price="20" value="private" name="registration.hosting"/> 
		 <span class="private price bgcolor" title="20 ${initParam.app_currency}/mo"><span>20</span> ${initParam.app_currency}/mo</span>
		 <span class="info fa fa-info"  data-info="info-server">&nbsp;</span>
		 <span class="voice fa fa-microphone"  >&nbsp;</span>
		 <span class="wrench fa fa-wrench" data-element="topology">&nbsp;</span>
		 <div id="topology" class="settings">
		     <fieldset class="bgcolor">
		      <h2><i class="fa fa-wrench"></i><span data-translation="topology"></span></h2>
		      <label  class="text-right"><i class="fa fa-database"></i><span data-translation="nodes"></span></label>
		      <input  name="registration.nodes" min="1" max="30" data-action="setNodes" type="number" value="1"/>
		       <span class="info fa fa-info"  data-info="info-nodes">&nbsp;</span>
		       <span class="voice fa fa-microphone"  >&nbsp;</span>
		       <label title="Vertical Scaling per Node" class="text-right"><i class="fa fa-database"></i><span data-translation="cloudlets"></span></label>
		      <input  min="1" max="70" data-action='setFlexibleCloudlets' name="registration.flexibleCloudlets"  type="number" value="4"/>
		       <span class="info fa fa-info"  data-info="info-cloudlets">&nbsp;</span>
		       <span class="voice fa fa-microphone"  >&nbsp;</span>
		       <h6><span>1 cloudlet = </span>&nbsp;128 MiB + 400 MHz</h6>
		       <h6><span data-translation="power"></span>&nbsp;<span class="power">128 MiB + 400 MHz</span></h6>
		      </fieldset>
		 </div>
	</fieldset>
	
	<fieldset>
	  <h1><i class="fa fa-money"></i><span data-translation="pricing"></span></h1>
	     <label  class="text-right"><i class="fa fa-money"></i><span data-translation="amount"></span></label>
		 <span  class="price bgcolor"><span id="amount"></span> ${initParam.app_currency}/mo</span>
	</fieldset>
	
	</section>
	
	<section class="step" data-step-title="confirmation">
	
	<div>
	   <p>
	      <input title="Mailing list subscription" value="true" name="registration.mailing" type="checkbox" checked/> 
		  <span class="mailing">
		  <span  data-translation="mailing-list"></span>
		  <i class="info fa fa-info adjust"  data-info="mailing-list">&nbsp;</i>
	      <i class="voice fa fa-microphone adjust"   >&nbsp;</i>
		  </span> 
	   </p>
	</div>
	<div>
	  <p class="bgcolor" data-translation="agreement"></p>
	</div>
	<div class="captcha">
     <div class="g-recaptcha" data-sitekey="6LfcIBwUAAAAAMpRV6hzY9LHZJWbGyO4k668VXP1"></div>
    </div>    	
	</section>
</form>
</div>
</div>
</div>
</div>
</div>
<div class="benefits">
   <div>
     <h2><i class="fa fa-money"></i><span data-translation="benefit-1-title"></span></h2>
     <p><span data-translation="benefit-1-content"></span></p>
   </div>
   <div>
     <h2><i class="fa fa-ticket"></i><span data-translation="benefit-2-title"></span></h2>
     <p><span data-translation="benefit-2-content"></span></p>
   </div>
   <div>
     <h2><i class="fa fa-key"></i><span data-translation="benefit-3-title"></span></h2>
     <p><span data-translation="benefit-3-content"></span></p>
   </div>
   <div>
     <h2><i class="fa fa-magic"></i><span data-translation="benefit-4-title"></span></h2>
     <p><span data-translation="benefit-4-content"></span></p>
   </div>
</div>
<script src='https://www.google.com/recaptcha/api.js' async defer></script>