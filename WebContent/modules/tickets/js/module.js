const validate = () => {
    if(CKEDITOR.instances.editor.getData().trim() =='') {
	  alert("Enter your message",() => {
		  CKEDITOR.instances.editor.focus(); 
	  });
	  return false;
    } 
    $("input[type=submit]").attr("disabled","disabled");
	return true;
};
const closeTicket = function(event,message) {
	confirm(message,() => {
		const href = $(event.target).attr("href");
		location.href = href;
	});
	return false;
};