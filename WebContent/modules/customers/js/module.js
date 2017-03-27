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
document.addEventListener("DOMContentLoaded", () => {
	var tbody = $("tbody");
	const rows = $("tr",tbody).length; 
	if(!rows) {
		tbody.append("<tr class='empty'><td valign='top' colspan='"+$("th").length+"'>no record found</td></tr>");
		$("<div class='row-count'/>").html("0 records").insertAfter("#list");
	}else {
		page.table.paginate();
		$("<div class='row-count'/>").html(rows + " records").insertAfter("#list");
	}
	$("#search input").focus().val($("#search input").val());
});