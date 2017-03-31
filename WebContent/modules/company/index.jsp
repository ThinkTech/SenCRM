<%@ taglib prefix="s" uri="/struts-tags"%>
<div id="content">
<div class="buttons">
<a href="company/customers/create" title="Create Customer" class="new-16">Create</a>
 <a title="Refresh" class="refresh-16">Refresh</a> 
 <a title="Help" class="help-16">Help</a> 
</div>
<h1 class="customers-32">Customers</h1>
<form id="search" action="company/customers/search" method="post">
	<span>Search :</span>
	<select name="search.filter">
	  <option value="id">ID</option>
	  <option value="name">Name</option>
	   <option value="type">Type</option>
	   <option value="category">Category</option>
       <option value="country">Country</option>
       <option value="createdBy">Created By</option>
	</select>
	<input name="search.value" type="text" value="${search.value}" placeholder="Search..."/>
</form>
<div id="list">
<table>
 <thead>
    <tr>
       <th title="ID">ID</th>
       <th title="Name">Name</th>
       <th title="Type">Type</th>
       <th title="Category">Category</th>
       <th title="Country">Country</th>
       <th title="Created On">Created On</th>
       <th title="Created By">Created By</th>
    </tr>
 </thead>

<tbody>
  
  <s:iterator value="entities">
	<tr>
	<td class="customer-16">${id}</td>
	<td title="${name}"><a href="company/customers/details?id=${id}">${name}</a></td>
	<td>${type}</td>
	<td>${category}</td>
	<td>${address.country}</td>
	<td><s:date name="createdOn" format="dd/MM/yyyy hh:mm:ss" /></td>
	<td>${createdBy.fullName}</td>
	</tr>
</s:iterator>
   
 </tbody>
  
</table>

</div>
</div>
<script>
document.addEventListener("DOMContentLoaded", () => {
	const filter = "${search.filter}";
	if(filter) $("#search select").val(filter); 
});
</script>