$.Tabs = function (el) {
  this.$el = $(el);
  this.$contentTabs = $(this.$el.attr('data-content-tabs'));
  this.$activeTab = $(this.$contentTabs.find('.active'));
  var that = this;
  this.$el.on('click', 'a', function (event) {
    event.preventDefault();
    var currentTarget = event.currentTarget;
    $currentTarget = $(currentTarget);
    // debugger;
    that.clickTab($currentTarget);
  });
};

$.fn.tabs = function () {
  return this.each(function () {
    new $.Tabs(this);
  });
};

$.Tabs.prototype.clickTab = function ($target) {
  // debugger;
  
  this.$el.find('li').find('.active').removeClass('active');
  this.$activeTab.addClass('transitioning');
  
  this.$activeTab.one('transitionend', function () {
    this.$activeTab.removeClass('transitioning');
    this.$activeTab.removeClass('active')
    this.$activeTab = $(this.$contentTabs.find($target.attr('href')));
    $target.addClass('active');
    this.$activeTab.addClass('transitioning');
    setTimeout(function () {
      this.$activeTab.removeClass('transitioning');
    }.bind(this),0.5)
    
    this.$activeTab.addClass('active');
  }.bind(this))
  
    
  // this.$activeTab.removeClass('active');

// this.$activeTab.removeClass('active');
 
};