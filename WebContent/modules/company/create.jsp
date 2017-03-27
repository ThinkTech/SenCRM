<div id="content">
<h1 class="icon-32">New Ticket <a title text-right="Help" class="help-16">Help</a> <a href="tickets" title text-right="Back" class="back-16">Back</a></h1>
<div>

<form class="form-ticket" onsubmit="return validate();" action="tickets/saveTicket">
<fieldset>
<div>
<label class="title text-right">Department :</label>
<select name="ticket.department">
<option value="Software">Software</option>
</select>
<label class="title text-right">Product :</label>
<select name="ticket.product">
<option value="SenTube">SenTube</option>
<option value="SenCRM">SenCRM</option>
<option value="SenTickets">SenTickets</option>
</select>
<label class="title text-right" class="required">Subject :</label>
<input type="text" required name="ticket.subject" maxlength="50"/>
<label class="title text-right">Priority :</label>
<select name="ticket.priority">
<option value="low">low</option>
<option value="normal" selected>normal</option>
<option value="urgent">urgent</option>
</select>
<h3>Enter your Message</h3>
<div class="message">
<textarea id="editor" name="ticket.message"> </textarea>
</div>
<input type="submit" title="Send Message"  value="Send"/>
</div>
</fieldset>
</form>
</div>
</div>
<script src="https://cdn.ckeditor.com/4.6.2/basic/ckeditor.js"></script>
<script>
  CKEDITOR.replace('editor');
  document.addEventListener("DOMContentLoaded", () => {
		$("input:first").focus();
  });
</script>