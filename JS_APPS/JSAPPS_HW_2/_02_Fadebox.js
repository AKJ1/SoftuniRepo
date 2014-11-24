$.fn.messageBox = function () {
	var box = $("<div>");
	box.css({
		'width': '500px',
		'height': '150px',
		'position': 'fixed',
		'display': 'hidden',
		'text-align': 'center'
	});

	this.success = function(message) {
		box.text(message);
		$('body').append(box);
		box.css('background-color', 'green');
		box.show();
		setTimeout(function() {
			box.hide();
		}, 3000);
	};
	this.failure = function(message) {
		box.text(message);
		$('body').append(box);
		box.css('background-color', 'red');
		box.show();
		setTimeout(function() {
			box.hide();
		}, 1000);
	};
	return this;
};