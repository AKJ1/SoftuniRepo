function checkFirstVisit(){
	if (localStorage.username) {
		visit();
		greet();
	}else{
		visit();
		requestUserName();
	}
}

function greet(){
	var greetdiv = document.createElement("div");
	var name = document.createElement("p");
	var visitcounter = document.createElement("p");
	var sessioncounter = document.createElement("p");
	
	name.innerHTML = "Hello " + localStorage.username;
	visitcounter.innerHTML = "You have visited <span class='bold'>" + localStorage.visits + "</span> times overall.";
	sessioncounter.innerHTML = "You have visited <span class='bold'>" + sessionStorage.visits + "</span> times this session.";

	greetdiv.appendChild(name);
	greetdiv.appendChild(sessioncounter);
	greetdiv.appendChild(visitcounter);
	$("#stats").append(greetdiv);
	startPollTimer();
}

function requestUserName() {
	var inputdiv = document.createElement("div");
	var inputfield = document.createElement("input");
	inputfield.id = "username-input";
	inputfield.setAttribute("placeholder", "Enter your name");
	var inputbutton = document.createElement("button");
	inputbutton.id = "username-button";
	$(inputbutton).text("Submit");
	$(inputbutton).on('click', function() {
		setUsername(inputfield.value);
	});
	inputdiv.appendChild(inputfield);
	inputdiv.appendChild(inputbutton);
	$('#stats').append(inputdiv);
}

function setUsername(username){
	localStorage.username = username;
	greet();
}
function visit(){
	if (localStorage.visits) {
		localStorage.visits = parseInt(localStorage.visits) + 1;
	}else{
		localStorage.visits = 1;
	}
	if (sessionStorage.visits) {
		sessionStorage.visits = parseInt(sessionStorage.visits) + 1;
	}else{
		sessionStorage.visits = 1;
	}
}

function calcExpiration(){
	var date = new Date();
	date.setTime(date.getTime() + 1*24*60*60*1000);
}