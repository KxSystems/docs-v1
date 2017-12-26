/*
	Title: Search code.kx.com
	Author: stephen@kx.com

	Script for results from custom search engine
*/
$(function() {
	$("form").submit(function(){
		var url = "http://" + window.location.host + "/?query=" + $("input").val();
		console.log(url);
		window.location = (url);
		return false;
	});
	$("#query").focus();
});