/** 
 * https://gist.github.com/wpscholar/4637176#file-jquery-external-links-new-window-js-L4
 * Open all external links in a new window
 */
// window.addEventListener('load', function(e) {
$(function() {
    $('a').not('[href*="mailto:"]').each(function () {
		var isInternalLink = new RegExp('/' + window.location.host + '/');
		if ( ! isInternalLink.test(this.href) ) {
			$(this).attr('target', '_blank');
		}
	});

	// cse.google.com Google Custom Search Engine
	// replace MkDocs Search form with GCSE container
	$('form[name="search"]').parent().parent().replaceWith('<gcse:search id="gcse_search"></gcse:search>');
	// compose master GCSE script to call other scripts
	var cx = '004878902718534787160:xazraufkjx4';
	var gcse = document.createElement('script');
	gcse.type = 'text/javascript';
	gcse.async = true;
	gcse.src = 'https://cse.google.com/cse.js?cx=' + cx;
	// after the GCSE adsense script runs, adapt GCSE style to MkDocs
	// $(document).on("afterscriptexecute", function() {
	$(document).on('afterscriptexecute', function(e) {
		if(e.target.tagName.toLowerCase() == 'script' && e.target.src.slice(0,29) === 'http://cse.google.com/adsense') {
		// if(e.target.tagName.toLowerCase() == 'script') {
			console.log('Matched: ' + e.target.src.slice(0,29));
			console.log('Loaded: ' + e.target.src);
			$('#gcse_search').css('width','300px');
			console.log('Set search-box width');
			var style = $('<style>.cse .gsc-control-cse, .gsc-control-cse {background-color: transparent; border-color: transparent;}.gsc-search-button {display: none;}</style>');
			$('html > head').append(style);
		}
	});

	// insert the master GCSE script
	var s = document.getElementsByTagName('script')[0];
	console.log('Insert new script');
	s.parentNode.insertBefore(gcse, s);

});
