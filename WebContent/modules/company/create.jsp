<div id="content">
<h1 class="icon-32 ${entity.instance}s-32">New ${entity.instance} <a title="Help" class="help-16">Help</a> <a href="company/${entity.instance}s" title="Back" class="back-16">Back</a></h1>
<div>

<form id="form" action="company/saveEntity" method="post"> 
   
     <fieldset class="info">
		<legend>${entity.instance}</legend>
		
		<label class="required text-right">Name : </label>
		<input title="Name" name="entity.name"  type="text"/>
		
		<label class="text-right">Sigle : </label>
		<input title="Sigle" name="entity.sigle" type="text"/>
		
		<label class="required text-right">Type :</label>
		<select title="Type" name="entity.type">
		 	<option value="1">Company</option>
		 	<option value="2">Organization</option>
		</select>
		
		<label class="text-right">Category :</label>
		<select title="Category" name="entity.category">
		 	<option value="2">S.A</option>
		 	<option value="3">S.A.R.L</option>
		 	<option value="1">Individual</option>
		</select>
		
		<label class="required text-right">Country :</label>
		<select title="Country" name="entity.country">
			 <option value="Senegal">Senegal</option>
		</select>
		
		<label class="required text-right">Town :</label>
		<input title="Town" name="entity.town" type="text"/>
		
		<label class="text-right">Address :</label>
		<input title="Address" name="entity.address" type="text"/>
		
		<label class="text-right">Telephone :</label>
		<input title="Telephone" name="entity.telephone" type="text"/>
		
		<label class="text-right">Mobile :</label>
		<input title="Mobile" name="entity.mobile" type="text"/>
	   
	    <label class="text-right">Email :</label>
		<input title="Email" name="entity.email" type="text"/>
		
		<label class="text-right">BP :</label>
		<input title="BP" name="entity.bp" type="text"/>
		
		<label class="text-right">Fax :</label>
		<input title="Fax" name="entity.fax" type="text"/>
		
	
	</fieldset>
      
           <fieldset class="info">
		<legend>Contact</legend>
		
		<label class="required text-right">First Name : </label>
		<input title="First Name" name="entity.contact.firstName" type="text"/>
		
		<label class="required text-right">Last Name : </label>
		<input title="Last Name" name="entity.contact.lastName" type="text"/>
		
		<label class="text-right">Profession :</label>
		<input title="Profession" name="entity.contact.profession" type="text"/>
		
		<label class="text-right">Date Of Birth :</label>
		<input title="Date Of Birth" name="entity.contact.dateOfBirth" type="text"/>
		
		<label class="required text-right">Gender :</label>
		<select title="Gender" name="entity.contact.gender">
			 <option>Male</option>
		 	<option selected="selected">Female</option>
		</select>
		
		<label class="required text-right">Country :</label>
		<select title="Country" name="entity.contact.country">
		     <option>Senegal</option>
			 <option>USA</option>
		</select>
		
		<label class="text-right">Town :</label>
		<input title="Town" name="entity.contact.town" type="text"/>
		
		<label class="text-right">Telephone :</label>
		<input title="Telephone" name="entity.contact.telephone" type="text"/>
		
		<label class="text-right">Mobile :</label>
		<input title="Mobile" name="entity.contact.mobile" type="text"/>
	   
	    <label class="text-right">Email :</label>
		<input title="Email" name="entity.contact.email" type="text"/>
	
	</fieldset>
	
	<input type="hidden" name="entity.instance" value="${entity.instance}"/>
	
	<input type="submit" title="Create ${entity.instance}"  value="Create"/>
</form>

</div>
</div>