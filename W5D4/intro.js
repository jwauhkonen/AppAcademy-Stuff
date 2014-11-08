Array.prototype.uniq = function() {
  var newArray = [];
  
  for (var i = 0; i < this.length; i++) {
    if ( !newArray.isInArray(this[i]) ) {
      newArray.push(this[i]);
    }
  }
  return newArray;
};
//
// Array.prototype.isInArray = function(val) {
//   for(var i = 0; i < this.length; i ++) {
//     if(this[i] === val) {
//       return true;
//     }
//   }
//   return false;
// };

Array.prototype.twoSum = function(){
  var newArray = [];
  
  for (var i = 0; i < this.length; i++){
    for (var j = i + 1; j < this.length; j++) {
      if (this[i] + this[j] === 0) {
        newArray.push([i, j]);
      }
    }
  }
  return newArray;
};

Array.prototype.transpose = function() {
  var newArray = [];
  
  for (var i = 0; i < this[0].length; i++) {
    newArray.push([]);
  }
  
  for (var col = 0; col < this[0].length; col++) {
    for (var row = 0; row < this.length; row++) {
      newArray[col][row] = this[row][col];
    }
  }
  return newArray;
};

Array.prototype.doubleArray = function() {
  var newArray = [];
  
  for (var i = 0; i < this.length; i++) {
    newArray.push( this[i] * 2 );
  }
  return newArray;
};

Array.prototype.myEach = function(fun) {
  for(var i = 0; i < this.length; i++) {
    fun(this[i]);
  }
};

Array.prototype.myMap = function(fun) {
  var newArray = [];

  var fun2 = function (el) { newArray.push(fun(el)); };
   this.myEach(fun2);
 return newArray;
};

Array.prototype.myInject = function(fun) {
  var accum = this[0];
  
  var fun2 = function (el) {
    accum = fun(accum, el);
  };
  
  this.slice(1, this.length).myEach(fun2);
  // for(var i = 1; i < this.length; i++) {
//     accum = fun(accum, this[i]);
//   }
  return accum;
};

Array.prototype.bubbleSort = function () {
  var sorted = false;
  
  while (sorted === false) {
    sorted = true;
   
    for (var i = 0; i < (this.length - 1); i++) {
      if (this[i] > this[i + 1]) {
        var temp = this[i];
        this[i] = this[i + 1];
        this[i + 1] = temp;
        sorted = false;
      }
      
    }
    
  }
  
  return this;
};

String.prototype.substrings = function () {
  var results = [];
  
  for(var i = 0; i < this.length; i++) {
    for(var j = (i + 1); j <= this.length; j++) {
      results.push(this.substring(i,j));
    }
  }
  return results.uniq();
};

var range = function(start, end) {
  if (end <= start + 1) {
    return [];
  }
  
  return [start + 1].concat(range(start + 1, end));
  
};

Array.prototype.recSum = function () {
  if (this.length === 0) {
    return 0;
  }
  
  if (this.length === 1) {
    return this[0];
  }
  
  return this[0] + this.slice(1, this.length).recSum();
  
};

var exp1 = function (b, n) {
  if (n === 0) {
    return 1;
  }
  
  return b * exp1(b, n - 1);
};

var exp2 = function (b, n) {
  if (n === 0) {
    return 1;
  }
  
  if (n === 1) {
    return b;
  }
  
  if (n % 2 === 0) {
    return exp2(b, n/2) * exp2(b, n/2);
  }
  
  if (n % 2 === 1) {
    return b * (exp2(b, (n-1) / 2) * exp2(b, (n-1) / 2));
  }
  
};

var fib = function (n) {
  if (n === 1) {
    return [1];
  }
  
  if (n === 2) {
    return [1,1];
  }
  
  var lastFib = fib(n - 1);
  return lastFib.concat([lastFib[lastFib.length -1 ] + lastFib[lastFib.length - 2]]); 
  
};

Array.prototype.binSearch = function (target) {
  var middle = Math.floor(this.length / 2);
  
  if(this[middle] === target) {
    return middle;
  }
  if(this.length === 1) {
    return undefined;
  }
  
  if(target > this[middle]) {
    return middle + this.slice(middle, this.length).binSearch(target);
  } else {
    return this.slice(0, middle).binSearch(target);
  }
};

var count = 0;
var makeChange = function(total, coins) {
  count++;
  // console.log('infinite recursion')
  // console.log(total)
  var bestChange = [];
  var remainder = 0;
  var thisChange = [];
  // debugger
  
  if (total === 0) {
    return [];
  }
  
  for (var i = 0; i < coins.length; i++) {
    if (coins[i] <= total) {
      remainder = total - coins[i];
      thisChange = [coins[i]].concat(makeChange(remainder, coins.slice(i)));
      
      if((thisChange.length < bestChange.length) || (bestChange.length === 0))       {
       bestChange = thisChange;
      }
    }
    
  }
  return bestChange;
};


function Cat(catName, owner) {
  this.catName = catName;
  this.owner = owner;

}


Cat.prototype.cuteStatement = function () {
  return this.owner + " loves " + this.catName;
};

Cat.prototype.cuteStatement = function () {
  return "Everyone loves " + this.catName;
};

Cat.prototype.meow = function () {
  return "Meow!";
};
