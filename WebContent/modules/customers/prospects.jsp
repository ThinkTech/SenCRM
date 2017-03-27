<%@ taglib prefix="s" uri="/struts-tags"%>
<div id="content">
<h1 class="prospects-32">Prospects <a title="Help" class="help-16">Help</a> <a href="tickets" title="Refresh" class="refresh-16">Refresh</a> <a href="tickets/createTicket" title="Create Ticket" class="new-16">Create</a></h1>
<form id="search" action="tickets/opened/search" method="post">
	<span>Search :</span>
	<select name="search.filter">
	  <option value="">ID</option>
	  <option value="">First Name</option>
	   <option value="" >Last Name</option>
       <option value="">Date Of Birth</option>
       <option value="">Country</option>
       <option value="">Created By</option>
	</select>
	<input name="search.value" type="text" value="${search.value}" placeholder="Search..."/>
</form>
<div id="list">
<table>
 <thead>
    <tr>
       <th title="ID">ID</th>
       <th title="First Name">First Name</th>
       <th title="Last Name">Last Name</th>
       <th title="Profession">Profession</th>
       <th title="Date Of Birth">Date Of Birth</th>
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
<div class="row-count"></div>
</div>
<script>
document.addEventListener("DOMContentLoaded", () => {
	const filter = "${search.filter}";
	if(filter) $("#search select").val(filter); 
});
</script>