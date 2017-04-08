<%@ taglib prefix="s" uri="/struts-tags"%>
<div id="content">
<div class="buttons">
 <a href="${referer}" title="Back" class="back-16">Back</a>
 <a href="${baseUrl}/company/delete?id=${structure.id}&instance=${structure.instance}" title="Delete" class="delete-16" onclick="return deleteStructure(event,'Are you sure that you want to delete this structure?');">Delete</a>
 <a href="company/${structure.instance}s/create" title="Create ${structure.instance}" class="new-16">Create</a> 
 <a title="Refresh" class="refresh-16">Refresh</a>
 <a title="Help" class="help-16">Help</a> 
</div>
<h1 class="icon-32 ${structure.instance}s-32">${structure.instance} : ${structure.name} ${structure.sigle}</h1>
<div class="details">
 <span class="text-right">Type :</span>
 <span>${structure.type}</span>
 <span class="text-right">Business :</span>
 <span>${structure.business}</span>
</div>
<div class="details">
 <span class="text-right">State :</span>
  <span>${structure.state}</span>
  <span class="text-right">Target :</span>
  <span>${structure.target}</span>
  <span class="text-right"><i class="fa fa-globe"></i>Country :</span> 
  <span>${structure.address.country}</span>
  <span class="text-right"><i class="fa fa-globe"></i>City :</span>
  <span>${structure.address.city}</span>
  <span class="text-right">Created on :</span>
  <span><s:date name="structure.createdOn" format="dd/MM/yyyy hh:mm:ss" /></span>
  <span class="text-right">Created by :</span>
  <span>${structure.createdBy.fullName}</span>
</div>
<h2><i class="fa fa-info"></i>Informations</h2>
<div id="tabs">

<div title="Address">
<fieldset>
    <div class="details">
	  <span class="text-right"><i class="fa fa-map-marker"></i>Location :</span>
	 <span>${structure.address.location}</span>
	 <span class="text-right"><i class="fa fa-map-marker"></i>Longitude :</span>
	 <span>${structure.address.longitude}</span>
	  <span class="text-right"><i class="fa fa-map-marker"></i>Latitude :</span>
	 <span>${structure.address.latitude}</span>
	  <span class="text-right"><i class="fa fa-map-marker"></i>Altitude :</span>
	 <span>${structure.address.altitude}</span>
	  <span class="text-right"><i class="fa fa-phone"></i>Telephone :</span>
	 <span>${structure.address.telephone}</span>
	  <span class="text-right"><i class="fa fa-envelope"></i>Email :</span>
	 <span><a href="mailto:${structure.address.email}">${structure.address.email}</a></span>
	  <span class="text-right"><i class="fa fa-envelope"></i>BP :</span>
	 <span>${structure.address.bp}</span>
	  <span class="text-right"><i class="fa fa-print"></i>Fax :</span>
	 <span>${structure.address.fax}</span>
	  <span class="text-right"><i class="fa fa-external-link"></i>Website :</span>
	 <span><a href="${structure.address.website}" target="_blank">${structure.address.website}</a></span>
	  <span class="text-right"><i class="fa fa-youtube"></i>Youtube :</span>
	 <span><a href="${structure.address.youtube}" target="_blank">${structure.address.youtube}</a></span>
	  <span class="text-right"><i class="fa fa-facebook"></i>Facebook :</span>
	 <span><a href="${structure.address.facebook}" target="_blank">${structure.address.facebook}</a></span>
	  <span class="text-right"><i class="fa fa-twitter"></i>Twitter :</span>
	 <span><a href="${structure.address.twitter}" target="_blank">${structure.address.twitter}</a></span>
	</div>
</fieldset>
</div>

<div title="Contacts">
<fieldset>
    <div class="details">
       <s:iterator value="structure.contacts">
          <span class="text-right">First Name :</span>
		  <span>${firstName}</span>
		  <span class="text-right">Last Name :</span>
		  <span>${lastName}</span>
		  <span class="text-right">Profession :</span> 
		  <span>${profession}</span>
		  <span class="text-right">Email :</span>
		  <span><a href="mailto:${address.email}">${address.email}</a></span>
		  <span class="text-right"><i class="fa fa-globe"></i>Country :</span> 
		  <span>${address.country}</span>
		  <span class="text-right"><i class="fa fa-globe"></i>City :</span>
		  <span>${address.city}</span>
		  <span class="text-right"><i class="fa fa-phone"></i>Telephone :</span>
	     <span>${address.telephone}</span>
	      <span class="text-right"><i class="fa fa-mobile"></i>Mobile :</span>
	     <span>${address.mobile}</span>
	     <span class="text-right"><i class="fa fa-envelope"></i>BP :</span>
	   <span>${address.bp}</span>
	  <span class="text-right"><i class="fa fa-print"></i>Fax :</span>
	 <span>${address.fax}</span>
	  <span class="text-right"><i class="fa fa-external-link"></i>Website :</span>
	   <span><a href="${address.website}" target="_blank">${address.website}</a></span>
	  <span class="text-right"><i class="fa fa-youtube"></i>Youtube :</span>
	 <span><a href="${address.youtube}" target="_blank">${address.youtube}</a></span>
	  <span class="text-right"><i class="fa fa-facebook"></i>Facebook :</span>
	 <span><a href="${address.facebook}" target="_blank">${address.facebook}</a></span>
	  <span class="text-right"><i class="fa fa-twitter"></i>Twitter :</span>
	 <span><a href="${address.twitter}" target="_blank">${address.twitter}</a></span>
	 <span class="text-right">Created on :</span>
    <span><s:date name="createdOn" format="dd/MM/yyyy hh:mm:ss" /></span>
    <span class="text-right">Created by :</span>
    <span>${createdBy.fullName}</span>
	  </s:iterator>
	</div>
</fieldset>
</div>

<div title="Accounts">
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

<div title="Additional">
<fieldset>
    <div class="details">
    </div>
</fieldset>
</div>

</div>
</div>