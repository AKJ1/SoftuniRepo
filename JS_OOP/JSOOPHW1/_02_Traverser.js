function Traverser(){
	this.x = 2;
	this.traverse = function(selector){
		var nodes = document.querySelectorAll(selector);
		var result;
		for(var node in nodes){
			console.log(nodes[node].innerHTML);
			result += nodes[node].innerHTML;
		}
		this.displayResults(result);
	};

	this.displayResults = function(str) {
		document.getElementById("result").innerHTML = str;
	};
}

var traverser = new Traverser();