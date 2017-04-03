const validate = function(){
    if(CKEDITOR.instances.editor.getData().trim() =='') {
	  alert("Enter your message",function(){
		  CKEDITOR.instances.editor.focus(); 
	  });
	  return false;
    }
    $("input[type=submit]",this).attr("disabled","disabled");
	return true;
};
