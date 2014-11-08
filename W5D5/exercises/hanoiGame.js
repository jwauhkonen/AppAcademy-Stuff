var readline = require('readline');

var reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

function HanoiGame() {
  this.stacks = [[3, 2, 1], [], []];
}

HanoiGame.prototype.isWon = function () {
  if ((this.stacks[0].length === 0) && 
    (this.stacks[1].length === 0 || this.stacks[2].length === 0)) {
    return true;
  } else {
    return false;
  }
};

HanoiGame.prototype.isValidMove = function (startTowerIdx, endTowerIdx) {
  if (this.stackEmpty(startTowerIdx) === true) {
    return false;
  } else {
    if (this.stackEmpty(endTowerIdx) === true) {
      return true;
    } else {
      var lastFromIndex = this.stacks[startTowerIdx].length - 1;
      var lastToIndex = this.stacks[endTowerIdx].length - 1;
    
      if (this.stacks[startTowerIdx][lastFromIndex] < 
        this.stacks[endTowerIdx][lastToIndex]) {
         return true;
      } else {
        return false;
      }
    }
  }
};

HanoiGame.prototype.stackEmpty = function (towerIdx) {
  if (this.stacks[towerIdx].length === 0) {
    return true;
  } else {
    return false;
  }
};

HanoiGame.prototype.move = function (startTowerIdx, endTowerIdx) {
  if (this.isValidMove(startTowerIdx, endTowerIdx) === true) {
    this.stacks[endTowerIdx].push(this.stacks[startTowerIdx].pop());
    return true;
  } else {
    return false;
  }
};

HanoiGame.prototype.print = function () {
  console.log(JSON.stringify(this.stacks));
};

HanoiGame.prototype.promptMove = function (callback) {
  this.print();
  reader.question("Which stack to move from?", function (fromStack) {
    var from = parseInt(fromStack);
    reader.question("Which stack to move to?", function (toStack) {
      var to = parseInt(toStack);
      
      callback(from, to);
    });
  });
};

HanoiGame.prototype.run = function (completionCallback) {
  var that = this;
  this.promptMove(function (from, to) {
    console.log("this: " + this);
    if (!that.move(from, to)) {
      console.log("Invalid move!");   
    }
    if (that.isWon() === true) {
      return completionCallback();
    }
  
    that.run(completionCallback);
  });
};

var game = new HanoiGame();
game.run(function () {
  console.log("You win!");
  reader.close();
});