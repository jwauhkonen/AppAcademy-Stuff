function sum() {
    var total = 0;
    var args = Array.prototype.slice.call(arguments);
    args.forEach(function (i) { total += i; });
    return total;
}

// console.log(sum(1, 2, 3, 5));



Function.prototype.myBind = function (context) {
  var fn = this;
  var args = Array.prototype.slice.call(arguments, 1); //slice after the first
  console.log("binding the following: " + args.join(", "));
  return function () {
    fn.apply(context, args);
  };
};


// function lunch(food1, food2, food3){
//     console.log(this.name + " is going to eat " + food1 + food2 + food3)
// }
// var o = { name: "Jeff" };
// boundLunch = lunch.myBind(o, "a", "b", "c")
// boundLunch();
// lunch("meat", "gum", "worms")

// var sum1 = curriedSum(4);
// console.log(sum(5));
// console.log(sum(30));
// console.log(sum(20));
// console.log(sum(1));
// console.log(sum1(5)(30)(20)(1));


function curriedSum(numArgs) {
    var numbers = [];
    
    var _curriedSum = function (n) {
        numbers.push(n);
        if (numArgs === numbers.length) {
            return sum.apply({}, numbers);
        }  else {
            return _curriedSum;
        }
        
    };
    
    return _curriedSum;
    
}

Function.prototype.curry = function(numArgs) {
    var fn = this;
    var numbers = [];
    
    var _curriedSum = function (n) {
        numbers.push(n);
        if (numArgs === numbers.length) {
            return fn.apply(window, numbers);
        }  else {
            return _curriedSum;
        }
        
    };
    
    return _curriedSum;
};


// function curryStudents(numStudents) {
//     var students = [];
//
//     var _curryStudents = function (student) {
//         students.push(student);
//         if (numStudents === students.length) {
//             return students
//         }  else {
//             return _curryStudents;
//         }
//     };
//     return _curryStudents;
// }


// function sumThree(num1, num2, num3) {
//   return num1 + num2 + num3;
// }
//
// sumThree(4, 20, 6); // == 30
//
// // you'll write `Function#curry`!
// var f1 = sumThree.curry(3);
// var f2 = f1(4);
// var f3 = f2(20);
// var result = f3(6); // = 30
//
// // or more briefly:
// console.log(sumThree.curry(3)(4)(20)(6)); // == 30

Function.prototype.inherits = function(SuperClass) {
    function Surrogate () {};
    Surrogate.prototype = SuperClass.prototype;
    this.prototype = new Surrogate();
}

function MovingObject () {};

function Ship () {};
Ship.inherits(MovingObject);

function Asteroid () {};
Asteroid.inherits(MovingObject);

MovingObject.prototype.move = function() {
    console.log("moving!!!!");
}

Asteroid.prototype.break = function() {
    console.log("breaking!!!");
}

spaceship = new Ship();
asteroid = new Asteroid();
spaceship.move();
asteroid.break();
spaceship.break();