function switchColors(){
	var desiredcolor = $("#targetcolor").val();
	var target = $("#targetclass").val();

	$("." + target).css("background-color", desiredcolor);
}
