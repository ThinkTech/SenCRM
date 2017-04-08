const deleteStructure = function(event,message) {
	const href = $(event.target).attr("href");
	confirm(message,function() {
		window.location.href = href;
	});
	return false;
};