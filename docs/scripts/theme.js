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
	var srch = $(".md-search");
	var shell = $(srch).parent();
	$(srch).remove();
	var gs = "<!--GOOGLE SEARCH BOX-->";
	gs += "<div class=\"md-search\" action>";
	gs += "  <form onsubmit=\"return goGoogle(this.searchstring.value)\" action>";
	gs += "    <p>";
	gs += "      <input type=\"text\" title=\"Search\" is=\"searchstring\" name=\"searchstring\" placeholder=\"Search\" value onclick=\"clearField(this)\">";
	gs += "      <input type=\"submit\" style=\"display: none;\" value=\"Google this site\">";
	gs += "    </p>";
	gs += "  </form>";
	gs += "</div>";
	$(shell).append($(gs));
});
///////////////////////////////////////////////////////////////////
function clearField(aControl)
{
  aControl.className = "user";
  aControl.value = "";
}
///////////////////////////////////////////////////////////////////
function goGoogle(aString)
{
  qry = "http://www.google.co.uk/search?q=";
  qry += "site%3Acode.kx.com/q/+";
  window.location = qry + aString;
  return false; // prevents submitting form to server
}