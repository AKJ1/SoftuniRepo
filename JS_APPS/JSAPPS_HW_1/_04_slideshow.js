var currentSlide = 0;
var slidecount = $(".slide").length;

function slideshow(){
	$('.slide').css("display", "none");
	$('.slide').first().show();
	setInterval(animateRight($(".slide")[currentSlide]), 1000);
}

function animateRight (slide) {
	$('.slide').css("display", "none");
	$(slide).css({
		left: '101%',

	});
	$(slide).show();
	$(slide).animate({
			left: '0px'},
			200);
	if (currentSlide >= slidecount-1) {
		currentSlide = 0;
	}else{
		currentSlide++;
	}	
}
function animateLeft (slide) {

	$(slide).show();
	$(slide).css({
		display: 'inline',
		right: '101%',
	});
	$(slide).animate({
			right: "0px"},
			200);
	if (currentSlide <= 0) {
		currentSlide--;
	}
}
