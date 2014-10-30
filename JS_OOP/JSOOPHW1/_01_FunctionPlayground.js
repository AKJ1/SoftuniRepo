function Funct(){		

	for (var i = 0; i < arguments.length; i++) {
		console.log("Argument " + arguments[i] + " is of Type " + typeof(arguments[i]));
	}

	console.log("this is " + this);
	// for(var argument in arguments){
	// 	console.log(arguments[argument] + typeof(arguments[argument]));
	// }
}

function Call () {
	Funct.call(10,25, 22.55, "I dont even", "._.");	
	Funct.apply();
	Funct();
}
Call();

Funct.call(0,25, 22.55, "I dont even", "Hello");
Funct.call();

Funct.apply(["zero" , 20, 30, "Things."]);
Funct.apply();