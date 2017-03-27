<div id="content">
<h1 class="icon-32 ${entity}s-32">New ${entity} <a title="Help" class="help-16">Help</a> <a href="company/${entity}s" title="Back" class="back-16">Back</a></h1>
<div>

<form id="form"> 
   
     <fieldset class="info">
		<legend>${entity}</legend>
		
		<label class="required text-right">First Name : </label>
		<input title="First Name" name="firstName"  type="text"/>
		
		<label class="required text-right">Last Name : </label>
		<input title="Last Name" name="lastName" type="text"/>
		
		<label class="required text-right">Type :</label>
		<select title="Type" name="type">
			 <option>Individual</option>
		 	<option>Company</option>
		</select>
		
		<label class="text-right">Profession :</label>
		<input title="Profession" name="profession" type="text"/>
		
		<label class="text-right">Date Of Birth :</label>
		<input title="Date Of Birth" name="dateOfBirth" type="text"/>
		
		<label class="required text-right">Sex :</label>
		<select title="Sex" name="sex">
			 <option>Male</option>
		 	<option>Female</option>
		</select>
		
		<label class="required text-right">Country :</label>
		<select title="Country" name="country">
			 <option>USA</option>
		</select>
		
		<label class="text-right">Telephone :</label>
		<input title="Telephone" name="telephone" type="text"/>
		
		<label class="required text-right">Mobile :</label>
		<input title="Mobile" name="mobile" type="text"/>
	   
	    <label class="text-right">Email :</label>
		<input title="Email" name="email" type="text"/>
		
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
		
		<label class="required text-right">Sex :</label>
		<select title="Sex" name="contact[sex]">
			 <option>Male</option>
		 	<option selected="selected">Female</option>
		</select>
		
		<label class="required text-right">Country :</label>
		<select title="Country" name="contact[country]">
			 <option>USA</option>
		</select>
		
		<label class="required text-right">Relation :</label>
		<select title="Relation"  name="contact[relation]">
		     <option>Wife</option>
			 <option>Husband</option>
			 <option>Parent</option>
			 <option>Friend</option>
			 <option>Other</option>
		</select>
		
		<label class="text-right">Telephone :</label>
		<input title="Telephone" name="contact[telephone]" type="text"/>
		
		<label class="required text-right">Mobile :</label>
		<input title="Mobile" name="contact[mobile]" type="text"/>
	   
	    <label class="text-right">Email :</label>
		<input title="Email" name="contact[email]" type="text"/>
	
	</fieldset>
	<input type="submit" title="Send Message"  value="Send"/>
</form>

</div>
</div>