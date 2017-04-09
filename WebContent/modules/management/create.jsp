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
		<input required title="Name" name="structure.name"  type="text"/>
		
		<label class="text-right">Sigle : </label>
		<input title="Sigle" name="structure.sigle" type="text"/>
		
		<label class="required text-right">Type :</label>
		<select required title="Type" name="structure.type">
		 	<option value="1">Company</option>
		 	<option value="2">Organization</option>
		 	<option value="3">Government</option>
		</select>
		
		<label class="required text-right">Business :</label>
		<select required title="Business" name="structure.business">
		    <option value="1">Software</option>
		 	<option value="2">Hosting</option>
		 	<option value="3">Industrial</option>
		 	<option value="4">Construction</option>
		 	<option value="5">Consulting</option>
		 	<option value="6">Provision of services</option>
		 	<option value="7">Other</option>
		</select>
		
		<label class="required text-right">State :</label>
		<select required title="State" name="structure.state">
		 	<option value="1">rising</option>
		 	<option value="2">growing</option>
		 	<option value="3">strong</option>
		 	<option value="4">struggling</option>
		</select>
		
		<label class="required text-right">Target :</label>
		<select required title="Target" name="structure.target">
		 	<option value="1">Companies</option>
		 	<option value="2">Governments</option>
		 	<option value="3">Communities</option>
		 	<option value="4">all</option>
		</select>
		
		<label class="required text-right"><i class="fa fa-globe"></i>Country :</label>
		<select class="country" required title="Country" name="structure.address.country">
		</select>
		
		<label class="text-right"><i class="fa fa-globe"></i>City :</label>
		<input   title="City" name="structure.address.city" type="text"/>
		
		<label class="text-right"><i class="fa fa-map-marker"></i>Address :</label>
		<input title="Address" name="structure.address.location" type="text"/>
		
		<label class="text-right"><i class="fa fa-phone"></i> Telephone :</label>
		<input title="Telephone" name="structure.address.telephone" type="text"/>
		
	    <label class="text-right"><i class="fa fa-envelope"></i>Email :</label>
		<input title="Email" name="structure.address.email" type="email"/>
		
		<label class="text-right"><i class="fa fa-external-link"></i>Website :</label>
		<input title="Fax" name="structure.address.website" type="text"/>
		
	</fieldset>
	
	 <fieldset>
		<legend>Contact</legend>
		
		<label class="required text-right"><i class="fa fa-user"></i>First Name : </label>
		<input required title="First Name" name="contact.firstName"  type="text"/>
		
		<label class="required text-right"><i class="fa fa-user"></i>Last Name : </label>
		<input required title="Last Name" name="contact.lastName" type="text"/>
		
		<label class="text-right"><i class="fa fa-user"></i>Profession :</label>
		<input title="Profession" name="contact.profession" type="text"/>
	   
	    <label class="text-right"><i class="fa fa-envelope"></i>Email :</label>
		<input title="Email" name="contact.address.email" type="email"/>
		
		<label class="required text-right"><i class="fa fa-globe"></i>Country :</label>
		<select class="country" required title="Country" name="contact.address.country">
		</select>
		
		<label class="text-right"><i class="fa fa-globe"></i>City :</label>
		<input  title="City" name="contact.address.city" type="text"/>
		
		<label class="text-right"><i class="fa fa-phone"></i>Telephone :</label>
		<input title="Mobile" name="contact.address.telephone" type="text"/>
		
		<label class="text-right"><i class="fa fa-mobile"></i>Mobile :</label>
		<input title="Mobile" name="contact.address.mobile" type="text"/>
		<div style="display:${structure.instance == 'customer' || structure.instance == 'partner' ? 'initial' : 'none'}">
		  <label class="text-right"><i class="fa fa-check-square"></i>Allow Access :</label>
		  <input title="Allow Access" value="true" name="structure.createAccount" type="checkbox"/>
		</div>
	</fieldset>
        
	<input type="hidden" name="structure.instance" value="${structure.instance}"/>
	
	<input type="submit" title="Create"  value="Create"/>
</form>

</div>
</div>
<script>
document.addEventListener("DOMContentLoaded",function(){
	$("form").on("submit",function(){
		$("input[type=submit]",this).attr("disabled","disabled");
	});
	app.getCountries("en","SEN");
});
</script>