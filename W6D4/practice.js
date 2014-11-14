Array.prototype.myEach = function (callback) {
	for (var i = 0; i < this.length; i++) {
		callback(this[i]);
	}
}

function sayHello(word) {
	console.log(word + "says hi");
}

var names = ["joe", "jonny", "jimmy"];

names.myEach( function (name) {
	sayHello(name);
})


function sum () {
	
}

Array.prototype.bubbleSort = function () {
	var sorted = false
	
	while (sorted === false) {
		sorted = true;
		
		for (var i = 0; i < this.length - 1; i++) {
			if (this[i] > this[i+1]) {
				var temp = this[i];
				this[i] = this[i+1];
				this[i+1] = temp;
				sorted = false;
			}
		}
	}
	
	return this;
}


console.log([3, 1, 5, 2, 4].bubbleSort());


Array.prototype.sum = function () {
	var total = 0;
	
	for (var i = 0; i < this.length; i++) {
		total += this[i];
	}
	
	return total;
}


function curriedSum(numArgs) {
	var numbers = [];
	
	function _curriedSum(number) {
		numbers.push(number);
		if (numbers.length < number) {
			return _curriedSum;
		} else {
			return numbers.sum();
		}
		
	}
	
	return _curriedSum;
}

var sum = curriedSum(4);
console.log(sum(5)(30)(20)(1));


Function.prototype.curry = function (numArgs) {
	var numbers = [];
	var that = this;
	
	function _curry (number) {
		numbers.push(number);
		
		if (numbers.length < numArgs) {
			return _curry;
		} else {
			return that.apply(null, numbers);
		}
	}
	
	return _curry;
}

function sumThree(num1, num2, num3) {
  return num1 + num2 + num3;
}

console.log(sumThree.curry(3)(4)(20)(6));