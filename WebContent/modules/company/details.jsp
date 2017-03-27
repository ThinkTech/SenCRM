<%@ taglib prefix="s" uri="/struts-tags"%>
<div id="content">
<h1 class="icon-32">Ticket : ${ticket.id} <a title="Help" class="help-16">Help</a> <a title="Refresh" class="refresh-16" style="display:${ticket.dateClose==null ? 'inline-block':'none'}">Refresh</a> <a href="tickets/createTicket" title="Create Ticket" class="new-16">Create</a>  <a class="back-16" href="${ticket.dateClose==null ? 'tickets' :'tickets/closed'}" title="Back">Back</a></h1>
<h3>${ticket.subject}</h3>
<a href="tickets/closeTicket?id=${ticket.id}" title="Close it now" class="close-ticket ${ticket.user.role}" onclick="return closeTicket(event,'Are you sure that you want to close this ticket?');" style="display:${ticket.dateClose==null ? 'block':'none'}">Close it now</a>
<div class="ticket-details">
 <span class="title text-right">Created on :</span>
 <span><s:date name="ticket.dateCreation" format="dd/MM/yyyy hh:mm:ss" /></span><br>
 <span class="title text-right">Last message on :</span>
 <span><s:date name="ticket.dateCreation" format="dd/MM/yyyy hh:mm:ss" /></span><br>
 <span class="title text-right">Current status :</span>
 <span>${ticket.status}</span>
</div>
<div class="ticket-details">
 <span class="title text-right">Department :</span>
 <span>${ticket.department}</span><br>
 <span class="title text-right">Product :</span>
 <span>${ticket.product}</span><br>
 <span class="title text-right">Priority :</span>
 <span>${ticket.priority}</span><br>
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
  document.addEventListener("DOMContentLoaded", () => {
		$("a.refresh-16").attr("href",window.location.href);
	});
</script>