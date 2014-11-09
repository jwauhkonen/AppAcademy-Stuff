var TTT = require("./ttt");

var readline = require('readline');

var reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

var game = new TTT.Game(reader);

// game.board.display();

game.run( function() {
	console.log(game.board.winner + " wins!");
	reader.close();
});