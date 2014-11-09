
Point.prototype = new Point();
Point.prototype.toString = function(){
	return " X: " + this.X + " Y: " + this.Y;
};
function Point(x, y){
	this.X = x;
	this.Y = y;
}

Shape.prototype = new Point();
Shape.prototype.constructor = Shape;
function Shape(x, y, color){	
	x = x? x : 0;
	y = y? y : 0;
	color = color? color : "black";
	Point.call(this, x, y);
	this.Color = color;
}
Shape.prototype.toString = function(){
	return " X: " + this.X + " Y: " + this.Y + " Color: " + this.Color;
};

Rectangle.prototype = new Shape();
Rectangle.prototype.constructor = Rectangle;
function Rectangle(width, height, x, y, color) {
	Shape.call(this, x, y, color);
	this._width = width;
	this._height = height;
}
Rectangle.prototype.toString = function(){
	this.toString = Shape.toString.call(this) + " Width: " + this._width + " Height:  " + this._height;
};

Circle.prototype = new Shape();
Circle.prototype.constructor = Circle;

function Circle(radius, x, y, color) {
	Shape.call(this, x, y, color);
	this._radius = radius;
}
Triangle.prototype = new Shape();
Triangle.prototype.constructor = Triangle;
function Triangle (pointA, pointB, pointC, x, y, color) {
	Shape.call(this, x, y, color);
	this._pointA = pointA;
	this._pointB = pointB;
	this._pointC = pointC;
}


Segment.prototype = new Shape();
Segment.prototype.constructor = Segment;
function Segment (pointA, pointB, x, y, color) {
	Shape.call(this, x, y, color);
	this._pointA = pointA;
	this._pointB = pointB;
}

var sh = new Shape(10, 20, "red");
console.log(sh.toString());

var rekt = new Rectangle(50, 150);
console.log(rekt.toString());