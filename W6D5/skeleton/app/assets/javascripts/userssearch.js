$.UsersSearch = function (el) {
  this.$el = $(el);
  this.input = "";
  this.$ul = $("users-seach.users");
  // this.listener();
  this.$el.on("input", 'input', this.handleInput.bind(this));
}

// $.UsersSearch.prototype.listener = function () {
//   return this.$el.on("keypress", this.handleInput(event));
// }

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
  for(var i = 0; i < newData.length; i ++) {
    console.log(newData[i].username)
    liString += "<li>" + newData[i].username + "</li>"
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