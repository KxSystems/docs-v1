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
	// Supplement local search: send query to Google Search on Return
	$("[data-md-component=query]").change(function() {
		var qry = "http://www.bing.com/search?q=";
		qry += "site%3Acode.kx.com/q/+"; // non-portable and excludes wiki
		window.location = qry + $(this).val();
		return false; // prevents submitting form to server
	});

});
