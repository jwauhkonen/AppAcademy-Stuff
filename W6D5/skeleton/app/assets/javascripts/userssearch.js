$.UsersSearch = function (el) {
  this.$el = $(el);
  this.input = "";
  this.$ul = this.$el.find(".users");
  this.$el.on("input", 'input', this.handleInput.bind(this));
}

$.UsersSearch.prototype.handleInput = function (event) {
  var that = this;
  
  this.input = $('div input').val();
  
  $.ajax({
    url: "/users/search",
    dataType: "json",
    type: "GET",
    data: { query: that.input },
    success: function (data) {
      that.renderResults(data);
    }
  });
}

$.UsersSearch.prototype.renderResults = function(newData){
  var liString = "";
  for(var i = 0; i < newData.length; i++) {
    console.log(newData[i].username)
    var currentUser = newData[i];
	liString += "<li><a href=" + currentUser.id + ">" + currentUser.username + "</a></li>";
	var button = "<button type='button' class='follow-toggle'></button>";
	var $button = $(button);
	$button.followToggle({userId: currentUser.id, followState: "unfollowed"})
	liString += button;
	// figure out how to get button to actually work as a follow toggle!!!!!
  }
  console.log(liString);
  this.$ul.html(liString);
  //clear ul.users
  //iterate through fetched users
  //each result: build an li with anchor tag linking to user
  //use append to add each result to ul
}

$.fn.usersSearch = function () {
  return this.each(function () {
    new $.UsersSearch(this);
  });
};

$(function () {
  $("div.users-search").usersSearch();
});