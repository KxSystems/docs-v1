/*
    Title: Search code.kx.com from search results
    Author: stephen@kx.com
    Version: 2018.01.10
*/
$(function() {
    $("form").submit(function(){
      var i = window.location.href.lastIndexOf('=');
      var url = window.location.href.substr(0,i+1) + $("input").val();
      console.log(url);
      window.location = url;
      return false;
    });
});
