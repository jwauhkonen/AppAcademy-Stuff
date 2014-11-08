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
  
  ['X', 'O'].forEach( function (symbol) {
    if (allMatch(symbol, this.grid[0]) ||
        allMatch(symbol, this.grid[1]) ||
        allMatch(symbol, this.grid[2]) ||
        allMatch(symbol, this.col()[0]) ||
        allMatch(symbol, this.col()[1]) ||
        allMatch(symbol, this.col()[2]) ||
        allMatch(symbol, diag1)        ||
        allMatch(symbol, diag2)
      ) {
        win = true;
        this.winner = symbol;
      }
  });
  
  return win;
};

Board.prototype.gameOver = function () {
  /// FINISH THIS WEEKEND :)
};



 var allMatch = function (symbol, arr) {
  var matches = true;
  arr.forEach( function(square) {
    if (square !== symbol) {
      matches = false;
    }
  });
  
  return matches;
};

