function Game(reader) {
	this.board = new Board();
	this.reader = reader;
	this.p1 =  new HumanPlayer();
	this.p2 = new HumanPlayer();
	this.p2.symbol = "O"
	this.currentPlayer = this.p1;
};

Game.prototype.run = function (completionCallback) {
	var that = this;
	this.board.display();
	console.log("Turn is: " + this.currentPlayer.symbol)
	
	this.promptMove(function (row, col) {
		if (!that.makeMove(row, col)) {
			console.log("Invalid Move!");
		} else {
			that.switchPlayer();
		}
		
		if (that.board.won() || that.board.gameOver()) {
			return completionCallback();
		}
		
		that.run(completionCallback);
	})
	
};

Game.prototype.switchPlayer = function () {
	if (this.currentPlayer === this.p1) {
		this.currentPlayer = this.p2;
	} else {
		this.currentPlayer = this.p1;
	}
};

Game.prototype.promptMove = function (callback) {
	
	this.reader.question("Enter your move in the form 'row,col'", function (moveInput) {
		var move = moveInput.split(",");
		var row = parseInt(move[0]);
		var col = parseInt(move[1]);
		callback(row, col);
	});
};

Game.prototype.makeMove = function (row, col) {
	if (!this.isInBounds(row, col)) {
		return false;
	} else {
		if (this.board.grid[row][col] === null) {
			this.board.grid[row][col] = this.currentPlayer.symbol;
			return true;
		} else {
			return false;
		}
	}

}; 

Game.prototype.isInBounds = function (row, col) {
	// console.log("I'm running");
	if ((0 <= row) && (row <= 2) && (0 <= col) && (col <= 2)) {
		// console.log(row);
	// 	console.log(col);
		return true;
	} else {
		// console.log("Stop!");
		return false;
	}
};




var Board = require("./board");
module.exports = Game;


function HumanPlayer() {
	this.symbol = "X";
};



function ComputerPlayer() {
	this.symbol = "O";
};