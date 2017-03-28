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
