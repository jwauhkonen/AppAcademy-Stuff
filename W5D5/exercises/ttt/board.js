function Board() {
  this.grid = [[null, null, null],
               [null, null, null],
               [null, null, null]];
  this.winner = null;
}

Board.prototype.col = function () {
  var sub = [[null, null, null],
             [null, null, null],
             [null, null, null]];
             
  for (var i = 0; i < sub.length; i++) {
    for (var j = 0; j < sub.length; j++) {
      sub[i][j] = this.grid[j][i];
    }
  }
  
  return sub;
}; 

Board.prototype.won = function () {
  var win = false;
  var diag1 = [this.grid[0][0], this.grid[1][1], this.grid[2][2]];
  var diag2 = [this.grid[0][2], this.grid[1][1], this.grid[2][0]];
  that = this;
  
  ['X', 'O'].forEach( function (symbol) {
    if (allMatch(symbol, that.grid[0])  ||
        allMatch(symbol, that.grid[1])  ||
        allMatch(symbol, that.grid[2])  ||
        allMatch(symbol, that.col()[0]) ||
        allMatch(symbol, that.col()[1]) ||
        allMatch(symbol, that.col()[2]) ||
        allMatch(symbol, diag1)         ||
        allMatch(symbol, diag2)
      ) {
        win = true;
        that.winner = symbol;
      }
  });
  
  return win;
};

Board.prototype.display = function () {
	grid = this.grid;
	for (var row = 0; row < grid.length; row++) {
		console.log(JSON.stringify(this.grid[row]));
	}
};


var allMatch = function (symbol, arr) {
  var matches = true;
  arr.forEach( function (square) {
    if (square !== symbol) {
      matches = false;
    }
  });
  
  return matches;
};

module.exports = Board;

// var board = new Board();
//
// board.grid = [["X", "X", "O"],
//              ["X", "X", null],
//              ["O", "O", "X"]];
//
// board.display()