Pokedex.RootView.prototype.renderPokemonDetail = function (pokemon) {
	var divString = "<div class='detail' img src='" + pokemon.attributes.image_url + "'>";
	
	
	
	var divString += "</div>";
	
	this.$pokeDetail.append(divString); 
};

Pokedex.RootView.prototype.selectPokemonFromList = function (event) {
};
