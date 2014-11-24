$.fn.treeView = function () {
	var tree = $("<div>");
	function CreateNode(parent){
		var node = $("<p>");
		node.on('click', function() {
			node.children().toggle();
		});
		parent.append(node);
		while(rng() <= 50) {
			CreateNode(node);
		}
	}
	function GenerateTree(){
		var x = 5;
		while(x-- >= 0){
			CreateNode(tree);
		}
		$("<body>").append(tree);
	}
	function rng(){
		return Math.floor((Math.random() * 100) + 1);
	}
	GenerateTree();
	return this.tree;
};