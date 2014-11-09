(function () {
	require.config({
		paths: {
			"ListItems": "_01_TODOListModule"
		}
	});
	var module = require(["ListItems"]);
}());
