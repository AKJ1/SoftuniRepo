function generateTable(){
	var string = $('#tablestring').val();
	var parsedObject = jQuery.parseJSON(string);
	var keys = Object.keys(parsedObject[0]);
	var table = $('<table>');
	
	var row = $("<tr>");
	for(var key in keys){
		row.append("<th>"+keys[key]+"</th>");
	}
	table.append(row);
	for (var i = 0; i < parsedObject.length; i++) {
		row = $("<tr>");
		for (var j = 0; j < Object.keys(parsedObject[i]).length; j++) {
			row.append("<td>" + parsedObject[i][keys[j]] + "</td>");
		}
		table.append(row);
	}
	$("#tableResult").append(table);
}