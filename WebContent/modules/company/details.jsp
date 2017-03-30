<%@ taglib prefix="s" uri="/struts-tags"%>
<div id="content">
<h1 class="icon-32 ${entity.instance}s-32">${entity.instance} : ${entity.name} ${entity.sigle} <a title="Help" class="help-16">Help</a> <a title="Refresh" class="refresh-16">Refresh</a> <a href="company/${entity.instance}s/create" title="Create ${entity.instance}" class="new-16">Create</a>  <a class="back-16" href="company/${entity.instance}s" title="Back">Back</a></h1>
<div class="details">
 <span class="text-right">Type :</span>
 <span>${entity.type}</span>
  <span class="text-right">Category :</span>
 <span>${entity.category}</span>
 <span class="text-right">Business :</span>
 <span>${entity.business}</span>
  <span class="text-right">Size :</span>
 <span>${entity.size}</span>
</div>
<div class="details">
 <span class="text-right">Ninea :</span>
 <span>${entity.ninea}</span>
  <span class="text-right">RC :</span>
 <span>${entity.rc}</span>
 <span class="text-right">State :</span>
  <span>${entity.state}</span>
  <span class="text-right">Target :</span>
  <span>${entity.target}</span>
  <span class="text-right">Country :</span> 
  <span>${entity.address.country}</span>
  <span class="text-right">Town :</span>
  <span>${entity.address.town}</span>
</div>
<fieldset>
    <legend>Actual Address</legend>
    <div class="details">
	  <span class="text-right">Location :</span>
	 <span>${entity.address.location}</span>
	 <span class="text-right">Longitude :</span>
	 <span>${entity.address.longitude}</span>
	  <span class="text-right">Latitude :</span>
	 <span>${entity.address.latitude}</span>
	  <span class="text-right">Altitude :</span>
	 <span>${entity.address.altitude}</span>
	  <span class="text-right">Telephone :</span>
	 <span>${entity.address.telephone}</span>
	  <span class="text-right">Mobile :</span>
	 <span>${entity.address.mobile}</span>
	  <span class="text-right">Email :</span>
	 <span>${entity.address.email}</span>
	  <span class="text-right">BP :</span>
	 <span>${entity.address.bp}</span>
	  <span class="text-right">Fax :</span>
	 <span>${entity.address.fax}</span>
	  <span class="text-right">Website :</span>
	 <span><a href="${entity.address.website}" target="_blank">${entity.address.website}</a></span>
	</div>
</fieldset>
</div>