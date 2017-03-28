<div id="content">
<h1 class="icon-32 ${entity}s-32">New ${entity} <a title="Help" class="help-16">Help</a> <a href="company/${entity}s" title="Back" class="back-16">Back</a></h1>
<div>

<form id="form"> 
   
     <fieldset class="info">
		<legend>${entity}</legend>
		
		<label class="required text-right">Name : </label>
		<input title="Name" name="name"  type="text"/>
		
		<label class="required text-right">Sigle : </label>
		<input title="Sigle" name="sigle" type="text"/>
		
		<label class="required text-right">Type :</label>
		<select title="Type" name="type">
		 	<option>Company</option>
		 	<option>Organization</option>
		</select>
		
		<label class="text-right">Category :</label>
		<select title="Category" name="category">
		 	<option>Individual</option>
		 	<option>S.A</option>
		 	<option>S.A.R.L</option>
		</select>
		
		<label class="required text-right">Country :</label>
		<select title="Country" name="country">
			 <option>Senegal</option>
		</select>
		
		<label class="required text-right">Town :</label>
		<input title="Town" name="town" type="text"/>
		
		<label class="text-right">Address :</label>
		<input title="Address" name="address" type="text"/>
		
		<label class="text-right">Telephone :</label>
		<input title="Telephone" name="telephone" type="text"/>
		
		<label class="text-right">Mobile :</label>
		<input title="Mobile" name="mobile" type="text"/>
	   
	    <label class="text-right">Email :</label>
		<input title="Email" name="email" type="text"/>
		
		<label class="text-right">BP :</label>
		<input title="BP" name="bp" type="text"/>
		
		<label class="text-right">Fax :</label>
		<input title="Fax" name="fax" type="text"/>
		
		<input name="createdBy" type="hidden" value="tetiana"/>
	
	</fieldset>
      
           <fieldset class="info">
		<legend>Contact</legend>
		
		<label class="required text-right">First Name : </label>
		<input title="First Name" name="contact[firstName]" type="text"/>
		
		<label class="required text-right">Last Name : </label>
		<input title="Last Name" name="contact[lastName]" type="text"/>
		
		<label class="text-right">Profession :</label>
		<input title="Profession" name="contact[profession]" type="text"/>
		
		<label class="text-right">Date Of Birth :</label>
		<input title="Date Of Birth" name="contact[dateOfBirth]" type="text"/>
		
		<label class="required text-right">Gender :</label>
		<select title="Gender" name="contact[sex]">
			 <option>Male</option>
		 	<option selected="selected">Female</option>
		</select>
		
		<label class="required text-right">Country :</label>
		<select title="Country" name="contact[country]">
		     <option>Senegal</option>
			 <option>USA</option>
		</select>
		
		<label class="text-right">Town :</label>
		<input title="Town" name="town" type="text"/>
		
		<label class="text-right">Telephone :</label>
		<input title="Telephone" name="contact[telephone]" type="text"/>
		
		<label class="text-right">Mobile :</label>
		<input title="Mobile" name="contact[mobile]" type="text"/>
	   
	    <label class="text-right">Email :</label>
		<input title="Email" name="contact[email]" type="text"/>
	
	</fieldset>
	<input type="submit" title="Send Message"  value="Send"/>
</form>

</div>
</div>