const validate = function() {
    if(CKEDITOR.instances.editor.getData().trim() =='') {
	  alert("Enter your message",function() {
		  CKEDITOR.instances.editor.focus(); 
	  });
	  return false;
    } 
	return true;
};
const closeTicket = function(event,message) {
	const href = $(event.target).attr("href");
	confirm(message,function() {
		window.location.href = href;
	});
	return false;
};