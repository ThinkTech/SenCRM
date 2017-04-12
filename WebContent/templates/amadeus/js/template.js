$(document).ready(function() {
	//Horizontal Tab
	$('#parentHorizontalTab_agile').easyResponsiveTabs({
		type: 'default', //Types: default, vertical, accordion
		width: 'auto', //auto or any width like 600px
		fit: true, // 100% fit in a container
		tabidentify: 'hor_1' // The tab groups identifier
	});
	$('input[type=email]').focus();
	$(".agile_form").submit(function(event){
		app.authenticate($(this));
		return false;
	});
});