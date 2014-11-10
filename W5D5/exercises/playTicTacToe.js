var TTT = require("./ttt");

var readline = require('readline');

var reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

var game = new TTT.Game(reader);

// game.board.display();

game.run( function() {
	game.board.display();
	if (game.board.winner === null) {
		console.log("It's a draw!");
	} else {
		console.log(game.board.winner + " wins!");
	}
	reader.close();
});