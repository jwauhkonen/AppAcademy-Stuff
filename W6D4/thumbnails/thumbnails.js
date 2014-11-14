$.Thumbnails = function (el) {
  this.$el = $(el);
  this.$gutterImages = this.$el.find(".gutter-images");
  this.$images = this.$el.find("img");
  this.$activeImg = this.$gutterImages.find("img:first-child");
  this.gutterIdx = 0;
  this.activate(this.$activeImg);
  this.fillGutterImages();
  var that = this;
  
  this.$gutterImages.on('click', 'img', function (event) {
    var $currentTarget = $(event.currentTarget);
    that.$activeImg = $currentTarget;
    that.activate($currentTarget);
  })
  
  this.$gutterImages.on('mouseenter', 'img', function (event) {
    var $currentTarget = $(event.currentTarget);
    that.activate($currentTarget);
  })
  
  this.$gutterImages.on('mouseleave', 'img', function (event) {
    that.activate(that.$activeImg);
  })
  
  this.$el.on('click', 'a', function (event) {
    var $currentTarget = $(event.currentTarget);
    if ($currentTarget.attr("class") === "nav right") {
      that.gutterIdx += 1;
    } else {
      that.gutterIdx -= 1;
    }
    
    if (that.gutterIdx === -1) {
      that.gutterIdx = that.$images.length - 1;
    }
    
    if (that.gutterIdx === that.$images.length) {
      that.gutterIdx = 0;
    }
    that.fillGutterImages();
  })
};

$.fn.thumbnails = function () {
  return this.each(function () {
    new $.Thumbnails(this);
  });
};

$.Thumbnails.prototype.activate = function ($img) {
  this.$el.find('.active > img').remove();
  var $activeImg = $img.clone();
  this.$el.find('.active').append($activeImg);
}

$.Thumbnails.prototype.fillGutterImages = function () {
  this.$el.find('.gutter-images > img').remove();
  for (var i = 0; i < 5; i++) {
    this.$el.find('.gutter-images').append(this.$images[this.gutterIdx + i]);
  }
};