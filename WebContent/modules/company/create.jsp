<div id="content">
<div class="buttons">
 <a href="${referer}" title="Back" class="back-16">Back</a>
 <a title="Help" class="help-16">Help</a> 
</div>
<h1 class="icon-32 ${structure.instance}s-32">Create ${structure.instance}</h1>
<div>
<form id="form" action="company/save" method="post"> 
   
     <fieldset>
		<legend>${structure.instance}</legend>
		
		<label class="required text-right">Name : </label>
		<input data-validation="required" title="Name" name="structure.name"  type="text"/>
		
		<label class="text-right">Sigle : </label>
		<input title="Sigle" name="structure.sigle" type="text"/>
		
		<label class="required text-right">Type :</label>
		<select data-validation="required" title="Type" name="structure.type">
		 	<option value="Company">Company</option>
		 	<option value="Organization">Organization</option>
		 	<option value="Government">Government</option>
		</select>
		
		<label class="required text-right">Category :</label>
		<select data-validation="required" title="Category" name="structure.category">
		 	<option value="S.A">S.A</option>
		 	<option value="S.A.R.L">S.A.R.L</option>
		 	<option value="Individual">Individual</option>
		 	<option value="Commercial">Commercial</option>
		</select>
		<label class="required text-right">Business :</label>
		<select data-validation="required" title="Category" name="structure.business">
		    <option value="Software">Software</option>
		 	<option value="Hosting">Hosting</option>
		 	<option value="Industrial">Industrial</option>
		 	<option value="Construction">Construction</option>
		 	<option value="Consulting">Consulting</option>
		 	<option value="Provision of services">Provision of services</option>
		 	<option value="Other">Other</option>
		</select>
		<label class="required text-right">Size :</label>
		<select data-validation="required" title="Category" name="structure.size">
		 	<option value="Small">Small</option>
		 	<option value="Medium">Medium</option>
		 	<option value="Big">Big</option>
		</select>
		
		<label class="required text-right">State :</label>
		<select data-validation="required" title="State" name="structure.state">
		 	<option value="rising">starting</option>
		 	<option value="growing">growing</option>
		 	<option value="strong">strong</option>
		 	<option value="struggling">struggling</option>
		 	<option value="falling">falling</option>
		</select>
		
		<label class="required text-right">Target :</label>
		<select data-validation="required" title="Target" name="structure.target">
		 	<option value="Companies">Companies</option>
		 	<option value="Governments">Governments</option>
		 	<option value="Communities">Communities</option>
		 	<option value="all">all</option>
		</select>
		
		<label class="required text-right"><i class="fa fa-globe"></i>Country :</label>
		<select class="country" data-validation="required" title="Country" name="structure.address.country">
		</select>
		
		<label class="required text-right"><i class="fa fa-globe"></i>Town :</label>
		<input class="town" data-validation="required" title="Town" name="structure.address.town" type="text"/>
		
		
	</fieldset>
	
	 <fieldset>
		<legend>Contact</legend>
		
		<label class="required text-right"><i class="fa fa-user"></i>First Name : </label>
		<input data-validation="required" title="First Name" name="contact.firstName"  type="text"/>
		
		<label class="required text-right"><i class="fa fa-user"></i>Last Name : </label>
		<input data-validation="required" title="Last Name" name="contact.lastName" type="text"/>
		
		<label class="text-right"><i class="fa fa-user"></i>Profession :</label>
		<input data-validation="required" title="Profession" name="contact.profession" type="text"/>
	   
	    <label class="text-right"><i class="fa fa-envelope"></i>Email :</label>
		<input data-validation="required" title="Email" name="contact.email" type="text"/>
		
		<label class="required text-right"><i class="fa fa-globe"></i>Country :</label>
		<select class="country" data-validation="required" title="Country" name="contact.address.country">
		</select>
		
		<label class="required text-right"><i class="fa fa-globe"></i>Town :</label>
		<input class="town" data-validation="required" title="Town" name="contact.address.town" type="text"/>
		
		<label class="text-right"><i class="fa fa-phone"></i>Telephone :</label>
		<input title="Mobile" name="contact.address.telephone" type="text"/>
		
		<label class="text-right"><i class="fa fa-mobile"></i>Mobile :</label>
		<input title="Mobile" name="contact.address.mobile" type="text"/>
		
		<label class="text-right"><i class="fa fa-key"></i>Create Account :</label>
		<input title="Create Account" name="" type="checkbox"/>
		
		<label class="text-right"><i class="fa fa-connectdevelop"></i>Send Invitation :</label>
		<input title="Send Invitation" name="" type="checkbox"/>
		
	</fieldset>
      
      <fieldset>
        <legend>Address</legend>
		
		<label class="text-right"><i class="fa fa-map-marker"></i>Location :</label>
		<input title="Address" name="structure.address.location" type="text"/>
		
		<label class="text-right"><i class="fa fa-phone"></i> Telephone :</label>
		<input title="Telephone" name="structure.address.telephone" type="text"/>
		
	    <label class="text-right"><i class="fa fa-envelope"></i>Email :</label>
		<input title="Email" name="structure.address.email" type="text"/>
		
		<label class="text-right"><i class="fa fa-envelope"></i>BP :</label>
		<input title="BP" name="structure.address.bp" type="text"/>
		
		<label class="text-right"><i class="fa fa-print"></i>Fax :</label>
		<input title="Fax" name="structure.address.fax" type="text"/>
		
		<label class="text-right"><i class="fa fa-external-link"></i>Website :</label>
		<input title="Fax" name="structure.address.website" type="text"/>
		
      </fieldset>
      
        
	<input type="hidden" name="structure.instance" value="${structure.instance}"/>
	
	<input type="submit" title="Create"  value="Create"/>
</form>

</div>
</div>
<script>
document.addEventListener("DOMContentLoaded",function(){
	head.load("//cdnjs.cloudflare.com/ajax/libs/jquery-form-validator/2.3.26/jquery.form-validator.min.js",function(){
		$.validate({
		    validateOnBlur: false,
		    errorMessagePosition: 'top',
		    lang: 'en',
		    onSuccess: function(form) {
		     $("input[type=submit]",form).attr("disabled","disabled");
		      return true;
		    }
		 });
	});
	app.getCountries("en","SEN");
});
</script>