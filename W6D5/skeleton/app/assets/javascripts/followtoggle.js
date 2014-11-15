$.FollowToggle = function (el) {
  this.$el = $(el);
  this.userId = this.$el.data("user-id");
  this.followState = this.$el.data("initial-follow-state");
  this.render();
  this.$el.on("click", this.handleClick.bind(this));
  // this.handleClick();
};

$.FollowToggle.prototype.method1 = function () {
  // ...
};

$.fn.followToggle = function () {
  return this.each(function () {
    new $.FollowToggle(this);
  });
};

$.FollowToggle.prototype.render = function () {
  //set disabled property
  if (this.followState === "following" || this.followState === "unfollowing") {
    this.$el.prop("disabled", true);
  }
  
  if (this.followState === "followed") {
    this.$el.html("Unfollow!");
  } else {
    this.$el.html("Follow!");
  }
}

$.FollowToggle.prototype.toggleFollowState = function () {
  if (this.$el.attr("data-initial-follow-state") === "followed") {
    this.$el.attr("data-initial-follow-state", "unfollowed")
    this.followState = "unfollowed";
  } else {
    this.$el.attr("data-initial-follow-state", "followed")
    this.followState = "followed";
  }
  
  this.$el.prop("disabled", false);
}

$.FollowToggle.prototype.handleClick = function(){
  event.preventDefault();
  
  if (this.followState === "unfollowed") {
    var newAction = 'POST';
    //set following
    this.followState = "following";
  } else {
    var newAction = 'DELETE';
    //set unfollowing
    this.followState = "unfollowing";
  }
  
  this.render();
  
  var that = this;  
  $.ajax({
    url: "/users/" + that.userId + "/follow",
    dataType: "json",
    type: newAction,
    success: function () { 
      that.toggleFollowState();
      that.render();
    }
  });
}


$(function () {
  $("button.follow-toggle").followToggle();
});