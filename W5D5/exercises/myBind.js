Function.prototype.myBind = function (context) {
  var fn = this;
  return function () {
    fn.apply(context);
  };
};

var cat = {
  name: "Bfast"
};

function meow () {
  console.log(this.name + " meows!");
}

var dog = {
  name: "Lunch"
};

var catMeow = meow.myBind(cat);

catMeow();
// cat.meow.myBind(dog);
