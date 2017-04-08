<%@ taglib prefix="s" uri="/struts-tags"%>
<div id="content">
<div class="buttons">
 <a href="company/partners/create" title="Create Partner" class="new-16">Create</a>
  <a  title="Refresh" class="refresh-16">Refresh</a> 
 <a title="Help" class="help-16">Help</a>
</div>
<h1 class="partners-32">Partners</h1>
<form id="search" action="company/partners/search" method="post">
	<span>Search :</span>
	<select name="search.filter">
	  <option value="name">Name</option>
       <option value="country">Country</option>
       <option value="city">City</option>
	   <option value="location">Location</option>
	</select>
	<input name="search.value" type="text" value="${search.value}" placeholder="Search..."/>
</form>
<div id="list">
<table>
 <thead>
    <tr>
       <th title="Name">Name</th>
       <th title="Country">Country</th>
       <th title="City">City</th>
       <th title="Location">Location</th>
       <th title="Created on">Created on</th>
    </tr>
 </thead>

<tbody>
  
  <s:iterator value="structures">
	<tr>
	<td class="partner-16" title="${name}"><a href="company/partners/details?id=${id}">${name}</a></td>
	<td>${address.country}</td>
	<td>${address.city}</td>
	<td>${address.location}</td>
	<td><s:date name="createdOn" format="dd/MM/yyyy hh:mm:ss" /></td>
	</tr>
</s:iterator>
   
 </tbody>
  
</table>

</div>

</div>
<script>
document.addEventListener("DOMContentLoaded",function(){
	const filter = "${search.filter}";
	if(filter) $("#search select").val(filter); 
});
</script>