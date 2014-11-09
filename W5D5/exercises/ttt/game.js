function Game(reader) {
	this.board = new Board();
	this.reader = reader;
};

Game.prototype.run = function (completionCallback) {
	this.board.display();
	
}

Game.prototype.promptMove = function (callback) {
	this.reader.question()
}



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

var Board = require("./board");
module.exports = Game;


function HumanPlayer() {
	
}