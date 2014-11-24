 
'Using jQuery write a script for adding elements before/after other elements.';
 'What does that even mean?';

 function addElementAfter(selector, element){
 	$(selector).after(element);
 }

  function addElementBefore(selector, element){
 	$(selector).before(element);
 }