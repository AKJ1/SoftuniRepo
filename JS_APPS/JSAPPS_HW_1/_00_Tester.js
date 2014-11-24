var lastid;
function toggleSection(id) {

	$("#" + id).show();
	if (lastid !== id) {
		$("#" + lastid).hide();
	}
	lastid = id;
}