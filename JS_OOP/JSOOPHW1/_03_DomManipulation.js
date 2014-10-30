function Manipulator(){
	this.addElement = function(selector, element) {
		document.querySelector(selector).appendChild(element);
	};
	this.removeElement = function(selector){
		document.querySelector(selector).removeChild();
	};
	this.attachEvent = function(selector, eventType, eventHandler){
		var nodes = document.querySelector(selector);
		for(var node in nodes){
			nodes[node].addEventListener(eventType, eventHandler());
		}
	};
	this.retriveElement = function(selector){
		return document.querySelector(selector);
	};
}

var manip = Manipulator();