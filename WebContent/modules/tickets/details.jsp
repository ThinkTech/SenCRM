<%@ taglib prefix="s" uri="/struts-tags"%>
<div id="content">
<div class="buttons">
<a href="tickets/closeTicket?id=${ticket.id}" title="Close it now" class="icon-16" onclick="return closeTicket(event,'Are you sure that you want to close this ticket?');" style="${ticket.dateClose==null ? '':'display:none'}">Close it now</a>
<a href="${referer}" title="Back" class="back-16">Back</a>
<a title="Refresh" class="refresh-16" style="${ticket.dateClose==null ? '':'display:none'}">Refresh</a>
<a href="tickets/create" title="Create Ticket" class="new-16">Create</a> 
<a title="Help" class="help-16">Help</a>    
</div>
<h1 class="icon-32">Ticket : ${ticket.id}</h1>
<h3>${ticket.subject}</h3>
<div class="details">
 <span class="text-right">Current status :</span>
 <span>${ticket.status}</span>
 <span class="text-right">Department :</span>
 <span>${ticket.department}</span>
 <span class="text-right">Product :</span>
 <span>${ticket.product}</span>
 <span class="text-right">Priority :</span>
 <span>${ticket.priority}</span>
  <span class="text-right">Created on :</span>
 <span><s:date name="ticket.dateCreation" format="dd/MM/yyyy hh:mm:ss" /></span>
 <span class="text-right">Last message on :</span>
 <span><s:date name="ticket.dateCreation" format="dd/MM/yyyy hh:mm:ss" /></span>
 <span class="text-right">Created by :</span>
 <span>${ticket.user.fullName}</span>
 <span class="text-right">Structure :</span>
 <span>${ticket.user.structure.name}</span>
</div>
<div class="ticket-messages">
<div class="ticket-message">
   <div class="ticket-message-header">
     <span class="user-type account-16 ${ticket.user.role}">${ticket.user.role}</span>
     <span class="user-name">${ticket.user.fullName}</span>
     <div class="time">
       <span>Date : <s:date name="ticket.dateCreation" format="dd/MM/yyyy hh:mm:ss" /></span>
     </div>
   </div>
   <div>
     ${ticket.message}
   </div>
   <hr/>
</div>
<s:iterator value="ticket.messages">
 <div class="ticket-message">
   <div class="ticket-message-header">
     <span class="user-type account-16 ${ticket.user.role}">${ticket.user.role}</span>
     <span class="user-name">${ticket.user.fullName}</span>
     <div class="time">
       <span>Date : <s:date name="dateCreation" format="dd/MM/yyyy hh:mm:ss" /></span>
     </div>
   </div>
   <div>
     ${content}
   </div>
   <hr/>
</div>
</s:iterator>
<div style="display:${ticket.dateClose==null ? 'block':'none'}">
<h4>Post a Message</h4>
<form class="form-ticket" onsubmit="return validate();" action="tickets/addMessage">
<div class="message">
<textarea id="editor" name="message.content"> </textarea>
</div>
<input name="ticket.id" type="hidden" value="${ticket.id}"/>
<input name="ticket.subject" type="hidden" value="${ticket.subject}"/>
<input type="submit" title="Send Message" value="Send"/>
</form>
</div>
</div>
</div>
<script src="https://cdn.ckeditor.com/4.6.2/basic/ckeditor.js"></script>
<script>
  CKEDITOR.replace('editor',{on:{
	  'instanceReady': function(evt) {
		  CKEDITOR.instances.editor.focus(); 
  }}});
</script>