function startPollTimer (argument) {
	this.t = 300;
	if (localStorage.username) {
		$("#poll").show();
		console.log("debug");
		if (!sessionStorage.poll) {
			resumeProgress();	
			setInterval(function(){
				this.t -= 1;
				updateTimer(t);
				if (t <= 0) {
					$('#poll').text('Time\'s up! Refresh to retry');
				}
			}, 1000);
		}else{
			loadResults();
		}
	}
}
function updateTimer(t){
	var minutes = Math.floor(t/60).toString();
	var seconds = (t-(Math.floor(t/60)*60));
	seconds = seconds.length === 1? "0" + seconds: seconds;
	$('p#timer').text(minutes + " : " + seconds);

	if (t % 10 === 0) {
		saveProgress();
		console.log("progress saved");
	}
}
function resumeProgress(){
	$("input:radio").each(function (index, element) {
		if (localStorage[element.name] == index) {
			$(element).attr("checked", true);
		}
	});
}
function saveProgress(){
	$("input:radio").each(function (index, element) {
		if ($(element).is(":checked")) {
			localStorage[element.name] = index;
			console.log("progress really saved");
		}
	});
}

function loadResults() {

	var lastname = "";
	var answers = $('<p>');
	$('input:radio').each(function (index, element){
		if (sessionStorage[element.name] && element.name != lastname) {

		console.log(lastname);
		console.log(sessionStorage[element.name]);
			answers.append("Your answer to " + element.name + " is " + sessionStorage[element.name] + "<br>");
		}
		lastname = element.name;
	});
	$('#poll').text("");
	$('#poll').append(answers);
}
function submitPoll(){
	$("input:radio:checked").each(function (index, element) {
		sessionStorage.poll = true;
		sessionStorage[element.name] = element.value;
	});
	$('#poll').text('Your input has been Recorded! ');
}