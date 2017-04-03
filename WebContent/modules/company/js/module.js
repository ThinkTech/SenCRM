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
document.addEventListener("DOMContentLoaded",function(){
	head.load("//cdnjs.cloudflare.com/ajax/libs/jquery-form-validator/2.3.26/jquery.form-validator.min.js",function(){
		$.validate({
		    validateOnBlur: false,
		    errorMessagePosition: 'top',
		    lang: 'en',
		    onSuccess: function(form) {
		     $("input[type=submit]",form).attr("disabled","disabled");
		      return true;
		    }
		 });
	});
});