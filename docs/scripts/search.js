/*
	Title: Search code.kx.com
	Author: stephen@kx.com
*/
$(function() {
	$("form").submit(function(){
		var url = "http://" + window.location.host + "/?query=" + $("input").val();
		console.log(url);
		window.location = (url);
		return false;
	});
});