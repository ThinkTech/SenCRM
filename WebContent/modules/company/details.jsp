<%@ taglib prefix="s" uri="/struts-tags"%>
<div id="content">
<div class="buttons">
 <a class="back-16" href="company/${entity.instance}s" title="Back">Back</a>
 <a href="company/${entity.instance}s/create" title="Create ${entity.instance}" class="new-16">Create</a> 
 <a title="Refresh" class="refresh-16">Refresh</a>
 <a title="Help" class="help-16">Help</a> 
</div>
<h1 class="icon-32 ${entity.instance}s-32">${entity.instance} : ${entity.name} ${entity.sigle}</h1>
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
<h2><i class="fa fa-info"></i>Additional Informations</h2>
<div id="tabs"> 
   <div title="Address">
<fieldset>
    <div class="details">
	  <span class="text-right"><i class="fa fa-map-marker"></i>Location :</span>
	 <span>${entity.address.location}</span>
	 <span class="text-right"><i class="fa fa-map-marker"></i>Longitude :</span>
	 <span>${entity.address.longitude}</span>
	  <span class="text-right"><i class="fa fa-map-marker"></i>Latitude :</span>
	 <span>${entity.address.latitude}</span>
	  <span class="text-right"><i class="fa fa-map-marker"></i>Altitude :</span>
	 <span>${entity.address.altitude}</span>
	  <span class="text-right"><i class="fa fa-phone"></i>Telephone :</span>
	 <span>${entity.address.telephone}</span>
	  <span class="text-right"><i class="fa fa-mobile"></i>Mobile :</span>
	 <span>${entity.address.mobile}</span>
	  <span class="text-right"><i class="fa fa-envelope"></i>Email :</span>
	 <span>${entity.address.email}</span>
	  <span class="text-right"><i class="fa fa-envelope"></i>BP :</span>
	 <span>${entity.address.bp}</span>
	  <span class="text-right"><i class="fa fa-print"></i>Fax :</span>
	 <span>${entity.address.fax}</span>
	  <span class="text-right"><i class="fa fa-external-link"></i>Website :</span>
	 <span><a href="${entity.address.website}" target="_blank">${entity.address.website}</a></span>
	</div>
</fieldset>
</div>

<div title="Contact">
<fieldset>
    <div class="details">
	</div>
</fieldset>
</div>

<div title="Account">
<fieldset>
    <div class="details">
	</div>
</fieldset>
</div>

<div title="Projects">
<fieldset>
    <div class="details">
	</div>
</fieldset>
</div>


<div title="Billing">
<fieldset>
    <div class="details">
	</div>
</fieldset>
</div>

</div>
</div>