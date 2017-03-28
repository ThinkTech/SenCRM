<%@ taglib prefix="s" uri="/struts-tags"%>
<div id="content">
<h1 class="partners-32">Partners <a title="Help" class="help-16">Help</a> <a  title="Refresh" class="refresh-16">Refresh</a> <a href="company/partners/create" title="Create Partner" class="new-16">Create</a></h1>
<form id="search" action="company/partners/search" method="post">
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
       <th title="Created By">Created By</th>
    </tr>
 </thead>

<tbody>
  
  <s:iterator value="tickets">
	<tr>
	<td class="icon-16">${id}</td>
	<td title="${subject}"><a href="tickets/opened/details?id=${id}">${subject}</a></td>
	<td><s:date name="dateCreation" format="dd/MM/yyyy hh:mm:ss" /></td>
	<td>${product}</td>
	<td>${department}</td>
	<td>${priority}</td>
	<td>${status}</td>
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