<%@ taglib prefix="s" uri="/struts-tags"%>
<div class="buttons">
    <a href="${referer}"  class="button"><i class="fa fa-arrow-left"></i>Back</a>
</div>
<div class="registration">
<h1 class="text-center"><i class="fa fa-user"></i>Create your account</h1>
<form id="form" action="registration/register" method="post"> 
   
	 <fieldset>
		<h1><i class="fa fa-user"></i>Manager</h1>
		
		<label class="required text-right"><i class="fa fa-user"></i>First Name : </label>
		<input required title="First Name" name="user.firstName"  type="text"/>
		
		<label class="required text-right"><i class="fa fa-user"></i>Last Name : </label>
		<input required title="Last Name" name="user.lastName" type="text"/>
		
		<label class="required text-right"><i class="fa fa-id-card"></i>Profession : </label>
		<input required title="Profession" name="user.profession" type="text"/>
		
	    <label class="required text-right"><i class="fa fa-envelope"></i>Email :</label>
		<input required title="Email" name="user.email" type="email"/>
		
		<label class="required text-right"><i class="fa fa-language"></i>Language :</label>
		<select title="Language" name="">
		        <option value="en">English</option>
		</select>
		
		<label class="required text-right"><i class="fa fa-key"></i>Password :</label>
		<input required id="password" title="Password" name="user.password" type="password"/>
		
		<label class="required text-right"><i class="fa fa-key"></i>Confirm :</label>
		<input required id="confirm" title="Confirm"  type="password"/>
		
	</fieldset>
	
	<fieldset>
		<h1><i class="fa fa-building"></i>Structure</h1>
		
		<label class="required text-right">Name : </label>
		<input required title="Name" name="account.structure.name"  type="text"/>
		
		<label class="text-right">Sigle : </label>
		<input title="Sigle" name="account.structure.sigle" type="text"/>
		
		<label class="required text-right">Type :</label>
		<select title="Type" name="account.structure.type">
		 	<option value="1">Company</option>
		 	<option value="2">Organization</option>
		 	<option value="3">Government</option>
		</select>
		
		<label class="required text-right">Business :</label>
		<select title="Business" name="account.structure.business">
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
		
		<label class="required text-right">State :</label>
		<select title="State" name="account.structure.state">
		 	<option value="1">rising</option>
		 	<option value="2">growing</option>
		 	<option value="3">strong</option>
		 	<option value="4">struggling</option>
		</select>
		
		<label class="required text-right">Target :</label>
		<select title="Target" name="account.structure.target">
		 	<option value="1">Companies</option>
		 	<option value="2">Governments</option>
		 	<option value="3">Communities</option>
		 	<option value="4">all</option>
		</select>
		
		<label class="required text-right"><i class="fa fa-globe"></i>Country :</label>
		<select class="country" required title="Country" name="account.structure.address.country">
		</select>
		
		<label class="required text-right"><i class="fa fa-globe"></i>City :</label>
		<input  required title="City" name="account.structure.address.city" type="text"/>
		
		<label class="text-right"><i class="fa fa-globe"></i>Address :</label>
		<input   title="City" name="account.structure.address.location" type="text"/>
		
	</fieldset>
	
	
	<fieldset>
	  <h1><i class="fa fa-puzzle-piece"></i>Modules</h1>
	   <s:iterator value="moduleManager.backendModules">
		   <label title="${description}" class="required text-right"><i class="fa fa-puzzle-piece"></i>${name}</label>
		   <input type="checkbox" data-checked="${mandatory}" data-disabled="${mandatory}"/> 
		   <span class="price">2500 XOF/Month</span>
		</s:iterator>
	</fieldset>
	<div>
	   <p>
	      <input type="checkbox" checked/> 
		  <span>Yes, send me emails on ThinkTech Products, Services and Events.</span> 
	   </p>
	</div>
	<div>
	  <p>
	   By clicking on the Create button below, you understand and agree that the use of ${app_name} is subject to these <a href="#">Terms of Use</a> 
	   and this <a href="#">Privacy Policy</a>, including the fact that ThinkTech may transfer your personal information collected in connection with your 
	   registration to its affiliates globally and to third party entities that provide services to ThinkTech.
	  </p>
	</div>
	<div class="captcha">
     <div class="g-recaptcha" data-sitekey="6LfcIBwUAAAAAMpRV6hzY9LHZJWbGyO4k668VXP1"></div>
    </div>    	
	<input type="submit" title="Create Account"  value="Create"/>
</form>

</div>
<script src='https://www.google.com/recaptcha/api.js' async defer></script>