var module = (function () {
	return {
		Container: function(){
			this._sections = {};
			this.SectionList = function(){
				return this._sections;
			};
			this.AddSection = function(section){
				this._sections.push(section);
			};
			this.addToDom = function() {
				var element = document.createElement("div");
				var button = document.createElement("button");
				var textInput = document.createElement("input");
				var parent = document.getElementById("target");

				element.setAttribute("class", "container");
				textInput.value = "Stuff";
				button.innerHTML = "Add Section";
				button.onclick = function(){
					var section = new module.Section(textInput.value);
					section.addToDom(this.parentNode);
					this.AddSection(element);		
					parent.appendChild(document.createElement("button"));
				};
				element.appendChild(textInput);
				element.appendChild(button);
				parent.appendChild(element);		
			};
		},
		Section: function(title){	
			this._items = {};
			if (title) {
				this.Title = title;
			}
			this.ItemList = function(){
				return this._items;
			};
			this.AddItem = function(item) {
				this._items.push(item);
			};
			this.addToDom = function(parent) {
				var textInput = document.createElement("input");
				var taskDiv = document.createElement("div");
				taskDiv.setAttribute("class", "item");
				var button = document.createElement("button");
				button.innerHTML = "Add Item";
				button.onclick = function(){		
					var item = new module.Item(textInput.value);
					item.addToDom(taskDiv);
				};
				var element = document.createElement("div");
				var header = document.createElement("h3");
				header.innerHTML = this.Title;
				element.setAttribute("class", "section");
				element.appendChild(header);
				element.appendChild(taskDiv);
				element.appendChild(textInput);
				element.appendChild(button);
				parent.appendChild(element);
			};
		},
		Item: function(content){
			if (content) {
				this._content = content;
			}else{
				this._content = "Unnamed task";
			}
			this._status = false;
			this.addToDom = function(parent) {
				var div = document.createElement("div");
				var checkbox = document.createElement("input");
				checkbox.type = "checkbox";
				checkbox.setAttribute("class", "checkbox");
				checkbox.onclick = function(){
					if (!this._status) {
						this._status = true;
						checkbox.parentNode.setAttribute("class", "checked");
					}
					else{
						this._status = false;
						checkbox.parentNode.setAttribute("class", "non");
					}
				};
				var label = document.createElement("label");
				label.innerHTML = this._content;

				div.appendChild(checkbox);
				div.appendChild(label);
				parent.appendChild(div);
			};
		}	
	};
}());
function CreateContainer() {
	var x = new module.Container();
	x.addToDom();	
}