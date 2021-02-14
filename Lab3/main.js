// Ejercicio1
function pregunta1(){
	const number = window.prompt('inserte un numero');

	// Append the table
	const htmlDoc = document.querySelector('html');
	htmlDoc.querySelector('#respuesta1').innerHTML = (
		'<table><tr id="table-res1"></tr></table>'
	);

	// Append the numbers
	for(let i=1; i<=number; i++){
		htmlDoc.querySelector("#table-res1").innerHTML += (
			`<td>${i}</td>`
		); 
	}

	// Re-write the webpage
	document.open();
	document.write(htmlDoc.innerHTML);
	document.close();
}


// Ejercicio2
function pregunta2(){
	const num1 = Math.floor(Math.random() * 10);
	const num2 = Math.floor(Math.random() * 10);

	// Start first time
	var d = new Date();
	var n1 = d.getTime();
	// Get user input
	const answer = window.prompt(`${num1} + ${num2} = `);
	const isCorrect = answer == num1+num2;
	// Get second time
	var d = new Date();
	var n2 = d.getTime();

	const timeSpent = (n2-n1) / 1000;

	// Append the result
	const htmlDoc = document.querySelector('html');
	htmlDoc.querySelector('#respuesta2').innerHTML = (
		`<p>The answer is ${isCorrect}
		and you spent ${timeSpent} seconds to answer.
		</p>`
	);

	// Re-write the webpage
	document.open();
	document.write(htmlDoc.innerHTML);
	document.close();
}


// Ejercicio3
function contador(numArr){
	let negatives = 0;
	let ceros = 0;
	let positives = 0;
	numArr.forEach( num => {
		if (num < 0){negatives += 1}
		else if (num == 0){ceros += 1}
		else {positives += 1}
	});
	return {'negatives':negatives, 'ceros':ceros, 'positives':positives}
}

function pregunta3(){
	const result = contador([-1, 0, 1, 2, 0, 10]);
	console.assert(result.negatives == 1, "Negatives failed");
	console.assert(result.ceros == 2, "Ceros failed");
	console.assert(result.positives == 3, "Positives failed");
	document.querySelector('#respuesta3').innerHTML = "[-1, 0, 1, 2, 0, 10]<br>"+JSON.stringify(result);
}


// Ejercicio4
function promedios(arr2D){
	const averages = [];
	arr2D.forEach(arr => {
		const average = arr.reduce((a, b) => (a + b)) / arr.length;
		averages.push(average);
	});
	return averages;
}

function pregunta4(){
	const result = promedios([[1,2,3], [10,20,30], [100,200,300]]);
	console.assert(result[0] == 2, "[1,2,3] failed given 2");
	console.assert(result[1] == 20, "[10,20,30] failed given 20");
	console.assert(result[2] == 200, "[100,200,300] failed given 200");
	document.querySelector('#respuesta4').innerHTML = "[[1,2,3], [10,20,30], [100,200,300]]<br>"+JSON.stringify(result);
}


// Ejercicio5
function inverso(num){
	const arrNum = num.toString().split("");
	return parseInt(arrNum.reverse().join(""));
}

function pregunta5() {
	const result = inverso(12345);
	console.assert(result == 54321, "inverso(12345) -> result Failed to give 54321");
	document.querySelector('#respuesta5').innerHTML = `12345<br>${result}`;
}


// Ejercicio6
class FindTargetInTwoPairNumbers {
	constructor(arr, target){
		this.i1 = 0;
		this.i2 = arr.length - 1;
		this.arr = arr;
		this.target = target;
	}

	solution(){
		let notFound = true;
		let sum = 0;
		while (notFound){
			sum = this.arr[this.i1] + this.arr[this.i2];

			if (sum == this.target){
				notFound = false;
				break;
			}

			this.addSubstractIndex(sum);

			if (this.i1 == this.i2){
				break;
			}
		}
		if (notFound){return "Not found"}
		return {"index1": this.i1, "index2": this.i2}; 
	}

	addSubstractIndex(sum){
		if (sum < this.target){
			this.i1 += 1;
		}
		else {
			this.i2 -= 1;
		}
	}

}


function pregunta6(arr, target){
	const object = new FindTargetInTwoPairNumbers(arr, target);
	const result = object.solution()
	document.querySelector('#respuesta6').innerHTML = (
		`Index1: ${result.index1}, Index2: ${result.index2}.`
	);
	
	console.assert(result.index1 == 2, "Failed index1");
	console.assert(result.index2 == 4, "Failed index2");
}
