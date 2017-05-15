<%@ taglib prefix="s" uri="/struts-tags"%>
<div class="buttons">
    <a href="documentation"  class="button"><i class="fa fa-book"></i><span data-translation="documentation">&nbsp;</span></a>
    <a href="public/pricing"  class="button"><i class="fa fa-money"></i><span data-translation="pricing">&nbsp;</span></a>
    <a href="login" class="button"><i class="fa fa-key"></i><span data-translation="signIn">&nbsp;</span></a>
    <a href="${referer}"  class="button"><i class="fa fa-arrow-left"></i><span data-translation="back">&nbsp;</span></a>
</div>
<div class="content">
<div class="registration">
<h1 class="text-center"><i class="fa fa-user"></i><span data-translation="create-account">&nbsp;</span></h1>
<form id="form" action="registration/register" method="post"> 
   <section class="step" data-step-title="profile">
	 <fieldset>
		<h1><i class="fa fa-user"></i><span data-translation="manager">&nbsp;</span></h1>
		
		<label class="required text-right"><i class="fa fa-user"></i><span data-translation="firstName">&nbsp;</span></label>
		<input required data-translation="firstName" name="user.firstName" maxlength="100"  type="text"/>
		<span class="info fa fa-info adjust"  data-info="info-firstName">&nbsp;</span>
	    <span class="voice fa fa-microphone">&nbsp;</span>
	   
		<label  class="required text-right"><i class="fa fa-user"></i><span data-translation="lastName">&nbsp;</span></label>
		<input required data-translation="lastName" name="user.lastName" maxlength="100" type="text"/>
		<span class="info fa fa-info adjust"  data-info="info-lastName">&nbsp;</span>
	    <span class="voice fa fa-microphone">&nbsp;</span>
	    
	    
	    <label class="required text-right"><i class="fa fa-envelope"></i><span data-translation="email">&nbsp;</span></label>
		<input required data-translation="email" name="user.email" maxlength="100" type="email"/>
		<span class="info fa fa-info adjust"  data-info="info-email">&nbsp;</span>
	    <span class="voice fa fa-microphone">&nbsp;</span>
	    
	    
		<label class="required text-right"><i class="fa fa-language"></i><span data-translation="language">&nbsp;</span></label>
		<select data-translation="Language" name="user.lang">
		        <option id="english" value="en" data-translation="english"></option>
	            <option id="french" value="fr" data-translation="french"></option>
		</select>
		<span class="info fa fa-info adjust"  data-info="info-language">&nbsp;</span>
	    <span class="voice fa fa-microphone">&nbsp;</span>
	    
	    
		<label  class="required text-right"><i class="fa fa-key"></i><span data-translation="password">&nbsp;</span></label>
		<input required  data-translation="password" id="password"  name="user.password" maxlength="100" type="password"/>
		<span class="info fa fa-info adjust"  data-info="info-password">&nbsp;</span>
	    <span class="voice fa fa-microphone">&nbsp;</span>
	    
	    
		<label class="required text-right"><i class="fa fa-key"></i><span data-translation="confirm">&nbsp;</span></label>
		<input required id="confirm" data-translation="confirm" maxlength="100" type="password"/>
		<span class="info fa fa-info adjust"  data-info="info-confirm">&nbsp;</span>
	    <span class="voice fa fa-microphone">&nbsp;</span>
	    
	    
	</fieldset>
	
	</section>
	
	<section class="step" data-step-title="structure">
	
	<fieldset>
		<h1><i class="fa fa-building"></i><span data-translation="structure">&nbsp;</span></h1>
		
		<label class="required text-right"><i class="fa fa-building-o"></i><span data-translation="name">&nbsp;</span></label>
		<input maxlength="100" required data-translation="name" name="account.structure.name" maxlength="100"  type="text"/>
		<span class="info fa fa-info adjust"  data-info="info-name">&nbsp;</span>
	    <span class="voice fa fa-microphone">&nbsp;</span>
	    
	   
		<label  class="required text-right"><i class="fa fa-money"></i><span data-translation="business">&nbsp;</span></label>
		<select data-translation="business" name="account.structure.business">
		    <option data-translation='accommodations' value='accommodations'></option>
			<option data-translation='accounting' value='accounting'></option>
			<option data-translation='advertising' value='advertising'></option>
			<option data-translation='aerospace' value='aerospace'></option>
			<option data-translation='agriculture' value='agriculture'></option>
			<option data-translation='air' value='air'></option>
			<option data-translation='apparel' value='apparel'></option>
			<option data-translation='automobile' value='automobile'></option>
			<option data-translation='banking' value='banking'></option>
			<option data-translation='beauty' value='beauty'></option>
			<option data-translation='biotechnology' value='biotechnology'></option>
			<option data-translation='construction' value='construction'></option>
			<option data-translation='consulting' value='consulting'></option>
			<option data-translation='consumer' value='consumer'></option>
			<option data-translation='education' value='education'></option>
			<option data-translation='electronics' value='electronics'></option>
			<option data-translation='employment' value='employment'></option>
			<option data-translation='energy' value='energy'></option>
			<option data-translation='entertainment' value='entertainment'></option>
			<option data-translation='fashion' value='fashion'></option>
			<option data-translation='financial' value='financial'></option>
			<option data-translation='arts' value='arts'></option>
			<option data-translation='food' value='food'></option>
			<option data-translation='green' value='green'></option>
			<option data-translation='government' value='government'></option>
			<option data-translation='health' value='health'></option>
			<option data-translation='information' value='information'></option>
			<option data-translation='technology' value='technology' selected></option>
			<option data-translation='insurance' value='insurance'></option>
			<option data-translation='journalism' value='journalism'></option>
			<option data-translation='manufacturing' value='manufacturing'></option>
			<option data-translation='media' value='media'></option>
			<option data-translation='medical' value='medical'></option>
			<option data-translation='motion' value='motion'></option>
			<option data-translation='music' value='music'></option>
			<option data-translation='pharmaceutical' value='pharmaceutical'></option>
			<option data-translation='administration' value='administration'></option>
			<option data-translation='relations' value='relations'></option>
			<option data-translation='publishing' value='publishing'></option>
			<option data-translation='rail' value='rail'></option>
			<option data-translation='estate' value='estate'></option>
			<option data-translation='retail' value='retail'></option>
			<option data-translation='service' value='service'></option>
			<option data-translation='sports' value='sports'></option>
			<option data-translation='telecommunications' value='telecommunications'></option>
			<option data-translation='tourism' value='tourism'></option>
			<option data-translation='Transportation' value='Transportation'></option>
			<option data-translation='travel' value='travel'></option>
			<option data-translation='utilities' value='utilities'></option>
			<option data-translation='other' value='other'></option>
		</select>
		<span class="info fa fa-info adjust"  data-info="info-business">&nbsp;</span>
	    <span class="voice fa fa-microphone">&nbsp;</span>
	    
	    
		<label  class="required text-right"><i class="fa fa-level-up"></i><span data-translation="size">&nbsp;</span></label>
		<select data-translation="size" name="account.structure.size">
		    <option value="micro" data-translation="micro"></option>
		 	<option value="small" data-translation="small"></option>
		 	<option value="medium" data-translation="medium"></option>
		 	<option value="big" data-translation="big"></option>
		</select>
		<span class="info fa fa-info adjust"  data-info="info-size">&nbsp;</span>
	    <span class="voice fa fa-microphone">&nbsp;</span>
	    
	    
		  
		<label  class="required text-right"><i class="fa fa-globe"></i><span data-translation="country">&nbsp;</span></label>
		<select data-translation="country" class="country" required  name="account.structure.address.country">
		</select>
		<span class="info fa fa-info adjust"  data-info="info-country">&nbsp;</span>
	    <span class="voice fa fa-microphone">&nbsp;</span>
	    
	    
		<label  class="text-right"><i class="fa fa-globe"></i><span data-translation="city">&nbsp;</span></label>
		<input data-translation="city" name="account.structure.address.city"  maxlength="200" type="text"/>
		<span class="info fa fa-info adjust"  data-info="info-city">&nbsp;</span>
	    <span class="voice fa fa-microphone">&nbsp;</span>
	    
	    <label  class="text-right"><i class="fa fa-globe"></i><span data-translation="address">&nbsp;</span></label>
		<input  data-translation="address" name="account.structure.address.location" maxlength="200" type="text"/>
		<span class="info fa fa-info adjust"  data-info="info-address">&nbsp;</span>
	    <span class="voice fa fa-microphone">&nbsp;</span>
	     
	   
	</fieldset>
	
	
	</section>
	
	<section class="step" data-step-title="subscription">
	
	<fieldset>
	  <h1><i class="fa fa-puzzle-piece"></i><span data-translation="modules">&nbsp;</span></h1>
	   <s:iterator value="moduleManager.backendModules">
		   <label title="${description}" class="${mandatory ? 'required' : ''} text-right"><i class="fa fa-puzzle-piece"></i><span data-translation="${id}">&nbsp;</span></label>
		   <input type="checkbox" data-price="${price}" value="${id}" name="registration.subscription" data-checked="${mandatory}"/> 
		   <span class="price bgcolor"><span data-translation="${id}_price">&nbsp;</span> ${initParam.app_currency}/mo</span>
		   <span class="info fa fa-info"  data-info="${id}_details">&nbsp;</span>
		   <span class="voice fa fa-microphone">&nbsp;</span>
		</s:iterator>
	</fieldset>

	
	<fieldset>
	  <h1><i class="fa fa-database"></i><span data-translation="hosting">&nbsp;</span></h1>
	     <label  class="required text-right"><i class="fa fa-industry"></i><span data-translation="provider">&nbsp;</span></label>
		 <select data-translation="provider" name="registration.provider">
		    <option value="1">MIRhosting</option>
		 </select>
		 <span class="info fa fa-info adjust"  data-info="info-provider">&nbsp;</span>
		  <span class="voice fa fa-microphone">&nbsp;</span>
	     <label  class="text-right"><i class="fa fa-database"></i><span data-translation="colocation">&nbsp;</span></label>
		 <input data-translation="colocation" type="radio" data-price="10" value="colocation" name="registration.hosting" checked/> 
		 <span class="price bgcolor"  title="10 ${initParam.app_currency}/mo"><span>10</span> ${initParam.app_currency}/mo</span>
		 <span class="info fa fa-info"  data-info="info-colocation">&nbsp;</span>
		 <span class="voice fa fa-microphone">&nbsp;</span>
	     <label  class="text-right"><i class="fa fa-database"></i><span data-translation="server">&nbsp;</span></label>
		 <input data-translation="server" type="radio"  data-price="20" value="private" name="registration.hosting"/> 
		 <span class="private price bgcolor" title="20 ${initParam.app_currency}/mo"><span>20</span> ${initParam.app_currency}/mo</span>
		 <span class="info fa fa-info"  data-info="info-server">&nbsp;</span>
		 <span class="voice fa fa-microphone"  >&nbsp;</span>
		 <span class="wrench fa fa-wrench" data-element="topology">&nbsp;</span>
		 <div id="topology" class="settings">
		     <fieldset class="bgcolor">
		      <h2><i class="fa fa-wrench"></i><span data-translation="topology">&nbsp;</span></h2>
		      <label  class="text-right"><i class="fa fa-database"></i><span data-translation="nodes">&nbsp;</span></label>
		      <input  name="registration.nodes" min="1" max="30" data-action="setNodes" type="number" value="1"/>
		       <span class="info fa fa-info"  data-info="info-nodes">&nbsp;</span>
		       <span class="voice fa fa-microphone"  >&nbsp;</span>
		       <label title="Vertical Scaling per Node" class="text-right"><i class="fa fa-database"></i><span data-translation="cloudlets">&nbsp;</span></label>
		      <input  min="1" max="70" data-action='setFlexibleCloudlets' name="registration.flexibleCloudlets"  type="number" value="4"/>
		       <span class="info fa fa-info"  data-info="info-cloudlets">&nbsp;</span>
		       <span class="voice fa fa-microphone"  >&nbsp;</span>
		       <h6><span>1 cloudlet = </span>&nbsp;128 MiB + 400 MHz</h6>
		       <h6><span data-translation="power">&nbsp;</span>&nbsp;<span class="power">128 MiB + 400 MHz</span></h6>
		      </fieldset>
		 </div>
	</fieldset>
	
	<fieldset>
	  <h1><i class="fa fa-money"></i><span data-translation="pricing">&nbsp;</span></h1>
	     <label  class="text-right"><i class="fa fa-money"></i><span data-translation="amount">&nbsp;</span></label>
		 <span  class="price bgcolor"><span id="amount">&nbsp;</span> ${initParam.app_currency}/mo</span>
	</fieldset>
	
	</section>
	
	<section class="step" data-step-title="confirmation">
	
	<div>
	   <p>
	      <input title="Mailing list subscription" value="true" name="registration.mailing" type="checkbox" checked/> 
		  <span class="mailing">
		  <span  data-translation="mailing-list">&nbsp;</span>
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
<script src='https://www.google.com/recaptcha/api.js' async defer></script>