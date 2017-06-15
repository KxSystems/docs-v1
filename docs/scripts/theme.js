/** 
 * https://gist.github.com/wpscholar/4637176#file-jquery-external-links-new-window-js-L4
 * Open all external links in a new window
 */
$(document).ready(function($) {
    $('a').not('[href*="mailto:"]').each(function () {
		var isInternalLink = new RegExp('/' + window.location.host + '/');
		if ( ! isInternalLink.test(this.href) ) {
			$(this).attr('target', '_blank');
		}
	});
	// FIXME replace with Google Search
	$("#query").click(function() {
	  qry = "http://www.google.com/search?q=";
	  qry += "site%3Acode.kx.com/q/+";
	  window.location = qry + $(this).val();
	  // return false; // prevents submitting form to server
	});
});
