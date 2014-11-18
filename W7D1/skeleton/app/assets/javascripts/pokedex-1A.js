Pokedex.RootView.prototype.addPokemonToList = function (pokemon) {
	var pokeString = "<li class='poke-list-item'>" + pokemon.escape("name") + "<br>" + pokemon.escape("poke_type") + "<li>";
	this.$pokeList.append(pokeString);
};

Pokedex.RootView.prototype.refreshPokemon = function (callback) {
	that = this;
	this.pokes.fetch({
		success: function() {
			for (var i = 0; i < that.pokes.models.length; i++) {
				that.addPokemonToList(that.pokes.models[i]);
			}
		}
	});
};
