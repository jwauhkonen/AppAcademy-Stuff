$.Carousel = function (el) {
  this.$el = $(el);
  this.activeIdx = 0;
  this.images = this.$el.find('img');
  this.$el.find('img:first-child').addClass('active');
  this.$handlers = this.$el.find('a');
  this.transitioning = false;
  var that = this;
  this.$handlers.on('click', function(event){
    var $currentTarget = $(event.currentTarget);
    that.slide($currentTarget.attr("class"));
  });
}

$.fn.carousel = function () {
  return this.each(function () {
    new $.Carousel(this);
  });
};

$.Carousel.prototype.slide = function (dir) {
  if (this.transitioning === true) {
    return;
  } else {
    this.transitioning = true;
  }
  
  if (dir === "slide-left") {
    this.slideLeft();
  } else {
    this.slideRight();
  }
  
};

$.Carousel.prototype.slideRight = function () {
  var $activeImage = $(this.images[this.activeIdx]);
  $activeImage.addClass("right");
  var that = this;
  $activeImage.one("transitionend", function () {
     $activeImage.removeClass("active");
     $activeImage.removeClass("right");
     that.transitioning = false;
  })
  this.activeIdx -= 1;
  if (this.activeIdx === -1) {
    this.activeIdx = this.images.length - 1;
  }
  
  var $newActiveImage = $(this.images[this.activeIdx]);
  $newActiveImage.addClass("active left");
  
  setTimeout(function () {
    $newActiveImage.removeClass('left');
  },10);
  
};

$.Carousel.prototype.slideLeft = function () {
  var $activeImage = $(this.images[this.activeIdx]);
  $activeImage.addClass("left");
  var that = this;
  $activeImage.one("transitionend", function () {
     $activeImage.removeClass("active");
     $activeImage.removeClass("left");
     that.transitioning = false;
  })
 
  
  this.activeIdx += 1;
  if (this.activeIdx === this.images.length) {
    this.activeIdx = 0;
  }

  var $newActiveImage = $(this.images[this.activeIdx]);
  $newActiveImage.addClass("active right");
  // debugger;
  setTimeout(function () {
    $newActiveImage.removeClass('right');
  },10);
  
};


// this.$activeTab.one('transitionend', function () {
//   this.$activeTab.removeClass('transitioning');
//   this.$activeTab.removeClass('active')
//   this.$activeTab = $(this.$contentTabs.find($target.attr('href')));
//   $target.addClass('active');
//   this.$activeTab.addClass('transitioning');
//   setTimeout(function () {
//     this.$activeTab.removeClass('transitioning');
//   }.bind(this),0.5)
//
//   this.$activeTab.addClass('active');
// }.bind(this))