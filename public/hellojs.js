console.log("I'm in a JS file");

// var input = 1;
// if (input) {
// 	console.log(input);
// } else {
// 	console.log("It's not defined.");
// }

var testy = Math.random();
// Closure!
function scope_func() {
	var testy = Math.random();
	window.clu = function(){
		console.log(testy);
		window.clu2 = function(){
			console.log(testy);
		};
	};
}
//Gotta call scope_func in order for hello to be assigned a value
scope_func();
clu();
clu2();
console.log(testy);